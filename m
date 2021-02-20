From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Sat, 20 Feb 2021 18:41:17 +0100
Subject: [Buildroot] Fwd: [PATCH/next] package/libxcrypt: fix conversion
 error
In-Reply-To: <CAJe0E3cteL=MS4=Zauzu9yJJ2xCOt=ymxEmDzRtQbfO6yEdqiA@mail.gmail.com>
References: <20210220162916.3424-1-guillaume.bressaix@gmail.com>
 <20210220171751.GO2276@scaer>
 <CAJe0E3cteL=MS4=Zauzu9yJJ2xCOt=ymxEmDzRtQbfO6yEdqiA@mail.gmail.com>
Message-ID: <CAJe0E3fR5hiNFGA3N=uV9FOAgyedZBoUQNV1DU-B1TtJompgXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

> Fortunately, libxcrypt has an option to disable it: --disable-werror

I confirm that it works, thank you, I did not know of this feature

> Care to send a patch to use it?

I just did, also, thanks for merging my other patch (*staging*)

a+
Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le sam. 20 f?vr. 2021 ? 18:17, Yann E. MORIN <yann.morin.1998@free.fr> a
?crit :

> Guillaume, All,
>
> On 2021-02-20 17:29 +0100, guillaume.bressaix at gmail.com spake thusly:
> > From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
> >
> > Fixes:
> http://autobuild.buildroot.net/results/e9a058a8c98daf197cd9d7ac632e0cb5707d524f
> >
> > Some sensitive compilers may raise a warning that turns into an error on
> this line.
>
> We usually do not like much that -Werror is used unconditionally,
> because newer compiler will inevitably add new warnings that were
> unknown at the time the code is written.
>
> Fortunately, libxcrypt has an option to disable it: --disable-werror
>
> Care to send a patch to use it?
>
> > Patch submitted to mainline, waiting for approval, see:
> > https://github.com/besser82/libxcrypt/pull/119
>
> As for all things crypto, I'll be waiting for upstream to report, or
> for someone more knowledgeable than I to assess this change (I think it
> is OK, but the Debian fix in openssl taught me to be warry of fixes that
> look OK ;-] )
>
> Thanks, I'm keeping a tab on this one for a few more days...
>
> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> > ---
> >  ...gost3411-core.c-fix-conversion-error.patch | 26 +++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >  create mode 100644
> package/libxcrypt/0001-lib-alg-gost3411-core.c-fix-conversion-error.patch
> >
> > diff --git
> a/package/libxcrypt/0001-lib-alg-gost3411-core.c-fix-conversion-error.patch
> b/package/libxcrypt/0001-lib-alg-gost3411-core.c-fix-conversion-error.patch
> > new file mode 100644
> > index 0000000000..5488d15a3d
> > --- /dev/null
> > +++
> b/package/libxcrypt/0001-lib-alg-gost3411-core.c-fix-conversion-error.patch
> > @@ -0,0 +1,26 @@
> > +From c7bf2cf8e610bb26bece7f3a2bc5b47d7c659c7d Mon Sep 17 00:00:00 2001
> > +From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
> > +Date: Sat, 20 Feb 2021 16:51:04 +0100
> > +Subject: [PATCH] lib/alg-gost3411-core.c: fix conversion error
> > +
> > +Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> > +---
> > + lib/alg-gost3411-2012-core.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/lib/alg-gost3411-2012-core.c b/lib/alg-gost3411-2012-core.c
> > +index 13bb493..af3a36e 100644
> > +--- a/lib/alg-gost3411-2012-core.c
> > ++++ b/lib/alg-gost3411-2012-core.c
> > +@@ -92,7 +92,7 @@ add512(const uint512_u *x, const uint512_u *y,
> uint512_u *r)
> > +     for (i = 0; i < 64; i++)
> > +     {
> > +         buf = xp[i] + yp[i] + (buf >> 8);
> > +-        rp[i] = (unsigned char) buf & 0xFF;
> > ++        rp[i] = (unsigned char) (buf & 0xFF);
> > +     }
> > + #endif
> > + }
> > +--
> > +2.20.1
> > +
> > --
> > 2.20.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210220/a92a9caf/attachment.html>
