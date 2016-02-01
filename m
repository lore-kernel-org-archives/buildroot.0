From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  1 Feb 2016 12:31:27 +0100
Subject: [Buildroot] [PATCH] toolchain-external: add a check for broken
	toolchains
Message-ID: <1454326287-2123-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some toolchain release can be broken due to sysroot location issue,
so the $(ARCH)-linux-gnu-gcc -print-file-name=libc.a command is
broken and return only "libc.a"

This lead to an error during the header check version helper,
so these toolchains can't be imported into Buildroot.

cc1: fatal error: $PWD/libc.a/usr/include/linux/version.h: No such file or directory
compilation terminated.
support/scripts/check-kernel-headers.sh: line 38: /tmp/check-headers.4V5PPF: Permission denied

This issue happen with the first linaro 2015.11 [1] release and
CodeSourcery standard edition [2].

Here is the sysroot directory tree for linaro 2015.11:
$ ls libc/arm-linux-gnueabihf
etc  lib  sbin  usr  var

Here is the sysroot directory tree for CodeSourcery standard:
$ ls libc/sgxx-glibc
etc  lib  lib64  sbin  usr  var

Usually the sysroot is located directly under libc directory
$ ls libc/
etc  lib  sbin  usr  var

Add a check to error out with an explicit error message

[1] https://bugs.linaro.org/show_bug.cgi?id=1995#c7
[2] http://lists.busybox.net/pipermail/buildroot/2014-October/110696.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 9ebf7bd..303a32a 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -478,6 +478,10 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
 		exit 1 ; \
 	fi ; \
+	if test "$${SYSROOT_DIR}" = "libc.a" ; then \
+		@echo "External toolchain broken, unable to find the main sysroot. Cannot use." ; \
+		exit 1 ; \
+	fi ; \
 	$(call check_kernel_headers_version,\
 		$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC)),\
 		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
@@ -571,6 +575,10 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
 		exit 1 ; \
 	fi ; \
+	if test "$${SYSROOT_DIR}" = "libc.a" ; then \
+		@echo "External toolchain broken, unable to find the main sysroot. Cannot use." ; \
+		exit 1 ; \
+	fi ; \
 	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	SUPPORT_LIB_DIR="" ; \
-- 
2.4.3
