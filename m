From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  3 Jul 2018 07:29:36 +0300
Subject: [Buildroot] [PATCH v2] alsa-utils: bat needs fftw single precision
Message-ID: <87c2b0d5f06ca9c6842b52cefc76aaf5923d41d7.1530592176.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise the configure check for fftw fails, and alsabat does not link
with libfftw. Instead of selecting fftw unconditionally, make fftw
single precision an optional dependency. Add a help text comment about
that.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: Make fftw single precision an optional dependency (Thomas P)
---
 package/alsa-utils/Config.in     | 3 ++-
 package/alsa-utils/alsa-utils.mk | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index 1a48fc0315ef..df6cfdac34d3 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -76,7 +76,8 @@ config BR2_PACKAGE_ALSA_UTILS_ASEQNET
 
 config BR2_PACKAGE_ALSA_UTILS_BAT
 	bool "bat"
-	select BR2_PACKAGE_FFTW
+	help
+	  Analysis support in alsabat requires fftw single precision
 
 config BR2_PACKAGE_ALSA_UTILS_IECSET
 	bool "iecset"
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 9b2e64b1d3e4..e9a45c675f94 100644
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
-- 
2.18.0
