From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 25 Mar 2016 23:16:17 +0100
Subject: [Buildroot] [PATCH v2] owfs: add sysv init scripts
Message-ID: <1458944177-7008-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

owserver is started unconditionally, but it needs the device(s) to
be specified at startup. Therefore a check for non-empty OWSERVER_ARGS
is added to the owserver start script.

owfs is started only if is built. It will connect to the owserver.
It will try to load the fuse module; if fuse is built-in or already
loaded, modprobe -q will fail silently.

Users who want a setup without owserver need to remove the owserver
init script post-build and need to give appropriate defaults to owfs.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: Suggestions from PeterK:
 - prefix variables from defaults file with OWFS_;
 - allow defaults file to override the server with other devices;
 - add empty definition of OWFS_ARGS, to make it clearer that this
   variable can also be used in the defaults file.
---
 package/owfs/S25owserver | 31 +++++++++++++++++++++++++++++++
 package/owfs/S30owfs     | 33 +++++++++++++++++++++++++++++++++
 package/owfs/owfs.mk     | 10 ++++++++++
 3 files changed, 74 insertions(+)
 create mode 100755 package/owfs/S25owserver
 create mode 100755 package/owfs/S30owfs

diff --git a/package/owfs/S25owserver b/package/owfs/S25owserver
new file mode 100755
index 0000000..b8da768
--- /dev/null
+++ b/package/owfs/S25owserver
@@ -0,0 +1,31 @@
+NAME="owserver"
+DAEMON="/usr/bin/${NAME}"
+PID_F="/run/${NAME}.pid"
+
+OWSERVER_ARGS=
+[ -r /etc/default/${NAME} ] && . /etc/default/${NAME}
+
+case "$1" in
+start)
+	printf "Starting ${NAME}: "
+	if [ -z "${OWSERVER_ARGS}" ]; then
+		echo "OWSERVER_ARGS must be set in defaults file" 1>&2
+		exit 1
+	fi
+	start-stop-daemon -S -x ${DAEMON} -- \
+		--pid_file ${PID_F} ${OWSERVER_ARGS}
+	[ $? -eq 0 ] && echo "OK" || echo "FAIL"
+	;;
+stop)
+	printf "Stopping ${NAME}: "
+	start-stop-daemon -K -p ${PID_F}
+	[ $? -eq 0 ] && echo "OK" || echo "FAIL"
+	;;
+restart|reload)
+	$0 stop
+	$0 start
+	;;
+*)
+	echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+esac
diff --git a/package/owfs/S30owfs b/package/owfs/S30owfs
new file mode 100755
index 0000000..7077a0e
--- /dev/null
+++ b/package/owfs/S30owfs
@@ -0,0 +1,33 @@
+NAME="owfs"
+DAEMON="/usr/bin/${NAME}"
+PID_F="/run/${NAME}.pid"
+OWFS_MOUNTPOINT="/dev/1wire"
+OWFS_DEVICES="-s localhost:4304"
+OWFS_ARGS=""
+
+[ -r /etc/default/${NAME} ] && . /etc/default/${NAME}
+
+case "$1" in
+start)
+	printf "Starting ${NAME}: "
+	# Fuse may be in a module, so try to load it
+	modprobe -q fuse && printf "[fuse] "
+	mkdir -p ${MOUNTPOINT}
+	start-stop-daemon -S -x ${DAEMON} -- \
+		--pid_file ${PID_F} -m ${OWFS_MOUNTPOINT} ${OWFS_DEVICES} \
+		${OWFS_ARGS}
+	[ $? -eq 0 ] && echo "OK" || echo "FAIL"
+	;;
+stop)
+	printf "Stopping ${NAME}: "
+	start-stop-daemon -K -p ${PID_F}
+	[ $? -eq 0 ] && echo "OK" || echo "FAIL"
+	;;
+restart|reload)
+	$0 stop
+	$0 start
+	;;
+*)
+	echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+esac
diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index 083939a..ca86b62 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -23,6 +23,10 @@ OWFS_CONF_OPTS += \
 	--enable-owfs \
 	--with-fuseinclude=$(STAGING_DIR)/usr/include \
 	--with-fuselib=$(STAGING_DIR)/usr/lib
+define OWFS_INSTALL_FUSE_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(OWFS_PKGDIR)S30owfs \
+		$(TARGET_DIR)/etc/init.d/S30owfs
+endef
 else
 OWFS_CONF_OPTS += --disable-owfs
 endif
@@ -70,4 +74,10 @@ ifeq ($(BR2_STATIC_LIBS),y)
 OWFS_CONF_OPTS += --disable-zero
 endif
 
+define OWFS_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(OWFS_PKGDIR)S25owserver \
+		$(TARGET_DIR)/etc/init.d/S25owserver
+	$(OWFS_INSTALL_FUSE_INIT_SYSV)
+endef
+
 $(eval $(autotools-package))
-- 
2.8.0.rc3
