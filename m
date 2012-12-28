From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Dec 2012 16:55:09 +0100
Subject: [Buildroot] [git commit] libffi: fix mips build failures
Message-ID: <20121228155607.7FBF89703D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4848386446b937d4d0d9d3e9489932ca3fcb1003
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/c4056ed2b969b900f7654e651e0e4cc2e8998e02

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
