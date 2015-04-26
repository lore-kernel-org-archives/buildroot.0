From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 19:17:21 +0200
Subject: [Buildroot] [git commit] package/ccache: bump to version 3.2.1
Message-ID: <20150426172347.A375081869@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=83c8fae3cdad8aa42b8907e76ab6c2b2ec2454d7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump ccache from v.3.1.x to v.3.2.x.
All functionality remained the same.
 - Configure now accepts a parameter to use ccache's internal zlib.
 - conf.c was introduced and some settings were moved from ccache.c,
   with minor changes.
 - The PATCH_CONFIGURATION hook was moved from POST_CONFIGURE to
   POST_PATCH, as patching files should be done there, before calling
   the configure script.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ccache/ccache.hash |    4 ++--
 package/ccache/ccache.mk   |   10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 10caac8..49012af 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,2 +1,2 @@
-# Verified key http://samba.org/ftp/ccache/ccache-3.1.11.tar.xz.asc - sha256 computed locally
-sha256	60e9f3f1e60f528cfce910f3224bcc698029320f6ab77ec09a7b46bda2bc678e	ccache-3.1.11.tar.xz
+# Verified key http://samba.org/ftp/ccache/ccache-3.2.1.tar.xz.asc - sha256 computed locally
+sha256	872af34e1d2cef18694001d29db7f167d644e7602ca32cd6c74b28d81458bd9d	ccache-3.2.1.tar.xz
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 893b6ae..52b5c67 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.1.11
+CCACHE_VERSION = 3.2.1
 CCACHE_SITE = http://samba.org/ftp/ccache
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPLv3+, others
@@ -19,7 +19,7 @@ CCACHE_LICENSE_FILES = LICENSE.txt GPL-3.0.txt
 # to use HOSTCC_NOCCACHE as the compiler. Instead, we take the easy
 # path: tell ccache to use its internal copy of zlib, so that ccache
 # has zero dependency besides the C library.
-HOST_CCACHE_CONF_OPTS += ccache_cv_zlib_1_2_3=no
+HOST_CCACHE_CONF_OPTS += --with-bundled-zlib
 
 # Patch host-ccache as follows:
 #  - Use BR_CACHE_DIR instead of CCACHE_DIR, because CCACHE_DIR
@@ -34,11 +34,11 @@ HOST_CCACHE_CONF_OPTS += ccache_cv_zlib_1_2_3=no
 #    the need to specify BR_CACHE_DIR when invoking ccache directly.
 define HOST_CCACHE_PATCH_CONFIGURATION
 	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/ccache.c
-	sed -i 's,getenv("CCACHE_COMPILERCHECK"),"none",' $(@D)/ccache.c
-	sed -i 's,"%s/.ccache","$(BR_CACHE_DIR)",' $(@D)/ccache.c
+	sed -i 's,conf->compiler_check = x_strdup("mtime"),conf->compiler_check = x_strdup("none"),' $(@D)/conf.c
+	sed -i 's,"%s/.ccache","$(BR_CACHE_DIR)",' $(@D)/conf.c
 endef
 
-HOST_CCACHE_POST_CONFIGURE_HOOKS += HOST_CCACHE_PATCH_CONFIGURATION
+HOST_CCACHE_POST_PATCH_HOOKS += HOST_CCACHE_PATCH_CONFIGURATION
 
 define HOST_CCACHE_MAKE_CACHE_DIR
 	mkdir -p $(BR_CACHE_DIR)
