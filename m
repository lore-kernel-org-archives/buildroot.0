From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Tue, 13 Oct 2015 20:28:34 +0200
Subject: [Buildroot] [PATCH v3] openal: New package
Message-ID: <561D4D52.3090001@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---

Tested on various backends, archs and toolchains (uclibc, glibc, musl, extern, intern)

v3: Added dependency on threads and select alsa as default backend, fixed license and check for dependencies (suggested by Thomas Petazzoni)
    Fixed ordering in Config.in and patch style (suggested by Vicente Olivert Riera)
    Added C++ dependency (spotted myself)
v2: Added check for static lib build, added URL to description (suggested by Bernd Kuhls)

 package/Config.in          |  1 +
 package/openal/Config.in   | 16 ++++++++++++++++
 package/openal/openal.hash |  2 ++
 package/openal/openal.mk   | 39 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 58 insertions(+)
 create mode 100644 package/openal/Config.in
 create mode 100644 package/openal/openal.hash
 create mode 100644 package/openal/openal.mk

diff --git a/package/Config.in b/package/Config.in
index 37d9cd0..0896c82 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -719,6 +719,7 @@ menu "Audio/Sound"
 	source "package/libsoxr/Config.in"
 	source "package/libvorbis/Config.in"
 	source "package/mp4v2/Config.in"
+	source "package/openal/Config.in"
 	source "package/opencore-amr/Config.in"
 	source "package/opus/Config.in"
 	source "package/opusfile/Config.in"
diff --git a/package/openal/Config.in b/package/openal/Config.in
new file mode 100644
index 0000000..49b097c
--- /dev/null
+++ b/package/openal/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_OPENAL
+	bool "openal"
+	# OpenAL needs a backend
+	select BR2_PACKAGE_ALSA_LIB if !BR2_PACKAGE_PORTAUDIO && !BR2_PACKAGE_PULSEAUDIO
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	help
+	  OpenAL provides capabilities for playing audio in a virtual
+	  3D environment. Distance attenuation, doppler shift, and
+	  directional sound emitters are among the features handled by
+	  the API.
+
+	  http://kcat.strangesoft.net/openal.html
+
+comment "openal needs a toolchain w/ threads, C++"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/openal/openal.hash b/package/openal/openal.hash
new file mode 100644
index 0000000..b28b2e2
--- /dev/null
+++ b/package/openal/openal.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	2f3dcd313fe26391284fbf8596863723f99c65d6c6846dccb48e79cadaf40d5f  openal-soft-1.16.0.tar.bz2
diff --git a/package/openal/openal.mk b/package/openal/openal.mk
new file mode 100644
index 0000000..ac595d1
--- /dev/null
+++ b/package/openal/openal.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# openal
+#
+################################################################################
+
+OPENAL_VERSION = 1.16.0
+OPENAL_SOURCE = openal-soft-$(OPENAL_VERSION).tar.bz2
+OPENAL_SITE = http://kcat.strangesoft.net/openal-releases
+OPENAL_LICENSE = LGPLv2+
+OPENAL_LICENSE_FILES = COPYING
+OPENAL_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+OPENAL_DEPENDENCIES += alsa-lib
+OPENAL_CONF_OPTS += -DALSOFT_REQUIRE_ALSA=ON
+else
+OPENAL_CONF_OPTS += -DALSOFT_REQUIRE_ALSA=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+OPENAL_DEPENDENCIES += portaudio
+OPENAL_CONF_OPTS += -DALSOFT_REQUIRE_PORTAUDIO=ON
+else
+OPENAL_CONF_OPTS += -DALSOFT_REQUIRE_PORTAUDIO=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+OPENAL_DEPENDENCIES += pulseaudio
+OPENAL_CONF_OPTS += -DALSOFT_REQUIRE_PULSEAUDIO=ON
+else
+OPENAL_CONF_OPTS += -DALSOFT_REQUIRE_PULSEAUDIO=OFF
+endif
+
+ifeq ($(BR2_STATIC_LIBS),y)
+OPENAL_CONF_OPTS += -DLIBTYPE=STATIC
+endif
+
+$(eval $(cmake-package))
-- 
1.9.1
