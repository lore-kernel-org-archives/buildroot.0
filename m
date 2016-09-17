From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 18:26:35 +0200
Subject: [Buildroot] [git commit] package/efl: enable elput support
Message-ID: <20160917165030.89B0F7FBAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=373c24cd1bb98a8b826b92034f7cb39780719625
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[Thomas:
 - add --disable-elput in the !BR2_PACKAGE_EFL_ELPUT case
 - add missing dependency on libxkbcomm]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/Config.in | 10 ++++++++++
 package/efl/efl.mk    |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index fa6d761..f963ade 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -183,6 +183,16 @@ config BR2_PACKAGE_EFL_OPENGL_NONE
 
 endchoice # OpenGL support
 
+config BR2_PACKAGE_EFL_ELPUT
+	bool "Elput"
+	select BR2_PACKAGE_LIBINPUT
+	select BR2_PACKAGE_LIBXKBCOMMON
+	help
+	  The elput library is an efl abstraction for the libinput library
+	  which can be used by various other subsystems (ecore_fb,
+	  ecore_drm, etc) to handle interfacing with libinput without
+	  having to duplicate the code in each subsystem.
+
 comment "libevas loaders"
 
 config BR2_PACKAGE_EFL_PNG
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 853c9dc..8038739 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -152,6 +152,13 @@ else
 EFL_CONF_OPTS += --disable-wayland
 endif
 
+ifeq ($(BR2_PACKAGE_EFL_ELPUT),y)
+EFL_CONF_OPTS += --enable-elput
+EFL_DEPENDENCIES += libinput libxkbcommon
+else
+EFL_CONF_OPTS += --disable-elput
+endif
+
 ifeq ($(BR2_PACKAGE_EFL_FB),y)
 EFL_CONF_OPTS += --enable-fb
 else
