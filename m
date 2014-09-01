From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  1 Sep 2014 18:31:40 +0200
Subject: [Buildroot] [PATCH 1/2] package/xbmc: enhance startup script
In-Reply-To: <cover.1409588958.git.yann.morin.1998@free.fr>
References: <cover.1409588958.git.yann.morin.1998@free.fr>
Message-ID: <f9702163e9f2ec5c3753961c5ce742841879425a.1409588958.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we can run XBMC with full openGL, it needs an X server to be
running, so it has to wait for it before running.

So, we create a config file (in /etc/default/xbmc) in which we store
whther to wait for an X server or not. All options to XBMC are now
hard-coded in our br-xbmc wrapper, not unlike we're doing for the
systemd unit.

Then, if it has to wait for X, our own br-xbmc wrapper will do the
waiting. We do it as thus, because we can not do it in the startup
script.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Note: as I don't know how to do dependencies in systemd, I did not
change our systemd unit. It can be done by any systemd-savy interested
party! ;-)
---
 package/xbmc/S50xbmc |  3 +--
 package/xbmc/br-xbmc | 15 +++++++++++++--
 package/xbmc/xbmc.mk | 10 ++++++++++
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/package/xbmc/S50xbmc b/package/xbmc/S50xbmc
index 312452b..6190b2f 100755
--- a/package/xbmc/S50xbmc
+++ b/package/xbmc/S50xbmc
@@ -5,12 +5,11 @@
 
 BIN=/usr/bin/br-xbmc
 XBMC=/usr/lib/xbmc/xbmc.bin
-XBMC_ARGS="--standalone -fs -n"
 PIDFILE=/var/run/xbmc.pid
 
 start() {
 	echo -n "Starting XBMC: "
-	start-stop-daemon -S -q -b -m -p $PIDFILE --exec $BIN -- $XBMC $XBMC_ARGS
+	start-stop-daemon -S -q -b -m -p $PIDFILE --exec $BIN -- $XBMC
 	[ $? == 0 ] && echo "OK" || echo "FAIL"
 }
 stop() {
diff --git a/package/xbmc/br-xbmc b/package/xbmc/br-xbmc
index fee5d51..27fa32a 100755
--- a/package/xbmc/br-xbmc
+++ b/package/xbmc/br-xbmc
@@ -3,7 +3,18 @@
 # We're called with the real XBMC executable as
 # first argument, followed by any XBMC extra args
 XBMC="${1}"
-shift
+
+# Parse XBMC options
+[ -f /etc/default/xbmc ] && . /etc/default/xbmc
+
+if [ -n "${WAIT_FOR_X}" ]; then
+    export DISPLAY=:0.0
+    while ! xset q >/dev/null 2>&1; do
+        sleep 1
+    done
+    # Wait yet a bit more in case it terminates with the last client
+    sleep 1
+fi
 
 # In case someone asked we terminate, just kill
 # the XBMC process
@@ -21,7 +32,7 @@ while [ ${LOOP} -eq 1 ]; do
     # for it. But BusyBox' ash's wait builtin does not return the
     # exit code even if there was only one job (which is correct
     # for POSIX). So we explicitly wait for the XBMC job
-    "${XBMC}" "${@}" &
+    "${XBMC}" --standalone -fs -n &
     wait %1
     ret=$?
     case "${ret}" in
diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index bdd634e..87b81c4 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -219,6 +219,15 @@ define XBMC_INSTALL_BR_WRAPPER
 endef
 XBMC_POST_INSTALL_TARGET_HOOKS += XBMC_INSTALL_BR_WRAPPER
 
+# When using full openGL (as opposed to EGL/GLES),
+# there must be a running X server
+ifeq ($(BR2_PACKAGE_XBMC_GL),y)
+define XBMC_WAIT_FOR_X
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/default
+	printf "WAIT_FOR_X=1\n" >$(TARGET_DIR)/etc/default/xbmc
+endef
+endif
+
 # When run from a startup script, XBMC has no $HOME where to store its
 # configuration, so ends up storing it in /.xbmc  (yes, at the root of
 # the rootfs). This is a problem for read-only filesystems. But we can't
@@ -233,6 +242,7 @@ XBMC_POST_INSTALL_TARGET_HOOKS += XBMC_INSTALL_CONFIG_DIR
 define XBMC_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/xbmc/S50xbmc \
 		$(TARGET_DIR)/etc/init.d/S50xbmc
+	$(XBMC_WAIT_FOR_X)
 endef
 
 define XBMC_INSTALL_INIT_SYSTEMD
-- 
1.9.1
