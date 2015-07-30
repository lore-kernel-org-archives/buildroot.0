From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 23:36:02 +0200
Subject: [Buildroot] [git commit] package/dropbear: Fix symlink only if
	pointing to the right directory
Message-ID: <20150730213626.679CF81E9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6dc5c7ffea3c309e3402e6c1e4cab42b8b44f421
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit ensures that the /etc/dropbear symlink won't be removed if
it points elsewhere than /var/run/dropbear.

[Thomas:
 - fix indentation / too long lines as suggested by Yann E. Morin.]

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dropbear/S50dropbear      |    6 ++++--
 package/dropbear/dropbear.service |    5 +++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/dropbear/S50dropbear b/package/dropbear/S50dropbear
index af50ccf..8938789 100644
--- a/package/dropbear/S50dropbear
+++ b/package/dropbear/S50dropbear
@@ -12,12 +12,14 @@ start() {
 	echo -n "Starting dropbear sshd: "
 	umask 077
 
-	# If /etc/dropbear is not a directory, and
+	# If /etc/dropbear is a symlink to /var/run/dropbear, and
 	#   - the filesystem is RO (i.e. we can not rm the symlink),
 	#     create the directory pointed to by the symlink.
 	#   - the filesystem is RW (i.e. we can rm the symlink),
 	#     replace the symlink with an actual directory
-	if ! [ -d /etc/dropbear ]; then
+	if [ -L /etc/dropbear \
+	     -a "$(readlink -f /etc/dropbear)" = "/var/run/dropbear" ]
+	then
 		if rm -f /etc/dropbear; then
 			mkdir -p /etc/dropbear
 		else
diff --git a/package/dropbear/dropbear.service b/package/dropbear/dropbear.service
index 0e2cf54..52c7702 100644
--- a/package/dropbear/dropbear.service
+++ b/package/dropbear/dropbear.service
@@ -3,13 +3,14 @@ Description=Dropbear SSH daemon
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
+if [ -L /etc/dropbear \
+     -a "$(readlink -f /etc/dropbear)" = "/var/run/dropbear" ]; then \
     if rm -f /etc/dropbear; then \
         mkdir -p /etc/dropbear; \
     else \
