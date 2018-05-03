From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 22:12:21 +0200
Subject: [Buildroot] [git commit] Makefile: Update mtime of
 $(TARGET_DIR)/usr in target-finalize
Message-ID: <20180503201245.DA1D181202@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbe5c6dad4da9cd174d5ef21caa73557e4592b31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The systemd ConditionNeedsUpdate option is useful when offline updates
of the vendor operating system resources in /usr require updating of
/etc or /var on the next following boot.

Two examples of services making use of this option are
systemd-hwdb-update.service and systemd-sysusers.service.

ConditionNeedsUpdate=/etc will be true if the mtime of /etc/.updated
is older than the mtime of /usr.  After services conditional on
ConditionNeedsUpdate have run, systemd-update-done.service will
synch the mtime of /usr to /etc/.updated so that the condition will
be false on subsequent boots.

For systems with writable /usr partitions where updates are done to
the running system, the update program will touch /usr as a final step.
But with Buildroot, where updates are often done by dumping a new
image onto the device, and where /usr is on a filesystem mounted
read-only, touching /usr as part of the update process is not practical.
Instead, it should be done a build time.

For testers, please note that systemd-update-done in v234 added a
regression where the mtime of /etc/.updated is set to the current time
instead of the mtime or /usr.  This will be fixed in v239.

For more details, see:
http://0pointer.de/public/systemd-man/systemd.unit.html
http://0pointer.de/public/systemd-man/systemd-update-done.service.html

Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 54f940659c..c024c65f78 100644
--- a/Makefile
+++ b/Makefile
@@ -756,6 +756,8 @@ endif
 		$(call MESSAGE,"Executing post-build script $(s)"); \
 		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
+	touch $(TARGET_DIR)/usr
+
 .PHONY: target-post-image
 target-post-image: $(TARGETS_ROOTFS) target-finalize
 	@rm -f $(ROOTFS_COMMON_TAR)
