From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 13 Mar 2015 15:22:06 -0300
Subject: [Buildroot] [PATCH 07/15] package/uclibc: drop non-largefile support
In-Reply-To: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1426270934-15499-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Force LFS builds for uClibc and drop the menu option.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/Config.in | 7 -------
 package/uclibc/uclibc.mk | 7 -------
 2 files changed, 14 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 3a65752..912872a 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -62,13 +62,6 @@ config BR2_UCLIBC_CONFIG
 	  See also docs/README in this package.
 	  If unsure, use the default.
 
-config BR2_TOOLCHAIN_BUILDROOT_LARGEFILE
-	bool "Enable large file (files > 2 GB) support"
-	select BR2_LARGEFILE
-	help
-	  Enable this option if you want your toolchain to support
-	  files bigger than 2 GB.
-
 config BR2_TOOLCHAIN_BUILDROOT_INET_IPV6
 	bool "Enable IPv6 support"
 	select BR2_INET_IPV6
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index feca77b..5a57a16 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -229,16 +229,9 @@ endif
 # Largefile
 #
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT_LARGEFILE),y)
 define UCLIBC_LARGEFILE_CONFIG
 	$(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_LFS,$(@D)/.config)
 endef
-else
-define UCLIBC_LARGEFILE_CONFIG
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_LFS,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_FOPEN_LARGEFILE_MODE,$(@D)/.config)
-endef
-endif
 
 #
 # MMU
-- 
2.0.5
