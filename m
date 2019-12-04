From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  4 Dec 2019 18:54:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/alsa-utils: fix build without alsa
 mixer
Message-ID: <20191204175437.2182278-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

atopology is needed to build alsa-utils since version 1.2.1 and
https://github.com/alsa-project/alsa-utils/commit/c8fdd38c74de2e8b7b2b5a4576787d5e9b4ae807

However, atopology is not correctly detected if --disable-alsatest is
passed so force the detection of alsa-topology through
--enable-alsa-topology as suggested by upstream in
https://github.com/alsa-project/alsa-lib/pull/16

An other option would be to drop --disable-alsatest but I couldn't find
why it was set

Fixes:
 - http://autobuild.buildroot.org/results/d0fb760669b02b813115af04adcf24530d35f4e1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/alsa-utils/alsa-utils.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 47f07bf7a2..bf703793b6 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -35,7 +35,10 @@ ALSA_UTILS_CONF_OPTS += --disable-alsaloop
 endif
 
 ifneq ($(BR2_PACKAGE_ALSA_UTILS_ALSAMIXER),y)
-ALSA_UTILS_CONF_OPTS += --disable-alsamixer --disable-alsatest
+ALSA_UTILS_CONF_OPTS += \
+	--disable-alsamixer \
+	--disable-alsatest \
+	--enable-alsa-topology
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_UTILS_BAT),y)
-- 
2.24.0
