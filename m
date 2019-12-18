From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Dec 2019 23:22:29 +0100
Subject: [Buildroot] [git commit] package/kf5/kf5-kcoreaddons: don't treat
 ld warnings as errors
Message-ID: <20191218221343.813ED8C9AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc53d5357d84ff9b78d76e45ce216061df8a37c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
