From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Apr 2015 18:52:19 +0200
Subject: [Buildroot] [git commit] doxygen: new package
Message-ID: <20150412165302.65F78807BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=330c4d01c4ff670476cc755015a833b5f963c9b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Host package only.

[Thomas:
 - add missing dependencies on host-flex and host-bison
 - add $(HOST_MAKE_ENV) to the configure, build and install steps, to
   make sure that the doxygen build system can find flex and bison.]

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/doxygen/doxygen.hash |    2 ++
 package/doxygen/doxygen.mk   |   29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 0 deletions(-)

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
index 0000000..6f81a56
--- /dev/null
+++ b/package/doxygen/doxygen.mk
@@ -0,0 +1,29 @@
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
+DOXYGEN_DEPENDENCIES = host-flex host-bison
+
+define HOST_DOXYGEN_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_MAKE_ENV) ./configure --shared --prefix=$(HOST_DIR)/usr)
+endef
+
+define HOST_DOXYGEN_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_DOXYGEN_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
+endef
+
+# Doxygen's configure is a handwritten script, not an autotools-generated one.
+# It doesn't accept host-autotools-package default arguments, so we have to
+# call host-generic-package here.
+$(eval $(host-generic-package))
