From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Aug 2019 23:01:38 +0200
Subject: [Buildroot] [git commit] package/gupnp-tools: bump to version 0.8.15
Message-ID: <20190802205946.927E28D1F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c4baea84e053369811dbd9cbfd6687250c5d8a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch to meson-package
- Add patch to fix build without gupnp-av

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-src-meson.build-upload-needs-gupnp-av.patch | 30 ++++++++++++++++++++++
 package/gupnp-tools/gupnp-tools.hash               |  4 +--
 package/gupnp-tools/gupnp-tools.mk                 | 10 ++++----
 3 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/package/gupnp-tools/0001-src-meson.build-upload-needs-gupnp-av.patch b/package/gupnp-tools/0001-src-meson.build-upload-needs-gupnp-av.patch
new file mode 100644
index 0000000000..f8eba76773
--- /dev/null
+++ b/package/gupnp-tools/0001-src-meson.build-upload-needs-gupnp-av.patch
@@ -0,0 +1,30 @@
+From 0831f77e990e363f78e3f6a5c461084988824f7b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 2 Jul 2019 23:48:12 +0200
+Subject: [PATCH] src/meson.build: upload needs gupnp-av
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.gnome.org/GNOME/gupnp-tools/merge_requests/3]
+---
+ src/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index 84b2ca2..6601f45 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -2,9 +2,9 @@ subdir('common')
+ 
+ if get_option('av-tools') and gupnp_av.found()
+     subdir('av-cp')
++    subdir('upload')
+ endif
+ 
+ subdir('discover')
+ subdir('network-light')
+ subdir('universal-cp')
+-subdir('upload')
+-- 
+2.20.1
+
diff --git a/package/gupnp-tools/gupnp-tools.hash b/package/gupnp-tools/gupnp-tools.hash
index d80d832631..b7015e13ad 100644
--- a/package/gupnp-tools/gupnp-tools.hash
+++ b/package/gupnp-tools/gupnp-tools.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/0.8/gupnp-tools-0.8.14.sha256sum:
-sha256	682b952b3cf43818c7d27549c152ea52e43320500820ab3392cf5a29a95e7efa	gupnp-tools-0.8.14.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/0.8/gupnp-tools-0.8.15.sha256sum:
+sha256	336ef4a09b9fc83444a1594c8215e2bed55fbea5b6d1bf6b54c63104b4c497ab	gupnp-tools-0.8.15.tar.xz
 
 # Locally computed:
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	COPYING
diff --git a/package/gupnp-tools/gupnp-tools.mk b/package/gupnp-tools/gupnp-tools.mk
index 06c7b1fd3b..6852697b8c 100644
--- a/package/gupnp-tools/gupnp-tools.mk
+++ b/package/gupnp-tools/gupnp-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_TOOLS_VERSION_MAJOR = 0.8
-GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).14
+GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).15
 GUPNP_TOOLS_SOURCE = gupnp-tools-$(GUPNP_TOOLS_VERSION).tar.xz
 GUPNP_TOOLS_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/$(GUPNP_TOOLS_VERSION_MAJOR)
@@ -22,17 +22,17 @@ GUPNP_TOOLS_DEPENDENCIES = \
 	libgtk3 \
 	$(TARGET_NLS_DEPENDENCIES)
 
-GUPNP_TOOLS_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
+GUPNP_TOOLS_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_GUPNP_AV),y)
-GUPNP_TOOLS_CONF_OPTS += --with-av
+GUPNP_TOOLS_CONF_OPTS += -Dav-tools=true
 GUPNP_TOOLS_DEPENDENCIES += gupnp-av
 else
-GUPNP_TOOLS_CONF_OPTS += --without-av
+GUPNP_TOOLS_CONF_OPTS += -Dav-tools=false
 endif
 
 ifeq ($(BR2_PACKAGE_GTKSOURCEVIEW),y)
 GUPNP_TOOLS_DEPENDENCIES += gtksourceview
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
