From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Jul 2018 22:04:16 +0200
Subject: [Buildroot] [git commit] alsa-utils: make fftw an optional
 dependency for alsabat
Message-ID: <20180704200052.44DBC870D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c31637b584a49a40e3a1f72d80002fd8fea0eeee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_PACKAGE_ALSA_UTILS_BAT option currently selects
BR2_PACKAGE_FFTW. However, it turns out that fftw is not a mandatory
dependency to build alsabat, just an optional dependency.

This commit therefore turns this dependency into an optional
one. However, it is not just FFTW that is necessary, but the simple
precision version of FFTW, so the optional dependency takes this into
account.

We take this opportunity to extend the Config.in help text for
BR2_PACKAGE_ALSA_UTILS_BAT.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/alsa-utils/Config.in     | 8 +++++++-
 package/alsa-utils/alsa-utils.mk | 3 ++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index 1a48fc0315..edf5d39f26 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -76,7 +76,13 @@ config BR2_PACKAGE_ALSA_UTILS_ASEQNET
 
 config BR2_PACKAGE_ALSA_UTILS_BAT
 	bool "bat"
-	select BR2_PACKAGE_FFTW
+	help
+	  ALSABAT (ALSA Basic Audio Tester) is a simple command-line
+	  utility intended to help automate audio driver and sound
+	  server testing with little human interaction.
+
+	  Note that analysis support in alsabat requires fftw single
+	  precision.
 
 config BR2_PACKAGE_ALSA_UTILS_IECSET
 	bool "iecset"
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 9b2e64b1d3..e9a45c675f 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -40,7 +40,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_ALSA_UTILS_BAT),y)
 ALSA_UTILS_CONF_OPTS += --enable-bat
-ALSA_UTILS_DEPENDENCIES += fftw
+# Analysis support requires fftw single precision
+ALSA_UTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_FFTW_PRECISION_SINGLE),fftw)
 else
 ALSA_UTILS_CONF_OPTS += --disable-bat
 endif
