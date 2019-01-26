From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 26 Jan 2019 08:16:37 +0100
Subject: [Buildroot] [PATCH] jemalloc: allow on MIPS64
In-Reply-To: <b125a6d7-aee7-d700-43e5-06d0d390c9f7@mind.be>
References: <20190125205052.31200-1-patrickdepinguin@gmail.com>
 <b125a6d7-aee7-d700-43e5-06d0d390c9f7@mind.be>
Message-ID: <CAAXf6LUCCVZ++VcZ+KFiyWgq7C30g+eVv_-QpMz2XJY=amRMfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 26, 2019, 00:57 Arnout Vandecappelle <arnout@mind.be wrote:

>
>
> On 25/01/2019 21:50, Thomas De Schampheleire wrote:
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >
> > jemalloc uses architecture #ifdefs to determine LG_QUANTUM and gives an
> > error when an unsupported architecture is used.
> > For this reason, Buildroot commit
> 3baf996c6a2b57ffaaa4627c1e04ff67c30e9754
> > introduced BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS.
> >
> > In the jemalloc sources, 'mips' is checked via '__mips__' which is set
> both
> > for 32-bit as 64-bit MIPS (including MIPS64 n32).
> > However, the Buildroot arch selection only includes 32-bit MIPS via
> BR2_mips
> > and BR2_mipsel.
> >
> > Update the arch selection to support MIPS64.
>
>  OK, it builds like that, but is it really going to work correctly? Most
> arches
> define it as 4, only 32-bit ARM, or1k (which is always 32-bit) and mips
> define
> it as 3. So is 3 really the correct value for mips64?
>

Well we are using it under MIPS64/n32 so the same value as MIPS32 is fine.
I haven't actually tested on n64.

I don't know how this value is used, and whether a bad value is just
suboptimal or actually broken.

The fact that there is no general difference between eg i386 and x86_64,
indicates there is no automatic difference between 32bit and 64bit.

If you prefer I can change the patch to check for n32 specifically.


>  Note that a value can also be passed with --with-lg-quantum config option
> for
> unsupported arches.
>

Yes, but we'd need to create a config symbol just for that. If we can solve
it without, I think it would be better.

Best regards
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190126/7d73db3d/attachment.html>
