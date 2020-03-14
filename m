From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:16:04 +0100
Subject: [Buildroot] [git commit] package/gcc: disable gcc 9.x for csky
Message-ID: <20200314140331.E153382AFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7542a596010e538ceff56b57dc2c6797c63d73ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building a toolchain with upstream gcc 9.x the build
fail due to several issues.

Note: The upstream Binutils support csky target since
release 2.32 but the support was never enabled in the
Buildroot packaging. So the latest version (2.33.1) was
tested here.

[upstream gcc 9.x w/ glibc csky fork with binutils csky for or binutils 2.33.1]
In file included from <command-line>:
./../include/libc-symbols.h:534:26: error: '__EI___errno_location' specifies less restrictive attributes than its target '__errno_location': 'const', 'nothrow' [-Werror=missing-attributes]
  534 |   extern __typeof (name) __EI_##name \

[upstream gcc 9.x w/ glibc 2.30 w/ binutils csky fork]
/tmp/ccThLRhb.s: Assembler messages:
/tmp/ccThLRhb.s:10: Error: invalid or unsupported encoding in .cfi_personality
/tmp/ccThLRhb.s:11: Error: invalid or unsupported encoding in .cfi_lsda

[upstream gcc 9.x w/ glibc 2.30 w/ binutils 2.33.1]
build/elf/librtld.os: in function `__sync_fetch_and_add_2':
libgcc/config/csky/linux-atomic.c:116: undefined reference to `__kernel_cmpxchg'

Currenlty, only the toolchain using binutils, gcc, glibc
fork produce a working toolchain. So disable gcc 9.x for
csky.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Guo Ren <guoren@kernel.org>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 8f9b167ca4..3e4a4d907c 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -58,8 +58,9 @@ config BR2_GCC_VERSION_9_X
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_powerpc_SPE
 	# C-SKY sk610 needs abiv1, which is not supported in
-	# upstream gcc
-	depends on !BR2_ck610
+	# upstream gcc. C-SKY gcc upstream support not tested
+	# with upstream binutils and glibc.
+	depends on !BR2_csky
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
 endchoice
