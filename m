From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Apr 2014 21:00:16 +0200
Subject: [Buildroot] [PATCH] imlib2: uses dlopen(),
	not available in static cases
Message-ID: <1398798016-14915-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to the imlib2 people, if you don't support dlopen(), you
have a "crap box":

image.h:16:4: warning: #warning "your crap box doesn't define RTLD_LOCAL !?"

So, let's disable imlib2 when doing static linking.

Fixes:

  http://autobuild.buildroot.net/results/b5e/b5ee859409cd626b769e8a159026e60ec6f29180/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/directfb/Config.in | 4 ++++
 package/giblib/Config.in   | 4 ++++
 package/imlib2/Config.in   | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 59e2580..e3c93a1 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -110,6 +110,10 @@ config BR2_PACKAGE_DIRECTFB_GIF
 config BR2_PACKAGE_DIRECTFB_IMLIB2
 	bool "enable IMLIB2 support"
 	select BR2_PACKAGE_IMLIB2
+	depends on !BR2_PREFER_STATIC_LIB
+
+comment "imlib2 support needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
 
 config BR2_PACKAGE_DIRECTFB_JPEG
 	bool "enable JPEG support"
diff --git a/package/giblib/Config.in b/package/giblib/Config.in
index 7eb3da8..7b8f038 100644
--- a/package/giblib/Config.in
+++ b/package/giblib/Config.in
@@ -1,9 +1,13 @@
 config BR2_PACKAGE_GIBLIB
 	bool "giblib"
 	depends on BR2_PACKAGE_XORG7
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_PACKAGE_IMLIB2
 	select BR2_PACKAGE_IMLIB2_X
 	help
 	  Giblib is a simple library which wraps imlib2.
 
 	  http://linuxbrit.co.uk/giblib/
+
+comment "giblib support needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
diff --git a/package/imlib2/Config.in b/package/imlib2/Config.in
index 16a94d6..1fef7e3 100644
--- a/package/imlib2/Config.in
+++ b/package/imlib2/Config.in
@@ -1,6 +1,10 @@
+comment "imlib2 needs toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
+
 config BR2_PACKAGE_IMLIB2
 	bool "imlib2"
 	select BR2_PACKAGE_FREETYPE
+	depends on !BR2_PREFER_STATIC_LIB # dlopen()
 	help
 	  Imlib 2 is the successor to Imlib. This library provides
 	  routines to load, save and render images in various formats.
-- 
1.9.2
