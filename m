From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 May 2018 23:09:36 +0200
Subject: [Buildroot] [git commit] ipsec-tools: rename options to have proper
 prefix
Message-ID: <20180521212027.1369D7F95E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d2c5c2540bff90877043c6f8c70a5aebc3304db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A number of options in the ipsec-tools package had their Config.in
option prefixed by BR2_PACKAGE_IPSEC, while the prefix should be
BR2_PACKAGE_IPSEC_TOOLS. This commit fixes that, and adds the
necessary Config.in.legacy handling.

Since those options are part of a choice, the legacy handling cannot
select the new name of the options, so the legacy handling only
informs the user of the rename.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                   | 24 ++++++++++++++++++++++++
 package/ipsec-tools/Config.in      |  8 ++++----
 package/ipsec-tools/ipsec-tools.mk |  6 +++---
 3 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7ec9526710..4e4f499454 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,30 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.05"
 
+config BR2_PACKAGE_IPSEC_SECCTX_DISABLE
+	bool "ipsec-tools security context disable option renamed"
+	select BR2_LEGACY
+	help
+	  For consistency reasons, the option
+	  BR2_PACKAGE_IPSEC_SECCTX_DISABLE was renamed to
+	  BR2_PACKAGE_IPSEC_TOOLS_SECCTX_DISABLE.
+
+config BR2_PACKAGE_IPSEC_SECCTX_ENABLE
+	bool "ipsec-tools SELinux security context enable option renamed"
+	select BR2_LEGACY
+	help
+	  For consistency reasons, the option
+	  BR2_PACKAGE_IPSEC_SECCTX_ENABLE was renamed to
+	  BR2_PACKAGE_IPSEC_TOOLS_SECCTX_ENABLE.
+
+config BR2_PACKAGE_IPSEC_SECCTX_KERNEL
+	bool "ipsec-tools kernel security context enable option renamed"
+	select BR2_LEGACY
+	help
+	  For consistency reasons, the option
+	  BR2_PACKAGE_IPSEC_SECCTX_KERNEL was renamed to
+	  BR2_PACKAGE_IPSEC_TOOLS_SECCTX_KERNEL.
+
 config BR2_PACKAGE_LIBTFDI_CPP
 	bool "libftdi C++ bindings option renamed"
 	select BR2_LEGACY
diff --git a/package/ipsec-tools/Config.in b/package/ipsec-tools/Config.in
index 1635675a36..59154123e6 100644
--- a/package/ipsec-tools/Config.in
+++ b/package/ipsec-tools/Config.in
@@ -57,17 +57,17 @@ config BR2_PACKAGE_IPSEC_TOOLS_HYBRID
 
 choice
 	prompt "Security context"
-	default BR2_PACKAGE_IPSEC_SECCTX_DISABLE
+	default BR2_PACKAGE_IPSEC_TOOLS_SECCTX_DISABLE
 	help
 	  Selects whether or not to enable security context support.
 
-config BR2_PACKAGE_IPSEC_SECCTX_DISABLE
+config BR2_PACKAGE_IPSEC_TOOLS_SECCTX_DISABLE
 	bool "Disable security context support"
 
-config BR2_PACKAGE_IPSEC_SECCTX_ENABLE
+config BR2_PACKAGE_IPSEC_TOOLS_SECCTX_ENABLE
 	bool "Enable SELinux security context support"
 
-config BR2_PACKAGE_IPSEC_SECCTX_KERNEL
+config BR2_PACKAGE_IPSEC_TOOLS_SECCTX_KERNEL
 	bool "Enable kernel security context"
 
 endchoice
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index c0b180de55..ddae9a75f3 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -68,13 +68,13 @@ else
 IPSEC_TOOLS_CONF_OPTS += --disable-hybrid
 endif
 
-ifeq ($(BR2_PACKAGE_IPSEC_SECCTX_DISABLE),y)
+ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_SECCTX_DISABLE),y)
 IPSEC_TOOLS_CONF_OPTS += --enable-security-context=no
 endif
-ifeq ($(BR2_PACKAGE_IPSEC_SECCTX_ENABLE),y)
+ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_SECCTX_ENABLE),y)
 IPSEC_TOOLS_CONF_OPTS += --enable-security-context=yes
 endif
-ifeq ($(BR2_PACKAGE_IPSEC_SECCTX_KERNEL),y)
+ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_SECCTX_KERNEL),y)
 IPSEC_TOOLS_CONF_OPTS += --enable-security-context=kernel
 endif
 
