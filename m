From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 20:04:06 +0200
Subject: [Buildroot] [git commit] package: prepare for per-version hash files
Message-ID: <20181020180239.524B07FF87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fe92792b3cc4c6eec74ae6bcf6b274668d2534e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Qt5 packages may have different licensing terms between the two
versions we support, and in some cases, those different terms are
expressed in similarly named files, like files named plain 'LICENSE' for
example.

Similarly, glibc also has different license files, especially since the
arc version still has libidn, which got dropped from upstream.

This is problematic, because, in a .hash file, we can't store two
different hashes for the same file. We've started to handle this case by
moving the licenses hashes to the per-version sub directories.

However, the hashes for the downloads are still stored inside the non-
versioned hash file of the package, which is not totally coherent: if we
have a per-version hash file, it should list all the hases for that
version, downloads included, and there should be no unversioned hash
file.

In preparation for this, we duplicate the downloads hashes from the main
hash files, and into the versioned ones. Once the download infra learns
to look for those hashes in these per-version subdirs, we'll remove the
unversioned hash files.

Note that, now that we have versioned hash files, the main hash files
will not be used to check license files, so we can already drop the
hashes for license files from the main hash files.

Note also that there are a few other packages for which we support
different versions (binutils, gcc, gdb, lua, xserver_xorg-server,
uboot), but none of those have different licensing terms due to the
version. Qt5 and glibc are alone in this case.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ga??l Portay <gael.portay@savoirfairelinux.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/arc-2018.03-release/glibc.hash                     | 4 ++++
 .../glibc.hash                                                   | 4 ++++
 package/qt5/qt5base/{ => 5.11.2}/qt5base.hash                    | 3 ---
 package/qt5/qt5base/5.6.3/qt5base.hash                           | 3 +++
 package/qt5/qt5base/qt5base.hash                                 | 9 ---------
 package/qt5/qt5connectivity/5.11.2/qt5connectivity.hash          | 3 +++
 package/qt5/qt5connectivity/5.6.3/qt5connectivity.hash           | 3 +++
 .../qt5/qt5quickcontrols2/{ => 5.11.2}/qt5quickcontrols2.hash    | 3 ---
 package/qt5/qt5quickcontrols2/5.6.3/qt5quickcontrols2.hash       | 3 +++
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash             | 5 -----
 package/qt5/qt5serialbus/5.11.2/qt5serialbus.hash                | 3 +++
 package/qt5/qt5serialbus/5.6.3/qt5serialbus.hash                 | 3 +++
 package/qt5/qt5serialport/5.11.2/qt5serialport.hash              | 3 +++
 package/qt5/qt5serialport/5.6.3/qt5serialport.hash               | 3 +++
 package/qt5/qt5virtualkeyboard/2.0/qt5virtualkeyboard.hash       | 3 +++
 .../qt5/qt5virtualkeyboard/{ => 5.11.2}/qt5virtualkeyboard.hash  | 3 ---
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash           | 7 -------
 17 files changed, 35 insertions(+), 30 deletions(-)

diff --git a/package/glibc/arc-2018.03-release/glibc.hash b/package/glibc/arc-2018.03-release/glibc.hash
index 4c9830e6f6..d073c9166f 100644
--- a/package/glibc/arc-2018.03-release/glibc.hash
+++ b/package/glibc/arc-2018.03-release/glibc.hash
@@ -1,3 +1,7 @@
+# Locally calculated (fetched from Github)
+sha256  e08ab67b2db2d0f0e8f3311d23c54fb8f6d4c1ef6fa0b4047fd5da400e3ce9de  glibc-arc-2018.03-release.tar.gz
+
+$ Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
 sha256  61abdd6930c9c599062d89e916b3e7968783879b6be0ee1c6229dd6169def431  LICENSES
diff --git a/package/glibc/glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab/glibc.hash b/package/glibc/glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab/glibc.hash
index 03abf1e96a..a95c990c99 100644
--- a/package/glibc/glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab/glibc.hash
+++ b/package/glibc/glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab/glibc.hash
@@ -1,3 +1,7 @@
+# Locally calculated (fetched from Github)
+sha256  6e88cea4002efa7f78d86ea5e98eb92ed423d5a35068751517c4f00f56b8666c  glibc-glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab.tar.gz
+
+# Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
 sha256  35bdb41dc0bcb10702ddacbd51ec4c0fe6fb3129f734e8c85fc02e4d3eb0ce3f  LICENSES
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/5.11.2/qt5base.hash
similarity index 79%
copy from package/qt5/qt5base/qt5base.hash
copy to package/qt5/qt5base/5.11.2/qt5base.hash
index daac4e06a3..1c11adba2d 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/5.11.2/qt5base.hash
@@ -1,6 +1,3 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtbase-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 fef48529a6fc2617a30d75d952cb327c6be341fd104154993922184b3b3b4da1 qtbase-opensource-src-5.6.3.tar.xz
-
 # Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtbase-everywhere-src-5.11.2.tar.xz.mirrorlist
 sha256 6381e7c3468d5a1dcfe3683b29eeced192faa0f8a32434fec071a59b8bcd0107 qtbase-everywhere-src-5.11.2.tar.xz
 
diff --git a/package/qt5/qt5base/5.6.3/qt5base.hash b/package/qt5/qt5base/5.6.3/qt5base.hash
index f113f82c73..2dae2e8bf0 100644
--- a/package/qt5/qt5base/5.6.3/qt5base.hash
+++ b/package/qt5/qt5base/5.6.3/qt5base.hash
@@ -1,3 +1,6 @@
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtbase-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 fef48529a6fc2617a30d75d952cb327c6be341fd104154993922184b3b3b4da1 qtbase-opensource-src-5.6.3.tar.xz
+
 # Hashes for license files:
 sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
 sha256 66f6bb53f6d985a4d651bf1ecfe8bbcbe32b0f744708d588f047580ee85d8ec8 LICENSE.LGPLv21
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index daac4e06a3..b72e8c71f1 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -3,12 +3,3 @@ sha256 fef48529a6fc2617a30d75d952cb327c6be341fd104154993922184b3b3b4da1 qtbase-o
 
 # Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtbase-everywhere-src-5.11.2.tar.xz.mirrorlist
 sha256 6381e7c3468d5a1dcfe3683b29eeced192faa0f8a32434fec071a59b8bcd0107 qtbase-everywhere-src-5.11.2.tar.xz
-
-# Hashes for license files:
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
-sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
-sha256 88ec689407cf2df9b2eb5c45952564d51ce73c129a3bdffb15c0d2d161ad7558 LICENSE.LGPLv3
-sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
-sha256 1f4fa3d202198f5d836993748eac9d91157e2cec7fb8426f56000a02a677cdc5 header.BSD
-sha256 2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216 src/3rdparty/harfbuzz-ng/COPYING
diff --git a/package/qt5/qt5connectivity/5.11.2/qt5connectivity.hash b/package/qt5/qt5connectivity/5.11.2/qt5connectivity.hash
index 6438065c62..921f2e80a8 100644
--- a/package/qt5/qt5connectivity/5.11.2/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/5.11.2/qt5connectivity.hash
@@ -1,3 +1,6 @@
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtconnectivity-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 58901bbd14d3bc472f27fe305fd8dc33cffbd10da83616e9691c04c3290d42c5 qtconnectivity-everywhere-src-5.11.2.tar.xz
+
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5connectivity/5.6.3/qt5connectivity.hash b/package/qt5/qt5connectivity/5.6.3/qt5connectivity.hash
index 8b885f7098..c1a03c5e00 100644
--- a/package/qt5/qt5connectivity/5.6.3/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/5.6.3/qt5connectivity.hash
@@ -1,3 +1,6 @@
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtconnectivity-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 fa406e3d63fa4a2acc8ecae6d110f20c766f19a21c7061a12f3c167deb07ccde qtconnectivity-opensource-src-5.6.3.tar.xz
+
 # Hashes for license files:
 sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/5.11.2/qt5quickcontrols2.hash
similarity index 68%
copy from package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
copy to package/qt5/qt5quickcontrols2/5.11.2/qt5quickcontrols2.hash
index 1ebed34166..bdf844eb91 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/5.11.2/qt5quickcontrols2.hash
@@ -1,6 +1,3 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols2-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 ec5078470abe2da888c2be5d1749b5961ef5132487c180ce4d4aa19ea7ff81cb qtquickcontrols2-opensource-src-5.6.3.tar.xz
-
 # Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtquickcontrols2-everywhere-src-5.11.2.tar.xz.mirrorlist
 sha256 aa0549f9a4135f9d600b57f53347ebf344e60d21f90c6d844109755da12dcb84 qtquickcontrols2-everywhere-src-5.11.2.tar.xz
 
diff --git a/package/qt5/qt5quickcontrols2/5.6.3/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/5.6.3/qt5quickcontrols2.hash
index 6f5bf29400..01fe5dcd61 100644
--- a/package/qt5/qt5quickcontrols2/5.6.3/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/5.6.3/qt5quickcontrols2.hash
@@ -1,3 +1,6 @@
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols2-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 ec5078470abe2da888c2be5d1749b5961ef5132487c180ce4d4aa19ea7ff81cb qtquickcontrols2-opensource-src-5.6.3.tar.xz
+
 # Hashes for license files:
 sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
 sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index 1ebed34166..eb97371337 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -3,8 +3,3 @@ sha256 ec5078470abe2da888c2be5d1749b5961ef5132487c180ce4d4aa19ea7ff81cb qtquickc
 
 # Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtquickcontrols2-everywhere-src-5.11.2.tar.xz.mirrorlist
 sha256 aa0549f9a4135f9d600b57f53347ebf344e60d21f90c6d844109755da12dcb84 qtquickcontrols2-everywhere-src-5.11.2.tar.xz
-
-# Hashes for license files:
-sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
-sha256 9e63a04ce021b8bf811b30881fa51c8c3db88afeead942cd59322f2fb69c75bc LICENSE.LGPLv3
-sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
diff --git a/package/qt5/qt5serialbus/5.11.2/qt5serialbus.hash b/package/qt5/qt5serialbus/5.11.2/qt5serialbus.hash
index 1dd9a56487..9c4aa16fd2 100644
--- a/package/qt5/qt5serialbus/5.11.2/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/5.11.2/qt5serialbus.hash
@@ -1,3 +1,6 @@
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtserialbus-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 1774c2c162f85f7cbcb2bdd2ef47507b110a01bc261627b46aa718e87079641e qtserialbus-everywhere-src-5.11.2.tar.xz
+
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
 sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
diff --git a/package/qt5/qt5serialbus/5.6.3/qt5serialbus.hash b/package/qt5/qt5serialbus/5.6.3/qt5serialbus.hash
index 574fcc5294..6715392eba 100644
--- a/package/qt5/qt5serialbus/5.6.3/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/5.6.3/qt5serialbus.hash
@@ -1,3 +1,6 @@
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtserialbus-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 71c89be3879414e2a11cad93a4882758f9259b1c0aec980560309192c99f9a9e qtserialbus-opensource-src-5.6.3.tar.xz
+
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
 sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
diff --git a/package/qt5/qt5serialport/5.11.2/qt5serialport.hash b/package/qt5/qt5serialport/5.11.2/qt5serialport.hash
index 6438065c62..4dda77e44a 100644
--- a/package/qt5/qt5serialport/5.11.2/qt5serialport.hash
+++ b/package/qt5/qt5serialport/5.11.2/qt5serialport.hash
@@ -1,3 +1,6 @@
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtserialport-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 b01b69ce421d449402363c0cf617fcc8856e39d6d2c28aa3d06d1f5359dc6f6e qtserialport-everywhere-src-5.11.2.tar.xz
+
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5serialport/5.6.3/qt5serialport.hash b/package/qt5/qt5serialport/5.6.3/qt5serialport.hash
index 56f2f6e500..e6f46c1c57 100644
--- a/package/qt5/qt5serialport/5.6.3/qt5serialport.hash
+++ b/package/qt5/qt5serialport/5.6.3/qt5serialport.hash
@@ -1,3 +1,6 @@
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtserialport-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 082d1fee2703aed19f840c4e4031e37c9b929e5bd8ebef2ebac4b28c509bae1a qtserialport-opensource-src-5.6.3.tar.xz
+
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
 sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
diff --git a/package/qt5/qt5virtualkeyboard/2.0/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/2.0/qt5virtualkeyboard.hash
index 266fc3b695..0cc4f9c82e 100644
--- a/package/qt5/qt5virtualkeyboard/2.0/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/2.0/qt5virtualkeyboard.hash
@@ -1,3 +1,6 @@
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtvirtualkeyboard-opensource-src-2.0.tar.xz.mirrorlist
+sha256 1d543a851e83fc3de40f48c2935f70278e842589b9a235c2b22f41733e561aec qtvirtualkeyboard-opensource-src-2.0.tar.xz
+
 # Hashes for license files:
 sha256 6148d2793ca4e62ba3935a27bd3e46971a5d7c871dbe8f2687a867bd2c2589fb src/virtualkeyboard/3rdparty/lipi-toolkit/license.txt
 sha256 05cc719deafd0ab083b03296bb2911de10d116953b626a7629b9ca59938038b1 src/virtualkeyboard/3rdparty/openwnn/NOTICE
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/5.11.2/qt5virtualkeyboard.hash
similarity index 77%
copy from package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
copy to package/qt5/qt5virtualkeyboard/5.11.2/qt5virtualkeyboard.hash
index d4b7e58e38..c065a9e807 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/5.11.2/qt5virtualkeyboard.hash
@@ -1,6 +1,3 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtvirtualkeyboard-opensource-src-2.0.tar.xz.mirrorlist
-sha256 1d543a851e83fc3de40f48c2935f70278e842589b9a235c2b22f41733e561aec qtvirtualkeyboard-opensource-src-2.0.tar.xz
-
 # Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtvirtualkeyboard-everywhere-src-5.11.2.tar.xz.mirrorlist
 sha256 2709500071e7e98ca6f6eecef0f5c80d19ae22aba562293352debd516633b197 qtvirtualkeyboard-everywhere-src-5.11.2.tar.xz
 
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
index d4b7e58e38..7a17677ec4 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -3,10 +3,3 @@ sha256 1d543a851e83fc3de40f48c2935f70278e842589b9a235c2b22f41733e561aec qtvirtua
 
 # Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtvirtualkeyboard-everywhere-src-5.11.2.tar.xz.mirrorlist
 sha256 2709500071e7e98ca6f6eecef0f5c80d19ae22aba562293352debd516633b197 qtvirtualkeyboard-everywhere-src-5.11.2.tar.xz
-
-# Hashes for license files:
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
-sha256 7a45a9769d19545480a241230e6ea520b5156fac00930dcd69b6886749743d10 src/virtualkeyboard/3rdparty/lipi-toolkit/MIT_LICENSE.txt
-sha256 05cc719deafd0ab083b03296bb2911de10d116953b626a7629b9ca59938038b1 src/virtualkeyboard/3rdparty/openwnn/NOTICE
-sha256 b5830d96fb5a7e7e7ebcc295f352846b4b998e78fdc8f9aa68e134d2e4b39986 src/virtualkeyboard/3rdparty/pinyin/NOTICE
-sha256 9400a6128693d2f25653698e695f554660c71efccc8c21af28bf143e35199db6 src/virtualkeyboard/3rdparty/tcime/COPYING
