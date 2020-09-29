From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2020 21:08:49 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/gcc: transition
 PowerPC 32 to secureplt
Message-ID: <20200929185938.6BB6B8CA3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85b5f2c6ff79a283b752e292685cd825293993b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

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
(cherry picked from commit f9b539bf4054d55da69280b19f4b99a91cbe6e0b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 50f2a3fcb7..e34801390b 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -220,6 +220,13 @@ HOST_GCC_COMMON_CONF_OPTS += \
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
