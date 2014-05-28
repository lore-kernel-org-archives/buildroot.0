From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 28 May 2014 09:46:20 +0200
Subject: [Buildroot] [PATCH v2] dropbear: fix missing directory with systemd
Message-ID: <1401263180-30574-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current SysV startup script create a directory which is necessary
for dropbear to correctly work.
This creation is not done with systemd.

Instead of both init creating the directory, we add the creation of this
directory to the INSTALL_TARGET_CMDS to make sure it's present.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/dropbear/S50dropbear | 4 ----
 package/dropbear/dropbear.mk | 1 +
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/dropbear/S50dropbear b/package/dropbear/S50dropbear
index a343b9e..f36165a 100644
--- a/package/dropbear/S50dropbear
+++ b/package/dropbear/S50dropbear
@@ -10,10 +10,6 @@ start() {
 	DROPBEAR_ARGS="$DROPBEAR_ARGS -R"
 
 	echo -n "Starting dropbear sshd: "
-	# Make sure dropbear directory exists
-	if [ ! -d /etc/dropbear ] ; then
-		mkdir -p /etc/dropbear
-	fi
 	umask 077
 	start-stop-daemon -S -q -p /var/run/dropbear.pid \
 		--exec /usr/sbin/dropbear -- $DROPBEAR_ARGS
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 2ac6211..6f860e5 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -85,6 +85,7 @@ define DROPBEAR_INSTALL_TARGET_CMDS
 	for f in $(DROPBEAR_TARGET_BINS); do \
 		ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/$$f ; \
 	done
+	mkdir -p ${TARGET_DIR}/etc/dropbear
 endef
 
 $(eval $(autotools-package))
-- 
2.0.0.rc0
