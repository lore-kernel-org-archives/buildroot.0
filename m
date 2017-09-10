From: Petr Kulhavy <brain@jikos.cz>
Date: Sun, 10 Sep 2017 12:31:28 +0200
Subject: [Buildroot] [PATCH 1/1] linuxptp: bump to the latest version
In-Reply-To: <20170910092450.GC3536@scaer>
References: <1504977449-30925-1-git-send-email-brain@jikos.cz>
 <20170909220851.56a41dc1@windsurf.lan>
 <a9a2f132-bb2f-a79e-cd8e-4116ae096691@jikos.cz>
 <20170910080432.0a6bc7b6@windsurf.lan> <20170910092450.GC3536@scaer>
Message-ID: <cab76ac0-716f-1f50-b04d-bb9caf0d3e94@jikos.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Thomas,

On 10/09/17 11:24, Yann E. MORIN wrote:
> On 2017-09-10 08:04 +0200, Thomas Petazzoni spake thusly:
>> On Sat, 9 Sep 2017 22:53:06 +0200, Petr Kulhavy wrote:
>>> Is there a command to just clone and compress the repo via BR?
>>> The <package>-extract make target fails if the hash doesn't exist and
>>> consequently deletes the temporary files.
>> Yeah, it's a bit annoying. If you put a none hash temporarily, then you
>> can have the tarball downloaded, calculate its hash, and add it. We
>> also had proposals like https://patchwork.ozlabs.org/patch/791357/ to
>> help with this.
> IIRC, I was opposed to that change, because we want the user to go and
> get the hash as provided by upstream (e.g. in a release email).
>
> Having the infra pre-calculate the hash locally defeats the very purpose
> of the hashes: check that what we got is what upstream provides.
Doesn't the idea of a hash of a cloned and zipped GIT repo go a little 
bit against this?
I mean, I have never seen any upstream providing a hash for a specific 
clone of a repo.
In fact, that is what the GIT hash provides, in a slightly different form.

So I must say I'm bit missing the point of providing a hash for cloned 
and zipped GIT repo.
What is the hash trying to protect?

On the contrary, I even think it is a wrong approach. The zip is created 
locally after the clone. And the output, or the hash if you want, 
depends on the zip tool used and its settings (compression level, etc.).
So if someone uses a tool with a different default compression level or 
for instance gzip gets optimized, or whatever, the hash will be 
different. Even if the cloned repo was the same.
(AFAIK there is no standard defining how well gzip should compress, nor 
does gzip guarantee for a given input an equivalent output between 
different future versions of gzip)
So in fact the hash on a GIT repo in BR compares the zip tool I used to 
create the hash file and the tool that the BR user has installed on his 
machine.
And that is surely not what you want to do, is it?

For GIT the SHA1 value together with "git fsck" seem to do the job. See 
the answer in this post:
https://stackoverflow.com/questions/31550828/verify-git-integrity

Regards
Petr
