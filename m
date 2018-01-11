From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 11 Jan 2018 13:50:00 +0100
Subject: [Buildroot] [PATCH v2] package/bash-completion: new package
Message-ID: <1515675000-13355-1-git-send-email-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jeremy Rosen <jeremy.rosen@smile.fr>

Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v2: use a install target hook (Baruch)
    install to staging
---
 package/Config.in                            |  1 +
 package/bash-completion/Config.in            |  7 +++++++
 package/bash-completion/bash-completion.hash |  3 +++
 package/bash-completion/bash-completion.mk   | 22 ++++++++++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/bash-completion/Config.in
 create mode 100644 package/bash-completion/bash-completion.hash
 create mode 100644 package/bash-completion/bash-completion.mk

diff --git a/package/Config.in b/package/Config.in
index 01f4095..d41d855 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1892,6 +1892,7 @@ comment "Shells"
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
index 0000000..facbeb0
--- /dev/null
+++ b/package/bash-completion/bash-completion.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 41ba892d3f427d4a686de32673f35401bc947a7801f684127120cdb13641441e  bash-completion-2.7.tar.xz
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/bash-completion/bash-completion.mk b/package/bash-completion/bash-completion.mk
new file mode 100644
index 0000000..b6606ad
--- /dev/null
+++ b/package/bash-completion/bash-completion.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# bash-completion
+#
+################################################################################
+
+BASH_COMPLETION_VERSION = 2.7
+BASH_COMPLETION_SITE = https://github.com/scop/bash-completion/releases/download/$(BASH_COMPLETION_VERSION)
+BASH_COMPLETION_SOURCE = bash-completion-$(BASH_COMPLETION_VERSION).tar.xz
+BASH_COMPLETION_LICENSE = GPL-2.0+
+BASH_COMPLETION_LICENSE_FILES = COPYING
+
+# Install bash-completion.pc file
+BASH_COMPLETION_INSTALL_STAGING = YES
+
+define BASH_COMPLETION_INSTALL_FILE
+	echo ". /usr/share/bash-completion/bash_completion" > $(TARGET_DIR)/etc/bash_completion
+endef
+
+BASH_COMPLETION_POST_INSTALL_TARGET_HOOKS += BASH_COMPLETION_INSTALL_FILE
+
+$(eval $(autotools-package))
-- 
2.7.4
