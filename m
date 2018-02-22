From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 22 Feb 2018 23:10:14 +0100
Subject: [Buildroot] [PATCH] package/skeleton-init-systemd: create a symlink
 /var/run to ../run
Message-ID: <20180222221014.19584-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported by J?r?my Rosen [1] and Jan Kundr?t (RO case)[2], systemd
looks for the dbus socket in /run/dbus instead of /var/run/dbus which
is not where dbus puts the socket. This is a change introduced with
the last version bump v237 [3].

The file /usr/lib/tmpfiles.d/var.con will create automatically that
symlink at bootup /var/run doesn't exist yet. But dbus creates, at
install time, the directory /var/run/dbus without taking care of
/var/run. So we end up with two different directories /run and
/var/run. This bug affects more or less all systemd-provided
utilities, including logind and systemd itself.

This patch create the correct symlink run -> ../run when systemd
is used as init system.

[1] http://lists.busybox.net/pipermail/buildroot/2018-February/214129.html
[2] http://lists.busybox.net/pipermail/buildroot/2018-February/213420.html
[3] https://github.com/systemd/systemd/commit/15ca0a42c7db49146a7169dbcb0683f0836cf8c2

Reported-by: J?r?my Rosen <jeremy.rosen@smile.fr>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/skeleton-init-systemd/skeleton-init-systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
index 95142904f5..d435aa54ee 100644
--- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
+++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
@@ -20,6 +20,7 @@ ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
 define SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW
 	echo "/dev/root / auto rw 0 1" >$(TARGET_DIR)/etc/fstab
 	mkdir -p $(TARGET_DIR)/var
+	ln -s ../run $(TARGET_DIR)/var/run
 endef
 
 else
-- 
2.14.3
