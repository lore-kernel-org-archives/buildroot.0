From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Jan 2020 11:59:42 +0100
Subject: [Buildroot] [git commit] package/tinyssh: new package
Message-ID: <20200101105048.077948EA29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7b3de8a3b1b446c081593192c3acb847f6f5f05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TinySSH is a minimalistic SSH server which implements only a subset of
SSHv2 features.

Might be useful for small systems.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
[yann.morin.1998 at free.fr:
  - add missing licence file, as noticed by Giulio
  - update the version to bring two fixes
  - update hash file accordingly (version and licence file)
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/tinyssh/Config.in    |  8 ++++++++
 package/tinyssh/tinyssh.hash |  3 +++
 package/tinyssh/tinyssh.mk   | 20 ++++++++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 27bedad48c..90941dd4c8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2462,6 +2462,7 @@ F:	package/tstools/
 N:	Vadim Kochan <vadim4j@gmail.com>
 F:	package/brcm-patchram-plus/
 F:	package/gettext-tiny/
+F:	package/tinyssh/
 
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clang/
diff --git a/package/Config.in b/package/Config.in
index 05a4e87ae7..894284c650 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2149,6 +2149,7 @@ endif
 	source "package/thttpd/Config.in"
 	source "package/tinc/Config.in"
 	source "package/tinyhttpd/Config.in"
+	source "package/tinyssh/Config.in"
 	source "package/tor/Config.in"
 	source "package/traceroute/Config.in"
 	source "package/transmission/Config.in"
diff --git a/package/tinyssh/Config.in b/package/tinyssh/Config.in
new file mode 100644
index 0000000000..da19d2d454
--- /dev/null
+++ b/package/tinyssh/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_TINYSSH
+	bool "tinyssh"
+	depends on BR2_USE_MMU # fork()
+	help
+	  TinySSH is a minimalistic SSH server which implements only
+	  a subset of SSHv2 features.
+
+	  https://tinyssh.org
diff --git a/package/tinyssh/tinyssh.hash b/package/tinyssh/tinyssh.hash
new file mode 100644
index 0000000000..99ee4afaff
--- /dev/null
+++ b/package/tinyssh/tinyssh.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  65a7dc785861a09399419a1e7c42cddf66f32dc233a33277327b11f1bd8a772c  tinyssh-7e2b4025bf3a2dae4c6617e3eb39df4bcde37454.tar.gz
+sha256  b5dc19477e29f4111e1c16cd89ec0782f5a07b1a30e3bdb7c155425b81b12c46  LICENCE
diff --git a/package/tinyssh/tinyssh.mk b/package/tinyssh/tinyssh.mk
new file mode 100644
index 0000000000..6f22be6c52
--- /dev/null
+++ b/package/tinyssh/tinyssh.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# tinyssh
+#
+################################################################################
+
+TINYSSH_VERSION = 7e2b4025bf3a2dae4c6617e3eb39df4bcde37454
+TINYSSH_SITE = $(call github,janmojzis,tinyssh,$(TINYSSH_VERSION))
+TINYSSH_LICENSE = Public Domain, CC0-1.0
+TINYSSH_LICENSE_FILES = LICENCE
+
+define TINYSSH_BUILD_CMDS
+	$(TARGET_MAKE_ENV) CC="$(TARGET_CC)" $(MAKE) -C $(@D) cross-compile
+endef
+
+define TINYSSH_INSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
+endef
+
+$(eval $(generic-package))
