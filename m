From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Mar 2016 16:57:00 +0200
Subject: [Buildroot] [PATCH] package/tvheadend: use wizard mode on first run
Message-ID: <1459090620-21422-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The format of the ACL database in tvheandend has changed, and generating
a default user is a little bit more involved than just dumping a file in
the correct locations: filenames are now md5sum (of something?) and the
usernames and passwords now have their own DB.

However, tvheadend has a wizard mode, where it is possible to configure
the basic features, of which creating an admin user.

We remove our canned ACL database, and change the startup script to
start in wizard mode on first run.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tvheadend/Config.in    | 4 ++--
 package/tvheadend/S99tvheadend | 5 +++++
 package/tvheadend/tvheadend.mk | 8 --------
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 095ec65..67a4b14 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -22,7 +22,7 @@ config BR2_PACKAGE_TVHEADEND
 	  https://www.lonelycoder.com/redmine/projects/tvheadend/
 
 	  Note:
-	    - a default user has been created to log in the web configuration
-	      GUI: admin/admin; you can change it at your discretion at runtime.
+	    - on first run, tvheadend will start in wizard mode; the webUI
+	      is available on port 9981.
 	    - if you want Avahi support, you'll need to enable:
 	          Avahi, D-Bus, libdaemon
diff --git a/package/tvheadend/S99tvheadend b/package/tvheadend/S99tvheadend
index 75b66f3..65669ce 100644
--- a/package/tvheadend/S99tvheadend
+++ b/package/tvheadend/S99tvheadend
@@ -21,6 +21,11 @@ ARGS="-f"
 [ -z "${TVH_HTSP_PORT}" ] || ARGS="${ARGS} -e ${TVH_HTSP_PORT}"
 [ "${TVH_DEBUG}" = "1"  ] && ARGS="${ARGS} -s"
 
+# If first run, start in wizard mode
+if [ -z "$(ls -1 /home/tvheadend/.hts/tvheadend/accesscontrol/ 2>/dev/null)" ]; then
+    ARGS="${ARGS} -C"
+fi
+
 case "$1" in
     start)
         printf "Starting TVHeadend daemon: "
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 3398faf..5159edc 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -107,15 +107,7 @@ TVHEADEND_POST_INSTALL_TARGET_HOOKS += TVHEADEND_CLEAN_SHARE
 #----------------------------------------------------------------------------
 # To run tvheadend, we need:
 #  - a startup script, and its config file
-#  - a default DB with a tvheadend admin
 #  - a non-root user to run as
-define TVHEADEND_INSTALL_DB
-	$(INSTALL) -D -m 0600 package/tvheadend/accesscontrol.1     \
-		$(TARGET_DIR)/home/tvheadend/.hts/tvheadend/accesscontrol/1
-	chmod -R go-rwx $(TARGET_DIR)/home/tvheadend
-endef
-TVHEADEND_POST_INSTALL_TARGET_HOOKS += TVHEADEND_INSTALL_DB
-
 define TVHEADEND_INSTALL_INIT_SYSV
 	$(INSTALL) -D package/tvheadend/etc.default.tvheadend $(TARGET_DIR)/etc/default/tvheadend
 	$(INSTALL) -D package/tvheadend/S99tvheadend          $(TARGET_DIR)/etc/init.d/S99tvheadend
-- 
1.9.1
