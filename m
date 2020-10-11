From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Oct 2020 00:03:09 +0200
Subject: [Buildroot] [git commit] package/quazip: bump to 1.1
Message-ID: <20201011215208.799C58E55E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2eb13000756f79471b0d459c735cc55f74f3875
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also dropping upstream patch.
With this release quazip drops the qmake build in favour of cmake.
It still ships the pkgconfig .pc file, so it's possible to link to
it by using CMake's find_package() or with pkgconfig.

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/quazip/0001-fix-qztest-build-error.patch | 36 ------------------------
 package/quazip/quazip.hash                       |  2 +-
 package/quazip/quazip.mk                         | 20 ++-----------
 3 files changed, 3 insertions(+), 55 deletions(-)

diff --git a/package/quazip/0001-fix-qztest-build-error.patch b/package/quazip/0001-fix-qztest-build-error.patch
deleted file mode 100644
index 6bbe820a0d..0000000000
--- a/package/quazip/0001-fix-qztest-build-error.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From df8a2c4f18293cb2eafcf81e5dc169a06dccf304 Mon Sep 17 00:00:00 2001
-From: tsteven4 <13596209+tsteven4@users.noreply.github.com>
-Date: Tue, 9 Jul 2019 16:42:28 -0600
-Subject: [PATCH] fix qztest build error.
-
-If int is bigger than quint16 then you will get the following
-linker error:
-
-.obj/testquazip.o: In function `TestQuaZip::setOsCode()':
-testquazip.cpp:(.text+0x42bd): undefined reference to `bool QTest::qCompare<int, unsigned short>(int const&, unsigned short const&, char const*, char const*, char const*, int)'
-collect2: error: ld returned 1 exit status
-
-This error indicates the two parameters of QCOMPARE do not have the same type.
-
-This occurs because integral promotions can be applied to fi.versionCreated.
-
-[Retrieved from:
-https://github.com/stachenov/quazip/commit/df8a2c4f18293cb2eafcf81e5dc169a06dccf304]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- qztest/testquazip.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/qztest/testquazip.cpp b/qztest/testquazip.cpp
-index 70a64fc..86f6556 100644
---- a/qztest/testquazip.cpp
-+++ b/qztest/testquazip.cpp
-@@ -233,7 +233,7 @@ void TestQuaZip::setOsCode()
-     checkZip.goToFirstFile();
-     QuaZipFileInfo64 fi;
-     QVERIFY(checkZip.getCurrentFileInfo(&fi));
--    QCOMPARE(fi.versionCreated >> 8, static_cast<quint16>(osCode));
-+    QCOMPARE(static_cast<uint>(fi.versionCreated) >> 8, osCode);
- }
- 
- void TestQuaZip::setDataDescriptorWritingEnabled()
diff --git a/package/quazip/quazip.hash b/package/quazip/quazip.hash
index e0a8206c52..8fab64b453 100644
--- a/package/quazip/quazip.hash
+++ b/package/quazip/quazip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 4fda4d4248e08015b5090d0369ef9e68bdc4475aa12494f7c0f6d79e43270d14 quazip-0.8.1.tar.gz
+sha256 54edce9c11371762bd4f0003c2937b5d8806a2752dd9c0fd9085e90792612ad0 quazip-1.1.tar.gz
 sha256 d2a653b46b87963f29a7f1523e7c39bafdbb3592dfa01725e61a523387148e72 COPYING
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index 53042f6c4c..44645ec9b9 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUAZIP_VERSION = 0.8.1
+QUAZIP_VERSION = 1.1
 QUAZIP_SITE = $(call github,stachenov,quazip,v$(QUAZIP_VERSION))
 QUAZIP_INSTALL_STAGING = YES
 QUAZIP_DEPENDENCIES = \
@@ -13,20 +13,4 @@ QUAZIP_DEPENDENCIES = \
 QUAZIP_LICENSE = LGPL-2.1
 QUAZIP_LICENSE_FILES = COPYING
 
-define QUAZIP_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE) PREFIX=/usr)
-endef
-
-define QUAZIP_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QUAZIP_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(STAGING_DIR)
-endef
-
-define QUAZIP_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(TARGET_DIR)
-endef
-
-$(eval $(generic-package))
+$(eval $(cmake-package))
