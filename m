From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 18 Dec 2019 17:19:57 +0100
Subject: [Buildroot] [PATCH] package/kf5/kf5-kcoreaddons: don't treat ld
 warnings as errors
Message-ID: <20191218161957.110979-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Microblaze ld emits warnings like:
'
FDE encoding in
CMakeFiles/KF5CoreAddons.dir/KF5CoreAddons_autogen/mocs_compilation.cpp.o(.eh_frame)
prevents .eh_frame_hdr table being created
'
Since '-Wl,--fatal-warnings' is passed by default, build fails, so don't
treat warnings as errors by appending "-Wl,--no-fatal-warnings" to
CMAKE_SHARED_LINKER_FLAGS that is previously defined in package
dependency kf5-extra-cmake-modules.

Fixes:
http://autobuild.buildroot.net/results/f19/f198c86930535c50393e17fc7a70fb4f27b096ee/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
index 164bad1225..5b3e9acd90 100644
--- a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
+++ b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
@@ -21,4 +21,9 @@ endif
 
 KF5_KCOREADDONS_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KCOREADDONS_CXXFLAGS)"
 
+ifeq ($(BR2_microblaze),y)
+# Microblaze ld emits warnings, make warnings not to be treated as errors
+KF5_KCOREADDONS_CONF_OPTS = -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
+endif
+
 $(eval $(cmake-package))
-- 
2.20.1
