From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Sep 2017 20:18:06 +0200
Subject: [Buildroot] [PATCH 1/1] linuxptp: bump to the latest version
In-Reply-To: <cab76ac0-716f-1f50-b04d-bb9caf0d3e94@jikos.cz>
References: <1504977449-30925-1-git-send-email-brain@jikos.cz>
 <20170909220851.56a41dc1@windsurf.lan>
 <a9a2f132-bb2f-a79e-cd8e-4116ae096691@jikos.cz>
 <20170910080432.0a6bc7b6@windsurf.lan>
 <20170910092450.GC3536@scaer>
 <cab76ac0-716f-1f50-b04d-bb9caf0d3e94@jikos.cz>
Message-ID: <20170910181806.GA21464@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, all,

On 2017-09-10 12:31 +0200, Petr Kulhavy spake thusly:
> On 10/09/17 11:24, Yann E. MORIN wrote:
> >On 2017-09-10 08:04 +0200, Thomas Petazzoni spake thusly:
> >>On Sat, 9 Sep 2017 22:53:06 +0200, Petr Kulhavy wrote:
> >>>Is there a command to just clone and compress the repo via BR?
> >>>The <package>-extract make target fails if the hash doesn't exist and
> >>>consequently deletes the temporary files.
> >>Yeah, it's a bit annoying. If you put a none hash temporarily, then you
> >>can have the tarball downloaded, calculate its hash, and add it. We
> >>also had proposals like https://patchwork.ozlabs.org/patch/791357/ to
> >>help with this.
> >IIRC, I was opposed to that change, because we want the user to go and
> >get the hash as provided by upstream (e.g. in a release email).
> >
> >Having the infra pre-calculate the hash locally defeats the very purpose
> >of the hashes: check that what we got is what upstream provides.
> Doesn't the idea of a hash of a cloned and zipped GIT repo go a little bit
> against this?
> I mean, I have never seen any upstream providing a hash for a specific clone
> of a repo.

Indeed no. This is one of the cases where a locally computed hash is needed.

> In fact, that is what the GIT hash provides, in a slightly different form.

Except when one git-clones a tag; unlike a sha1, a tag can be changed;
see below.

> So I must say I'm bit missing the point of providing a hash for cloned and
> zipped GIT repo.
> What is the hash trying to protect?

Globally, the hash is here for three reasons:

 1- be sure that what we download is what we expect, to avoid
    man-in-the-middle attacks, especially on security-sensitive
    packages: ca-certificates, openssh, dropbear, etc...

 2- be sure that what we download is what we expect, to avoid silent
    corruption of the downloaded blob, or to avoid fscked-up by
    intermediate CDNs (already seen!)

 3- detect when upstream completely messes up, and redoes a release,
    like regnerating a release tarball, or re-tagging another commit,
    after the previous one went public.

The last one is problmatic, becasue then we can not longer ensure
reproducibility of a build. There's nothing we can do in this case, of
course, except pster upstream to nver do that again. But at least, we
caught it and we can act accordingly; it is not a silent change of
behaviour.

> On the contrary, I even think it is a wrong approach. The zip is created
> locally after the clone. And the output, or the hash if you want, depends on
> the zip tool used and its settings (compression level, etc.).

No, it should not depend on it, because we really go at great lengths to
ensure it *is* reproduclibe; see the scripts in support/download/

> So if someone uses a tool with a different default compression level or for
> instance gzip gets optimized, or whatever, the hash will be different. Even
> if the cloned repo was the same.

And if gzip no longer produces the same output, then a lot of other
things break loose, because nothing previously existing would be
reproducible anymnore. This would make quite a fuss, to say the least.

> (AFAIK there is no standard defining how well gzip should compress, nor does
> gzip guarantee for a given input an equivalent output between different
> future versions of gzip)

Indeed there's no standard, except de-facto, for what the compression
level is: all versions have defaulted to level 6. At least all that are
applicable by today, that is that was already level 6 20 years ago, and
probably even before that (but my memory is not that trustworthy past
that mark, sorry).

Note that you still have a (very small) point: we do not enforce the
compression level when compressing the archive:
    https://git.buildroot.org/buildroot/tree/support/download/git#n104

So, do you want to send a patch that forces level 6, please?

However, yes, there *is* a standard about the gzip compression
algorithm; gzip uses the DEFLATE algorithm, which is specified in
RFC1951: https://tools.ietf.org/html/rfc1951

If gzip would compress with another algorithm, then that would no longer
be gzip. I would love to see a movie about sysadmins and developpers who
battle in a world where gzip sudenly changes its output format. Sure
worth the pop-corn. I might even go see it in 3D! ;-)

> So in fact the hash on a GIT repo in BR compares the zip tool I used to
> create the hash file and the tool that the BR user has installed on his
> machine.
> And that is surely not what you want to do, is it?

Yes it is, because it is reproducible.

> For GIT the SHA1 value together with "git fsck" seem to do the job. See the
> answer in this post:
> https://stackoverflow.com/questions/31550828/verify-git-integrity

However, we can also use a tag from a git repo, and a tag is not sufficient
to ensure the three integrity checks we need, as explained above.

So yes, we do want a hash of a tarball created by a git clone.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
