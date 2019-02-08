From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  8 Feb 2019 23:12:21 +0100
Subject: [Buildroot] [PATCH 1/1] support/dependencies: require at least
 CMake 3.8
Message-ID: <20190208221221.17852-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gerbera package in version 1.3 unfortunately now requires CMake >= 3.8
for C++17 macros:
https://github.com/gerbera/gerbera/commit/b5fd39f30fb10385ec228b71377685206a609c3a

So we need to bump our requirement from 3.1 to 3.8. If the host doesn't
have a CMake >= 3.8, Buildroot will build its own host-cmake package.

Fixes:
 - http://autobuild.buildroot.org/results/6405647b47b132ff5d0d211b92d407322d52d507

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 support/dependencies/check-host-cmake.mk | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index 4300e6f600..703bae400f 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -1,14 +1,5 @@
-# Versions before 3.0 are affected by the bug described in
-# https://git.busybox.net/buildroot/commit/?id=ef2c1970e4bff3be3992014070392b0e6bc28bd2
-# and fixed in upstream CMake in version 3.0:
-# https://cmake.org/gitweb?p=cmake.git;h=e8b8b37ef6fef094940d3384df5a1d421b9fa568
-#
-# Set this to either 3.0 or higher, depending on the highest minimum
-# version required by any of the packages bundled in Buildroot. If a
-# package is bumped or a new one added, and it requires a higher
-# version, our cmake infra will catch it and whine.
-#
-BR2_CMAKE_VERSION_MIN = 3.1
+# gerbera package needs at least CMake 3.8
+BR2_CMAKE_VERSION_MIN = 3.8
 
 BR2_CMAKE_CANDIDATES ?= cmake cmake3
 BR2_CMAKE ?= $(call suitable-host-package,cmake,\
-- 
2.14.1
