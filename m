From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 18:02:42 +0200
Subject: [Buildroot] [git commit] package/bash-completion: new package
Message-ID: <20180428160346.BCC23811A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=989470cf14a34f9f7a071a9be1e55425fd242915
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
[Thomas: transfer the explanation from the commit log into the
Config.in help text, after rewording it.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                            |  1 +
 package/bash-completion/Config.in            | 15 +++++++++++++++
 package/bash-completion/bash-completion.hash |  3 +++
 package/bash-completion/bash-completion.mk   | 16 ++++++++++++++++
 4 files changed, 35 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 08f96b68d5..19aa012933 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1940,6 +1940,7 @@ comment "Shells"
 	source "package/zsh/Config.in"
 comment "Utilities"
 	source "package/at/Config.in"
+	source "package/bash-completion/Config.in"
 	source "package/ccrypt/Config.in"
 	source "package/crudini/Config.in"
 	source "package/dialog/Config.in"
diff --git a/package/bash-completion/Config.in b/package/bash-completion/Config.in
new file mode 100644
index 0000000000..c907c04a54
--- /dev/null
+++ b/package/bash-completion/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_BASH_COMPLETION
+	bool "bash completion"
+	depends on BR2_PACKAGE_BASH
+	help
+	  Add bash completion infrastructure.
+
+	  The bash completion infrastructure is enabled by
+	  /etc/profile.d/bash_completion.sh, which is normally
+	  sourced by /etc/profile.
+
+	  If the system does not use the /etc/profile.d directory
+	  mechanism, the /etc/profile.d/bash_completion.sh script can
+	  be sourced from /etc/bashrc or ~/.bashrc.
+
+	  https://github.com/scop/bash-completion
diff --git a/package/bash-completion/bash-completion.hash b/package/bash-completion/bash-completion.hash
new file mode 100644
index 0000000000..2c4cf67578
--- /dev/null
+++ b/package/bash-completion/bash-completion.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 c01f5570f5698a0dda8dc9cfb2a83744daa1ec54758373a6e349bd903375f54d  bash-completion-2.8.tar.xz
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/bash-completion/bash-completion.mk b/package/bash-completion/bash-completion.mk
new file mode 100644
index 0000000000..9976918648
--- /dev/null
+++ b/package/bash-completion/bash-completion.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# bash-completion
+#
+################################################################################
+
+BASH_COMPLETION_VERSION = 2.8
+BASH_COMPLETION_SITE = https://github.com/scop/bash-completion/releases/download/$(BASH_COMPLETION_VERSION)
+BASH_COMPLETION_SOURCE = bash-completion-$(BASH_COMPLETION_VERSION).tar.xz
+BASH_COMPLETION_LICENSE = GPL-2.0
+BASH_COMPLETION_LICENSE_FILES = COPYING
+
+# Install bash-completion.pc file
+BASH_COMPLETION_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
