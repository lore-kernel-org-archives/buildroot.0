From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Mon, 12 Oct 2015 21:32:32 +0200
Subject: [Buildroot] [PATCH] openal: New package
Message-ID: <561C0AD0.6050909@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
---

Tested on various archs and toolchains (uclibc, glibc, musl, extern, intern)

 package/Config.in          |  1 +
 package/openal/Config.in   | 18 ++++++++++++++++++
 package/openal/openal.hash |  2 ++
 package/openal/openal.mk   | 30 ++++++++++++++++++++++++++++++
 4 files changed, 51 insertions(+)
 create mode 100644 package/openal/Config.in
 create mode 100644 package/openal/openal.hash
 create mode 100644 package/openal/openal.mk

diff --git a/package/Config.in b/package/Config.in
index 37d9cd0..767cb29 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -722,6 +722,7 @@ menu "Audio/Sound"
 	source "package/opencore-amr/Config.in"
 	source "package/opus/Config.in"
 	source "package/opusfile/Config.in"
+	source "package/openal/Config.in"
 	source "package/portaudio/Config.in"
 	source "package/speex/Config.in"
 	source "package/taglib/Config.in"
diff --git a/package/openal/Config.in b/package/openal/Config.in
new file mode 100644
index 0000000..0bbbb37
--- /dev/null
+++ b/package/openal/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_OPENAL
+	bool "openal"
+	# OpenAL needs a backend
+	depends on BR2_PACKAGE_ALSA_LIB || \
+	           BR2_PACKAGE_PORTAUDIO || \
+	           BR2_PACKAGE_PULSEAUDIO
+	help
+	  OpenAL provides capabilities for playing audio in a virtual
+	  3D environment. Distance attenuation, doppler shift, and
+	  directional sound emitters are among the features handled by
+	  the API.
+
+	  http://kcat.strangesoft.net/openal.html
+
+comment "openal needs a backend"
+	depends on !BR2_PACKAGE_ALSA_LIB && \
+	           !BR2_PACKAGE_PORTAUDIO && \
+	           !BR2_PACKAGE_PULSEAUDIO
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
index 0000000..0c6a7cb
--- /dev/null
+++ b/package/openal/openal.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# openal
+#
+################################################################################
+
+OPENAL_VERSION = 1.16.0
+OPENAL_SOURCE = openal-soft-$(OPENAL_VERSION).tar.bz2
+OPENAL_SITE = http://kcat.strangesoft.net/openal-releases
+OPENAL_LICENSE = LGPL
+OPENAL_LICENSE_FILES = COPYING
+OPENAL_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+OPENAL_DEPENDENCIES += alsa-lib
+endif
+
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+OPENAL_DEPENDENCIES += portaudio
+endif
+
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+OPENAL_DEPENDENCIES += pulseaudio
+endif
+
+ifeq ($(BR2_STATIC_LIBS),y)
+OPENAL_CONF_OPTS += -DLIBTYPE=STATIC
+endif
+
+$(eval $(cmake-package))
-- 
1.9.1
