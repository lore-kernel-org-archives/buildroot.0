From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Oct 2014 01:17:14 +0200
Subject: [Buildroot] [git commit] libv4l: needs iconv
Message-ID: <20141024232206.DDD13B0BC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a33ae93ab6fefadc97a350dcd6868b209718e117
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 http://autobuild.buildroot.net/results/901/901ed0092ee0411ba77a6f1f46d161621569c7f7/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libv4l/Config.in |    1 +
 package/libv4l/libv4l.mk |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index 866f8c6..04f0c6a 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBV4L
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  libv4l is a collection of libraries which adds a thin abstraction
 	  layer on top of video4linux2 devices. libv4l consists of 3 different
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 0512e49..732fad5 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -20,6 +20,8 @@ LIBV4L_DEPENDENCIES += argp-standalone
 LIBV4L_CONF_ENV += LIBS="-largp"
 endif
 
+LIBV4L_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+
 ifeq ($(BR2_PACKAGE_JPEG),y)
 LIBV4L_DEPENDENCIES += jpeg
 LIBV4L_CONF_OPTS += --with-jpeg
