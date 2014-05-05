From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 May 2014 23:53:27 +0200
Subject: [Buildroot] [git commit] gcc: disable libsanitizer for musl
Message-ID: <20140506081939.342209C5E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f4d658d888b539de9a6247ae5b1a0999de5d4ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A build issue affects libsanitizer on musl toolchains, even with
previous versions of gcc such as 4.8.x, so we disable building
libsanitizer when working with musl.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 3274821..741bb84 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -122,8 +122,9 @@ ifneq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),y)
 HOST_GCC_COMMON_CONF_OPT += --disable-libquadmath
 endif
 
-# libsanitizer requires wordexp, not in default uClibc config
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC),y)
+# libsanitizer requires wordexp, not in default uClibc config. Also
+# doesn't build properly with musl.
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC)$(BR2_TOOLCHAIN_BUILDROOT_MUSL),y)
 HOST_GCC_COMMON_CONF_OPT += --disable-libsanitizer
 endif
 
