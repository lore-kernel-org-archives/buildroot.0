From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Jun 2012 09:12:45 +0200
Subject: [Buildroot] [git commit] linphone: use external ortp/mediastreamer
	libraries
Message-ID: <20120604071301.B6DF996E32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96f41055068e54e734edc99c88ec46aa40d8ced5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/linphone/Config.in   |    6 ++++++
 package/linphone/linphone.mk |    8 ++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/linphone/Config.in b/package/linphone/Config.in
index 31c28d8..1a6cfdb 100644
--- a/package/linphone/Config.in
+++ b/package/linphone/Config.in
@@ -2,6 +2,9 @@ config BR2_PACKAGE_LINPHONE
 	bool "linphone"
 	select BR2_PACKAGE_LIBEXOSIP2
 	select BR2_PACKAGE_SPEEX
+	select BR2_PACKAGE_ORTP
+	select BR2_PACKAGE_MEDIASTREAMER
+	depends on BR2_INSTALL_LIBSTDCPP # mediastreamer
 	help
 	  Linphone is an internet phone or Voice Over IP phone (VoIP).
 
@@ -19,3 +22,6 @@ config BR2_PACKAGE_LINPHONE
 	  client, linphonec, and video support is not enabled.
 
 	  http://www.linphone.org/
+
+comment "linphone requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index 6ba6b53..b34fbf7 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -6,7 +6,11 @@
 
 LINPHONE_VERSION = 3.5.2
 LINPHONE_SITE = http://download-mirror.savannah.gnu.org/releases/linphone/3.5.x/sources/
-LINPHONE_CONF_OPT = --disable-video --disable-gtk_ui
-LINPHONE_DEPENDENCIES = libeXosip2 speex
+LINPHONE_CONF_OPT = \
+	--disable-gtk_ui \
+	--enable-external-ortp \
+	--enable-external-mediastreamer
+
+LINPHONE_DEPENDENCIES = host-pkg-config ortp mediastreamer libeXosip2 speex
 
 $(eval $(call AUTOTARGETS))
