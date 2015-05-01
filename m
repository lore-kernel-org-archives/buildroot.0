From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 11:13:54 +0200
Subject: [Buildroot] [git commit] toolchain-external: mark Synopsys
	toolchain as broken
Message-ID: <20150501091550.0E65081D5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd3c00fbc01e99496f28276c62182963cada0979
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This uClibc toolchain does not provide an appropriate uClibc
configuration for Buildroot: missing IPv6, missing nsl stub, missing
program invocation, etc. Therefore, we mark it as broken, waiting for
a new upstream release of a new toolchain.

We keep around the toolchain-external Synopsys code anyway, since it
will most likely be identical for the new toolchain version. However,
we remove all the quirks that were introduced to start work around
issues related to this toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/exim/exim.mk                   |    7 -------
 package/wvdial/Config.in               |    2 --
 package/wvstreams/Config.in            |    3 ---
 toolchain/toolchain-external/Config.in |    4 ++++
 4 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 67dbd64..ed309de 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -70,13 +70,6 @@ define EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL
 endef
 endif
 
-# this specific toolchain lacks libnsl
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12),y)
-define EXIM_REMOVE_LIBNSL_FROM_MAKEFILE
-	$(SED) 's/-lnsl//g' $(@D)/OS/Makefile-Linux
-endef
-endif
-
 define EXIM_CONFIGURE_TOOLCHAIN
 	$(call exim-config-add,CC,$(TARGET_CC))
 	$(call exim-config-add,CFLAGS,$(TARGET_CFLAGS))
diff --git a/package/wvdial/Config.in b/package/wvdial/Config.in
index 14befcf..e57f975 100644
--- a/package/wvdial/Config.in
+++ b/package/wvdial/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_WVDIAL
 	bool "wvdial"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # wvstreams
-	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12 # wvstreams
 	select BR2_PACKAGE_WVSTREAMS
 	help
 	  wvdial is an intelligent Point-to-Point Protocol dialer
@@ -12,4 +11,3 @@ config BR2_PACKAGE_WVDIAL
 comment "wvdial needs a toolchain w/ C++"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12
diff --git a/package/wvstreams/Config.in b/package/wvstreams/Config.in
index 0580516..3080dc7 100644
--- a/package/wvstreams/Config.in
+++ b/package/wvstreams/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_WVSTREAMS
 	bool "wvstreams"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
-	# toolchain lacks program_invocation_*
-	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
@@ -14,4 +12,3 @@ config BR2_PACKAGE_WVSTREAMS
 comment "wvstreams needs a toolchain w/ C++"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 9433101..665a15b 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -837,6 +837,10 @@ config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12
 	bool "Synopsys ARC 2014.12 toolchain"
 	depends on BR2_arc
 	depends on BR2_HOSTARCH = "x86_64"
+	# does not provide IPv6, and lacks many uClibc features
+	# expected by Buildroot. The next Synopsys toolchain version
+	# should fix those problems.
+	depends on BROKEN
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
