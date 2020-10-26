From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 26 Oct 2020 23:54:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: fix build without
 dlopen
In-Reply-To: <20201026072554.GC2805@scaer>
References: <20201025164359.1837392-1-fontaine.fabrice@gmail.com>
 <20201026072554.GC2805@scaer>
Message-ID: <CAPi7W81xTkf5gyZswNjH7kGujZyzRFXGosq3AVEv5hUD_v+VdQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le lun. 26 oct. 2020 ? 08:26, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>
> Fabrice, All,
>
> On 2020-10-25 17:43 +0100, Fabrice Fontaine spake thusly:
> > Fix build of libuhttpd in version 3.4.0 without dlopen
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/b2bbd0681705b94e6b531996b39f62e47f089c92
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Applied to master, thanks.
>
> See below for an additional comment...
>
> > ---
> >  ...rc-uhttpd.c-fix-build-without-dlopen.patch | 35 +++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 package/libuhttpd/0001-src-uhttpd.c-fix-build-without-dlopen.patch
> >
> > diff --git a/package/libuhttpd/0001-src-uhttpd.c-fix-build-without-dlopen.patch b/package/libuhttpd/0001-src-uhttpd.c-fix-build-without-dlopen.patch
> > new file mode 100644
> > index 0000000000..966041028b
> > --- /dev/null
> > +++ b/package/libuhttpd/0001-src-uhttpd.c-fix-build-without-dlopen.patch
> > @@ -0,0 +1,35 @@
> > +From 0b2058e7c96a3d8d994d572116ad7b950766347b Mon Sep 17 00:00:00 2001
> > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +Date: Fri, 16 Oct 2020 21:39:47 +0200
> > +Subject: [PATCH] src/uhttpd.c: fix build without dlopen
> > +
> > +Build without dlopen fails on:
> > +
> > +/data/buildroot-test/instance-0/output-1/build/libuhttpd-3.4.0/src/uhttpd.c:45:23: error: unused variable 'p' [-Werror=unused-variable]
> > +     struct uh_plugin *p = srv->plugins;
> > +                       ^
>
> Ideally, we'd like to be able to build with -Werror. Do you think you
> could see with upstream so that they at least add an option to disable
> it?
I opened a merge request here: https://github.com/zhaojh329/libuhttpd/pull/12.
>
> Regards,
> Yann E. MORIN.
>
> > +Fixes:
> > + - http://autobuild.buildroot.org/results/b2bbd0681705b94e6b531996b39f62e47f089c92
> > +
> > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +[Retrieved from:
> > +https://github.com/zhaojh329/libuhttpd/commit/0b2058e7c96a3d8d994d572116ad7b950766347b]
> > +---
> > + src/uhttpd.c | 2 ++
> > + 1 file changed, 2 insertions(+)
> > +
> > +diff --git a/src/uhttpd.c b/src/uhttpd.c
> > +index dad3646..a37c136 100644
> > +--- a/src/uhttpd.c
> > ++++ b/src/uhttpd.c
> > +@@ -42,7 +42,9 @@ void conn_free(struct uh_connection *conn);
> > + static void uh_server_free(struct uh_server *srv)
> > + {
> > +     struct uh_connection *conn = srv->conns;
> > ++#ifdef HAVE_DLOPEN
> > +     struct uh_plugin *p = srv->plugins;
> > ++#endif
> > +
> > +     ev_io_stop(srv->loop, &srv->ior);
> > +
> > --
> > 2.28.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
Best Regards,

Fabrice
