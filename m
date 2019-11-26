From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Tue, 26 Nov 2019 09:55:41 +0100
Subject: [Buildroot] [PATCH] package/glibc: install locale utility when nls
 is enabled
Message-ID: <20191126085541.2688-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/glibc/Config.in | 2 +-
 package/glibc/glibc.mk  | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 323767f..b8c2573 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_GLIBC_UTILS
 	depends on BR2_PACKAGE_BASH
 	help
 	  Enabling this option will compile and install the getconf,
-	  ldconfig and ldd glibc utilities for the target.
+	  ldconfig, ldd and locale glibc utilities for the target.
 
 comment "glibc utilities need bash"
 	depends on !BR2_PACKAGE_BASH
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 5da0b06..e366134 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -146,7 +146,10 @@ endif
 ifeq ($(BR2_PACKAGE_GLIBC_UTILS),y)
 GLIBC_TARGET_UTILS_USR_BIN = posix/getconf elf/ldd
 GLIBC_TARGET_UTILS_SBIN = elf/ldconfig
+endif
 
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+GLIBC_TARGET_UTILS_USR_BIN += locale/locale
 endif
 
 define GLIBC_INSTALL_TARGET_CMDS
-- 
2.7.4
