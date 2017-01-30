From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 15:38:04 +0100
Subject: [Buildroot] [git commit] git-crypt: new package
Message-ID: <20170130143937.9FAC38040F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c43f5fd37e2cb4298c042b07b1ba017ebcd9256
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: git is a runtime dependency, use pkg-config for openssl
	dependencies, use make install]
Signed-off-by: Francesco Negri <francesconegri@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                |  1 +
 package/git-crypt/Config.in      | 15 +++++++++++++++
 package/git-crypt/git-crypt.hash |  2 ++
 package/git-crypt/git-crypt.mk   | 25 +++++++++++++++++++++++++
 4 files changed, 43 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 6a3a1a7..067ff3c 100644
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
index 0000000..362fe9a
--- /dev/null
+++ b/package/git-crypt/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_GIT_CRYPT
+	bool "git-crypt"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # git
+	select BR2_PACKAGE_GIT # runtime
+	select BR2_PACKAGE_OPENSSL
+	help
+	  git-crypt enables transparent encryption and decryption of
+	  files in a git repository.
+
+	  https://www.agwa.name/projects/git-crypt/
+
+comment "git-crypt needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU
diff --git a/package/git-crypt/git-crypt.hash b/package/git-crypt/git-crypt.hash
new file mode 100644
index 0000000..8589f03
--- /dev/null
+++ b/package/git-crypt/git-crypt.hash
@@ -0,0 +1,2 @@
+# Hash from: https://lists.cloudmutt.com/pipermail/git-crypt-announce/2015-May/000003.html
+sha256 0a8f92c0a0a125bf768d0c054d947ca4e4b8d6556454b0e7e87fb907ee17cf06 git-crypt-0.5.0.tar.gz
diff --git a/package/git-crypt/git-crypt.mk b/package/git-crypt/git-crypt.mk
new file mode 100644
index 0000000..7785ddc
--- /dev/null
+++ b/package/git-crypt/git-crypt.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# git-crypt
+#
+################################################################################
+
+GIT_CRYPT_VERSION = 0.5.0
+GIT_CRYPT_SITE = https://www.agwa.name/projects/git-crypt/downloads
+GIT_CRYPT_DEPENDENCIES = host-pkgconf openssl
+GIT_CRYPT_LICENSE = GPLv3+, MIT
+GIT_CRYPT_LICENSE_FILES = COPYING parse_options.hpp
+
+GIT_CRYPT_LIBS = `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
+
+define GIT_CRYPT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		LDFLAGS="$(TARGET_LDFLAGS) $(GIT_CRYPT_LIBS)" PREFIX=/usr
+endef
+
+define GIT_CRYPT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
+		PREFIX=/usr install
+endef
+
+$(eval $(generic-package))
