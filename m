From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 9 Mar 2013 22:27:02 +0100
Subject: [Buildroot] [git commit] jpeg: convert to a real package
Message-ID: <20130309212740.3D8AE9AF4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30c695ef01340855cb74a35bb465fb7408c0fb7e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

jpeg is a virtual package, but since it is listed in the dependencies
of other packages, it should obey to all the normal make rules for
packages. Notably, the jpeg-show-depends target is mandatory for the
graph-depends script to work.

Instead to implement such a make target manually, make jpeg a normal
generic-package, except that it doesn't have any source.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jpeg/jpeg.mk |   22 ++++++++++++++++++----
 1 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index 3caacaa..962908d 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -1,10 +1,24 @@
 #############################################################
 #
-# jpeg
+# Virtual jpeg package
 #
 #############################################################
 
-jpeg: $(if $(BR2_PACKAGE_JPEG_TURBO),jpeg-turbo,libjpeg)
+JPEG_SOURCE =
 
-host-jpeg: host-libjpeg
-host-jpeg-source: host-libjpeg-source
+ifeq ($(BR2_PACKAGE_JPEG_TURBO),y)
+JPEG_DEPENDENCIES += jpeg-turbo
+endif
+
+ifeq ($(BR2_PACKAGE_LIBJPEG),y)
+JPEG_DEPENDENCIES += libjpeg
+endif
+
+ifeq ($(JPEG_DEPENDENCIES),)
+define JPEG_CONFIGURE_CMDS
+	echo "No JPEG implementation defined. Configuration error"
+	exit 1
+endef
+endif
+
+$(eval $(generic-package))
