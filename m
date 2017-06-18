From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 18 Jun 2017 12:34:38 +0300
Subject: [Buildroot] [PATCH 09/14] libv4l: don't link with librt
In-Reply-To: <20170618093123.GJ2918@scaer>
References: <cover.1497583686.git.baruch@tkos.co.il>
 <dac5de98b1d8ad387fa3cfa63dc3c8e3e6c32d31.1497583686.git.baruch@tkos.co.il>
 <20170618093123.GJ2918@scaer>
Message-ID: <20170618093438.fpuk4gkg2z2zhuut@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Jun 18, 2017 at 11:31:23AM +0200, Yann E. MORIN wrote:
> Baruch, All,
> 
> On 2017-06-16 06:32 +0300, Baruch Siach spake thusly:
> > Buildroot no longer supports toolchains with glibc older than 2.17, so there
> > is no need to link with librt for clock_* system calls.
> > 
> > The following patches are not renumbered. The noise is too high.
> 
> If you use -M and/or -C when doing the patches, then git will detect
> renames and/or copies, and will not actually send the diff, just the
> rename.

The noise is mostly in the libv4l.mk comment. It would hide the actual 
significant change there. Should I do it anyway?

baruch

> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Regards,
> Yann E. MORIN.
> 
> > ---
> >  ...3-utils-qv4l2-Makefile.am-link-with-librt.patch | 29 ----------------------
> >  package/libv4l/libv4l.mk                           |  3 +--
> >  2 files changed, 1 insertion(+), 31 deletions(-)
> >  delete mode 100644 package/libv4l/0003-utils-qv4l2-Makefile.am-link-with-librt.patch
> > 
> > diff --git a/package/libv4l/0003-utils-qv4l2-Makefile.am-link-with-librt.patch b/package/libv4l/0003-utils-qv4l2-Makefile.am-link-with-librt.patch
> > deleted file mode 100644
> > index 4bac577d98b2..000000000000
> > --- a/package/libv4l/0003-utils-qv4l2-Makefile.am-link-with-librt.patch
> > +++ /dev/null
> > @@ -1,29 +0,0 @@
> > -From 66d1d752976f4b45a5faff2bc68fc2fa9d435c71 Mon Sep 17 00:00:00 2001
> > -From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > -Date: Sun, 14 May 2017 22:04:55 +0200
> > -Subject: [PATCH] utils/qv4l2/Makefile.am: link with librt
> > -
> > -qv4l2 uses clock_gettime(), so it should link with librt to be
> > -compatible with old versions of glibc.
> > -
> > -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ----
> > - utils/qv4l2/Makefile.am | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/utils/qv4l2/Makefile.am b/utils/qv4l2/Makefile.am
> > -index fd58486..a991d66 100644
> > ---- a/utils/qv4l2/Makefile.am
> > -+++ b/utils/qv4l2/Makefile.am
> > -@@ -7,7 +7,7 @@ qv4l2_SOURCES = qv4l2.cpp general-tab.cpp ctrl-tab.cpp vbi-tab.cpp capture-win.c
> > -   v4l2-tpg-core.c v4l2-tpg-colors.c
> > - nodist_qv4l2_SOURCES = moc_qv4l2.cpp moc_general-tab.cpp moc_capture-win.cpp moc_vbi-tab.cpp qrc_qv4l2.cpp
> > - qv4l2_LDADD = ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la \
> > --  ../libv4l2util/libv4l2util.la ../libmedia_dev/libmedia_dev.la
> > -+  ../libv4l2util/libv4l2util.la ../libmedia_dev/libmedia_dev.la -lrt
> > - qv4l2_CPPFLAGS = -I../common
> > - 
> > - if WITH_QTGL
> > --- 
> > -2.7.4
> > -
> > diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
> > index 4e7aa422228f..b74271728a0b 100644
> > --- a/package/libv4l/libv4l.mk
> > +++ b/package/libv4l/libv4l.mk
> > @@ -11,8 +11,6 @@ LIBV4L_INSTALL_STAGING = YES
> >  LIBV4L_DEPENDENCIES = host-pkgconf
> >  LIBV4L_CONF_OPTS = --disable-doxygen-doc
> >  
> > -# 0003-utils-qv4l2-Makefile.am-link-with-librt.patch, host-gettext
> > -# needed for autoreconf to work
> >  # below patches requires autoreconf:
> >  # 0004-configure.ac-clarify-configure-summary.patch
> >  # 0005-configure.ac-revisit-v4l2-ctl-compliance-using-libv4.patch
> > @@ -21,6 +19,7 @@ LIBV4L_CONF_OPTS = --disable-doxygen-doc
> >  # 0008-configure.ac-fix-build-of-v4l-utils-on-uclinux.patch
> >  # 0009-configure.ac-add-USE_LIBV4L-to-summary.patch
> >  LIBV4L_AUTORECONF = YES
> > +# host-gettext needed for autoreconf to work
> >  LIBV4L_DEPENDENCIES += host-gettext
> >  
> >  # fix uclibc-ng configure/compile
> > -- 
> > 2.11.0

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
