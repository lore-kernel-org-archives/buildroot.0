From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Dec 2013 21:03:57 +0100
Subject: [Buildroot] [PATCH] libfreefare: Fix build on static
In-Reply-To: <20131205185110.GD3405@free.fr>
References: <1386267434-7144-1-git-send-email-Vincent.Riera@imgtec.com>
 <20131205185110.GD3405@free.fr>
Message-ID: <20131205200357.GE3405@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2013-12-05 19:51 +0100, Yann E. MORIN spake thusly:
> On 2013-12-05 18:17 +0000, Vicente Olivert Riera spake thusly:
> > This patch makes this package building correctly on static.
> > 
> > Fixes:
> > 
> >    http://autobuild.buildroot.net/results/f09/f09d515f0e7b6d78010f1ce624336ceaef624989/
> > 
> > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> > ---
> >  .../libfreefare-001-fix-static-build.patch         |   10 ++++++++++
> >  1 files changed, 10 insertions(+), 0 deletions(-)
> >  create mode 100644 package/libfreefare/libfreefare-001-fix-static-build.patch
> > 
> > diff --git a/package/libfreefare/libfreefare-001-fix-static-build.patch b/package/libfreefare/libfreefare-001-fix-static-build.patch
> > new file mode 100644
> > index 0000000..31dfa30
> > --- /dev/null
> > +++ b/package/libfreefare/libfreefare-001-fix-static-build.patch
> > @@ -0,0 +1,10 @@
> > +--- libfreefare-0.3.4/examples/Makefile.am.orig	2013-12-05 17:08:16.058185440 +0000
> > ++++ libfreefare-0.3.4/examples/Makefile.am	2013-12-05 17:14:02.270548090 +0000
> > +@@ -2,6 +2,7 @@
> > + 
> > + AM_CFLAGS = -I. -I$(top_srcdir)/libfreefare @LIBNFC_CFLAGS@
> > + AM_LDFLAGS = @LIBNFC_LIBS@
> > ++LIBS = -lcrypto -lz
> 
> Note that libfreefare itself does not use libz, but libcrypto does.
> 
> The reason why -lz is missing is because libfreefare uses AC_CHECK_LIB
> to check for libcrypto, when it should use PKG_CHECK_MODULES (which
> correctly has" Libs.private: -ldl -lz )

Gah. No, it does not. I was looking at my host's libcrypto.pc. The one
we install is missing -lz. So it should be fixed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
