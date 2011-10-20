From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Oct 2011 16:10:10 +0200
Subject: [Buildroot] [git commit] mpg123: fix module loading with libtool /
	!HAVE_DEVFILES
Message-ID: <20111020151344.15AA88EBC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6206828e3f39721fc0a567818d967236b1afc97c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mpg123 enables loadable modules support if libtool is detected, but
by default tries to load <module>.la, which we strip from the
rootfs unless HAVE_DEVFILES is enabled.

Fix it by directly loading .so files instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mpg123/mpg123.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
index c01c8ad..8ea05a8 100644
--- a/package/multimedia/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -57,4 +57,11 @@ endif
 
 MPG123_CONF_OPT += --with-audio=$(shell echo $(MPG123_AUDIO) | tr ' ' ,)
 
+ifeq ($(BR2_PACKAGE_LIBTOOL),y)
+MPG123_DEPENDENCIES += libtool
+# .la files gets stripped unless HAVE_DEVFILES is enabled, so directly
+# load .so files rather than .la
+MPG123_CONF_OPT += --with-modules --with-module-suffix=.so
+endif
+
 $(eval $(call AUTOTARGETS))
