From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 22:22:36 +0200
Subject: [Buildroot] [git commit] boost: add
 BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
Message-ID: <20180630203109.674BD83941@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8360fb0150fcc65d75cdbfeaa3da811cd17c2ea5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rework boost-context dependencies and manage them through the hidden
BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/Config.in | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 781bc47c00..bb53adccdd 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -69,10 +69,18 @@ config BR2_PACKAGE_BOOST_CONTAINER
 # http://www.boost.org/doc/libs/1_59_0/libs/context/doc/html/context/architectures.html
 # for the list of supported architectures. Sparc pretends to be
 # supported, but it doesn't build.
+config BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	bool
+	default y if ((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM)
+	default y if BR2_i386
+	default y if BR2_mips
+	default y if BR2_mipsel
+	default y if BR2_powerpc
+	default y if BR2_x86_64
+
 config BR2_PACKAGE_BOOST_CONTEXT
 	bool "boost-context"
-	depends on ((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM) || \
-		BR2_i386 || BR2_mips || BR2_mipsel || BR2_powerpc || BR2_x86_64
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	help
 	  C++11 context switching library.
