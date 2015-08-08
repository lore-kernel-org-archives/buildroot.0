From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:43 -0000
Subject: [Buildroot] [git commit branch/next] package/dropbear: fix
	generating keys on RO file systems
Message-ID: <20150808105631.B81177FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7d04dd2df8bb935c61f7c814ee88eba7e75b5e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

dropbear generates its keys at the first connection, and wants to save
them in /etc/dropbear (not configurable).

Currently, our /etc/dropbear is a directory.

When the filesystem is read-only, dropbear can't save its keys, so
refuses all connections.

Fix that with:

  - at build time, create /etc/dropbear as a symlink to
    /var/run/dropbear

  - at runtime, if the filesystem is RW (we can rm /etc/dropbear),
    we replace the symlink with an actual directory; otherwise,
    when the filesystem is RO (we can't rm /etc/dropbear), we create
    /var/run/dropbear so the symlink points to an existing directory

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Acked-by: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dropbear/S50dropbear      |   14 ++++++++++++++
 package/dropbear/dropbear.mk      |    2 +-
 package/dropbear/dropbear.service |   13 +++++++++++++
 3 files changed, 28 insertions(+), 1 deletions(-)

diff --git a/package/dropbear/S50dropbear b/package/dropbear/S50dropbear
index 2694931..af50ccf 100644
--- a/package/dropbear/S50dropbear
+++ b/package/dropbear/S50dropbear
@@ -11,6 +11,20 @@ start() {
 
 	echo -n "Starting dropbear sshd: "
 	umask 077
+
+	# If /etc/dropbear is not a directory, and
+	#   - the filesystem is RO (i.e. we can not rm the symlink),
+	#     create the directory pointed to by the symlink.
+	#   - the filesystem is RW (i.e. we can rm the symlink),
+	#     replace the symlink with an actual directory
+	if ! [ -d /etc/dropbear ]; then
+		if rm -f /etc/dropbear; then
+			mkdir -p /etc/dropbear
+		else
+			mkdir -p $(readlink /etc/dropbear)
+		fi
+	fi
+
 	start-stop-daemon -S -q -p /var/run/dropbear.pid \
 		--exec /usr/sbin/dropbear -- $DROPBEAR_ARGS
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index bc65d69..5bbe864 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -93,7 +93,7 @@ define DROPBEAR_INSTALL_TARGET_CMDS
 	for f in $(DROPBEAR_TARGET_BINS); do \
 		ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/$$f ; \
 	done
-	mkdir -p $(TARGET_DIR)/etc/dropbear
+	ln -snf ../var/run/dropbear $(TARGET_DIR)/etc/dropbear
 endef
 
 $(eval $(autotools-package))
diff --git a/package/dropbear/dropbear.service b/package/dropbear/dropbear.service
index 4e6c879..0e2cf54 100644
--- a/package/dropbear/dropbear.service
+++ b/package/dropbear/dropbear.service
@@ -3,6 +3,19 @@ Description=Dropbear SSH daemon
 After=syslog.target network.target auditd.service
 
 [Service]
+# If /etc/dropbear is not a directory, and
+#   - the filesystem is RO (i.e. we can not rm the symlink),
+#     create the directory pointed to by the symlink.
+#   - the filesystem is RW (i.e. we can rm the symlink),
+#     replace the symlink with an actual directory
+ExecStartPre=/bin/sh -c '\
+if ! [ -d /etc/dropbear ]; then \
+    if rm -f /etc/dropbear; then \
+        mkdir -p /etc/dropbear; \
+    else \
+        mkdir -p $(readlink /etc/dropbear); \
+    fi; \
+fi'
 ExecStart=/usr/sbin/dropbear -F -R
 ExecReload=/bin/kill -HUP $MAINPID
 
