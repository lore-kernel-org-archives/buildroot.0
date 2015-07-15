From: paul at crapouillou.net <paul@crapouillou.net>
Date: Wed, 15 Jul 2015 11:55:03 +0200
Subject: [Buildroot] [PATCH] package/dropbear: Fix symlink only if pointing
	to the right directory
Message-ID: <1436954103-8380-1-git-send-email-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Paul Cercueil <paul@crapouillou.net>

This commit ensures that the /etc/dropbear symlink won't be removed if
it points elsewhere than /var/run/dropbear.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 package/dropbear/S50dropbear      | 4 ++--
 package/dropbear/dropbear.service | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dropbear/S50dropbear b/package/dropbear/S50dropbear
index af50ccf..d42fb60 100644
--- a/package/dropbear/S50dropbear
+++ b/package/dropbear/S50dropbear
@@ -12,12 +12,12 @@ start() {
 	echo -n "Starting dropbear sshd: "
 	umask 077
 
-	# If /etc/dropbear is not a directory, and
+	# If /etc/dropbear is a symlink to /var/run/dropbear, and
 	#   - the filesystem is RO (i.e. we can not rm the symlink),
 	#     create the directory pointed to by the symlink.
 	#   - the filesystem is RW (i.e. we can rm the symlink),
 	#     replace the symlink with an actual directory
-	if ! [ -d /etc/dropbear ]; then
+	if [ "$(readlink /etc/dropbear)" = "/var/run/dropbear" ]; then
 		if rm -f /etc/dropbear; then
 			mkdir -p /etc/dropbear
 		else
diff --git a/package/dropbear/dropbear.service b/package/dropbear/dropbear.service
index 0e2cf54..62ade1f 100644
--- a/package/dropbear/dropbear.service
+++ b/package/dropbear/dropbear.service
@@ -3,13 +3,13 @@ Description=Dropbear SSH daemon
 After=syslog.target network.target auditd.service
 
 [Service]
-# If /etc/dropbear is not a directory, and
+# If /etc/dropbear is a symlink to /var/run/dropbear, and
 #   - the filesystem is RO (i.e. we can not rm the symlink),
 #     create the directory pointed to by the symlink.
 #   - the filesystem is RW (i.e. we can rm the symlink),
 #     replace the symlink with an actual directory
 ExecStartPre=/bin/sh -c '\
-if ! [ -d /etc/dropbear ]; then \
+if [ "$(readlink /etc/dropbear)" = "/var/run/dropbear" ]; then \
     if rm -f /etc/dropbear; then \
         mkdir -p /etc/dropbear; \
     else \
-- 
2.1.4
