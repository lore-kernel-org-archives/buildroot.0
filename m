From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Oct 2019 23:54:39 +0100
Subject: [Buildroot] [PATCH 1/3] package/eudev: introduce a host variant
In-Reply-To: <cover.1572303270.git.yann.morin.1998@free.fr>
References: <cover.1572303270.git.yann.morin.1998@free.fr>
Message-ID: <205a3ececc3ca9da9ab5829b7498141d8904c84d.1572303270.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

eudev and systemd provide a hardware database (hwdb) as a set of
multiple files. Various other utilities may also use that database.

Those files have to be "compiled" into a binary to be useful; libudev
(and thus all utilities based on it) only use the compiled hwdb.

Compiling the hwdb is done with udevadm, using the hwdb sub-command:
    udevadm hwdb --update

Provide a simple host-variant of eudev, so that we can call udevadm at
build time.

This host udevadm will read files from $(HOST_DIR)/etc/udev/hwdb.d/*.hwdb
and write the compiled hwdb to $(HOST_DIR)/etc/udev/hwdb.bin.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Carlos Santos <unixmania@gmail.com>
---
 package/Config.in.host       |  1 +
 package/eudev/Config.in.host |  3 +++
 package/eudev/eudev.mk       | 14 ++++++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 package/eudev/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 914491e210..c0ac4fbbcc 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -17,6 +17,7 @@ menu "Host utilities"
 	source "package/dtc/Config.in.host"
 	source "package/e2fsprogs/Config.in.host"
 	source "package/e2tools/Config.in.host"
+	source "package/eudev/Config.in.host"
 	source "package/f2fs-tools/Config.in.host"
 	source "package/faketime/Config.in.host"
 	source "package/fatcat/Config.in.host"
diff --git a/package/eudev/Config.in.host b/package/eudev/Config.in.host
new file mode 100644
index 0000000000..87dfc43912
--- /dev/null
+++ b/package/eudev/Config.in.host
@@ -0,0 +1,3 @@
+# Select this if you need host eudev tools (e.g. udevadm)
+config BR2_PACKAGE_HOST_EUDEV
+	bool
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 2a3adb849c..12568a6645 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -55,4 +55,18 @@ define EUDEV_USERS
 	- - kvm -1 * - - - kvm nodes
 endef
 
+HOST_EUDEV_DEPENDENCIES = host-gperf host-pkgconf
+HOST_EUDEV_CONF_OPTS = \
+	--disable-manpages \
+	--sbindir=$(HOST_DIR)/sbin \
+	--libexecdir=$(HOST_DIR)/lib \
+	--with-rootlibdir=$(HOST_DIR)/lib \
+	--disable-introspection \
+	--disable-kmod \
+	--disable-blkid \
+	--disable-rule-generator \
+	--enable-hwdb \
+	--disable-selinux
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.1
