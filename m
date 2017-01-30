From: Francesco Negri <francesconegri@gmail.com>
Date: Mon, 30 Jan 2017 11:58:08 +0100
Subject: [Buildroot] [PATCH v2 1/1] git-crypt: new package
In-Reply-To: <20170130002853.76103-1-francesconegri@gmail.com>
References: <20170130002853.76103-1-francesconegri@gmail.com>
Message-ID: <20170130105808.86147-1-francesconegri@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francesco Negri <francesconegri@gmail.com>
---
Changes v1 -> v2:
  - added BR2_USE_MMU and BR2_PACKAGE_OPENSSL to Config.in
  - added dependency comment (hope it is correct!)
  - download from official website instead of GitHub
  - use hash from git-crypt mailing list
---
 package/Config.in                |  1 +
 package/git-crypt/Config.in      | 15 +++++++++++++++
 package/git-crypt/git-crypt.hash |  2 ++
 package/git-crypt/git-crypt.mk   | 23 +++++++++++++++++++++++
 4 files changed, 41 insertions(+)
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
index 000000000..e7a67ae47
--- /dev/null
+++ b/package/git-crypt/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_GIT_CRYPT
+	bool "git-crypt"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_GIT
+	select BR2_USE_MMU # git
+	select BR2_PACKAGE_OPENSSL
+	help
+	  git-crypt enables transparent encryption and decryption of files in a
+	  git repository.
+
+	  https://www.agwa.name/projects/git-crypt/
+
+comment "git-crypt needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU
diff --git a/package/git-crypt/git-crypt.hash b/package/git-crypt/git-crypt.hash
new file mode 100644
index 000000000..8589f03f7
--- /dev/null
+++ b/package/git-crypt/git-crypt.hash
@@ -0,0 +1,2 @@
+# Hash from: https://lists.cloudmutt.com/pipermail/git-crypt-announce/2015-May/000003.html
+sha256 0a8f92c0a0a125bf768d0c054d947ca4e4b8d6556454b0e7e87fb907ee17cf06 git-crypt-0.5.0.tar.gz
diff --git a/package/git-crypt/git-crypt.mk b/package/git-crypt/git-crypt.mk
new file mode 100644
index 000000000..13f8f435b
--- /dev/null
+++ b/package/git-crypt/git-crypt.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# git-crypt
+#
+################################################################################
+
+GIT_CRYPT_VERSION = 0.5.0
+
+GIT_CRYPT_SOURCE = git-crypt-$(GIT_CRYPT_VERSION).tar.gz
+GIT_CRYPT_SITE = https://www.agwa.name/projects/git-crypt/downloads
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
