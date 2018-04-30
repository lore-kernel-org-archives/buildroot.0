From: Chris Lesiak <chris.lesiak@licor.com>
Date: Mon, 30 Apr 2018 12:14:11 -0500
Subject: [Buildroot] [PATCH v2] Makefile: Update mtime of $(TARGET_DIR)/usr
 in target-finalize
In-Reply-To: <20180416153339.23002-1-chris.lesiak@licor.com>
References: <20180416153339.23002-1-chris.lesiak@licor.com>
Message-ID: <20180430171411.21920-1-chris.lesiak@licor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
Changed v1 --> v2
  - Provide a more detailed commit message.
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 8004cc2925..479ce74dc1 100644
--- a/Makefile
+++ b/Makefile
@@ -761,6 +761,8 @@ endif
 		$(call MESSAGE,"Executing post-build script $(s)"); \
 		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
+	touch $(TARGET_DIR)/usr
+
 .PHONY: target-post-image
 target-post-image: $(TARGETS_ROOTFS) target-finalize
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
-- 
2.14.3
