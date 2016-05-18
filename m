From: Julien CORJON <corjon.j@ecagroup.com>
Date: Wed, 18 May 2016 14:52:36 +0000
Subject: [Buildroot] building qt5webengine
In-Reply-To: <CAPTQzAD5Kugi=Aov5bW-L=oyypo15OJFsTNkvt=YSyAeScox+A@mail.gmail.com>
References: <CAPTQzAD5Kugi=Aov5bW-L=oyypo15OJFsTNkvt=YSyAeScox+A@mail.gmail.com>
Message-ID: <573C81B3.1020506@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anatoly,

Thanks for your work, I did not had the time to work on Qt5WebEngine...

At this point you should merge the last version of my patch (at the end 
of this email) with your work and submit it to the BR mailing list.

Le 18/05/2016 14:15, Anatoly Asviyan a ?crit :
> Hi
> I have succeeded to build qt5webengine for imx6. I've started from
> Julien Corjon patch and added the following:
>
>   * compile host python with bz2

Take a look on my patch bellow for this point.

>   * compile target code with -std=c++11 flag
>   * compile host code without that flag
>   * hint gyp/ninja voodoo to do Unix build (it should be auto detected,
>     but it does not)

I don't remember to have to cheat C++ or gyp/ninja last time I've 
compiled qt5webengine and I don't find any reference to these issues in 
bugreports.qt.io which is weird.

>   * inject missing V4L2 enum (it exists in my kernel headers but not in
>     toolchain's /usr/include/linux)

Take a look on bugreport on that one, there is a quite similar bug[1].
If it's your case, your toolchain is really old (<2.6.39) moreover for 
an i.MX6. It's probably time to update ;-)

>
> I've tried to do above things in a clean way, by changing *.pro or *.gyp
> files. but it did not worked, so I ended up with an ugly hack.
>
> Todo
>
>   * do above steps in a clean way
>   * configure qt5webengine to use BR2's  ssl, ffmpeg and icu and not its
>     own copies. This is specifically important for me, since I have
>     patched ffmpeg

You should probably take a look on yocto recipe for that one[2].

Also you should take care to enable qt5webengine only for 
x86/armv6/armv7 (see my patch) and take a look to yocto patches [3].

>
>
> Patch: https://gist.github.com/aanatoly/76a2310d41d797d266700c70f0890de7

For a better review, please send your patch directly to the mailing list 
(See[4]) and do not forget to add a description and a Signed-off-by for 
qt5webengine patches (See [5] for an example)

Thanks for your work!

Regards,

Julien

[1] https://bugreports.qt.io/browse/QTBUG-48298
[2] 
https://github.com/meta-qt5/meta-qt5/blob/master/recipes-qt/qt5/qtwebengine_git.bb#L33
[3] 
https://github.com/meta-qt5/meta-qt5/tree/master/recipes-qt/qt5/qtwebengine
[4] https://buildroot.org/downloads/manual/manual.html#submitting-patches
[5] 
https://git.buildroot.net/buildroot/tree/package/qt5/qt5base/0001-Disable-c-standard-compiler-flags-for-the-host-build.patch

>
> --
> Regards, Anatoly
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

---

commit 35f7ade29035fb8fa43654055640b9c57d741f71
Author: Julien Corjon <corjon.j@ecagroup.com>
Date:   Thu Mar 24 11:42:40 2016 +0100

     qt5webengine: new package

diff --git a/package/python/python.mk b/package/python/python.mk
index 4ecd0d1..2a35526 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -31,7 +31,6 @@ HOST_PYTHON_CONF_OPTS +=      \
         --disable-gdbm          \
         --disable-bsddb         \
         --disable-test-modules  \
-       --disable-bz2           \
         --disable-ssl           \
         --disable-ossaudiodev   \
         --disable-pyo-build
@@ -56,6 +55,12 @@ HOST_PYTHON_DEPENDENCIES = host-expat host-zlib

  PYTHON_INSTALL_STAGING = YES

+ifeq ($(BR2_PACKAGE_QT5WEBENGINE),y)
+HOST_PYTHON_DEPENDENCIES += host-bzip2
+else
+HOST_PYTHON_CONF_OPTS += --disable-bz2
+endif
+
  ifeq ($(BR2_PACKAGE_PYTHON_READLINE),y)
  PYTHON_DEPENDENCIES += readline
  endif
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index f673daa..28a0a1e 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -44,6 +44,7 @@ source "package/qt5/qt5serialport/Config.in"
  source "package/qt5/qt5svg/Config.in"
  source "package/qt5/qt5tools/Config.in"
  source "package/qt5/qt5webchannel/Config.in"
+source "package/qt5/qt5webengine/Config.in"
  source "package/qt5/qt5websockets/Config.in"
  source "package/qt5/qt5x11extras/Config.in"
  source "package/qt5/qt5xmlpatterns/Config.in"
diff --git a/package/qt5/qt5webengine/Config.in 
b/package/qt5/qt5webengine/Config.in
new file mode 100644
index 0000000..492d640
--- /dev/null
+++ b/package/qt5/qt5webengine/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_QT5WEBENGINE
+       bool "qt5webengine"
+       depends on BR2_ARM_CPU_ARMV6 || BR2_ARM_CPU_ARMV7A || BR2_i386
+       depends on BR2_PACKAGE_QT5_GL_AVAILABLE
+       depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+       select BR2_PACKAGE_QT5BASE
+       select BR2_PACKAGE_QT5BASE_GUI
+       select BR2_PACKAGE_QT5BASE_FONTCONFIG
+       select BR2_PACKAGE_QT5BASE_DBUS
+       select BR2_PACKAGE_QT5BASE_ICU
+       select BR2_PACKAGE_QT5WEBCHANNEL
+       select BR2_PACKAGE_OPENSSL
+       select BR2_PACKAGE_LIBCAP
+       select BR2_PACKAGE_QT5DECLARATIVE
+       select BR2_PACKAGE_QT5DECLARATIVE_QUICK
+       help
+         Qt is a cross-platform application and UI framework for
+         developers using C++.
+
+         This package corresponds to the qt5webengine module.
+
+         http://qt.io
+
+comment "qt5webengine  needs an OpenGL-capable backend"
+       depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
+       depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git 
a/package/qt5/qt5webengine/pending-patches/0001-allow_all_linux_gxx.patch b/package/qt5/qt5webengine/pending-patches/0001-allow_all_linux_gxx.patch
new file mode 100644
index 0000000..62c5a34
--- /dev/null
+++ 
b/package/qt5/qt5webengine/pending-patches/0001-allow_all_linux_gxx.patch
@@ -0,0 +1,16 @@
+Index: qt5webengine-5.5.0/tools/qmake/mkspecs/features/functions.prf
+===================================================================
+--- qt5webengine-5.5.0.orig/tools/qmake/mkspecs/features/functions.prf
++++ qt5webengine-5.5.0/tools/qmake/mkspecs/features/functions.prf
+@@ -12,9 +12,9 @@ defineTest(isPlatformSupported) {
+     return(false)
+   }
+
+-  linux-g++*:!isGCCVersionSupported(): return(false)
++  linux*g++*:!isGCCVersionSupported(): return(false)
+   !isPythonVersionSupported(): return(false)
+-  linux-g++*|win32-msvc2013|macx-clang: return(true)
++  linux*g++*|win32-msvc2013|macx-clang: return(true)
+   boot2qt: return(true)
+
+   skipBuild("Qt WebEngine can currently only be built for Linux (GCC), 
Windows (MSVC 2013), OS X (XCode 5.1+) or Qt for Device Creation.")
diff --git 
a/package/qt5/qt5webengine/pending-patches/0002-switch_float_abi_for_arm_to_hard.patch 
b/package/qt5/qt5webengine/pending-patches/0002-switch_float_abi_for_arm_to_hard.patch
new file mode 100644
index 0000000..6210a13
--- /dev/null
+++ 
b/package/qt5/qt5webengine/pending-patches/0002-switch_float_abi_for_arm_to_hard.patch
@@ -0,0 +1,39 @@
+commit 779d02564f64654487db059f71c7e8257a851397
+Author: sbc <sbc@chromium.org>
+Date:   Sun May 17 16:52:45 2015 -0700
+
+    Switch default float-abi for ARM linux from softfp to hard
+
+    All the ARM linux builders already specify this, and
+    armhf is the now the default for both Ubuntu and Debian.
+
+    Followup cleanup cl for the bots:
+    https://codereview.chromium.org/1141643004/
+
+    BUG=308256
+
+    Review URL: https://codereview.chromium.org/1140503004
+
+    Cr-Original-Commit-Position: refs/heads/master@{#330316}
+    Cr-Mirrored-From: https://chromium.googlesource.com/chromium/src
+    Cr-Mirrored-Commit: ff8ec298fd273181647ec4d94c032343382dbe57
+
+diff --git a/common.gypi b/common.gypi
+index cd9f5b7..2f5ea2d 100644
+--- a/common.gypi
++++ b/common.gypi
+@@ -2311,9 +2311,12 @@
+           }, {
+             'arm_fpu%': 'vfpv3-d16',
+           }],
++          ['OS=="android"', {
++            'arm_float_abi%': 'softfp',
++          }, {
++            'arm_float_abi%': 'hard',
++          }],
+         ],
+-        # Change the default to hard once the armhf transition is 
complete.
+-        'arm_float_abi%': 'softfp',
+         'arm_thumb%': 1,
+       }],
+
diff --git a/package/qt5/qt5webengine/qt5webengine.hash 
b/package/qt5/qt5webengine/qt5webengine.hash
new file mode 100644
index 0000000..19cf63c
--- /dev/null
+++ b/package/qt5/qt5webengine/qt5webengine.hash
@@ -0,0 +1,2 @@
+# Hash from: 
http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtwebengine-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 8aa2b5ad6c9f98a781aa99303eab3a40bbe74d26a543eea6b4145f5f47c76a03 
qtwebengine-opensource-src-5.6.0.tar.xz
diff --git a/package/qt5/qt5webengine/qt5webengine.mk 
b/package/qt5/qt5webengine/qt5webengine.mk
new file mode 100644
index 0000000..fd775e6
--- /dev/null
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -0,0 +1,71 @@
+################################################################################
+#
+# qt5webengine
+HOST_PYTHON_DEPENDENCIES += host-bzip2
+else
+HOST_PYTHON_CONF_OPTS += --disable-bz2
+endif
+
  ifeq ($(BR2_PACKAGE_PYTHON_READLINE),y)
  PYTHON_DEPENDENCIES += readline
  endif
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index f673daa..28a0a1e 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -44,6 +44,7 @@ source "package/qt5/qt5serialport/Config.in"
  source "package/qt5/qt5svg/Config.in"
  source "package/qt5/qt5tools/Config.in"
  source "package/qt5/qt5webchannel/Config.in"
+source "package/qt5/qt5webengine/Config.in"
  source "package/qt5/qt5websockets/Config.in"
  source "package/qt5/qt5x11extras/Config.in"
  source "package/qt5/qt5xmlpatterns/Config.in"
diff --git a/package/qt5/qt5webengine/Config.in 
b/package/qt5/qt5webengine/Config.in
new file mode 100644
index 0000000..492d640
--- /dev/null
+++ b/package/qt5/qt5webengine/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_QT5WEBENGINE
+       bool "qt5webengine"
+       depends on BR2_ARM_CPU_ARMV6 || BR2_ARM_CPU_ARMV7A || BR2_i386
+       depends on BR2_PACKAGE_QT5_GL_AVAILABLE
+       depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+       select BR2_PACKAGE_QT5BASE
+       select BR2_PACKAGE_QT5BASE_GUI
+       select BR2_PACKAGE_QT5BASE_FONTCONFIG
+       select BR2_PACKAGE_QT5BASE_DBUS
+       select BR2_PACKAGE_QT5BASE_ICU
+       select BR2_PACKAGE_QT5WEBCHANNEL
+       select BR2_PACKAGE_OPENSSL
+       select BR2_PACKAGE_LIBCAP
+       select BR2_PACKAGE_QT5DECLARATIVE
+       select BR2_PACKAGE_QT5DECLARATIVE_QUICK
+       help
+         Qt is a cross-platform application and UI framework for
+         developers using C++.
+
+         This package corresponds to the qt5webengine module.
+
+         http://qt.io
+
+comment "qt5webengine  needs an OpenGL-capable backend"
+       depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
+       depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git 
a/package/qt5/qt5webengine/pending-patches/0001-allow_all_linux_gxx.patch b/package/qt5/qt5webengine/pending-patches/0001-allow_all_linux_gxx.patch
new file mode 100644
index 0000000..62c5a34
--- /dev/null
+++ 
b/package/qt5/qt5webengine/pending-patches/0001-allow_all_linux_gxx.patch
@@ -0,0 +1,16 @@
+Index: qt5webengine-5.5.0/tools/qmake/mkspecs/features/functions.prf
+===================================================================
+--- qt5webengine-5.5.0.orig/tools/qmake/mkspecs/features/functions.prf
++++ qt5webengine-5.5.0/tools/qmake/mkspecs/features/functions.prf
+@@ -12,9 +12,9 @@ defineTest(isPlatformSupported) {
+     return(false)
+   }
+
+-  linux-g++*:!isGCCVersionSupported(): return(false)
++  linux*g++*:!isGCCVersionSupported(): return(false)
+   !isPythonVersionSupported(): return(false)
+-  linux-g++*|win32-msvc2013|macx-clang: return(true)
++  linux*g++*|win32-msvc2013|macx-clang: return(true)
+   boot2qt: return(true)
+
+   skipBuild("Qt WebEngine can currently only be built for Linux (GCC), 
Windows (MSVC 2013), OS X (XCode 5.1+) or Qt for Device Creation.")
diff --git 
a/package/qt5/qt5webengine/pending-patches/0002-switch_float_abi_for_arm_to_hard.patch 
b/package/qt5/qt5webengine/pending-patches/0002-switch_float_abi_for_arm_to_hard.patch
new file mode 100644
index 0000000..6210a13
--- /dev/null
+++ 
b/package/qt5/qt5webengine/pending-patches/0002-switch_float_abi_for_arm_to_hard.patch
@@ -0,0 +1,39 @@
+commit 779d02564f64654487db059f71c7e8257a851397
+Author: sbc <sbc@chromium.org>
+Date:   Sun May 17 16:52:45 2015 -0700
+
+    Switch default float-abi for ARM linux from softfp to hard
+
+    All the ARM linux builders already specify this, and
+    armhf is the now the default for both Ubuntu and Debian.
+
+    Followup cleanup cl for the bots:
+    https://codereview.chromium.org/1141643004/
+
+    BUG=308256
+
+    Review URL: https://codereview.chromium.org/1140503004
+
+    Cr-Original-Commit-Position: refs/heads/master@{#330316}
+    Cr-Mirrored-From: https://chromium.googlesource.com/chromium/src
+    Cr-Mirrored-Commit: ff8ec298fd273181647ec4d94c032343382dbe57
+
+diff --git a/common.gypi b/common.gypi
+index cd9f5b7..2f5ea2d 100644
+--- a/common.gypi
++++ b/common.gypi
+@@ -2311,9 +2311,12 @@
+           }, {
+             'arm_fpu%': 'vfpv3-d16',
+           }],
++          ['OS=="android"', {
++            'arm_float_abi%': 'softfp',
++          }, {
++            'arm_float_abi%': 'hard',
++          }],
+         ],
+-        # Change the default to hard once the armhf transition is 
complete.
+-        'arm_float_abi%': 'softfp',
+         'arm_thumb%': 1,
+       }],
+
diff --git a/package/qt5/qt5webengine/qt5webengine.hash 
b/package/qt5/qt5webengine/qt5webengine.hash
new file mode 100644
index 0000000..19cf63c
--- /dev/null
+++ b/package/qt5/qt5webengine/qt5webengine.hash
@@ -0,0 +1,2 @@
+# Hash from: 
http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtwebengine-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 8aa2b5ad6c9f98a781aa99303eab3a40bbe74d26a543eea6b4145f5f47c76a03 
qtwebengine-opensource-src-5.6.0.tar.xz
diff --git a/package/qt5/qt5webengine/qt5webengine.mk 
b/package/qt5/qt5webengine/qt5webengine.mk
new file mode 100644
index 0000000..fd775e6
--- /dev/null
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -0,0 +1,71 @@
+################################################################################
+#
+# qt5webengine
+#
+################################################################################
+
+QT5WEBENGINE_VERSION = $(QT5_VERSION)
+QT5WEBENGINE_SITE = $(QT5_SITE)
+QT5WEBENGINE_SOURCE = 
qtwebengine-opensource-src-$(QT5WEBENGINE_VERSION).tar.xz
+QT5WEBENGINE_DEPENDENCIES = qt5base qt5declarative qt5webchannel libcap 
openssl host-gperf host-python
+QT5WEBENGINE_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5WEBENGINE_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
+# Source files contain references to LGPL_EXCEPTION.txt but it is not 
included
+# in the archive.
+QT5WEBENGINE_LICENSE_FILES = LICENSE.LGPLv21 LICENSE.LGPLv3 LICENSE.GPLv2
+else
+QT5WEBENGINE_LICENSE = Commercial license
+QT5WEBENGINE_REDISTRIBUTE = NO
+endif
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+QT5WEBENGINE_DEPENDENCIES += qt5declarative
+endif
+
+define QT5WEBENGINE_CONFIGURE_CMDS
+       (cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5WEBENGINE_BUILD_CMDS
+       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5WEBENGINE_INSTALL_STAGING_CMDS
+       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+       $(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
+define QT5WEBENGINE_INSTALL_TARGET_QMLS
+       cp -dpfr $(STAGING_DIR)/usr/qml/QtWebEngine $(TARGET_DIR)/usr/qml/
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5WEBENGINE_INSTALL_TARGET_EXAMPLES
+       cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/webengine* 
$(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
+ifneq ($(BR2_STATIC_LIBS),y)
+define QT5WEBENGINE_INSTALL_TARGET_LIBS
+       cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebEngine*.so.* 
$(TARGET_DIR)/usr/lib/
+endef
+endif
+
+define QT5WEBENGINE_INSTALL_TARGET_RESOURCES
+       cp -dpf $(STAGING_DIR)/usr/libexec/QtWebEngineProcess 
$(TARGET_DIR)/usr/libexec/
+       cp -dpfr $(STAGING_DIR)/usr/translations/qtwebengine_locales 
$(TARGET_DIR)/usr/translations/
+       cp -dpfr $(STAGING_DIR)/usr/resources $(TARGET_DIR)/usr/
+endef
+
+define QT5WEBENGINE_INSTALL_TARGET_CMDS
+       $(QT5WEBENGINE_INSTALL_TARGET_LIBS)
+       $(QT5WEBENGINE_INSTALL_TARGET_RESOURCES)
+       $(QT5WEBENGINE_INSTALL_TARGET_QMLS)
+       $(QT5WEBENGINE_INSTALL_TARGET_EXAMPLES)
+endef
+
+$(eval $(generic-package))
