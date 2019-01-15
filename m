From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 15 Jan 2019 23:42:39 +0100
Subject: [Buildroot] [PATCH v4 2/2] freeswitch: bump to git master
 8f10ae54a18a19fc6ed938e4f662bd218ba54b5e
In-Reply-To: <20190115224239.26125-1-ps.report@gmx.net>
References: <20190115224239.26125-1-ps.report@gmx.net>
Message-ID: <20190115224239.26125-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enables openssl-1.1.0h compatible compile.

- add bootstrap.sh post-patch call (normal AUTORECONF is broken)
- add tiff dependency (bundled tiff source is gone)
- rebase (and git format) 001-libvpx-cross.patch patch
- update libs/srtp/LICENSE file hash (updated copyright year)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v2 -> v3:
  - add PATH=$(BR_PATH) for bootstrap.sh call (suggested by Bernd Kuhls)

  - fix need for disabled BR2_COMPILER_PARANOID_UNSAFE_PATH, run
    bootstrap.sh as post-patch insted pre-configure (as the freetype
    packege does)

Changes v1 -> v2:
  - new patch (suggested by Bernd Kuhls)
---
 .../0001-Fix-cross-compiling-libvpx.patch     | 30 ++++++++++++-------
 package/freeswitch/freeswitch.hash            | 11 +++----
 package/freeswitch/freeswitch.mk              | 16 ++++++++--
 3 files changed, 37 insertions(+), 20 deletions(-)

diff --git a/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch b/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
index 1d4b97a7a0..9542d037ed 100644
--- a/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
+++ b/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
@@ -1,4 +1,7 @@
-Fix cross-compiling libvpx
+From 4ba073af7877242a79579b040e3be00bed4275cc Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Thu, 3 May 2018 22:24:23 +0200
+Subject: [PATCH] Fix cross-compiling libvpx
 
 Freeswitch since version 1.6.7 only uses an in-tree-version of libvpx:
 https://freeswitch.org/fisheye/changelog/freeswitch?cs=febe0f8dacea2d2a31902b3dc469be757f8c3c4d
@@ -10,20 +13,27 @@ package/freeswitch/freeswitch.mk and add target=generic-gnu as
 configure parameter:
 https://freeswitch.org/stash/projects/FS/repos/freeswitch/browse/libs/libvpx/README#110
 
-And yes, autoreconf is also broken, so we patch Makefile.in instead
-of Makefile.am.
-
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 
-diff -uNr freeswitch-1.6.7.org/Makefile.in freeswitch-1.6.7/Makefile.in
---- freeswitch-1.6.7.org/Makefile.in	2016-04-01 18:09:54.000000000 +0200
-+++ freeswitch-1.6.7/Makefile.in	2016-04-22 20:11:37.938961730 +0200
-@@ -4025,7 +4025,7 @@
+[rebased on freeswitch git master branch]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 53bd7c66aa..2e4059740a 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -567,7 +567,7 @@ libs/libzrtp/libzrtp.a:
  	cd libs/libzrtp && $(MAKE)
  
  libs/libvpx/Makefile:
--	cd libs/libvpx && CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --size-limit=16384x16384 --extra-cflags="$(VISIBILITY_FLAG)"
-+	cd libs/libvpx && CROSS=$(CROSS) CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --target=generic-gnu --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --size-limit=16384x16384 --extra-cflags="$(VISIBILITY_FLAG)"
+-	cd libs/libvpx && CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --extra-cflags="$(VISIBILITY_FLAG)"
++	cd libs/libvpx && CROSS=$(CROSS) CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --target=generic-gnu --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --extra-cflags="$(VISIBILITY_FLAG)"
  
  libs/libvpx/libvpx.a: libs/libvpx/Makefile
  	@cd libs/libvpx && $(MAKE)
+-- 
+2.19.2
+
diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index dab2fb237b..23dab45dc5 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,10 +1,7 @@
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.2.tar.xz.md5
-md5 61de81cd70afb056dde7b1dcb91ad967 freeswitch-1.8.2.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.2.tar.xz.sha1
-sha1 f2c077db40b05c5fdf66cbe77bd879f41132f79a freeswitch-1.8.2.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.2.tar.xz.sha256
-sha256 ebcf3db970ea9bb534c0983a1c9eef88395deb6e0902d8d6407bf217b2f27b9a freeswitch-1.8.2.tar.xz
-# Locally computed
+# Locally computed:
+sha256 56d932c001f3cc53b6ee5d835536b01fceacf1e360a6b48c5c1265eda5d6be86  freeswitch-8f10ae54a18a19fc6ed938e4f662bd218ba54b5e.tar.gz
+
+# License files:
 sha256 10299420c1e8602c0daf5a59d022621cd72a9148d1f0f33501edb3db3445c7fe  COPYING
 sha256 e8e26b16da14aa3e6ed5c22c705fdc1f45d6225fca461ea9f7314bcdfdc414c4  libs/apr/LICENSE
 sha256 1eefb2ea1db0af7729a9d8a27d7c65d8a37ab185393f935b029aac6828ce315a  libs/apr-util/LICENSE
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 577d6c9450..a7d52995ce 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.8.2
-FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
-FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
+FREESWITCH_VERSION = 8f10ae54a18a19fc6ed938e4f662bd218ba54b5e
+#FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
+FREESWITCH_SITE = https://freeswitch.org/stash/scm/fs/freeswitch.git
+FREESWITCH_SITE_METHOD = git
 # External modules need headers/libs from staging
 FREESWITCH_INSTALL_STAGING = YES
 FREESWITCH_LICENSE = MPL-1.1, \
@@ -38,6 +39,15 @@ FREESWITCH_DEPENDENCIES = \
 	util-linux \
 	zlib
 
+# run bootstrap.sh (normal AUTORECONF is broken)
+define FREESWITCH_RUN_BOOTSTRAP
+	cd $(@D); PATH=$(BR_PATH) ./bootstrap.sh
+endef
+
+# running while POST_PATCH stage enables libtool patching
+FREESWITCH_POST_PATCH_HOOKS += FREESWITCH_RUN_BOOTSTRAP
+FREESWITCH_DEPENDENCIES += host-automake host-autoconf host-libtool
+
 # disable display of ClueCon banner in fs_cli
 FREESWITCH_CONF_ENV += \
 	disable_cc=yes
-- 
2.20.1
