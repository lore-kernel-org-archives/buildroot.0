From: unixmania at gmail.com <unixmania@gmail.com>
Date: Fri, 20 Mar 2020 20:35:46 -0300
Subject: [Buildroot] [[PATCH RFC] 5/6] package/owfs: use modules-load to
 load the kernel module
In-Reply-To: <20200320233547.28586-1-unixmania@gmail.com>
References: <20200320233547.28586-1-unixmania@gmail.com>
Message-ID: <20200320233547.28586-6-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

This is compatible with BusyBox/sysvinit (via S02modules-load), OpenRC
and systemd. It also prevents trying to load the module each time the
init script is executed.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
Tested on QEMU with a kernel config with FUSE_FS=m. Only the module
loading was tested, since there is no 1-wire device.
---
 package/owfs/S60owfs |  2 --
 package/owfs/owfs.mk | 11 +++++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/owfs/S60owfs b/package/owfs/S60owfs
index feed676f8a..46b7ec775d 100644
--- a/package/owfs/S60owfs
+++ b/package/owfs/S60owfs
@@ -10,8 +10,6 @@ OWFS_ARGS=""
 case "$1" in
 start)
 	printf "Starting ${NAME}: "
-	# Fuse may be in a module, so try to load it
-	modprobe -q fuse && printf "[fuse] "
 	mkdir -p ${OWFS_MOUNTPOINT}
 	start-stop-daemon -S -x ${DAEMON} -- \
 		--pid_file ${PID_F} -m ${OWFS_MOUNTPOINT} ${OWFS_DEVICES} \
diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index ffc0b3098d..a09a4bb37b 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -35,6 +35,17 @@ define OWFS_CREATE_MOUNTPOINT
 	mkdir -p $(TARGET_DIR)/dev/1wire
 endef
 OWFS_POST_INSTALL_TARGET_HOOKS += OWFS_CREATE_MOUNTPOINT
+ifeq ($(BR2_LINUX_KERNEL),y)
+define OWFS_GEN_MODULES_CONF
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/modules-load.d
+	{ \
+		find $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/kernel/fs/fuse -name 'fuse.ko*'; \
+	} 2> /dev/null | { \
+		sed 's:^.*/::; s:\.ko[^ ]*::'; \
+	} > $(TARGET_DIR)/etc/modules-load.d/60-owfs.conf
+endef
+OWFS_TARGET_FINALIZE_HOOKS += OWFS_GEN_MODULES_CONF
+endif
 else
 OWFS_CONF_OPTS += --disable-owfs
 endif
-- 
2.18.2
