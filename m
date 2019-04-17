From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 08:43:24 +0200
Subject: [Buildroot] [git commit] package/pcre2: jit needs threads
Message-ID: <20190417063913.4AFCB812AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ce9f557f8b0819c2aea718033c8e9e297fd64de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a BR2_PACKAGE_PCRE2_JIT_ARCH_SUPPORTS to be able to use it in the
comment

Fixes:
 - http://autobuild.buildroot.org/results/547be5264effaf27c7f85ece88c5f5f792abd910

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pcre2/Config.in | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/pcre2/Config.in b/package/pcre2/Config.in
index 007dd960c6..f35877f376 100644
--- a/package/pcre2/Config.in
+++ b/package/pcre2/Config.in
@@ -23,12 +23,24 @@ config BR2_PACKAGE_PCRE2_32
 	  This option builds the 32-bits pcre2 library, i.e
 	  'libpcre2-32'
 
+config BR2_PACKAGE_PCRE2_JIT_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_powerpc
+	default y if BR2_sparc
+
 config BR2_PACKAGE_PCRE2_JIT
 	bool "enable JIT support"
-	depends on BR2_i386 || BR2_x86_64 || BR2_arm  || BR2_armeb || \
-		BR2_aarch64 || BR2_mips || BR2_mipsel || \
-		BR2_mips64 || BR2_mips64el || BR2_powerpc || BR2_sparc
+	depends on BR2_PACKAGE_PCRE2_JIT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  This option enables JIT support
 
+comment "JIT support needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_PCRE2_JIT_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 endif
