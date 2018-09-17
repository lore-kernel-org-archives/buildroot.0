From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 17 Sep 2018 18:55:47 +0200
Subject: [Buildroot] [PATCH 1/1] domoticz: fix build with gcc <= 4.7
Message-ID: <20180917165547.30222-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sleep_for is not always defined with gcc <= 4.7, see
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52680

To fix this issue, add -D_GLIBCXX_USE_NANOSLEEP if gcc version is lower
than 4.8

Fixes:
 - http://autobuild.buildroot.net/results/0dada8dd727f32a4500670f6620adb05943ed0b7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/domoticz/domoticz.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 7f094d0976..832774a147 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -18,6 +18,12 @@ DOMOTICZ_DEPENDENCIES = \
 	sqlite \
 	zlib
 
+# sleep_for, see https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52680
+ifneq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8),y)
+DOMOTICZ_CONF_OPTS += \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -D_GLIBCXX_USE_NANOSLEEP"
+endif
+
 # Due to the dependency on mosquitto, domoticz depends on
 # !BR2_STATIC_LIBS so set USE_STATIC_BOOST and USE_OPENSSL_STATIC to OFF
 DOMOTICZ_CONF_OPTS += \
-- 
2.17.1
