From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 22:57:54 +0200
Subject: [Buildroot] [git commit] package/linux-tools: add iio
Message-ID: <20161005205918.81974805CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3afc4de8823d63ca8fc860c5ad1dab97e62e160f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-tools/Config.in         |  9 +++++++++
 package/linux-tools/linux-tool-iio.mk | 27 +++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index bd07509..db9ed9f 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -32,6 +32,15 @@ config BR2_PACKAGE_LINUX_TOOLS_GPIO
 
 	  These tools are available only from kernel version 4.8.
 
+config BR2_PACKAGE_LINUX_TOOLS_IIO
+	bool "iio"
+	select BR2_PACKAGE_LINUX_TOOLS
+	help
+	  iio is a collection of tools to get information about,
+	  control and monitor iio devices present on system.
+
+	  These tools are available only from kernel version 4.7.
+
 config BR2_PACKAGE_LINUX_TOOLS_PERF
 	bool "perf"
 	select BR2_PACKAGE_LINUX_TOOLS
diff --git a/package/linux-tools/linux-tool-iio.mk b/package/linux-tools/linux-tool-iio.mk
new file mode 100644
index 0000000..60d6249
--- /dev/null
+++ b/package/linux-tools/linux-tool-iio.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# iio
+#
+################################################################################
+
+LINUX_TOOLS += iio
+
+IIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
+
+define IIO_BUILD_CMDS
+	$(Q)if ! grep install $(LINUX_DIR)/tools/iio/Makefile >/dev/null 2>&1 ; then \
+		echo "Your kernel version is too old and does not have install section in the iio tools." ; \
+		echo "At least kernel 4.7 must be used." ; \
+		exit 1 ; \
+	fi
+
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/iio \
+		$(IIO_MAKE_OPTS)
+endef
+
+define IIO_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/iio \
+		$(IIO_MAKE_OPTS) \
+		INSTALL_ROOT=$(TARGET_DIR) \
+		install
+endef
