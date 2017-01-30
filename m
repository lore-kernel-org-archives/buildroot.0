From: Francesco Negri <francesconegri@gmail.com>
Date: Mon, 30 Jan 2017 01:28:53 +0100
Subject: [Buildroot] [PATCH 1/1] git-crypt: new package
Message-ID: <20170130002853.76103-1-francesconegri@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francesco Negri <francesconegri@gmail.com>
---
 package/Config.in                |  1 +
 package/git-crypt/Config.in      |  9 +++++++++
 package/git-crypt/git-crypt.hash |  2 ++
 package/git-crypt/git-crypt.mk   | 21 +++++++++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/git-crypt/Config.in
 create mode 100644 package/git-crypt/git-crypt.hash
 create mode 100644 package/git-crypt/git-crypt.mk

diff --git a/package/Config.in b/package/Config.in
index 6a3a1a7c7..067ff3cc9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -138,6 +138,7 @@ menu "Development tools"
 	source "package/gawk/Config.in"
 	source "package/gettext/Config.in"
 	source "package/git/Config.in"
+	source "package/git-crypt/Config.in"
 	source "package/gperf/Config.in"
 	source "package/grep/Config.in"
 	source "package/jq/Config.in"
diff --git a/package/git-crypt/Config.in b/package/git-crypt/Config.in
new file mode 100644
index 000000000..15a12b5c6
--- /dev/null
+++ b/package/git-crypt/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_GIT_CRYPT
+	bool "git-crypt"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_GIT
+	help
+	  git-crypt enables transparent encryption and decryption of files in a
+	  git repository.
+
+	  https://github.com/AGWA/git-crypt
diff --git a/package/git-crypt/git-crypt.hash b/package/git-crypt/git-crypt.hash
new file mode 100644
index 000000000..fe18498cc
--- /dev/null
+++ b/package/git-crypt/git-crypt.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 5150144a528bc74eeb47a2884cf2fefe978a1d1dc0223bbfcac395fa6a73a410 git-crypt-0.5.0.tar.gz
diff --git a/package/git-crypt/git-crypt.mk b/package/git-crypt/git-crypt.mk
new file mode 100644
index 000000000..9f7df223d
--- /dev/null
+++ b/package/git-crypt/git-crypt.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# git-crypt
+#
+################################################################################
+
+GIT_CRYPT_VERSION = 0.5.0
+GIT_CRYPT_SITE = $(call github,agwa,git-crypt,$(GIT_CRYPT_VERSION))
+GIT_CRYPT_DEPENDENCIES = git openssl
+GIT_CRYPT_LICENSE = GPLv3
+GIT_CRYPT_LICENSE_FILES = COPYING
+
+define GIT_CRYPT_BUILD_CMDS
+	$(MAKE) CXX="$(TARGET_CXX)" -C $(@D) all
+endef
+
+define GIT_CRYPT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/git-crypt $(TARGET_DIR)/usr/bin/git-crypt
+endef
+
+$(eval $(generic-package))
-- 
2.11.0
