From: Davide Viti <zinosat@tiscali.it>
Date: Wed,  5 Dec 2012 22:05:42 +0100
Subject: [Buildroot] [PATCH] tcllib: new package
In-Reply-To: <1354741542-6079-1-git-send-email-zinosat@tiscali.it>
References: <1354741542-6079-1-git-send-email-zinosat@tiscali.it>
Message-ID: <1354741542-6079-2-git-send-email-zinosat@tiscali.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Davide Viti <zinosat@tiscali.it>
---
 package/Config.in        |    5 +++++
 package/tcllib/Config.in |   12 ++++++++++++
 package/tcllib/tcllib.mk |   23 +++++++++++++++++++++++
 3 files changed, 40 insertions(+), 0 deletions(-)
 create mode 100644 package/tcllib/Config.in
 create mode 100644 package/tcllib/tcllib.mk

diff --git a/package/Config.in b/package/Config.in
index e759620..6d3f4fb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -311,6 +311,11 @@ endmenu
 endif
 source "package/ruby/Config.in"
 source "package/tcl/Config.in"
+if BR2_PACKAGE_TCL
+menu "tcl libraries/modules"
+source "package/tcllib/Config.in"
+endmenu
+endif
 endmenu
 
 menu "Libraries"
diff --git a/package/tcllib/Config.in b/package/tcllib/Config.in
new file mode 100644
index 0000000..cf65a9e
--- /dev/null
+++ b/package/tcllib/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_TCLLIB
+	bool "tcllib"
+	depends on BR2_PACKAGE_TCL
+	help
+	  Tcllib is a collection of utility modules for Tcl. These
+	  modules provide a wide variety of functionality, from
+	  implementations of standard data structures to
+	  implementations of common networking protocols. The intent
+	  is to collect commonly used function into a single library,
+	  which users can rely on to be available and stable
+
+	  http://tcl.activestate.com/software/tcllib/
diff --git a/package/tcllib/tcllib.mk b/package/tcllib/tcllib.mk
new file mode 100644
index 0000000..2e85dc2
--- /dev/null
+++ b/package/tcllib/tcllib.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# tcllib
+#
+#############################################################
+TCLLIB_VERSION       = 1.13
+TCLLIB_SOURCE        = tcllib-$(TCLLIB_VERSION).tar.gz
+TCLLIB_SITE          = http://sourceforge.net/projects/tcllib/files/tcllib/$(TCLLIB_VERSION)/
+TCLLIB_LICENSE       = BSD-2c
+TCLLIB_LICENSE_FILES = license.terms
+TCLLIB_DEPENDENCIES  = tcl
+
+define TCLLIB_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+	    tclsh installer.tcl \
+	    -no-examples -no-html -no-pkgs -no-wait \
+	    -no-gui -no-apps -no-nroff \
+	    -pkg-path $(TARGET_DIR)/usr/lib/tcl8.4 \
+	)
+endef
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.2.5
