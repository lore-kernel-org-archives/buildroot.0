From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  4 Jun 2017 22:16:42 +0200
Subject: [Buildroot] [PATCH] package/doxygen: bump to 1.8.13
Message-ID: <20170604201642.28799-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The version 1.8.9.1 of Doxygen doesn't support flex >= 2.5.33, so bump
to 1.8.13 and switch to CMake build system.

Also backport an upstream patch fixing a segfault in xmlgen [1].

[1] https://github.com/doxygen/doxygen/pull/555

Fixes:
http://autobuild.buildroot.net/results/43d/43de5eb7282ec8283ad2744309b91addf7cce0d3

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
---
 ...1.8.13-Regression-Segfault-building-the-b.patch | 30 ++++++++++++++++++++++
 package/doxygen/doxygen.hash                       |  2 +-
 package/doxygen/doxygen.mk                         | 19 ++------------
 3 files changed, 33 insertions(+), 18 deletions(-)
 create mode 100644 package/doxygen/0001-Bug-776791-1.8.13-Regression-Segfault-building-the-b.patch

diff --git a/package/doxygen/0001-Bug-776791-1.8.13-Regression-Segfault-building-the-b.patch b/package/doxygen/0001-Bug-776791-1.8.13-Regression-Segfault-building-the-b.patch
new file mode 100644
index 0000000..b64158c
--- /dev/null
+++ b/package/doxygen/0001-Bug-776791-1.8.13-Regression-Segfault-building-the-b.patch
@@ -0,0 +1,30 @@
+From 0f02761a158a5e9ddbd5801682482af8986dbc35 Mon Sep 17 00:00:00 2001
+From: albert-github <albert.tests@gmail.com>
+Date: Wed, 4 Jan 2017 12:24:55 +0100
+Subject: [PATCH] Bug 776791 - [1.8.13 Regression] Segfault building the
+ breathe docs
+
+Protected against NULL pointer of variable al
+
+[Romain: backport from upstream]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/xmlgen.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/xmlgen.cpp b/src/xmlgen.cpp
+index fe95c7a..70e198a 100644
+--- a/src/xmlgen.cpp
++++ b/src/xmlgen.cpp
+@@ -620,7 +620,7 @@ static void generateXMLForMember(MemberDef *md,FTextStream &ti,FTextStream &t,De
+     if (md->isInline()) t << "yes"; else t << "no";
+     t << "\"";
+ 
+-    if (al->refQualifier!=RefQualifierNone)
++    if (al!=0 && al->refQualifier!=RefQualifierNone)
+     {
+       t << " refqual=\"";
+       if (al->refQualifier==RefQualifierLValue) t << "lvalue"; else t << "rvalue";
+-- 
+2.9.4
+
diff --git a/package/doxygen/doxygen.hash b/package/doxygen/doxygen.hash
index 40cfe16..4cf53e7 100644
--- a/package/doxygen/doxygen.hash
+++ b/package/doxygen/doxygen.hash
@@ -1,2 +1,2 @@
 # Computed locally
-sha256 d4ab6e28d4d45d8956cad17470aade3fbe2356e8f64b92167e738c1887feccec  doxygen-1.8.9.1.src.tar.gz
+sha256 af667887bd7a87dc0dbf9ac8d86c96b552dfb8ca9c790ed1cbffaa6131573f6b  doxygen-1.8.13.src.tar.gz
diff --git a/package/doxygen/doxygen.mk b/package/doxygen/doxygen.mk
index 428747b..10cdcf9 100644
--- a/package/doxygen/doxygen.mk
+++ b/package/doxygen/doxygen.mk
@@ -4,26 +4,11 @@
 #
 ################################################################################
 
-DOXYGEN_VERSION = 1.8.9.1
+DOXYGEN_VERSION = 1.8.13
 DOXYGEN_SOURCE = doxygen-$(DOXYGEN_VERSION).src.tar.gz
 DOXYGEN_SITE = http://ftp.stack.nl/pub/users/dimitri
 DOXYGEN_LICENSE = GPL-2.0
 DOXYGEN_LICENSE_FILES = LICENSE
 HOST_DOXYGEN_DEPENDENCIES = host-flex host-bison
 
-define HOST_DOXYGEN_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_MAKE_ENV) ./configure --shared --prefix=$(HOST_DIR)/usr)
-endef
-
-define HOST_DOXYGEN_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define HOST_DOXYGEN_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-# Doxygen's configure is a handwritten script, not an autotools-generated one.
-# It doesn't accept host-autotools-package default arguments, so we have to
-# call host-generic-package here.
-$(eval $(host-generic-package))
+$(eval $(host-cmake-package))
-- 
2.9.4
