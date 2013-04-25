From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 25 Apr 2013 22:57:00 +0200
Subject: [Buildroot] [git commit] package/tvheadend: use a non-root user to
	run the daemon
Message-ID: <20130425214004.D37929B83B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c1f1536d6fd947069338a47669eabdb8f8dcee7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tvheadend/etc.default.tvheadend |    5 ++---
 package/tvheadend/tvheadend.mk          |   10 ++++++++--
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/tvheadend/etc.default.tvheadend b/package/tvheadend/etc.default.tvheadend
index c769055..253f832 100644
--- a/package/tvheadend/etc.default.tvheadend
+++ b/package/tvheadend/etc.default.tvheadend
@@ -1,6 +1,5 @@
-# Once we have a real user, we'll use it
-TVH_USER=root
-TVH_GROUP=root
+TVH_USER=tvheadend
+TVH_GROUP=tvheadend
 #TVH_ADAPTERS=
 #TVH_HTTP_PORT=9981
 #TVH_HTSP_PORT=9982
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 5a971b8..58965d6 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -26,9 +26,11 @@ TVHEADEND_DEPENDENCIES     += dvb-apps
 # To run tvheadend, we need:
 #  - a startup script, and its config file
 #  - a default DB with a tvheadend admin
+#  - a non-root user to run as
 define TVHEADEND_INSTALL_DB
-	$(INSTALL) -D package/tvheadend/accesscontrol.1     \
-	              $(TARGET_DIR)/root/.hts/tvheadend/accesscontrol/1
+	$(INSTALL) -D -m 0600 package/tvheadend/accesscontrol.1     \
+	              $(TARGET_DIR)/home/tvheadend/.hts/tvheadend/accesscontrol/1
+	chmod -R go-rwx $(TARGET_DIR)/home/tvheadend
 endef
 TVHEADEND_POST_INSTALL_TARGET_HOOKS  = TVHEADEND_INSTALL_DB
 
@@ -37,6 +39,10 @@ define TVHEADEND_INSTALL_INIT_SYSV
 	$(INSTALL) -D package/tvheadend/S99tvheadend          $(TARGET_DIR)/etc/init.d/S99tvheadend
 endef
 
+define TVHEADEND_USERS
+tvheadend -1 tvheadend -1 * /home/tvheadend - video TVHeadend daemon
+endef
+
 #----------------------------------------------------------------------------
 # tvheadend is not an autotools-based package, but it is possible to
 # call its ./configure script as if it were an autotools one.
