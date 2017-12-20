From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 20 Dec 2017 18:02:51 +0200
Subject: [Buildroot] [PATCH 2/2] pulseaudio: fix libsamplerate dependency
In-Reply-To: <6e8f78216f2cc0177456fa5723e6ad37832833da.1513785771.git.baruch@tkos.co.il>
References: <6e8f78216f2cc0177456fa5723e6ad37832833da.1513785771.git.baruch@tkos.co.il>
Message-ID: <3e746e6aac146ae876e51f832d4979b1de3c6eb0.1513785771.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The (deprecated) libsamplerate support is not enabled unless
--enable-samplerate is passed to configure. Fix this.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/pulseaudio/pulseaudio.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 3863557881e5..13fcec52a3b3 100644
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
-- 
2.15.1
