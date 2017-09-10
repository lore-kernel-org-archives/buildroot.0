From: Petr Kulhavy <brain@jikos.cz>
Date: Mon, 11 Sep 2017 01:30:06 +0200
Subject: [Buildroot] [PATCH 1/1] linuxptp: bump to the latest version
In-Reply-To: <20170910181806.GA21464@scaer>
References: <1504977449-30925-1-git-send-email-brain@jikos.cz>
 <20170909220851.56a41dc1@windsurf.lan>
 <a9a2f132-bb2f-a79e-cd8e-4116ae096691@jikos.cz>
 <20170910080432.0a6bc7b6@windsurf.lan> <20170910092450.GC3536@scaer>
 <cab76ac0-716f-1f50-b04d-bb9caf0d3e94@jikos.cz>
 <20170910181806.GA21464@scaer>
Message-ID: <ddba8f8e-5c77-97ab-9e2c-2a5a00b8522d@jikos.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

thank you for the exhaustive explanation. I can see now why the hash for 
cloned GIT repos might be needed.

I'm however not sure that I expressed clearly enough my point regarding 
the issues I see in the currect hash calculation.
There is a fundamental difference between downloading a raw file (let's 
say an archive from an FTP server) and calculating its hash, and cloning 
a GIT repo and calculating the hash in the way BR does.

*In the first case* the integrity check is done on the downloaded file. 
That is, the file is downloaded to local (during which it might be 
corrupted, or a different file is downloaded in case of MITM), then the 
checksum is calculated.
The sha256sum tool guarantees that the same input sequence of bytes 
always produces the same hash. Regardless the version, regardless the 
implementation, regardless the host machine. The SHA256 algorithm 
guarantees that.
A difference in the hash automatically means a difference in the 
downloaded file.

*In the second case* the sum is not calculated directly on the 
downloaded file(s). The files are downloaded to local (during which they 
might get corrupted, or different files are downloaded due to MITM or 
GIT repo changes).
Then they are tared and gzipped. Then the sum is calculated.
This method may produce false negatives.

So we have the chain: download -> tar -> gzip -> sha256-sum
Do tar and gzip guarantee reproducible output on identical input across 
implementations? Or is the output version/implementation specific? Let's 
look at them closely.

*Tar:**
*- guarantees to produce a POSIX interchangeable format from the input, 
as defined in POSIX 1003.1-1990
- you force the gnu header format, sort the files, use numeric owners, 
UID=GID=0, force the date to the checkout date -> these are all good, 
but still don't guarantee a reproducible output across implementations
- because the standard does not specify what type of padding should be 
used for strings (after the 0 character) and for files (the last block 
of a file). These are*implementation specific*. GNU tar seems to 
initialize them to 0.

*Gzip:
*- RFCs 1950-1952 guarantee compatibility on the file format and algorithm
- the DEFLATE algorithm however has some free space for the 
implementation to find the matching strings. This means *a compatible 
implementation might **produce* *different output.
*- in GNU gzip these tweaks are controlled by the compression level in 
gzip, which should be explicitly specified as you already realised
- GNU gzip can change its implementation in the future
- other implementation than GNU gzip might produce different output. See 
https://en.wikipedia.org/wiki/DEFLATE#Encoder.2Fcompressor
For instance the pigz based on zlib does produce a different output 
(pigz compresses slightly more even at the same level 6). Yet, you can 
perfectly compress with pigz and decompress with GNU gunzip.
See your 3D film here ;-)  https://zlib.net/pigz/

So the current hash calculation for cloned GIT repos depends on the 
tools used. Is that more clear now?


What to do then? I can see several options, with different reliability 
and practicality:
1) the 100% reliable solution is to calculate checksum of each 
individual file (raw) plus compare the file names. E.g.

|LC_ALL=C find . -type f -print0 | sort -z | xargs -r0 sha256sum | sha256sum|


2) another 100% reliable solution: bundle BR with a specific version of 
tar and gzip (or download and build them) and use the current method. 
However the same tools should be then use to create the hash file.

3) the almost 100% working solution is to remove the gzip step and 
calculate checksum of the tar. This depends just on the padding 
implementation in tar, and it is reasonable to assume zero-padding.
Just for sure the Buildroot documentation should be updated that *GNU* 
tar is required.

4) the implementation dependent solution is to use tar.gz as now, force 
the compression level, document that *GNU* gzip is required and cross 
fingers that gzip doesn't change its implementation in the future.

In any case, if specific versions of the tools are assumed (and the 
current implementation does assume them), this should be very clearly 
documented.

Regards
Petr

On 10/09/17 20:18, Yann E. MORIN wrote:
> Petr, all,
>
> On 2017-09-10 12:31 +0200, Petr Kulhavy spake thusly:
>> On 10/09/17 11:24, Yann E. MORIN wrote:
>>> On 2017-09-10 08:04 +0200, Thomas Petazzoni spake thusly:
>>>> On Sat, 9 Sep 2017 22:53:06 +0200, Petr Kulhavy wrote:
>>>>> Is there a command to just clone and compress the repo via BR?
>>>>> The <package>-extract make target fails if the hash doesn't exist and
>>>>> consequently deletes the temporary files.
>>>> Yeah, it's a bit annoying. If you put a none hash temporarily, then you
>>>> can have the tarball downloaded, calculate its hash, and add it. We
>>>> also had proposals like https://patchwork.ozlabs.org/patch/791357/ to
>>>> help with this.
>>> IIRC, I was opposed to that change, because we want the user to go and
>>> get the hash as provided by upstream (e.g. in a release email).
>>>
>>> Having the infra pre-calculate the hash locally defeats the very purpose
>>> of the hashes: check that what we got is what upstream provides.
>> Doesn't the idea of a hash of a cloned and zipped GIT repo go a little bit
>> against this?
>> I mean, I have never seen any upstream providing a hash for a specific clone
>> of a repo.
> Indeed no. This is one of the cases where a locally computed hash is needed.
>
>> In fact, that is what the GIT hash provides, in a slightly different form.
> Except when one git-clones a tag; unlike a sha1, a tag can be changed;
> see below.
>
>> So I must say I'm bit missing the point of providing a hash for cloned and
>> zipped GIT repo.
>> What is the hash trying to protect?
> Globally, the hash is here for three reasons:
>
>   1- be sure that what we download is what we expect, to avoid
>      man-in-the-middle attacks, especially on security-sensitive
>      packages: ca-certificates, openssh, dropbear, etc...
>
>   2- be sure that what we download is what we expect, to avoid silent
>      corruption of the downloaded blob, or to avoid fscked-up by
>      intermediate CDNs (already seen!)
>
>   3- detect when upstream completely messes up, and redoes a release,
>      like regnerating a release tarball, or re-tagging another commit,
>      after the previous one went public.
>
> The last one is problmatic, becasue then we can not longer ensure
> reproducibility of a build. There's nothing we can do in this case, of
> course, except pster upstream to nver do that again. But at least, we
> caught it and we can act accordingly; it is not a silent change of
> behaviour.
>
>> On the contrary, I even think it is a wrong approach. The zip is created
>> locally after the clone. And the output, or the hash if you want, depends on
>> the zip tool used and its settings (compression level, etc.).
> No, it should not depend on it, because we really go at great lengths to
> ensure it *is* reproduclibe; see the scripts in support/download/
>
>> So if someone uses a tool with a different default compression level or for
>> instance gzip gets optimized, or whatever, the hash will be different. Even
>> if the cloned repo was the same.
> And if gzip no longer produces the same output, then a lot of other
> things break loose, because nothing previously existing would be
> reproducible anymnore. This would make quite a fuss, to say the least.
>
>> (AFAIK there is no standard defining how well gzip should compress, nor does
>> gzip guarantee for a given input an equivalent output between different
>> future versions of gzip)
> Indeed there's no standard, except de-facto, for what the compression
> level is: all versions have defaulted to level 6. At least all that are
> applicable by today, that is that was already level 6 20 years ago, and
> probably even before that (but my memory is not that trustworthy past
> that mark, sorry).
>
> Note that you still have a (very small) point: we do not enforce the
> compression level when compressing the archive:
>      https://git.buildroot.org/buildroot/tree/support/download/git#n104
>
> So, do you want to send a patch that forces level 6, please?
>
> However, yes, there *is* a standard about the gzip compression
> algorithm; gzip uses the DEFLATE algorithm, which is specified in
> RFC1951: https://tools.ietf.org/html/rfc1951
>
> If gzip would compress with another algorithm, then that would no longer
> be gzip. I would love to see a movie about sysadmins and developpers who
> battle in a world where gzip sudenly changes its output format. Sure
> worth the pop-corn. I might even go see it in 3D! ;-)
>
>> So in fact the hash on a GIT repo in BR compares the zip tool I used to
>> create the hash file and the tool that the BR user has installed on his
>> machine.
>> And that is surely not what you want to do, is it?
> Yes it is, because it is reproducible.
>
>> For GIT the SHA1 value together with "git fsck" seem to do the job. See the
>> answer in this post:
>> https://stackoverflow.com/questions/31550828/verify-git-integrity
> However, we can also use a tag from a git repo, and a tag is not sufficient
> to ensure the three integrity checks we need, as explained above.
>
> So yes, we do want a hash of a tarball created by a git clone.
>
> Regards,
> Yann E. MORIN.
>

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170911/1c0f9b29/attachment.html>
