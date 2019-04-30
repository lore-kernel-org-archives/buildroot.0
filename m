From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Apr 2019 20:06:26 +0200
Subject: [Buildroot] [git commit] package/liburiparser: bump to version 0.9.3
Message-ID: <20190430180852.79E4983D75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=240aa29d677935d84cb21168bdef153bb1c962a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 0.9.3 is a fix-up to 0.9.2. Combined, releases 0.9.2 and 0.9.3
feature:

- Migration from GNU autotools to CMake
- Link fixes for use of uriparser from C++ code
- Library visibility fixes / introduction of -fvisibility=hidden

For more details please check the change log at

   https://github.com/uriparser/uriparser/blob/uriparser-0.9.3/ChangeLog

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liburiparser/liburiparser.hash |  2 +-
 package/liburiparser/liburiparser.mk   | 14 ++++++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
index bbdb37329d..4216f1f17f 100644
--- a/package/liburiparser/liburiparser.hash
+++ b/package/liburiparser/liburiparser.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  75248f3de3b7b13c8c9735ff7b86ebe72cbb8ad043291517d7d53488e0893abe  uriparser-0.9.1.tar.bz2
+sha256  28af4adb05e811192ab5f04566bebc5ebf1c30d9ec19138f944963d52419e28f  uriparser-0.9.3.tar.bz2
 sha256  ee90029e62d11f48faa59360d15c3ad8e7c094c74cc25b055716d92340da561f  COPYING
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index 529f70190c..4a68814e00 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -4,16 +4,22 @@
 #
 ################################################################################
 
-LIBURIPARSER_VERSION = 0.9.1
+LIBURIPARSER_VERSION = 0.9.3
 LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.bz2
 LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause
 LIBURIPARSER_LICENSE_FILES = COPYING
 LIBURIPARSER_INSTALL_STAGING = YES
-LIBURIPARSER_CONF_OPTS = --disable-test
+LIBURIPARSER_CONF_OPTS = -DURIPARSER_BUILD_DOCS=OFF -DURIPARSER_BUILD_TESTS=OFF
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+LIBURIPARSER_CONF_OPTS += -DBUILD_SHARED_LIBS=ON
+else
+LIBURIPARSER_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
+endif
 
 ifeq ($(BR2_USE_WCHAR),)
-LIBURIPARSER_CONF_OPTS += --disable-wchar_t
+LIBURIPARSER_CONF_OPTS += -DURIPARSER_BUILD_WCHAR_T=OFF
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
