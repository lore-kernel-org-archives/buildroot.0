From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 17 May 2021 22:13:27 +0200
Subject: [Buildroot] [RFC for-next] package/gcc: enable secureplt for
 powerpc64
Message-ID: <20210517201327.755689-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GCC support enabling secureplt for powerpc64.

From [1]
"PowerPC has two PLT models: BSS-PLT and Secure-PLT. BSS-PLT uses
runtime code generation to generate the PLT stubs. Secure-PLT was
introduced with GCC 4.1 and Binutils 2.17 (base has GCC 4.2.1 and
Binutils 2.17), and is a more secure PLT format, using a read-only
linkage table, with the dynamic linker populating a non-executable
index table."

This option is always enabled by glibc testing script
called build-many-glibcs.py [1]. This script exist since
glibc 2.25.

Runtime tested with qemu_ppc64_e5500_defconfig.

[1] https://reviews.freebsd.org/D20598
[2] https://sourceware.org/git/?p=glibc.git;a=blob;f=scripts/build-many-glibcs.py;h=9c08ab7b326e6385abb835eb32dd143952a71942;hb=9826b03b747b841f5fc6de2054bf1ef3f5c4bdf3#l345

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Matt Weber <matthew.weber@collins.com>
---

While looking at ppc secureplt issue with BR2_PIC_PIE, I noticed
that gcc --enable-secureplt option was only used for BR2_powerpc
although it's also available for powerpc64.

I don't have a powerpc64 hardware for real testing.
Test welcome.
---
 package/gcc/gcc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 5e419f7ede..ed9b93e50f 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -231,7 +231,7 @@ endif
 # Set default to Secure-PLT to prevent run-time
 # generation of PLT stubs (supports RELRO and
 # SELinux non-exemem capabilities)
-ifeq ($(BR2_powerpc),y)
+ifeq ($(BR2_powerpc)$(BR2_powerpc64),y)
 HOST_GCC_COMMON_CONF_OPTS += --enable-secureplt
 endif
 
-- 
2.31.1
