From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Sep 2017 23:59:29 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/valgrind: hide
	comment when arch is not supported
Message-ID: <20170905220139.0F24681ED2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1bed722b737617fe480742a75d20d04684dfe2de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Currently, the comment that "valgrind needs shared libs" is not hidden
when the architecture dependencies are not met, which can confuse some
users (as recently seen on IRC).

Fix that by introducing the traditional _ARCH_SUPPORTS option, and have
the comment and the symbol depend on that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Brandon Maier <brandon.maier@rockwellcollins.com>
Cc: J??r??me Pouiller <jezz@sysmic.org>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed--by: Pedro Ribeiro <pedrib@gmail.com>
Tested-by: Pedro Ribeiro <pedrib@gmail.com>
[Arnout: put _ARCH_SUPPORTS at the top of the file]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

(cherry picked from commit afb6bc67a6e3a9fa08a61d81e17e0c152ed09f2a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/valgrind/Config.in | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
index 40e219d..75b779d 100644
--- a/package/valgrind/Config.in
+++ b/package/valgrind/Config.in
@@ -1,14 +1,19 @@
+config BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
+	bool
+	default y if BR2_ARM_CPU_ARMV7A
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	depends on !BR2_MIPS_SOFT_FLOAT
+
 comment "valgrind needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS
 
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
 
