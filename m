From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2019 23:44:31 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/eudev: introduce
 a host variant
Message-ID: <20191106224839.01A578E963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=696c2a2c15badcee17551732b0b8e43497e2943f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

eudev and systemd provide a hardware database (hwdb) as a set of
multiple files. Various other utilities may also use that database.

Those files have to be "compiled" into a binary to be useful; libudev
(and thus all utilities based on it) only use the compiled hwdb.

Compiling the hwdb is done with udevadm, using the hwdb sub-command:
    udevadm hwdb --update

Provide a simple host-variant of eudev, so that we can call udevadm at
build time.

When it is configured, eudev will shoehorn its --prefix path as the base
location where the .hwdb file will be searched from, as well as where
the hwdb.bin will be generated in. This means that with the usual
--prefix=$(HOST_DIR), it would look into there.

udevadm also accepts a --root=/path option at runtime, which prepends
/path to all the paths it uses to find and generate files.

Obviously, combining --root=$(TARGET_DIR) and --prefix=$(HOST_DIR) would
not do what we want: all files would be searched for, and generated, in
$(HOST_DIR)$(TARGET_DIR)/ . Avoiding use of --root would not help much
either, as files would still searched in $(HOST_DIR) (we could use a
trick to copy files there, generate and then move the hwdb.bin, but
that's not nice).

However, since we only need udevadm, and since udevadm has no internal
and no external dependency, we can use a less dirty trick and configure
host-eudev with --prefix=/usr (and similar for the other paths), manually
copy udevadm to HOST_DIR, and then use --root when calling it.

Then, we get a udevadm that can read files from, and generate files into
$(TARGET_DIR). We register a target-finalize hook to generate the
hwdb.bin, so that any pakage may install its .hwdb files (currently only
eudev and systemd do, but other packages might (e.g. sane is known to do
so on standard desktop distros))

The *.hwdb source files consume a lot of space, roughly the same as the
generated database, i.e. ~8MiB as of today, and they are totally useless
on the target; only the generated hwdb.bin is useful. So we want to get
rid of them.

However, we also want to be able to complete a build (e.g. make
foo-reinstall to reinstall more hwdb files), so we don't want to
irremediably lose them. As such, we register a pre-rootfs-cmd hook, that
removes them just before assembling the filesystems, when we're only
using a copy of the target directory.

Note that this is the first host package to register a target-finalize
hook, and also the first to register a pre-rootfs-cmd hook. This avoids
duplicating these hooks logic in both eudev and systemd.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c2fee90943c0a10e9156487ef4565b7328f01ebf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in.host       |  1 +
 package/eudev/Config.in.host |  3 +++
 package/eudev/eudev.mk       | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 93822304e9..944dfc02d6 100644
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
index c5fbee8b9b..8d55bbdf12 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -55,4 +55,40 @@ define EUDEV_USERS
 	- - kvm -1 * - - - kvm nodes
 endef
 
+HOST_EUDEV_DEPENDENCIES = host-gperf host-pkgconf
+
+HOST_EUDEV_SYSCONFDIR = $(if $(BR2_PACKAGE_SYSTEMD),/usr/lib,/etc)
+HOST_EUDEV_CONF_OPTS = \
+	--prefix=/usr \
+	--sbindir=/sbin \
+	--libexecdir=/lib \
+	--with-rootlibdir=/lib \
+	--sysconfdir=$(HOST_EUDEV_SYSCONFDIR) \
+	--disable-blkid \
+	--disable-introspection \
+	--disable-kmod \
+	--disable-manpages \
+	--disable-rule-generator \
+	--disable-selinux \
+	--enable-hwdb
+
+define HOST_EUDEV_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src/udev/udevadm \
+		$(HOST_DIR)/bin/udevadm
+endef
+
+define HOST_EUDEV_BUILD_HWDB
+	$(HOST_DIR)/bin/udevadm hwdb --update --root $(TARGET_DIR)
+endef
+HOST_EUDEV_TARGET_FINALIZE_HOOKS += HOST_EUDEV_BUILD_HWDB
+
+# Note: this will run in the filesystem context, so will use a copy
+# of tharget/, not the real one, so the files are still available on
+# re-builds (foo-rebuild, etc...)
+define HOST_EUDEV_RM_HWDB_SRC
+	rm -rf $(TARGET_DIR)/$(HOST_EUDEV_SYSCONFDIR)/udev/hwdb.d/
+endef
+HOST_EUDEV_ROOTFS_PRE_CMD_HOOKS += HOST_EUDEV_RM_HWDB_SRC
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
