From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  7 Sep 2016 23:08:41 +0200
Subject: [Buildroot] [PATCH 2/4] package/efl: enable elput support
In-Reply-To: <1473282523-12796-1-git-send-email-romain.naour@gmail.com>
References: <1473282523-12796-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1473282523-12796-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/efl/Config.in | 9 +++++++++
 package/efl/efl.mk    | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index f4d88bc..df13047 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -185,6 +185,15 @@ comment "OpenGL ES support needs an OpenGL ES w/ EGL provider"
 
 endchoice # OpenGL support
 
+config BR2_PACKAGE_EFL_ELPUT
+	bool "Elput"
+	select BR2_PACKAGE_LIBINPUT
+	help
+	  The elput library is an efl abstraction for the libinput library
+	  which can be used by various other subsystems (ecore_fb,
+	  ecore_drm, etc) to handle interfacing with libinput without
+	  having to duplicate the code in each subsystem.
+
 comment "libevas loaders"
 
 config BR2_PACKAGE_EFL_PNG
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 44649d5..5b65758 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -152,6 +152,11 @@ else
 EFL_CONF_OPTS += --disable-wayland
 endif
 
+ifeq ($(BR2_PACKAGE_EFL_ELPUT),y)
+EFL_CONF_OPTS += --enable-elput
+EFL_DEPENDENCIES += libinput
+endif
+
 ifeq ($(BR2_PACKAGE_EFL_FB),y)
 EFL_CONF_OPTS += --enable-fb
 else
-- 
2.5.5
