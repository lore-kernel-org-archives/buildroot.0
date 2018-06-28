From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Thu, 28 Jun 2018 17:33:28 -0400
Subject: [Buildroot] [PATCH] qt5webengine: propagate parallel flag to ninja
Message-ID: <20180628213328.32550-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

WebEngine is a big project to build. It uses ninja which is a build
system that do everything in parallel[1].

	Builds are always run in parallel, based by default on the number of
	CPUs your system has. Underspecified build dependencies will result in
	incorrect builds.

QtWebEngine does not propagate the parallel flags from the running
instance of make to ninja. Thus, all the machine cores are used to
build this single project.

	make -j 10 -> ninja -j # all cores

This behavior disrupts powerful machines which are setup to build many
projects in parallel. Even worth, the build fails on machine where the
ratio number of CPU-cores / amount of RAM (including swap) is not
appropriate. g++ may have not enough of memory to build all those files
in parallel.

Unfortunatly, the target `run_ninja' is hardcoded in the Makefile
src/core/Makefile.run_gn; there is no way to propagate the flags using a
variable through the make command-line.

	run_ninja:
	        /home/gportay/src/buildroot/output-qt5.11/build/qt5webengine-5.11.1/src/3rdparty/ninja/ninja
-C /home/gportay/src/buildroot/output-qt5.11/build/qt5webengine-5.11.1/src/core/release QtWebEngineCore

Luckily, the Qt gn_run.pro[1] can hardcode ninja extra flags through the
variable NINJAFLAGS when the Makefile is generated (which is performed
during the build and not during configure step).

This commit sets the NINJAFLAGS using the variable BR2_JLEVEL to limits
the number of cores used by ninja.

Fixes:
	virtual memory exhausted: Cannot allocate memory

[1]: https://ninja-build.org/manual.html#_comparison_to_make
[2]: https://github.com/qt/qtwebengine/blob/v5.11.1/src/core/gn_run.pro#L49-L53

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/qt5/qt5webengine/qt5webengine.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index e527e6bc36..efdb6e49ec 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -48,6 +48,8 @@ define QT5WEBENGINE_PYTHON2_SYMLINK
 endef
 QT5WEBENGINE_PRE_CONFIGURE_HOOKS += QT5WEBENGINE_PYTHON2_SYMLINK
 
+QT5WEBENGINE_ENV += NINJAFLAGS="-j$(BR2_JLEVEL)"
+
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 define QT5WEBENGINE_CREATE_HOST_PKG_CONFIG
 	sed s%@HOST_DIR@%$(HOST_DIR)%g $(QT5WEBENGINE_PKGDIR)/host-pkg-config.in > $(@D)/host-bin/host-pkg-config
-- 
2.11.0
