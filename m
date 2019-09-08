From: Christopher McCrory <chrismcc@gmail.com>
Date: Sun,  8 Sep 2019 09:11:59 -0700
Subject: [Buildroot] [PATCH 15/27] package/smartmontools: bump to version 7.0
Message-ID: <20190908161159.26692-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add work around for broken configure check

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/smartmontools/smartmontools.hash | 6 +++---
 package/smartmontools/smartmontools.mk   | 7 ++++++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/smartmontools/smartmontools.hash b/package/smartmontools/smartmontools.hash
index 2f2b7aa096..b36681eb4e 100644
--- a/package/smartmontools/smartmontools.hash
+++ b/package/smartmontools/smartmontools.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/smartmontools/files/smartmontools/6.5/
-md5	093aeec3f8f39fa9a37593c4012d3156	smartmontools-6.5.tar.gz
-sha1	7e788b429534a4ae627858fbcc826b93402cee7e	smartmontools-6.5.tar.gz
+# Locally calculated
+sha256 e5e1ac2786bc87fdbd6f92d0ee751b799fbb3e1a09c0a6a379f9eb64b3e8f61c smartmontools-7.0.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index 137c00a505..36b9c39243 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -4,9 +4,14 @@
 #
 ################################################################################
 
-SMARTMONTOOLS_VERSION = 6.5
+SMARTMONTOOLS_VERSION = 7.0
 SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smartmontools/$(SMARTMONTOOLS_VERSION)
 SMARTMONTOOLS_LICENSE = GPL-2.0+
 SMARTMONTOOLS_LICENSE_FILES = COPYING
 
+# Work around broken configure check.
+ifneq ($(BR2_TOOLCHAIN_HAS_SSP),y)
+SMARTMONTOOLS_CONF_OPTS += CXXFLAGS="$(TARGET_CXXFLAGS) -fno-stack-protector"
+endif
+
 $(eval $(autotools-package))
-- 
2.20.1
