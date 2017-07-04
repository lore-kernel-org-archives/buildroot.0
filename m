From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:57 +0200
Subject: [Buildroot] [PATCH 077/100] tpm-tools: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-78-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tpm-tools/Config.in    | 1 -
 package/tpm-tools/tpm-tools.mk | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/tpm-tools/Config.in b/package/tpm-tools/Config.in
index 091f424..e115687 100644
--- a/package/tpm-tools/Config.in
+++ b/package/tpm-tools/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_TPM_TOOLS
 	depends on !BR2_arc # trousers
 	select BR2_PACKAGE_TROUSERS
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Tools to manage and diagnose a TPM
 
diff --git a/package/tpm-tools/tpm-tools.mk b/package/tpm-tools/tpm-tools.mk
index c90edbb..4dbf50a 100644
--- a/package/tpm-tools/tpm-tools.mk
+++ b/package/tpm-tools/tpm-tools.mk
@@ -9,8 +9,7 @@ TPM_TOOLS_SITE = http://downloads.sourceforge.net/project/trousers/tpm-tools/$(T
 TPM_TOOLS_STRIP_COMPONENTS = 2
 TPM_TOOLS_LICENSE = Common Public License Version 1.0
 TPM_TOOLS_LICENSE_FILES = LICENSE
-TPM_TOOLS_DEPENDENCIES = trousers openssl \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+TPM_TOOLS_DEPENDENCIES = trousers openssl $(TARGET_NLS_DEPENDENCIES)
 # configure.in and lib/Makefile.am is patched
 TPM_TOOLS_AUTORECONF = YES
 TPM_TOOLS_GETTEXTIZE = YES
-- 
2.9.4
