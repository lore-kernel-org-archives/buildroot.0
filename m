From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Dec 2015 19:53:16 +0100
Subject: [Buildroot] [PATCH 4/7] package/racehound: require kernel modules
	from Kconfig
In-Reply-To: <cover.1449771844.git.yann.morin.1998@free.fr>
References: <cover.1449771844.git.yann.morin.1998@free.fr>
Message-ID: <2252f9ff70115e4e0417c20c09ce0d3ab9c15b3f.1449771844.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And reorder 'select' after 'depends'

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/racehound/Config.in    | 3 ++-
 package/racehound/racehound.mk | 6 ------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/racehound/Config.in b/package/racehound/Config.in
index b9c4f36..9f1011b 100644
--- a/package/racehound/Config.in
+++ b/package/racehound/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_RACEHOUND
 	bool "racehound"
-	select BR2_PACKAGE_ELFUTILS
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -9,6 +8,8 @@ config BR2_PACKAGE_RACEHOUND
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	# only x86/x86_64 supported
 	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
 	help
 	  RaceHound can be used to detect data races in the Linux
 	  kernel on x86.
diff --git a/package/racehound/racehound.mk b/package/racehound/racehound.mk
index 66f3ebe..7d8d1e3 100644
--- a/package/racehound/racehound.mk
+++ b/package/racehound/racehound.mk
@@ -12,12 +12,6 @@ RACEHOUND_SUPPORTS_IN_SOURCE_BUILD = NO
 
 RACEHOUND_DEPENDENCIES = elfutils linux
 
-# We're building a kernel module without using the kernel-module infra,
-# so we need to tell we want module support in the kernel
-ifeq ($(BR2_PACKAGE_RACEHOUND),y)
-LINUX_NEEDS_MODULES = y
-endif
-
 # override auto detection (uses host parameters, not cross compile
 # ready)
 RACEHOUND_CONF_OPTS += \
-- 
1.9.1
