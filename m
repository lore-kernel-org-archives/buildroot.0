From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 14 Aug 2020 18:30:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpd: add openal optional dependency
Message-ID: <20200814163026.1547032-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpd/Config.in | 12 ++++++++++++
 package/mpd/mpd.mk    |  7 +++++++
 2 files changed, 19 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 1b3ab8fa5d..791fb0f54a 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -286,6 +286,18 @@ comment "jack support needs a toolchain w/ dynamic library"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS
 
+config BR2_PACKAGE_MPD_OPENAL
+	bool "openal"
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_PACKAGE_OPENAL
+	help
+	  Enable OpenAL output support.
+
+comment "openal support needs a toolchain w/ NPTL"
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+
 config BR2_PACKAGE_MPD_OSS
 	bool "oss"
 	help
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index b8df04f084..a3b90aa55f 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -200,6 +200,13 @@ else
 MPD_CONF_OPTS += -Dneighbor=false
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_OPENAL),y)
+MPD_DEPENDENCIES += openal
+MPD_CONF_OPTS += -Dopenal=enabled
+else
+MPD_CONF_OPTS += -Dopenal=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_OPUS),y)
 MPD_DEPENDENCIES += opus libogg
 MPD_CONF_OPTS += -Dopus=enabled
-- 
2.27.0
