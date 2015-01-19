From: Maxim Mikityanskiy <maxtram95@gmail.com>
Date: Mon, 19 Jan 2015 18:14:11 +0200
Subject: [Buildroot] [PATCH 11/16] package/samba: use FHS dirs
In-Reply-To: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
Message-ID: <1421684056-5266-12-git-send-email-maxtram95@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Clean up system directories by making samba conform to FHS and by using
subdirectories e.g. /var/log/samba and /var/run/samba instead of
/var/log and /var/run.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 package/samba/S91smb   |  5 +++--
 package/samba/samba.mk | 10 +++++-----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/samba/S91smb b/package/samba/S91smb
index c190771..2e03e82 100755
--- a/package/samba/S91smb
+++ b/package/samba/S91smb
@@ -10,6 +10,7 @@
 mkdir -p /var/cache/samba
 mkdir -p /var/log/samba
 mkdir -p /var/lock/subsys
+mkdir -p /var/run/samba
 
 RETVAL=0
 
@@ -33,13 +34,13 @@ stop() {
 	echo -n "Shutting down SMB services: "
 	kill -9 `pidof smbd`
 	RETVAL=$?
-	rm -f /var/run/smbd.pid
+	rm -f /var/run/samba/smbd.pid
 	echo "done"
 
 	echo -n "Shutting down NMB services: "
 	kill -9 `pidof nmbd`
 	RETVAL2=$?
-	rm -f /var/run/nmbd.pid
+	rm -f /var/run/samba/nmbd.pid
 
 	[ $RETVAL -eq 0 -a $RETVAL2 -eq 0 ] && rm -f /var/lock/subsys/smb
 	echo "done"
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index d25e94e..31ad644 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -33,11 +33,11 @@ SAMBA_CONF_ENV = \
 	$(if $(BR2_PACKAGE_SAMBA_AVAHI),AVAHI_LIBS=-pthread)
 
 SAMBA_CONF_OPTS = \
-	--with-piddir=/var/run \
-	--with-lockdir=/var/lock \
-	--with-logfilebase=/var/log \
-	--with-configdir=/etc/samba \
-	--with-privatedir=/etc/samba \
+	--with-fhs \
+	--with-piddir=/var/run/samba \
+	--with-lockdir=/var/cache/samba \
+	--with-ncalrpcdir=/var/run/ncalrpc \
+	--with-nmbdsocketdir=/var/run/nmbd \
 	\
 	--disable-cups \
 	--enable-shared-libs \
-- 
2.2.1
