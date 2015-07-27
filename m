From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 23:45:01 +0200
Subject: [Buildroot] [git commit] rpcbind: add systemd support
Message-ID: <20150727214536.CA662805FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0db9c4d197b19bb14f67deeeac495a85a4c28767
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd files taken from Arch Linux.

[Thomas:
 - fix indentation
 - indicate source of systemd files.]

Signed-off-by: Aur??lien Chabot <aurelien@chabot.fr>
Acked-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpcbind/rpcbind.mk      |   16 ++++++++++++++++
 package/rpcbind/rpcbind.service |   10 ++++++++++
 package/rpcbind/rpcbind.socket  |    8 ++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index 1e28af9..4360d1f 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -14,11 +14,27 @@ RPCBIND_CONF_ENV += \
 	CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
 RPCBIND_DEPENDENCIES += libtirpc host-pkgconf
 RPCBIND_CONF_OPTS += --with-rpcuser=root
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+RPCBIND_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
+else
 RPCBIND_CONF_OPTS += --with-systemdsystemunitdir=no
+endif
+
+define RPCBIND_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -m 0755 -D package/rpcbind/rpcbind.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/rpcbind.service
+	$(INSTALL) -m 0755 -D package/rpcbind/rpcbind.socket \
+		$(TARGET_DIR)/usr/lib/systemd/system/rpcbind.socket
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/sockets.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/rpcbind.socket \
+		$(TARGET_DIR)/etc/systemd/system/sockets.target.wants/rpcbind.socket
+endef
 
 define RPCBIND_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/rpcbind/S30rpcbind \
 		$(TARGET_DIR)/etc/init.d/S30rpcbind
 endef
 
+
 $(eval $(autotools-package))
diff --git a/package/rpcbind/rpcbind.service b/package/rpcbind/rpcbind.service
new file mode 100644
index 0000000..b7a32a1
--- /dev/null
+++ b/package/rpcbind/rpcbind.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=RPC bind service
+Requires=rpcbind.socket
+
+[Service]
+Type=forking
+ExecStart=/usr/bin/rpcbind
+
+[Install]
+Also=rpcbind.socket
diff --git a/package/rpcbind/rpcbind.socket b/package/rpcbind/rpcbind.socket
new file mode 100644
index 0000000..d63c1d9
--- /dev/null
+++ b/package/rpcbind/rpcbind.socket
@@ -0,0 +1,8 @@
+[Unit]
+Description=RPCbind Server Activation Socket
+
+[Socket]
+ListenStream=/var/run/rpcbind.sock
+
+[Install]
+WantedBy=sockets.target
