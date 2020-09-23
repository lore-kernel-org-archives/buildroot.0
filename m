From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 20:47:02 +0200
Subject: [Buildroot] [git commit] package/gcc: transition PowerPC 32 to
 secureplt
Message-ID: <20200923183806.95F4B86A94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9b539bf4054d55da69280b19f4b99a91cbe6e0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PowerPC has two PLT models: BSS-PLT and Secure-PLT. BSS-PLT uses
runtime code generation to generate the PLT stubs. Secure-PLT was
introduced with GCC 4.1 and Binutils 2.17 (base has GCC 4.2.1 and
Binutils 2.17), and is a more secure PLT format, using a read-only
linkage table, with the dynamic linker populating a non-executable
index table.

References to other distro/BSD transitions:
  https://patchwork.openembedded.org/patch/106621/
  https://reviews.freebsd.org/D20598

Fixes a bug observed when creating SELinux policy where all apps
require execmem because the heap requires execute before this change.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/gcc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index b834269adc..df5bf22b96 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -223,6 +223,13 @@ HOST_GCC_COMMON_CONF_OPTS += \
 	--with-long-double-128
 endif
 
+# Set default to Secure-PLT to prevent run-time
+# generation of PLT stubs (supports RELRO and
+# SELinux non-exemem capabilities)
+ifeq ($(BR2_powerpc),y)
+HOST_GCC_COMMON_CONF_OPTS += --enable-secureplt
+endif
+
 # PowerPC64 big endian by default uses the elfv1 ABI, and PowerPC 64
 # little endian by default uses the elfv2 ABI. However, musl has
 # decided to use the elfv2 ABI for both, so we force the elfv2 ABI for
