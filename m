From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Nov 2014 11:25:18 +0100
Subject: [Buildroot] [git commit] libv4l: fix utilities build with older
	glibc versions
Message-ID: <20141109102534.84219B32CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=44f89c38dc72e042d8190f4ca15b26abdb7e69b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/9af/9af37fbf344b63b60e59ccac21e010cdf0ea219e/
http://autobuild.buildroot.net/results/bbd/bbd34d5378354e9db7822eaae8d3c4a75a67ac23/
http://autobuild.buildroot.net/results/ebb/ebbaa70e1a277162ba53c7bde8335ee998486703/
http://autobuild.buildroot.net/results/2c1/2c11f4dbb7cfadcfc6fbc267679b2b4eab867221/

And many more.

The utilities use clock_gettime(), which was provided in librt in glibc <
2.17, so ensure we link against -lrt.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libv4l/libv4l.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 732fad5..63dd5d2 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -17,7 +17,7 @@ LIBV4L_LICENSE_FILES = COPYING COPYING.libv4l lib/libv4l1/libv4l1-kernelcode-lic
 
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 LIBV4L_DEPENDENCIES += argp-standalone
-LIBV4L_CONF_ENV += LIBS="-largp"
+LIBV4L_LIBS += -largp
 endif
 
 LIBV4L_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
@@ -38,8 +38,12 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
 LIBV4L_CONF_OPTS += --enable-v4l-utils
+# clock_gettime is used, which is provided by librt for glibc < 2.17
+LIBV4L_LIBS += -lrt
 else
 LIBV4L_CONF_OPTS += --disable-v4l-utils
 endif
 
+LIBV4L_CONF_ENV += LIBS="$(LIBV4L_LIBS)"
+
 $(eval $(autotools-package))
