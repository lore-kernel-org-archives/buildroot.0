From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 21:48:18 +0200
Subject: [Buildroot] [git commit] package/rpcbind: use upstream systemd
 service files
Message-ID: <20210720191417.19EDD8856F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=f94347880701fb4fa8ffa844ff9ac683f2f8f4e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The overriden service files appear to have compatibility issues
with upstream rpcbind, don't replace the bundled service files.

We need to build with --enable-warmstarts as this is required
by the systemd service files.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpcbind/rpcbind.mk      | 10 ++--------
 package/rpcbind/rpcbind.service | 10 ----------
 package/rpcbind/rpcbind.socket  |  8 --------
 3 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index d9f25e698e..725075f962 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -17,19 +17,13 @@ RPCBIND_DEPENDENCIES += libtirpc host-pkgconf
 RPCBIND_CONF_OPTS += --with-rpcuser=root
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
-RPCBIND_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
+RPCBIND_CONF_OPTS += --enable-warmstarts \
+	--with-systemdsystemunitdir=/usr/lib/systemd/system
 RPCBIND_DEPENDENCIES += systemd
 else
 RPCBIND_CONF_OPTS += --with-systemdsystemunitdir=no
 endif
 
-define RPCBIND_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -m 0644 -D package/rpcbind/rpcbind.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/rpcbind.service
-	$(INSTALL) -m 0644 -D package/rpcbind/rpcbind.socket \
-		$(TARGET_DIR)/usr/lib/systemd/system/rpcbind.socket
-endef
-
 define RPCBIND_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/rpcbind/S30rpcbind \
 		$(TARGET_DIR)/etc/init.d/S30rpcbind
diff --git a/package/rpcbind/rpcbind.service b/package/rpcbind/rpcbind.service
deleted file mode 100644
index e41931df4a..0000000000
--- a/package/rpcbind/rpcbind.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=RPC bind service
-Requires=rpcbind.socket
-
-[Service]
-Type=forking
-ExecStart=/usr/sbin/rpcbind
-
-[Install]
-Also=rpcbind.socket
diff --git a/package/rpcbind/rpcbind.socket b/package/rpcbind/rpcbind.socket
deleted file mode 100644
index d63c1d9720..0000000000
--- a/package/rpcbind/rpcbind.socket
+++ /dev/null
@@ -1,8 +0,0 @@
-[Unit]
-Description=RPCbind Server Activation Socket
-
-[Socket]
-ListenStream=/var/run/rpcbind.sock
-
-[Install]
-WantedBy=sockets.target
