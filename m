From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Wed, 16 Sep 2015 19:38:12 -0500
Subject: [Buildroot] [PATCH] make: requires dynamic libraries
Message-ID: <1442450292-13794-1-git-send-email-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While attempting to build make in a static library only configuration
the following error will be shown:

 gc_pthread_redirects.h:37:22: fatal error: dlfcn.h: No such file or
 directory
  #   include <dlfcn.h>

Fix this by depending make on !BR2_STATIC_LIBS.

Fixes:
  http://autobuild.buildroot.net/results/814/8143ae0afac139845e5016058d85c800dc8527ad

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
---
 package/make/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/make/Config.in b/package/make/Config.in
index f576b7b..11adbab 100644
--- a/package/make/Config.in
+++ b/package/make/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MAKE
 	bool "make"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # dlopen()
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  A tool which controls the generation of executables and other
@@ -11,3 +12,6 @@ config BR2_PACKAGE_MAKE
 	  useful to run the uClibc test suite on the target.
 
 	  http://www.gnu.org/software/make/
+
+comment "make needs a toolchain w/ dynamic libraries"
+	depends on BR2_STATIC_LIBS
-- 
1.9.1
