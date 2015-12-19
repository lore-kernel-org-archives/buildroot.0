From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 16:14:31 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/vsxu: new package
In-Reply-To: <1446915053-13783-4-git-send-email-bernd.kuhls@t-online.de>
References: <1446915053-13783-1-git-send-email-bernd.kuhls@t-online.de>
 <1446915053-13783-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151219161431.7ef99690@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat,  7 Nov 2015 17:50:53 +0100, Bernd Kuhls wrote:
> This package needs cal3d source code which is included upstream as a git
> submodule, something not supported by the git download helper.
> To include cal3d I used a method described by Arnout:
> http://lists.busybox.net/pipermail/buildroot/2013-March/069971.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Here is what I've done to remove the submodule issue:

diff --git a/package/vsxu/vsxu.mk b/package/vsxu/vsxu.mk
index 7dcbf74..9553f81 100644
--- a/package/vsxu/vsxu.mk
+++ b/package/vsxu/vsxu.mk
@@ -7,18 +7,22 @@
 # instead of using master branch we use branch glfw3
 VSXU_VERSION = 4a34b08ec9e51605ca55d1a833f23e9601b2aa88
 VSXU_SITE = $(call github,vovoid,vsxu,$(VSXU_VERSION))
+VSXU_CAL3D_VERSION = 0f640189eec913973c64db3bc1c1685554cb7202
+VSXU_CAL3D_SOURCE = cal3d-$(VSXU_CAL3D_VERSION).tar.gz
+VSXU_EXTRA_DOWNLOADS = $(call github,vovoid,cal3d,$(VSXU_CAL3D_VERSION))/$(VSXU_CAL3D_SOURCE)
 VSXU_LICENSE = GPLv3
 VSXU_LICENSE_FILES = COPYING
 VSXU_INSTALL_STAGING = YES
-VSXU_DEPENDENCIES = cal3d freetype jpeg libgl libglew libglfw libglu \
+VSXU_DEPENDENCIES = freetype jpeg libgl libglew libglfw libglu \
        libpng zlib
 
 # cal3d is a git submodule
-define VSXU_LINK_CAL3D
-       rm -rf $(@D)/plugins/src/mesh.importers/cal3d/
-       ln -sf $(CAL3D_DIR) $(@D)/plugins/src/mesh.importers/cal3d
+define VSXU_EXTRACT_CAL3D
+       mkdir -p $(@D)/plugins/src/mesh.importers/cal3d
+        $(call suitable-extractor,$(VSXU_CAL3D_SOURCE)) $(DL_DIR)/$(VSXU_CAL3D_SOURCE) | \
+        $(TAR) --strip-components=1 -C $(@D)/plugins/src/mesh.importers/cal3d $(TAR_OPTIONS) -
 endef
-VSXU_POST_EXTRACT_HOOKS += VSXU_LINK_CAL3D
+VSXU_POST_EXTRACT_HOOKS += VSXU_EXTRACT_CAL3D
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 VSXU_DEPENDENCIES += alsa-lib

However, it fails to build on ARM because CMakeLists.txt hardcodes
-mtune=nocona:

[  2%] Building CXX object engine/CMakeFiles/vsxu_engine.dir/src/vsxfst/Common/String.cpp.o
arm-linux-g++.br_real: error: unrecognized argument in option ?-mtune=nocona?

Can you have a look into this and check that it builds on ARM ?

> diff --git a/package/vsxu/0001-disable-backtrace.patch b/package/vsxu/0001-disable-backtrace.patch
> new file mode 100644
> index 0000000..1c5e2a4
> --- /dev/null
> +++ b/package/vsxu/0001-disable-backtrace.patch
> @@ -0,0 +1,35 @@
> +uClibc has no support for execinfo.h/backtrace
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +--- a/engine/include/debug/vsx_backtrace.h	2015-05-23 13:21:46.000000000 +0200
> ++++ b/engine/include/debug/vsx_backtrace.h	2015-11-05 20:46:48.000000000 +0100
> +@@ -7,7 +7,7 @@
> + 
> + #include <stdio.h>
> + #include <errno.h>
> +-#include <execinfo.h>
> ++//#include <execinfo.h>

This is not a super great solution. What about instead:

include(CheckIncludeFiles)

check_include_files(execinfo.h HAVE_EXECINFO)

and then #ifdef HAVE_EXECINFO ... #endif in the source code ?

This way, the solution is clean, and you can submit the patch upstream :-)

> diff --git a/package/vsxu/0002-fix-includes.patch b/package/vsxu/0002-fix-includes.patch
> new file mode 100644
> index 0000000..5d94496
> --- /dev/null
> +++ b/package/vsxu/0002-fix-includes.patch
> @@ -0,0 +1,41 @@
> +Do not use host paths when cross-compiling.
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Looks good, please submit upstream. Since the package is on github, it
would be better if you used Git formatted patches.

Could you rework the patch to take into account those comments, and
send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
