From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 24 Apr 2018 11:28:22 +0200
Subject: [Buildroot] [PATCH v3] package/bash-completion: new package
Message-ID: <1524562102-24480-1-git-send-email-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jeremy Rosen <jeremy.rosen@smile.fr>

Along with other files, bash_completion install bash_completion.sh
script in /etc/profile.d to load bash_completion for interactive shell.

When interactive shells is used, /etc/profile is executed and source
all *.sh script present in /etc/profile.d directoty.

If the system does not use the /etc/profile.d directory mechanism,
the /etc/profile.d/bash_completion.sh script can be sourced in
/etc/bashrc or ~/.bashrc.

bashrc file can be provided from a rootfs overlay when needed.

Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v3: remove post install hook
    bump to version 2.8
    use GPL-2.0 (not GPL-2.0+), there is no "or any later version" string
v2: use a install target hook (Baruch)
    install to staging
---
 package/Config.in                            |  1 +
 package/bash-completion/Config.in            |  7 +++++++
 package/bash-completion/bash-completion.hash |  3 +++
 package/bash-completion/bash-completion.mk   | 16 ++++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/bash-completion/Config.in
 create mode 100644 package/bash-completion/bash-completion.hash
 create mode 100644 package/bash-completion/bash-completion.mk

diff --git a/package/Config.in b/package/Config.in
index ecd9b8f..f48e683 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1935,6 +1935,7 @@ comment "Shells"
 	source "package/zsh/Config.in"
 comment "Utilities"
 	source "package/at/Config.in"
+	source "package/bash-completion/Config.in"
 	source "package/ccrypt/Config.in"
 	source "package/crudini/Config.in"
 	source "package/dialog/Config.in"
diff --git a/package/bash-completion/Config.in b/package/bash-completion/Config.in
new file mode 100644
index 0000000..597c928
--- /dev/null
+++ b/package/bash-completion/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_BASH_COMPLETION
+	bool "bash completion"
+	depends on BR2_PACKAGE_BASH
+	help
+	  Add bash completion infrastructure.
+
+	  https://github.com/scop/bash-completion
diff --git a/package/bash-completion/bash-completion.hash b/package/bash-completion/bash-completion.hash
new file mode 100644
index 0000000..2c4cf67
--- /dev/null
+++ b/package/bash-completion/bash-completion.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 c01f5570f5698a0dda8dc9cfb2a83744daa1ec54758373a6e349bd903375f54d  bash-completion-2.8.tar.xz
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/bash-completion/bash-completion.mk b/package/bash-completion/bash-completion.mk
new file mode 100644
index 0000000..9976918
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
-- 
2.7.4
