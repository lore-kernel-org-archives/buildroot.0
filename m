From: unixmania at gmail.com <unixmania@gmail.com>
Date: Mon,  2 Dec 2019 21:14:05 -0300
Subject: [Buildroot] [PATCH] package/glibc: drop dependency of utilities on
 bash
Message-ID: <20191203001405.12984-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

The dependency was added because ldd uses bash-specific syntax to
localize messages. Add a post-patch hook, instead, to replace the
occurrences of $"foo" by "foo", simply, so the code becomes POSIX
sh compliant if bash is not selected.

Also set the configuration environment accordingly to replace the
/bin/bash hashbang by /bin/sh.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/glibc/Config.in |  4 ----
 package/glibc/glibc.mk  | 11 ++++++++++-
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index b8c2573d96..7b2f246947 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -11,10 +11,6 @@ endif
 
 config BR2_PACKAGE_GLIBC_UTILS
 	bool "Install glibc utilities"
-	depends on BR2_PACKAGE_BASH
 	help
 	  Enabling this option will compile and install the getconf,
 	  ldconfig, ldd and locale glibc utilities for the target.
-
-comment "glibc utilities need bash"
-	depends on !BR2_PACKAGE_BASH
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 8eafa55ae1..1b38f8aedb 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -74,10 +74,19 @@ endef
 endif
 
 GLIBC_CONF_ENV = \
-	ac_cv_path_BASH_SHELL=/bin/bash \
+	ac_cv_path_BASH_SHELL=/bin/$(if $(BR2_PACKAGE_BASH),bash,sh) \
 	libc_cv_forced_unwind=yes \
 	libc_cv_ssp=no
 
+# POSIX shell does not support localization, so remove the corresponding
+# syntax from ldd if bash is not selected.
+ifeq ($(BR2_PACKAGE_BASH),)
+define GLIBC_LDD_NO_BASH
+	$(SED) 's/$$"/"/g' $(@D)/elf/ldd.bash.in
+endef
+GLIBC_POST_PATCH_HOOKS += GLIBC_LDD_NO_BASH
+endif
+
 # Override the default library locations of /lib64/<abi> and
 # /usr/lib64/<abi>/ for RISC-V.
 ifeq ($(BR2_riscv),y)
-- 
2.18.1
