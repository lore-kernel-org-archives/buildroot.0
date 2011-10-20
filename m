From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Oct 2011 17:12:57 +0200
Subject: [Buildroot] [git commit] package: add pulseaudio
Message-ID: <20111020151344.F0C1D8C9FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d96e977e372a9b7b7c681fc7bc6902211273ea1e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in                |    1 +
 package/multimedia/pulseaudio/Config.in     |   21 ++++++++++++++
 package/multimedia/pulseaudio/pulseaudio.mk |   40 +++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 7b63c14..ebf9314 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -39,6 +39,7 @@ source "package/multimedia/mpg123/Config.in"
 source "package/multimedia/mplayer/Config.in"
 source "package/multimedia/musepack/Config.in"
 source "package/multimedia/portaudio/Config.in"
+source "package/multimedia/pulseaudio/Config.in"
 source "package/multimedia/python-mad/Config.in"
 source "package/multimedia/speex/Config.in"
 source "package/multimedia/swfdec/Config.in"
diff --git a/package/multimedia/pulseaudio/Config.in b/package/multimedia/pulseaudio/Config.in
new file mode 100644
index 0000000..6e6d64c
--- /dev/null
+++ b/package/multimedia/pulseaudio/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_PULSEAUDIO
+	bool "pulseaudio"
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBTOOL
+	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_LIBSNDFILE
+	select BR2_PACKAGE_SPEEX
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
+	help
+	  PulseAudio is a sound system for POSIX OSes, meaning that it
+	  is a proxy for your sound applications. It allows you to do
+	  advanced operations on your sound data as it passes between
+	  your application and your hardware. Things like transferring
+	  the audio to a different machine, changing the sample format
+	  or channel count and mixing several sounds into one are
+	  easily achieved using a sound server.
+
+	  http://pulseaudio.org
+
+comment "pulseaudio requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
new file mode 100644
index 0000000..0686d39
--- /dev/null
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# pulseaudio
+#
+################################################################################
+
+PULSEAUDIO_VERSION = 1.0
+PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases/
+PULSEAUDIO_INSTALL_STAGING = YES
+PULSEAUDIO_CONF_OPT = \
+	--localstatedir=/var \
+	--disable-default-build-tests \
+	--disable-legacy-runtime-dir \
+	--disable-legacy-database-entry-format
+
+PULSEAUDIO_DEPENDENCIES = \
+	host-pkg-config libtool json-c libsndfile speex \
+	$(if $(BR2_PACKAGE_LIBINTL),libintl) \
+	$(if $(BR2_PACKAGE_LIBATOMIC_OPS),libatomic_ops) \
+	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
+	$(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib) \
+	$(if $(BR2_PACKAGE_LIBGLIB2),libglib2) \
+	$(if $(BR2_PACKAGE_LIBGTK2),libgtk2) \
+	$(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi) \
+	$(if $(BR2_PACKAGE_DBUS),dbus) \
+	$(if $(BR2_PACKAGE_BLUEZ_UTILS),bluez_utils) \
+	$(if $(BR2_PACKAGE_UDEV),udev) \
+	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
+	$(if $(BR2_PACKAGE_FFTW),fftw) \
+	$(if $(BR2_PACKAGE_ORC),orc)
+
+ifneq ($(BR2_PACKAGE_VALA),y)
+define PULSEAUDIO_REMOVE_VALA
+	rm -rf $(TARGET_DIR)/usr/share/vala
+endef
+
+PULSEAUDIO_POST_INSTALL_TARGET_HOOKS += PULSEAUDIO_REMOVE_VALA
+endif
+
+$(eval $(call AUTOTARGETS))
