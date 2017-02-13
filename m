From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 13 Feb 2017 18:24:51 +0100
Subject: [Buildroot] [PATCH 1/1] domoticz: fix build on powerpc64le
Message-ID: <1487006691-34766-1-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is an issue with powerpc64le and boost::uuids::random_generator on the
following line of code (from include/boost/uuid/seed_rng.hpp):
sha.process_bytes( (unsigned char const*)&std::rand, sizeof( void(*)() ) )
This line "inspects the first couple bytes (here eight) of the std::rand
function to seed some rng. Due to the implementation of process_bytes and
inlining happening, it seems that one of the loops therein uses &rand-1 as
some boundary, compiling with -O0 makes that reloc come out as 'rand + 0' and
the link will succeed."
See: https://bugzilla.suse.com/show_bug.cgi?id=955832#c7

Fixes:
 - http://autobuild.buildroot.org/results/454c0ea393615bae2d1b44be9920f25b5c49fc33

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/domoticz/domoticz.mk | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index f43dbda..48cdbc4 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -18,6 +18,21 @@ DOMOTICZ_DEPENDENCIES = \
 	sqlite \
 	zlib
 
+# Fixes:
+# http://autobuild.buildroot.org/results/454c0ea393615bae2d1b44be9920f25b5c49fc33
+# There is an issue with powerpc64le and boost::uuids::random_generator on the
+# following line of code (from include/boost/uuid/seed_rng.hpp):
+# sha.process_bytes( (unsigned char const*)&std::rand, sizeof( void(*)() ) )
+# This line "inspects the first couple bytes (here eight) of the std::rand
+# function to seed some rng. Due to the implementation of process_bytes and
+# inlining happening, it seems that one of the loops therein uses &rand-1 as
+# some boundary, compiling with -O0 makes that reloc come out as 'rand + 0' and
+# the link will succeed."
+# See: https://bugzilla.suse.com/show_bug.cgi?id=955832#c7
+ifeq ($(BR2_powerpc64le),y)
+DOMOTICZ_CXXFLAGS += -O0
+endif
+
 # Due to the dependency on mosquitto, domoticz depends on
 # !BR2_STATIC_LIBS so set USE_STATIC_BOOST to OFF
 DOMOTICZ_CONF_OPTS += -DUSE_STATIC_BOOST=OFF
@@ -27,7 +42,8 @@ DOMOTICZ_CONF_OPTS += -DUSE_STATIC_BOOST=OFF
 DOMOTICZ_CONF_OPTS += \
 	-DUSE_BUILTIN_LUA=OFF \
 	-DUSE_BUILTIN_SQLITE=OFF \
-	-DUSE_BUILTIN_MQTT=OFF
+	-DUSE_BUILTIN_MQTT=OFF \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(DOMOTICZ_CXXFLAGS)"
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 DOMOTICZ_DEPENDENCIES += libusb
-- 
2.5.0
