From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 10:45:08 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/directfb: disable
 on riscv32
Message-ID: <20210610081742.891BC86F8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2956477b9e9078f22341c1140e7c326e912f0f07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

directfb unconditionally uses __NR_futex which will raise the following
build failure on riscv32:

system.c:242:21: error: '__NR_futex' undeclared (first use in this function)
  242 |      ret = syscall( __NR_futex, uaddr, op, val, timeout, uaddr2, val3 );
      |                     ^~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c0f4168575fa85af933539441eea95a3b10dac91

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit cb6fd050cde0eaf6b9b3c8f4cab2b6d925974922)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/directfb/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 20481f56da..f4d6b8cbd1 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DIRECTFB
 	bool "directfb"
+	depends on !BR2_RISCV_32
 	depends on !BR2_STATIC_LIBS # static link issues
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -161,6 +162,7 @@ config BR2_PACKAGE_DIRECTFB_TESTS
 endif # BR2_PACKAGE_DIRECTFB
 
 comment "directfb needs a glibc or uClibc toolchain w/ C++, NPTL, gcc >= 4.5, dynamic library"
+	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || BR2_TOOLCHAIN_USES_MUSL || \
