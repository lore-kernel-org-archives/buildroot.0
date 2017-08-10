From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Aug 2017 23:51:11 +0200
Subject: [Buildroot] [PATCH] package/valgrind: hide comment when arch is not
	supported
Message-ID: <20170810215111.32360-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the comment that "valgrind needs shared libs" is not hidden
when the architecture dependencies are not met, which can confuse some
users (as recently seen on IRC).

Fix that by introducing the traditional _ARCH_SUPPORTS option, and have
the comment and the symbol depend on that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Brandon Maier <brandon.maier@rockwellcollins.com>
Cc: J?r?me Pouiller <jezz@sysmic.org>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

---
Note: Cc-ing the people that have touched valgrind in the past 12
months-or-so...
---
 package/valgrind/Config.in | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
index 40e219d95a..919bd1afb5 100644
--- a/package/valgrind/Config.in
+++ b/package/valgrind/Config.in
@@ -1,14 +1,19 @@
 comment "valgrind needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS
 
+config BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
+	bool
+	default y if BR2_ARM_CPU_ARMV7A
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	depends on !BR2_MIPS_SOFT_FLOAT
+
 config BR2_PACKAGE_VALGRIND
 	bool "valgrind"
-	depends on BR2_ARM_CPU_ARMV7A || BR2_i386 || \
-		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
-		   BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
-		   BR2_x86_64
+	depends on BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_MIPS_SOFT_FLOAT
 	help
 	  Tool for debugging and profiling Linux programs.
 
-- 
2.11.0
