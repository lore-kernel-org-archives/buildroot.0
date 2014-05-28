From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 May 2014 10:01:44 +0200
Subject: [Buildroot] [git commit] dropbear: fix missing directory with
	systemd
Message-ID: <20140528080949.C8D659CB94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe823b63741ba8eca70a534207d655f5affa927c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current SysV startup script create a directory which is necessary
for dropbear to correctly work.
This creation is not done with systemd.

Instead of both init creating the directory, we add the creation of this
directory to the INSTALL_TARGET_CMDS to make sure it's present.

[Peter: use make syntax for TARGET_DIR as pointed out by Thomas]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dropbear/S50dropbear |    4 ----
 package/dropbear/dropbear.mk |    1 +
 2 files changed, 1 insertions(+), 4 deletions(-)

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
index 2ac6211..3a39169 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -85,6 +85,7 @@ define DROPBEAR_INSTALL_TARGET_CMDS
 	for f in $(DROPBEAR_TARGET_BINS); do \
 		ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/$$f ; \
 	done
+	mkdir -p $(TARGET_DIR)/etc/dropbear
 endef
 
 $(eval $(autotools-package))
