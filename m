From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  8 Feb 2013 23:06:50 +0100
Subject: [Buildroot] [PATCH 2/2] package/tvheadend: use a non-root user to
	run the daemon
In-Reply-To: <cover.1360360690.git.yann.morin.1998@free.fr>
References: <cover.1360360690.git.yann.morin.1998@free.fr>
Message-ID: <b231f7374a61c875ed2d45327c55979913b429dc.1360360690.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
index 5100781..4a3f882 100644
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
-- 
1.7.2.5
