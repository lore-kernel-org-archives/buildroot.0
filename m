From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 20:36:50 +0100
Subject: [Buildroot] [git commit] apr-util: various improvements
Message-ID: <20130324194037.583A29B28F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a00fc22779983440d0bec2b996b55f4064079e55
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit:
 * Adds licensing informations.
 * Uses the apr-1-config script instead of pointing apr-util to the
   apr build directory.
 * Ensures apu-1-config gets fixed properly using the
   <pkg>_CONFIG_SCRIPTS mechanism.
 * Ensures that libiconv gets built before apr-util if available, so
   that character set conversion features of apr-util can be enabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/apr-util/apr-util.mk |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index b9ff904..94b1817 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -5,9 +5,16 @@
 #############################################################
 APR_UTIL_VERSION = 1.4.1
 APR_UTIL_SITE = http://archive.apache.org/dist/apr
+APR_UTIL_LICENSE = Apache-2.0
+APR_UTIL_LICENSE_FILES = LICENSE
 APR_UTIL_INSTALL_STAGING = YES
 APR_UTIL_DEPENDENCIES = apr sqlite neon zlib
 APR_UTIL_CONF_OPT = \
-	--with-apr=$(BUILD_DIR)/apr-$(APR_VERSION) \
+	--with-apr=$(STAGING_DIR)/usr/bin/apr-1-config
+APR_UTIL_CONFIG_SCRIPTS = apu-1-config
+
+# When iconv is available, then use it to provide charset conversion
+# features.
+APR_UTIL_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 $(eval $(autotools-package))
