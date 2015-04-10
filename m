From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Fri, 10 Apr 2015 11:49:57 +0200
Subject: [Buildroot] [PATCH v3 1/3] doxygen: new package
In-Reply-To: <1428659399-28620-1-git-send-email-bgolaszewski@baylibre.com>
References: <1428659399-28620-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <1428659399-28620-2-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Host package only.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/doxygen/doxygen.hash |  2 ++
 package/doxygen/doxygen.mk   | 28 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 package/doxygen/doxygen.hash
 create mode 100644 package/doxygen/doxygen.mk

diff --git a/package/doxygen/doxygen.hash b/package/doxygen/doxygen.hash
new file mode 100644
index 0000000..40cfe16
--- /dev/null
+++ b/package/doxygen/doxygen.hash
@@ -0,0 +1,2 @@
+# Computed locally
+sha256 d4ab6e28d4d45d8956cad17470aade3fbe2356e8f64b92167e738c1887feccec  doxygen-1.8.9.1.src.tar.gz
diff --git a/package/doxygen/doxygen.mk b/package/doxygen/doxygen.mk
new file mode 100644
index 0000000..07fba54
--- /dev/null
+++ b/package/doxygen/doxygen.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# doxygen
+#
+################################################################################
+
+DOXYGEN_VERSION = 1.8.9.1
+DOXYGEN_SOURCE = doxygen-$(DOXYGEN_VERSION).src.tar.gz
+DOXYGEN_SITE = http://ftp.stack.nl/pub/users/dimitri/
+DOXYGEN_LICENSE = GPLv2
+DOXYGEN_LICENSE_FILES = LICENSE
+
+define HOST_DOXYGEN_CONFIGURE_CMDS
+	(cd $(@D); ./configure --shared --prefix=$(HOST_DIR)/usr)
+endef
+
+define HOST_DOXYGEN_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define HOST_DOXYGEN_INSTALL_CMDS
+	$(MAKE) install -C $(@D)
+endef
+
+# Doxygen's configure is a handwritten script, not an autotools-generated one.
+# It doesn't accept host-autotools-package default arguments, so we have to
+# call host-generic-package here.
+$(eval $(host-generic-package))
-- 
2.1.4
