From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Dec 2012 12:35:39 -0300
Subject: [Buildroot] [PATCH] libffi: fix mips build failures
Message-ID: <1356708939-11895-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/c4056ed2b969b900f7654e651e0e4cc2e8998e02

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libffi/libffi.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 7570583..64b3eb4 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -8,9 +8,14 @@ LIBFFI_VERSION = 3.0.11
 LIBFFI_SITE    = ftp://sources.redhat.com/pub/libffi/
 LIBFFI_LICENSE = MIT
 LIBFFI_LICENSE_FILES = LICENSE
-
 LIBFFI_INSTALL_STAGING = YES
 
+# Newer CS MIPS toolchains use a different (compact) eh_frame format
+# libffi don't like them, just switch to the older format
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209)$(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203),y)
+LIBFFI_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -mno-compact-eh"
+endif
+
 # Move the headers to the usual location, and adjust the .pc file
 # accordingly
 define LIBFFI_MOVE_STAGING_HEADERS
-- 
1.7.8.6
