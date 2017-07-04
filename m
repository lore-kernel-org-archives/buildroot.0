From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:49:16 +0200
Subject: [Buildroot] [PATCH 096/100] xfsprogs: remove libintl static linking
	handling
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-97-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We no longer support building the full-blown libintl in static linking
scenarios, as it causes too many problems. Therefore, remove the
patch and special code that was handling this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0004-build-add-EXTRALIBS-to-link-with.patch    | 53 ----------------------
 package/xfsprogs/xfsprogs.mk                       | 17 -------
 2 files changed, 70 deletions(-)
 delete mode 100644 package/xfsprogs/0004-build-add-EXTRALIBS-to-link-with.patch

diff --git a/package/xfsprogs/0004-build-add-EXTRALIBS-to-link-with.patch b/package/xfsprogs/0004-build-add-EXTRALIBS-to-link-with.patch
deleted file mode 100644
index 8ff0580..0000000
--- a/package/xfsprogs/0004-build-add-EXTRALIBS-to-link-with.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 1e9bb2fba94bc508659f1667bf95501324849bb9 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 26 Feb 2017 12:04:54 +0100
-Subject: [PATCH] build: add EXTRALIBS to link with
-
-When doing a uClibc static build, the build fails to link:
-    http://autobuild.buildroot.org/results/503/50314716a9f72e8bb238e52e9dc342c68f7e0b8b/build-end.log
-
-The cause is due to:
-  - xfsprogs links dome programs with util-linux' libblkid
-  - util-linux' libblkid is linked to util-linux' libuuid
-  - util-linux' libuuid uses i18n functions when locales are enabled
-  - uClibc does not provide i18n functions
-  - i18n functions are provided by libintl from libintl from gettext
-
-util-linux installs pkg-config files for thos two libs. However,
-xfsprogs does not use pkg-config to find libblkid or libuuid, thus it
-misses the Libs.private field from libuid.
-
-In this case, it is necessary to pass LIBS=-lintl at configure time, so
-that configure correctly finds libblkid.
-
-Still, this is not enough, because the build will not use LIBS during
-the link phase.
-
-We fix that last bit by adding EXTRALIBS to the libraries to link with,
-so that it is possible to pass EXTRALIBS=-lintl at build time:
-
-    $ ./configure [...] LIBS=-lintl
-    $ make EXTRALIBS=-lintl
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Cc: Waldemar Brodkorb <wbx@openadk.org>
----
- include/buildmacros | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/buildmacros b/include/buildmacros
-index a7c5d8a..dd62d80 100644
---- a/include/buildmacros
-+++ b/include/buildmacros
-@@ -11,7 +11,7 @@ BUILDRULES = $(TOPDIR)/include/buildrules
- 
- LDFLAGS += $(LOADERFLAGS) $(LLDFLAGS)
- LTLDFLAGS += $(LOADERFLAGS)
--LDLIBS = $(LLDLIBS) $(PLDLIBS) $(MALLOCLIB)
-+LDLIBS = $(LLDLIBS) $(PLDLIBS) $(MALLOCLIB) $(EXTRALIBS)
- 
- MAKEOPTS = --no-print-directory Q=$(Q)
- SRCFILES = Makefile $(HFILES) $(CFILES) $(LSRCFILES) $(LFILES) $(YFILES)
--- 
-2.7.4
-
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index ed56d34..2f708f1 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -18,23 +18,6 @@ XFSPROGS_CONF_OPTS = \
 	INSTALL_GROUP=root \
 	--enable-static
 
-# xfsprogs links some of its programs to libs from util-linux, which use
-# i18n functions. For shared-only builds, that's automatically pulled in.
-# Static builds need some help, though...
-#
-# No need to depend on gettext in this case: xfsprogs does not use it for
-# itself; util-linux does need it and has it in its own dependencies.
-#
-# xfsprogs' buildsystem uses hand-made Makefiles, not automake, and they
-# do not use the LIBS variable set by configure. So we use EXTRALIBS that
-# is added by our patch.
-#
-# It is not needed to propagate the EXTRALIBS to the install step.
-ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS)$(BR2_NEEDS_GETTEXT_IF_LOCALE),yy)
-XFSPROGS_CONF_OPTS += LIBS=-lintl
-XFSPROGS_MAKE_OPTS = EXTRALIBS=-lintl
-endif
-
 XFSPROGS_INSTALL_TARGET_OPTS = DIST_ROOT=$(TARGET_DIR) install
 
 $(eval $(autotools-package))
-- 
2.9.4
