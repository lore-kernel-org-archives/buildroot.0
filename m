From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 13 Jul 2014 20:45:58 +0200
Subject: [Buildroot] [PATCH 1/3] toolchain-external: handle a special case
	where kernel headers check needs TOOLCHAIN_EXTERNAL_CFLAGS
In-Reply-To: <1405277160-4686-1-git-send-email-romain.naour@openwide.fr>
References: <1405277160-4686-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1405277160-4686-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the Sourcery Codebench standard edition, the sysroot returned
point to a non existant directory if no CFLAGS are specified.

Here are the results of -print-sysroot gcc option:

$ ./i686-pc-linux-gnu-gcc -print-sysroot
Full/path/to/i686-pc-linux-gnu/libc/system32

$ ./i686-pc-linux-gnu-gcc -m64 -print-sysroot
Full/path/to/i686-pc-linux-gnu/libc/system64

$ ./i686-pc-linux-gnu-gcc -msgxx-glibc -print-sysroot
Full/path/to/i686-pc-linux-gnu/libc/sgxx-glibc

The problem is that in the "libc" directory there is only the sub-directory
"sgxx-glibc".

Note: All hearders files and libraries are available in arch specific sysroot.

When using the -print-file-name gcc option, the result is quite buggy and it is
not empty.

$ ./i686-pc-linux-gnu-gcc -print-file-name=libc.a
libc.a

So the toolchain check fail because $PWD/libc.a is used as SYSROOT_DIR since
the toolchain-external backend does not always use CFLAGS.

Add a test to use ARCH_SYSROOT_DIR for kernel headers check if SYSROOT_DIR is
not a directory.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 toolchain/toolchain-external/toolchain-external.mk | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 0955686..8280b84 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -454,9 +454,16 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
 		exit 1 ; \
 	fi ; \
-	$(call check_kernel_headers_version,\
-		$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC)),\
-		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
+	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	if test -d "$${SYSROOT_DIR}"  ; then \
+		$(call check_kernel_headers_version,\
+			"$${SYSROOT_DIR}",\
+			$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
+	else \
+		$(call check_kernel_headers_version,\
+			"$${ARCH_SYSROOT_DIR}",\
+			$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
+	fi ; \
 	if test "$(BR2_arm)" = "y" ; then \
 		$(call check_arm_abi,\
 			"$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)",\
-- 
1.9.3
