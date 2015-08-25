From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Aug 2015 23:43:33 +0200
Subject: [Buildroot] [PATCH] package/dropbear: add warning about volatile
	keys
Message-ID: <1440539013-23389-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the rootfs is read-only, keys will be generated in a volatile
location, which is inherently bad as host keys will change on each boot,
rendering virtually useless.

Add a warning so the user is at least aware of the issue.

Consign the rm output to oblivion, to avoid noisy output, now that we
have a proper warning.

Move the starting message after the symlink-block, to avoid messages
collision. Move the umask as well, sicne /etc/dropbear/ may be world
readable; just the private host keys should be ?00 (and dropbear handles
that by itself).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 package/dropbear/S50dropbear      | 12 +++++++-----
 package/dropbear/dropbear.service |  6 ++++--
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/dropbear/S50dropbear b/package/dropbear/S50dropbear
index 765d6a3..b4e3c5c 100644
--- a/package/dropbear/S50dropbear
+++ b/package/dropbear/S50dropbear
@@ -9,9 +9,6 @@ test -r /etc/default/dropbear && . /etc/default/dropbear
 start() {
 	DROPBEAR_ARGS="$DROPBEAR_ARGS -R"
 
-	echo -n "Starting dropbear sshd: "
-	umask 077
-
 	# If /etc/dropbear is a symlink to /var/run/dropbear, and
 	#   - the filesystem is RO (i.e. we can not rm the symlink),
 	#     create the directory pointed to by the symlink.
@@ -20,13 +17,18 @@ start() {
 	if [ -L /etc/dropbear \
 	     -a "$(readlink /etc/dropbear)" = "/var/run/dropbear" ]
 	then
-		if rm -f /etc/dropbear; then
+		if rm -f /etc/dropbear >/dev/null 2>&1; then
 			mkdir -p /etc/dropbear
 		else
-			mkdir -p $(readlink /etc/dropbear)
+			echo "No persistent location to store SSH host keys. New keys will be"
+			echo "generated at each boot. Are you sure this is what you want to do?"
+			mkdir -p "$(readlink /etc/dropbear)"
 		fi
 	fi
 
+	echo -n "Starting dropbear sshd: "
+	umask 077
+
 	start-stop-daemon -S -q -p /var/run/dropbear.pid \
 		--exec /usr/sbin/dropbear -- $DROPBEAR_ARGS
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
diff --git a/package/dropbear/dropbear.service b/package/dropbear/dropbear.service
index 9dcbf25..1eb42f9 100644
--- a/package/dropbear/dropbear.service
+++ b/package/dropbear/dropbear.service
@@ -11,10 +11,12 @@ After=syslog.target network.target auditd.service
 ExecStartPre=/bin/sh -c '\
 if [ -L /etc/dropbear \
      -a "$(readlink /etc/dropbear)" = "/var/run/dropbear" ]; then \
-    if rm -f /etc/dropbear; then \
+    if rm -f /etc/dropbear >/dev/null 2>&1; then \
         mkdir -p /etc/dropbear; \
     else \
-        mkdir -p $(readlink /etc/dropbear); \
+        echo "No persistent location to store SSH host keys. New keys will be"; \
+        echo "generated at each boot. Are you sure this is what you want to do?"; \
+        mkdir -p "$(readlink /etc/dropbear)"; \
     fi; \
 fi'
 ExecStart=/usr/sbin/dropbear -F -R
-- 
1.9.1
