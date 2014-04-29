From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Apr 2014 23:09:00 +0200
Subject: [Buildroot] [git commit] imlib2: uses dlopen(),
	not available in static cases
Message-ID: <20140429223019.A7FC09CA6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=056d25098fb73505a8c173e52de3fafa070bab44
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to the imlib2 people, if you don't support dlopen(), you
have a "crap box":

image.h:16:4: warning: #warning "your crap box doesn't define RTLD_LOCAL !?"

So, let's disable imlib2 when doing static linking.

Fixes:

  http://autobuild.buildroot.net/results/b5e/b5ee859409cd626b769e8a159026e60ec6f29180/

[Peter: fix imlib2 comment as pointed out by Thomas]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/directfb/Config.in |    4 ++++
 package/giblib/Config.in   |    4 ++++
 package/imlib2/Config.in   |    4 ++++
 3 files changed, 12 insertions(+), 0 deletions(-)

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
index 16a94d6..757f100 100644
--- a/package/imlib2/Config.in
+++ b/package/imlib2/Config.in
@@ -1,6 +1,10 @@
+comment "imlib2 needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
+
 config BR2_PACKAGE_IMLIB2
 	bool "imlib2"
 	select BR2_PACKAGE_FREETYPE
+	depends on !BR2_PREFER_STATIC_LIB # dlopen()
 	help
 	  Imlib 2 is the successor to Imlib. This library provides
 	  routines to load, save and render images in various formats.
