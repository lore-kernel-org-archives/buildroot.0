From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Apr 2018 18:11:16 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] qt5script: correct
 license information
Message-ID: <20180408194522.E9FE388064@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0651acdd1dab879d59c841101b22e9d64f53e2fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The license information in qt5script was just copied from all the other
qt5 modules, but it is different (and complicated).

- libQt5Script itself contains the third-party JavaScriptCore source.
  JavaScriptCore has a number of licenses: BSD-2-Clause, BSD-3-Clause,
  LGPL-2.0+, LGPL-2.1+. Since it is all linked together, the end
  result will be BSD-3-Clause and LGPL-2.1+.

  The different BSD licenses are all slightly different (different
  authors, which affects the third clause in particular). Only one
  separate license file is provided, so let's use that one.

  There is an LGPL-2.0 license file, which is slightly different from
  the top-level LICENSE.LGPLv21, so let's add that one as well.

- libQt5Script also contains Qt-specific code which is all licensed
  under LGPL-2.1 only. This is covered by the LICENSE.LGPLv21 file.
  It merges with the LGPL-2.1+ from JavaScriptCore but limits it to
  2.1 only.

- libQt5ScriptTools is a separate libary containing just the script
  debugger. It is covered by the usual Qt license:
  * LGPL-2.1 or LGPL-3.0 with exception for Qt 5.6;
  * LGPL-3.0 or GPL-2.0+ for Qt 5.9 (actually it is GPL-2.0 or GPL-3.0
    or any later version approved by the KDE Qt foundation, but let's
    keep it simple :-). Note that there is no LICENSE.GPLv2 provided,
    only LICENSE.GPLv3. Also, there is an LGPL_EXCEPTION.txt file but
    no mention of an exception anywhere in the sources.

Update the license information with all of the above. Also add hashes
for the new license files from JavaScriptCore.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d9ec8526bb68ea50a8e9b9847ab119c6248c66fd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5script/qt5script.hash |  2 ++
 package/qt5/qt5script/qt5script.mk   | 17 +++++++++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index bcb37801a8..9b43e5fd65 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -10,3 +10,5 @@ sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8 LICENSE.
 sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084 LGPL_EXCEPTION.txt
 sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
 sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
+sha256 5094ecb9c9dcd0eadc34f3c11511d9b5535063032bc150164ecd1a5d5a445547 src/3rdparty/javascriptcore/JavaScriptCore/COPYING.LIB
+sha256 43b007cd3ac7b7ea5284b13e9580334028e6f42e859059605d57558f39374197 src/3rdparty/javascriptcore/JavaScriptCore/pcre/COPYING
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index b6c02d0d1c..9539f56df6 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -10,8 +10,21 @@ QT5SCRIPT_SOURCE = qtscript-opensource-src-$(QT5SCRIPT_VERSION).tar.xz
 QT5SCRIPT_DEPENDENCIES = qt5base
 QT5SCRIPT_INSTALL_STAGING = YES
 
-QT5SCRIPT_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
-QT5SCRIPT_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+# JavaScriptCore contains files under BSD-2-Clause, BSD-3-Clause, and LGPL-2+.
+# This is linked into libQt5Script, which also contains Qt sources under
+# LGPL-2.1 (only). Therefore, the library is  LGPL-2.1 and BSD-3-Clause.
+# libQt5ScriptTools is under the normal Qt opensource license.
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+QT5SCRIPT_LICENSE = LGPL-2.1, BSD-3-Clause, LGPL-3.0 or GPL-2.0+ (libQt5ScriptTools), GFDL-1.3 (docs)
+QT5SCRIPT_LICENSE_FILES = LICENSE.LGPLv21 LICENSE.LGPLv3 LICENSE.GPLv3 LICENSE.FDL
+else
+QT5SCRIPT_LICENSE = LGPL-2.1, BSD-3-Clause, LGPL-2.1 with exception or LGPL-3.0 with exception (libQt5ScriptTools), GFDL-1.3 (docs)
+QT5SCRIPT_LICENSE_FILES = LICENSE.LGPLv21 LICENSE.LGPLv3 LGPL_EXCEPTION.txt LICENSE.FDL
+endif
+# License files from JavaScriptCore
+QT5SCRIPT_LICENSE_FILES += \
+	src/3rdparty/javascriptcore/JavaScriptCore/COPYING.LIB \
+	src/3rdparty/javascriptcore/JavaScriptCore/pcre/COPYING
 
 define QT5SCRIPT_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
