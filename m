From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 21:35:27 +0100
Subject: [Buildroot] [git commit] package/spice: enable slirp support
Message-ID: <20121216204049.3615E9A2B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5faf337b39a0515439b828c5ad12858fa9c02b38
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/spice/Config.in |    7 +++++++
 package/spice/spice.mk  |    8 +++++++-
 2 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/package/spice/Config.in b/package/spice/Config.in
index 08c3893..b1e187a 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -41,4 +41,11 @@ config BR2_PACKAGE_SPICE_GUI
 	  Say 'y' here to enable the Graphical User Interface (GUI)
 	  start dialog.
 
+config BR2_PACKAGE_SPICE_TUNNEL
+	bool "Enable network redirection"
+	select BR2_PACKAGE_SLIRP
+	help
+	  Say 'y' here to enable network redirection, aka tunnelling
+	  through a SLIP/SLIRP session.
+
 endif # BR2_PACKAGE_SPICE
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index 0a5c58e..78ca202 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -22,7 +22,6 @@ SPICE_DEPENDENCIES    = \
 # We disable everything for now, because the dependency tree can become
 # quite deep if we try to enable some features, and I have not tested that.
 SPICE_CONF_OPT =            \
-  --disable-tunnel          \
   --disable-opengl          \
   --disable-smartcard       \
   --disable-automated-tests \
@@ -44,6 +43,13 @@ else
 SPICE_CONF_OPT += --disable-gui
 endif
 
+ifeq ($(BR2_PACKAGE_SPICE_TUNNEL),y)
+SPICE_CONF_OPT += --enable-tunnel
+SPICE_DEPENDENCIES += slirp
+else
+SPICE_CONF_OPT += --disable-tunnel
+endif
+
 SPICE_CONF_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 SPICE_MAKE_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 
