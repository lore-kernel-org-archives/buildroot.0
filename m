From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Jun 2013 13:08:37 +0200
Subject: [Buildroot] [git commit] uClibc 0.9.31: remove stray
	kludges/conditions
Message-ID: <20130617111104.E8DA79AEBE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=25c3160092d7e542f77bf496af5ca7f0dc677aeb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/binutils/Config.in.host           |   11 +++++------
 package/connman/Config.in                 |    4 ++--
 package/libglib2/libglib2.mk              |    2 +-
 toolchain/toolchain-buildroot/Config.in.2 |   11 +----------
 4 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index d9bab44..3d687fe 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -4,8 +4,7 @@ choice
 	prompt "Binutils Version"
 	depends on !BR2_arc
 	default BR2_BINUTILS_VERSION_2_21 if (BR2_mips || BR2_mipsel || BR2_sh)
-	default BR2_BINUTILS_VERSION_2_21_1 if (!BR2_UCLIBC_VERSION_0_9_31)
-	default BR2_BINUTILS_VERSION_2_21
+	default BR2_BINUTILS_VERSION_2_21_1
 	help
 	  Select the version of binutils you wish to use.
 
@@ -22,19 +21,19 @@ choice
 		bool "binutils 2.21"
 
 	config BR2_BINUTILS_VERSION_2_21_1
-		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
+		depends on !BR2_avr32
 		bool "binutils 2.21.1"
 
 	config BR2_BINUTILS_VERSION_2_22
-		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
+		depends on !BR2_avr32
 		bool "binutils 2.22"
 
 	config BR2_BINUTILS_VERSION_2_23_1
-		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
+		depends on !BR2_avr32
 		bool "binutils 2.23.1"
 
 	config BR2_BINUTILS_VERSION_2_23_2
-		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
+		depends on !BR2_avr32
 		bool "binutils 2.23.2"
 
 endchoice
diff --git a/package/connman/Config.in b/package/connman/Config.in
index 93f9ab5..e0505b3 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_CONNMAN
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_IPTABLES
 	select BR2_PACKAGE_GNUTLS
-	depends on !(BR2_UCLIBC_VERSION_0_9_31 || BR2_UCLIBC_VERSION_0_9_32)
+	depends on !BR2_UCLIBC_VERSION_0_9_32
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
@@ -50,5 +50,5 @@ config BR2_PACKAGE_CONNMAN_CLIENT
 endif # BR2_PACKAGE_CONNMAN
 
 comment "connman needs a toolchain with IPv6, WCHAR, thread and resolver support"
-	depends on BR2_UCLIBC_VERSION_0_9_31 || BR2_UCLIBC_VERSION_0_9_32 || \
+	depends on BR2_UCLIBC_VERSION_0_9_32 || \
 		!BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 8a63bd9..4821a76 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -52,7 +52,7 @@ LIBGLIB2_CONF_ENV = \
 		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
 # old uClibc versions don't provide qsort_r
-ifeq ($(BR2_UCLIBC_VERSION_0_9_31)$(BR2_UCLIBC_VERSION_0_9_32)$(BR2_TOOLCHAIN_CTNG_uClibc)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2)$(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
+ifeq ($(BR2_UCLIBC_VERSION_0_9_32)$(BR2_TOOLCHAIN_CTNG_uClibc)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2)$(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
 LIBGLIB2_CONF_ENV += glib_cv_have_qsort_r=no
 else
 LIBGLIB2_CONF_ENV += glib_cv_have_qsort_r=yes
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index 35d6db2..f58a4f7 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -44,19 +44,11 @@ config BR2_TOOLCHAIN_BUILDROOT_LOCALE
 config BR2_TOOLCHAIN_BUILDROOT_CXX
 	bool "Enable C++ support"
 	select BR2_INSTALL_LIBSTDCPP
-	depends on !(! BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE && \
-		       BR2_TOOLCHAIN_BUILDROOT_LOCALE    && \
-		       BR2_UCLIBC_VERSION_0_9_31)
 	help
 	  Enable this option if you want your toolchain to support the
 	  C++ language and you want C++ libraries to be installed on
 	  your target system.
 
-comment "C++ support broken in uClibc 0.9.31 with locale enabled with gcc 4.2"
-	depends on !BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE && \
-		    BR2_TOOLCHAIN_BUILDROOT_LOCALE    && \
-		    BR2_UCLIBC_VERSION_0_9_31
-
 config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
 	bool "Enable stack protection support"
 	help
@@ -68,7 +60,7 @@ config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
 
 choice
 	prompt "Thread library implementation"
-	default BR2_PTHREADS_NATIVE if (!BR2_UCLIBC_VERSION_0_9_31) && !BR2_ARM_OABI && !(BR2_avr32 || BR2_xtensa)
+	default BR2_PTHREADS_NATIVE if !BR2_ARM_OABI && !(BR2_avr32 || BR2_xtensa)
 	default BR2_PTHREADS_OLD
 	help
 	  Use this option to select the thread library implementation
@@ -92,7 +84,6 @@ choice
 	config BR2_PTHREADS_NATIVE
 		bool "Native POSIX Threading (NPTL)"
 	        select BR2_TOOLCHAIN_HAS_THREADS
-		depends on !BR2_UCLIBC_VERSION_0_9_31
 		depends on !BR2_ARM_OABI
 		depends on !BR2_x86_i386
 		depends on !BR2_avr32
