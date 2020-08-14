From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Aug 2020 22:49:24 +0200
Subject: [Buildroot] [git commit] package/mpd: add openal optional dependency
Message-ID: <20200814205156.6B1128643A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23dee8e0b9088319fb984c85d9e3ba6ae1f3cc47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
