From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Dec 2017 21:37:18 +0100
Subject: [Buildroot] [git commit] pulseaudio: fix libsamplerate dependency
Message-ID: <20171220203745.8E516811FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b85c6a038cc210355d8d5715cdf6fa73d18e8ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The (deprecated) libsamplerate support is not enabled unless
--enable-samplerate is passed to configure. Fix this.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pulseaudio/pulseaudio.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 3863557..13fcec5 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -17,7 +17,6 @@ PULSEAUDIO_CONF_OPTS = \
 
 PULSEAUDIO_DEPENDENCIES = \
 	host-pkgconf libtool libsndfile speex host-intltool \
-	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
 	$(if $(BR2_PACKAGE_LIBGLIB2),libglib2) \
 	$(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi) \
 	$(if $(BR2_PACKAGE_DBUS),dbus) \
@@ -25,6 +24,13 @@ PULSEAUDIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_FFTW),fftw) \
 	$(if $(BR2_PACKAGE_SYSTEMD),systemd)
 
+ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
+PULSEAUDIO_CONF_OPTS += --enable-samplerate
+PULSEAUDIO_DEPENDENCIES += libsamplerate
+else
+PULSEAUDIO_CONF_OPTS += --disable-samplerate
+endif
+
 ifeq ($(BR2_PACKAGE_GDBM),y)
 PULSEAUDIO_CONF_OPTS += --with-database=gdbm
 PULSEAUDIO_DEPENDENCIES += gdbm
