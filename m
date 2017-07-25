From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Jul 2017 23:14:30 +0200
Subject: [Buildroot] [PATCH 09/14 v4] system: separate sysv and systemd
	parts of the skeleton
In-Reply-To: <cover.1501017251.git.yann.morin.1998@free.fr>
References: <cover.1501017251.git.yann.morin.1998@free.fr>
Message-ID: <bfef4d6217c64d96457484fcb87854b192b3a37a.1501017251.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For systemd, we create a simple /etc/fstab with only an entry for /, as
systemd otherwise automatically mounts what it needs where it needs it.

systemd does not like that the content of /var be symlinks to /tmp,
especially journald that starts before /tmp is mounted, and thus the
journal files are hidden from view, which causes quite a bit of fuss...

Instead, move the current /var to a sysv-only skeleton.

systemd at install time will create the /var content it needs, so we
just create an empty /var for systemd.

systemd would create /home and /srv at runtime if they are missing, but
it is better to create them right now, to simplify supporting systemd on
a RO filesystem in the (near) future.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Changes v3 -> v4:
  - add blurb about /etc/fstab  (Arnout)
  - blurb about /home and /srv moved from here to the commit log itself
---
 package/skeleton-systemd/skeleton-systemd.mk              | 7 +++++++
 package/skeleton-sysv/skeleton-sysv.mk                    | 4 ++++
 {system => package/skeleton-sysv}/skeleton/dev/log        | 0
 {system => package/skeleton-sysv}/skeleton/dev/pts/.empty | 0
 {system => package/skeleton-sysv}/skeleton/dev/shm/.empty | 0
 {system => package/skeleton-sysv}/skeleton/etc/fstab      | 0
 {system => package/skeleton-sysv}/skeleton/var/cache      | 0
 {system => package/skeleton-sysv}/skeleton/var/lib/misc   | 0
 {system => package/skeleton-sysv}/skeleton/var/lock       | 0
 {system => package/skeleton-sysv}/skeleton/var/log        | 0
 {system => package/skeleton-sysv}/skeleton/var/run        | 0
 {system => package/skeleton-sysv}/skeleton/var/spool      | 0
 {system => package/skeleton-sysv}/skeleton/var/tmp        | 0
 system/skeleton/dev/.empty                                | 0
 14 files changed, 11 insertions(+)
 rename {system => package/skeleton-sysv}/skeleton/dev/log (100%)
 rename {system => package/skeleton-sysv}/skeleton/dev/pts/.empty (100%)
 rename {system => package/skeleton-sysv}/skeleton/dev/shm/.empty (100%)
 rename {system => package/skeleton-sysv}/skeleton/etc/fstab (100%)
 rename {system => package/skeleton-sysv}/skeleton/var/cache (100%)
 rename {system => package/skeleton-sysv}/skeleton/var/lib/misc (100%)
 rename {system => package/skeleton-sysv}/skeleton/var/lock (100%)
 rename {system => package/skeleton-sysv}/skeleton/var/log (100%)
 rename {system => package/skeleton-sysv}/skeleton/var/run (100%)
 rename {system => package/skeleton-sysv}/skeleton/var/spool (100%)
 rename {system => package/skeleton-sysv}/skeleton/var/tmp (100%)
 create mode 100644 system/skeleton/dev/.empty

diff --git a/package/skeleton-systemd/skeleton-systemd.mk b/package/skeleton-systemd/skeleton-systemd.mk
index cec6359007..384715e1c9 100644
--- a/package/skeleton-systemd/skeleton-systemd.mk
+++ b/package/skeleton-systemd/skeleton-systemd.mk
@@ -15,4 +15,11 @@ SKELETON_SYSTEMD_DEPENDENCIES = skeleton-common
 
 SKELETON_SYSTEMD_PROVIDES = skeleton
 
+define SKELETON_SYSTEMD_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/home
+	mkdir -p $(TARGET_DIR)/srv
+	mkdir -p $(TARGET_DIR)/var
+	echo "/dev/root / auto rw 0 1" >$(TARGET_DIR)/etc/fstab
+endef
+
 $(eval $(generic-package))
diff --git a/package/skeleton-sysv/skeleton-sysv.mk b/package/skeleton-sysv/skeleton-sysv.mk
index b0c2b6bac1..b5fa396ac2 100644
--- a/package/skeleton-sysv/skeleton-sysv.mk
+++ b/package/skeleton-sysv/skeleton-sysv.mk
@@ -15,4 +15,8 @@ SKELETON_SYSV_DEPENDENCIES = skeleton-common
 
 SKELETON_SYSV_PROVIDES = skeleton
 
+define SKELETON_SYSV_INSTALL_TARGET_CMDS
+	$(call SYSTEM_RSYNC,$(SKELETON_SYSV_PKGDIR)/skeleton,$(TARGET_DIR))
+endef
+
 $(eval $(generic-package))
diff --git a/system/skeleton/dev/log b/package/skeleton-sysv/skeleton/dev/log
similarity index 100%
rename from system/skeleton/dev/log
rename to package/skeleton-sysv/skeleton/dev/log
diff --git a/system/skeleton/dev/pts/.empty b/package/skeleton-sysv/skeleton/dev/pts/.empty
similarity index 100%
rename from system/skeleton/dev/pts/.empty
rename to package/skeleton-sysv/skeleton/dev/pts/.empty
diff --git a/system/skeleton/dev/shm/.empty b/package/skeleton-sysv/skeleton/dev/shm/.empty
similarity index 100%
rename from system/skeleton/dev/shm/.empty
rename to package/skeleton-sysv/skeleton/dev/shm/.empty
diff --git a/system/skeleton/etc/fstab b/package/skeleton-sysv/skeleton/etc/fstab
similarity index 100%
rename from system/skeleton/etc/fstab
rename to package/skeleton-sysv/skeleton/etc/fstab
diff --git a/system/skeleton/var/cache b/package/skeleton-sysv/skeleton/var/cache
similarity index 100%
rename from system/skeleton/var/cache
rename to package/skeleton-sysv/skeleton/var/cache
diff --git a/system/skeleton/var/lib/misc b/package/skeleton-sysv/skeleton/var/lib/misc
similarity index 100%
rename from system/skeleton/var/lib/misc
rename to package/skeleton-sysv/skeleton/var/lib/misc
diff --git a/system/skeleton/var/lock b/package/skeleton-sysv/skeleton/var/lock
similarity index 100%
rename from system/skeleton/var/lock
rename to package/skeleton-sysv/skeleton/var/lock
diff --git a/system/skeleton/var/log b/package/skeleton-sysv/skeleton/var/log
similarity index 100%
rename from system/skeleton/var/log
rename to package/skeleton-sysv/skeleton/var/log
diff --git a/system/skeleton/var/run b/package/skeleton-sysv/skeleton/var/run
similarity index 100%
rename from system/skeleton/var/run
rename to package/skeleton-sysv/skeleton/var/run
diff --git a/system/skeleton/var/spool b/package/skeleton-sysv/skeleton/var/spool
similarity index 100%
rename from system/skeleton/var/spool
rename to package/skeleton-sysv/skeleton/var/spool
diff --git a/system/skeleton/var/tmp b/package/skeleton-sysv/skeleton/var/tmp
similarity index 100%
rename from system/skeleton/var/tmp
rename to package/skeleton-sysv/skeleton/var/tmp
diff --git a/system/skeleton/dev/.empty b/system/skeleton/dev/.empty
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.11.0
