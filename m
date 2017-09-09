From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 23:04:06 +0200
Subject: [Buildroot] [git commit] smcroute: bump to version 2.3.1
Message-ID: <20170909205720.4E03B80FC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b5ef4bbeeaf8ec92eb9758d3a8106f30bbb3cbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add optional dependency on libcap, which exists since this version
bump.

Signed-off-by: Thomas Faivre <thomas.faivre@6wind.com>
[Thomas: add explicit --with-libcap.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/smcroute/smcroute.hash | 6 +++---
 package/smcroute/smcroute.mk   | 9 ++++++++-
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
index e1483ec..0487ef6 100644
--- a/package/smcroute/smcroute.hash
+++ b/package/smcroute/smcroute.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  cf344922b4298b94e53fa2db8f2b064bece60f75926966f330437dfcbd76d425  smcroute-2.1.1.tar.xz
-# From https://github.com/troglobit/smcroute/releases/download/2.1.1/smcroute-2.1.1.tar.xz.md5
-md5     cd9256577fe06beaf8da2eba1a02f953  smcroute-2.1.1.tar.xz
+sha256  cd6c5cc2edfa1348acb07ed026180ebfc8dd0f87153f5382cb27cb5557724c56  smcroute-2.3.1.tar.xz
+# From https://github.com/troglobit/smcroute/releases/download/2.3.1/smcroute-2.3.1.tar.xz.md5
+md5     d8080828b7730bffb86969afd2bf94cb  smcroute-2.3.1.tar.xz
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index 0dd39ea..e7e6ef1 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMCROUTE_VERSION = 2.1.1
+SMCROUTE_VERSION = 2.3.1
 SMCROUTE_SOURCE = smcroute-$(SMCROUTE_VERSION).tar.xz
 SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
 SMCROUTE_LICENSE = GPL-2.0+
@@ -14,4 +14,11 @@ SMCROUTE_CONF_OPTS = ac_cv_func_setpgrp_void=yes
 #BUG:The package Makefile uses CC?= even though the package is autotools based
 SMCROUTE_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+SMCROUTE_DEPENDENCIES = libcap
+SMCROUTE_CONF_OPTS += --with-libcap
+else
+SMCROUTE_CONF_OPTS += --without-libcap
+endif
+
 $(eval $(autotools-package))
