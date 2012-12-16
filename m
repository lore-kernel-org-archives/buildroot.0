From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 21:35:00 +0100
Subject: [Buildroot] [git commit] package/spice: enable GUI
Message-ID: <20121216204048.F34309A2B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af103acf4eb7fa6193c0bb9d844ea95f4e15db71
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/spice/Config.in |    8 ++++++++
 package/spice/spice.mk  |    8 +++++++-
 2 files changed, 15 insertions(+), 1 deletions(-)

diff --git a/package/spice/Config.in b/package/spice/Config.in
index aacc779..08c3893 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -33,4 +33,12 @@ config BR2_PACKAGE_SPICE_CLIENT
 	select BR2_PACKAGE_XLIB_LIBXFIXES
 	select BR2_PACKAGE_XLIB_LIBXRANDR
 
+config BR2_PACKAGE_SPICE_GUI
+	bool "Enable GUI"
+	depends on BR2_PACKAGE_SPICE_CLIENT
+	select BR2_PACKAGE_CEGUI06
+	help
+	  Say 'y' here to enable the Graphical User Interface (GUI)
+	  start dialog.
+
 endif # BR2_PACKAGE_SPICE
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index 2f7fc20..0a5c58e 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -23,7 +23,6 @@ SPICE_DEPENDENCIES    = \
 # quite deep if we try to enable some features, and I have not tested that.
 SPICE_CONF_OPT =            \
   --disable-tunnel          \
-  --disable-gui             \
   --disable-opengl          \
   --disable-smartcard       \
   --disable-automated-tests \
@@ -38,6 +37,13 @@ else
 SPICE_CONF_OPT += --disable-client
 endif
 
+ifeq ($(BR2_PACKAGE_SPICE_GUI),y)
+SPICE_CONF_OPT += --enable-gui
+SPICE_DEPENDENCIES += cegui06
+else
+SPICE_CONF_OPT += --disable-gui
+endif
+
 SPICE_CONF_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 SPICE_MAKE_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 
