From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 10:15:17 +0200
Subject: [Buildroot] [git commit] arch/csky: restrict ck610 to the C-SKY gcc
 port
Message-ID: <20190801081630.38A5B88986@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8aad93817633e46262f2fa0e150b01d51dd324a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As Guo explained, upstream gcc does not support abi-v1 (only abi-v2), but
ck610 needs abi-v1 [0] [1]

To simplify things, we make the whole C-SKY architecture require gcc-9
or later, and add a single exception in gcc to force the ck610 to use
the C-SKY port.

Note that this does not change the default gcc version to be used for
C-SKY: the C-SKY port is still always the default one; the gcc-9 version
is only proposed as an alternative (except for ck610, of course).

[0] http://lists.busybox.net/pipermail/buildroot/2019-July/254386.html
[1] package/Makefile.in#73

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Guo Ren <guoren@kernel.org>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Romain Naour <romain.naour@gmail.com>
Acked-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in             | 3 +++
 arch/Config.in.csky        | 2 ++
 package/gcc/Config.in.host | 3 +++
 3 files changed, 8 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index d8d841b1a2..94bd2150ca 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -78,6 +78,9 @@ config BR2_aarch64_be
 config BR2_csky
 	bool "csky"
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	# Most variants are supported by gcc-9+, except one that is
+	# handled as a special exception in package/gcc/Config.in.host
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 	help
 	  csky is processor IP from china.
 	  http://www.c-sky.com/
diff --git a/arch/Config.in.csky b/arch/Config.in.csky
index 4bdfbfae4b..7e2029f759 100644
--- a/arch/Config.in.csky
+++ b/arch/Config.in.csky
@@ -5,6 +5,8 @@ choice
 	  Specific CPU variant to use
 
 config BR2_ck610
+	# Not supported by upstream gcc <= 9, and handled as a special
+	# exception in package/gcc/Config.in.host
 	bool "ck610"
 
 config BR2_ck807
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 8b563c8f27..adc12e95ea 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -89,6 +89,9 @@ config BR2_GCC_VERSION_9_X
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_powerpc_SPE
+	# C-SKY sk610 needs abiv1, which is not supported in
+	# upstream gcc
+	depends on !BR2_ck610
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
 endchoice
