From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  4 Sep 2015 22:17:32 +0200
Subject: [Buildroot] [PATCHv3] system: add options for /bin /sbin and /lib
	to be symlinks into /usr
Message-ID: <1441397852-23461-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd is increasingly expecting things to live in /usr/bin, /usr/sbin
or /usr/lib nad not in /bin, /sbin or /lib. It has inherited those
expectations from a Fedora change:
    https://fedoraproject.org/wiki/Features/UsrMove

Note however, that systemd does support /usr being on a separate
filesystem; it just expects an initramfs to mount it before the final
switchroot over to the actual rootfs.

But the traditional use-case for Buildroot is not to boot with an
initramfs; although that is totally feasible, that's probably not what
is commonly done in the vast majority of cases.

However, a lot of packages still install stuff directly into /bin,
/sbin or /lib, which systemd may need early-on in the boot process,
even before it may have a chance to mount /usr. Even though we can
tell systemd, at configure-time, where it should expect programs to
be at runtime, it does not make sense to go head-first against an
upstream wa^Hill.

Add an option so that /bin, /sbin and /lib be symlinks to /usr/bin
and /usr/sbin. That option is forcibly enabled when the init system
is systemd.

Note: we need not handle /lib32 or /lib64, as they already are symlinks
to /lib, which means they will automatically be redirected to /usr/lib,
as /usr/lib32 and /usr/lib64 already are.

Furthermore, this means we're no longer supporting a split-usr setup, so
the corresponding configure options have been removed as well for
systemd and, when using a merged /usr, for eudev as well.

In Buildroot, we decided (with this patch) not to support a split-usr
when systemd is used as an init system. This is a design decision, not
a systemd issue. Thus the select is with BR2_INIT_SYSTEMD rather than
with BR2_PACKAGE_SYSTEMD.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Mike Williams <mike@mikebwilliams.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Baruch Siach <baruch@tkos.co.il>

---
Changes v2 -> v3:
  - only conditionally drop the split-usr options for eudev  (Vicente)
  - add this missing history log  (Vicente)
  - add a rationale on why this is the init system that selects
    merged-usr, not the package  (Arnout).

Changes v1 -> v2:
  - in skeleton.mk, use a single variable for both cases  (Arnout)
  - add reference to the Fedora merged-usr manifesto  (Arnout)
  - add note about /lib32 and /lib64  (Arnout)
  - rename the kconfig option  (Arnout)
  - slightly reword the help text  (Arnout)
  - drop the split-usr and related options from systemd (Mike, Vicente)
    and eudev (but only when using merged-usr)
  - typoes  (Arnout, Baruch)
---
 package/eudev/eudev.mk       |  6 ++++--
 package/skeleton/skeleton.mk | 20 +++++++++++++++++---
 package/systemd/systemd.mk   |  2 --
 system/Config.in             | 17 +++++++++++++++++
 system/skeleton/bin/.empty   |  0
 system/skeleton/lib/.empty   |  0
 system/skeleton/sbin/.empty  |  0
 7 files changed, 38 insertions(+), 7 deletions(-)
 delete mode 100644 system/skeleton/bin/.empty
 delete mode 100644 system/skeleton/lib/.empty
 delete mode 100644 system/skeleton/sbin/.empty

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 1aa74b3..a005f45 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -22,16 +22,18 @@ EUDEV_CONF_ENV += LIBS=-lrt
 EUDEV_CONF_OPTS =		\
 	--disable-manpages	\
 	--sbindir=/sbin		\
-	--with-rootlibdir=/lib	\
 	--libexecdir=/lib	\
 	--with-firmware-path=/lib/firmware	\
 	--disable-introspection			\
-	--enable-split-usr			\
 	--enable-libkmod
 
 EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
 EUDEV_PROVIDES = udev
 
+ifeq ($(BR2_ROOTFS_MERGED_USR),)
+EUDEV_CONF_OPTS += --with-rootlibdir=/lib --enable-split-usr
+endif
+
 ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
 EUDEV_CONF_OPTS += --enable-rule_generator
 endif
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 48e7085..920d3b4 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -19,15 +19,29 @@ else
 SKELETON_PATH = system/skeleton
 endif
 
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+define SKELETON_USR_SYMLINKS_OR_DIRS
+	ln -snf usr/bin $(TARGET_DIR)/bin
+	ln -snf usr/sbin $(TARGET_DIR)/sbin
+	ln -snf usr/lib $(TARGET_DIR)/lib
+endef
+else
+define SKELETON_USR_SYMLINKS_OR_DIRS
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/bin
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/sbin
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/lib
+endef
+endif
+
 define SKELETON_INSTALL_TARGET_CMDS
 	rsync -a --ignore-times $(SYNC_VCS_EXCLUSIONS) \
 		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
 		$(SKELETON_PATH)/ $(TARGET_DIR)/
-	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
-		$(TARGET_DIR_WARNING_FILE)
+	$(SKELETON_USR_SYMLINKS_OR_DIRS)
 	ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
-	mkdir -p $(TARGET_DIR)/usr
 	ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
+	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
+		$(TARGET_DIR_WARNING_FILE)
 endef
 
 SKELETON_TARGET_GENERIC_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b62fc08..59ab103 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -28,7 +28,6 @@ endif
 
 SYSTEMD_CONF_OPTS += \
 	--with-rootprefix= \
-	--with-rootlibdir=/lib \
 	--enable-static=no \
 	--disable-manpages \
 	--disable-selinux \
@@ -37,7 +36,6 @@ SYSTEMD_CONF_OPTS += \
 	--with-dbuspolicydir=/etc/dbus-1/system.d \
 	--with-dbussessionservicedir=/usr/share/dbus-1/services \
 	--with-dbussystemservicedir=/usr/share/dbus-1/system-services \
-	--enable-split-usr \
 	--disable-efi \
 	--disable-gnuefi \
 	--disable-tests \
diff --git a/system/Config.in b/system/Config.in
index fad829d..7d73e27 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -78,6 +78,10 @@ config BR2_INIT_SYSV
 	select BR2_PACKAGE_INITSCRIPTS
 	select BR2_PACKAGE_SYSVINIT
 
+# In Buildroot, we decided not to support a split-usr when systemd is
+# used as an init system. This is a design decision, not a systemd
+# issue. Thus the select is with BR2_INIT_SYSTEMD (below) rather than
+# with BR2_PACKAGE_SYSTEMD.
 config BR2_INIT_SYSTEMD
 	bool "systemd"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
@@ -88,6 +92,7 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
 
 comment 'systemd needs an (e)glibc toolchain, headers >= 3.10'
@@ -178,6 +183,18 @@ endif
 
 if BR2_ROOTFS_SKELETON_DEFAULT
 
+config BR2_ROOTFS_MERGED_USR
+	bool "Use symlinks to /usr for /bin, /sbin and /lib"
+	help
+	  If you say 'n' here, then /bin, /sbin and /lib and their
+	  counterparts in /usr will be separate directories. This
+	  is the historical UNIX way. In this case, /usr can be a
+	  filesystem on a partition separate from / .
+
+	  If you say 'y' here, then /bin, /sbin and /lib will be symlinks
+	  to their counterparts in /usr. In this case, /usr can not be a
+	  separate filesystem.
+
 config BR2_TARGET_ENABLE_ROOT_LOGIN
 	bool "Enable root login with password"
 	default y
diff --git a/system/skeleton/bin/.empty b/system/skeleton/bin/.empty
deleted file mode 100644
index e69de29..0000000
diff --git a/system/skeleton/lib/.empty b/system/skeleton/lib/.empty
deleted file mode 100644
index e69de29..0000000
diff --git a/system/skeleton/sbin/.empty b/system/skeleton/sbin/.empty
deleted file mode 100644
index e69de29..0000000
-- 
1.9.1
