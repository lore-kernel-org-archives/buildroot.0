From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 16:45:22 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/libsquish:
 re-enable for BR2_STATIC_LIBS configuration
Message-ID: <20190124154615.E5B028E5E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=896695e8ad5606ecd5e612de5c96028632e3cce1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Since the bump to version 1.15, libsquish can conditionally
build/install its shared library, which makes it possible to re-enable
this package for BR2_STATIC_LIBS configurations.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ae4b9e4afbbd92e2303507651982d477fd734e68)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsquish/Config.in    | 5 ++---
 package/libsquish/libsquish.mk | 4 ++++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/libsquish/Config.in b/package/libsquish/Config.in
index eabe6c54a8..e93e97e578 100644
--- a/package/libsquish/Config.in
+++ b/package/libsquish/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBSQUISH
 	bool "libsquish"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_STATIC_LIBS
 	help
 	  The libSquish library compresses images with the DXT standard
 	  (also known as S3TC). This standard is mainly used by OpenGL
@@ -9,5 +8,5 @@ config BR2_PACKAGE_LIBSQUISH
 
 	  http://sourceforge.net/projects/libsquish
 
-comment "libsquish needs a toolchain w/ C++, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
+comment "libsquish needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libsquish/libsquish.mk b/package/libsquish/libsquish.mk
index b1a80e5b60..75d2cbd16a 100644
--- a/package/libsquish/libsquish.mk
+++ b/package/libsquish/libsquish.mk
@@ -12,7 +12,11 @@ LIBSQUISH_STRIP_COMPONENTS = 0
 LIBSQUISH_LICENSE = MIT
 LIBSQUISH_LICENSE_FILES = LICENSE.txt
 
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBSQUISH_MAKE_ENV = USE_SHARED=0
+else
 LIBSQUISH_MAKE_ENV = USE_SHARED=1
+endif
 
 define LIBSQUISH_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(LIBSQUISH_MAKE_ENV) $(MAKE) -C $(@D)
