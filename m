From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 21:07:36 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] Config.in: disable
 PIC/PIE if the toolchain does not support PIE
Message-ID: <20191031200136.1D6308E2C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=464be6f0f7fd1e61ed998a9c637b599cacfddaa0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

m68k does not seem to really support PIE as it raises the following
build failure with aer-inject:
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/7.4.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/Scrt1.o: in function `lib_main':
(.text+0x4): undefined reference to `__shared_flat_add_library'
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/7.4.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: final link failed: bad value

We also have another build failure with uclibc on microblazeel:
/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/8.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: final link failed: bad value
collect2: error: ld returned 1 exit status
Makefile.in:114: recipe for target '../utils/getconf' failed

So add a BR2_TOOLCHAIN_SUPPORTS_PIE dependency on BR2_PIC_PIE

Fixes:
 - http://autobuild.buildroot.net/results/4cdd6f0368cc9d3c6e88f01b1a8929eb0839b638
 - http://autobuild.buildroot.net/results/a82a484409149d7f9aff6140ddcb89f627f508c7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit de3fa43891bc679da14f8d14dda835180a8e977c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Config.in b/Config.in
index a6e280b885..8587680179 100644
--- a/Config.in
+++ b/Config.in
@@ -718,10 +718,15 @@ comment "Security Hardening Options"
 config BR2_PIC_PIE
 	bool "Build code with PIC/PIE"
 	depends on BR2_SHARED_LIBS
+	depends on BR2_TOOLCHAIN_SUPPORTS_PIE
 	help
 	  Generate Position-Independent Code (PIC) and link
 	  Position-Independent Executables (PIE).
 
+comment "PIC/PIE needs a toolchain w/ PIE"
+	depends on BR2_SHARED_LIBS
+	depends on !BR2_TOOLCHAIN_SUPPORTS_PIE
+
 choice
 	bool "Stack Smashing Protection"
 	default BR2_SSP_ALL if BR2_ENABLE_SSP # legacy
@@ -804,12 +809,16 @@ config BR2_RELRO_PARTIAL
 
 config BR2_RELRO_FULL
 	bool "Full"
+	depends on BR2_TOOLCHAIN_SUPPORTS_PIE
 	select BR2_PIC_PIE
 	help
 	  This option includes the partial configuration, but also marks
 	  the GOT as read-only at the cost of initialization time during
 	  program loading, i.e every time an executable is started.
 
+comment "RELRO Full needs a toolchain w/ PIE"
+	depends on !BR2_TOOLCHAIN_SUPPORTS_PIE
+
 endchoice
 
 comment "RELocation Read Only (RELRO) needs shared libraries"
