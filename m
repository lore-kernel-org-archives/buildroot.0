From: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Date: Thu, 8 Feb 2018 12:22:21 +0100
Subject: [Buildroot] [PATCH 1/3] systemd: Ensure /run and /var/run are the
 same on R/O rootfs
Message-ID: <45c17d05433e7bb40ff6e2b30c5cb41fed04ec76.1518089469.git.jan.kundrat@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When I updated systemd from 234 to 237 and D-Bus from 1.12.0 to 1.12.2
on my system with a read-only rootfs (buildroot 1c0c55c028 to buildroot
27d2229692), my D-Bus-activated services stopped working. Checking the
logs, it turned out that systemd PID 1 was not able to connect the D-Bus
socket at all. There were some recent changes in systemd where upstream
refactored code which waits for sockets to appear. However, the real
problem is that systemd is configured to look for the D-Bus socket in
/run/dbus, while D-Bus creates it at /var/run/dbus/. D-Bus upstream
explains in a bugreport [1] that this "traditional" /var/run/dbus is
going to stay because it's hardcoded in other independent
implementations of the D-Bus APIs.

As is also said in that bugreport, the root cause is that /run and
/var/run are effectively two separate directories on Buildroot -- at
least when configured for a R/O rootfs. Furthermore, systemd actually
actively warns about this:

  systemd[1]: System is tainted: var-run-bad

Looking further, systemd-tmpfiles also detects breakage:

  systemd-tmpfiles[172]: [/usr/lib/tmpfiles.d/var.conf:12] Duplicate line for path "/var/run", ignoring.
  systemd-tmpfiles[172]: [/usr/lib/tmpfiles.d/var.conf:14] Duplicate line for path "/var/log", ignoring.
  systemd-tmpfiles[172]: [/usr/lib/tmpfiles.d/var.conf:21] Duplicate line for path "/var/lib", ignoring.

This change simply skips /var/run from being copied from the
/usr/share/factory. The symlink is still created by another tmpfiles.d
entry which belongs to systemd.

The other warnings are still in present:

  systemd-tmpfiles[174]: [/usr/lib/tmpfiles.d/var.conf:14] Duplicate line for path "/var/log", ignoring.
  systemd-tmpfiles[174]: [/usr/lib/tmpfiles.d/var.conf:21] Duplicate line for path "/var/lib", ignoring.

I'm leaving that one to someone who is more familiar with systemd and
buildroot conventions. My box now boots again, so I'm happy :).

[1] https://bugs.freedesktop.org/show_bug.cgi?id=101628

Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
---
 package/skeleton-init-systemd/skeleton-init-systemd.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
index a2d4e8c4b3..95142904f5 100644
--- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
+++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
@@ -42,7 +42,9 @@ define SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
 	mkdir $(TARGET_DIR)/var
 	for i in $(TARGET_DIR)/usr/share/factory/var/*; do \
 		j="$${i#$(TARGET_DIR)/usr/share/factory}"; \
-		if [ -L "$${i}" ]; then \
+		if [ "$${j}" = "/var/run" ]; then \
+			echo "# $${j} is being handled by systemd"
+		elif [ -L "$${i}" ]; then \
 			printf "L+! %s - - - - %s\n" \
 				"$${j}" "../usr/share/factory/$${j}" \
 			|| exit 1; \
-- 
2.14.3
