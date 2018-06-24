From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 24 Jun 2018 16:15:05 +0200
Subject: [Buildroot] [PATCH 1/1] domoticz: remove boost hack for powerpc64le
Message-ID: <20180624141505.31561-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since boost 1.67, seed_rng.hpp has been removed:
https://github.com/boostorg/uuid/commit/a8a1ec3d826b04d2c842e79ecd18cff6a991fd29

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/domoticz/domoticz.mk | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index af58563436..6421fd0dd5 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -18,21 +18,6 @@ DOMOTICZ_DEPENDENCIES = \
 	sqlite \
 	zlib
 
-# Fixes:
-# http://autobuild.buildroot.org/results/454c0ea393615bae2d1b44be9920f25b5c49fc33
-# There is an issue with powerpc64le and boost::uuids::random_generator on the
-# following line of code (from include/boost/uuid/seed_rng.hpp):
-# sha.process_bytes( (unsigned char const*)&std::rand, sizeof( void(*)() ) )
-# This line "inspects the first couple bytes (here eight) of the std::rand
-# function to seed some rng. Due to the implementation of process_bytes and
-# inlining happening, it seems that one of the loops therein uses &rand-1 as
-# some boundary, compiling with -O0 makes that reloc come out as 'rand + 0' and
-# the link will succeed."
-# See: https://bugzilla.suse.com/show_bug.cgi?id=955832#c7
-ifeq ($(BR2_powerpc64le),y)
-DOMOTICZ_CXXFLAGS += -O0
-endif
-
 # Due to the dependency on mosquitto, domoticz depends on
 # !BR2_STATIC_LIBS so set USE_STATIC_BOOST to OFF
 DOMOTICZ_CONF_OPTS += -DUSE_STATIC_BOOST=OFF
-- 
2.14.1
