From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jan 2014 22:05:45 +0100
Subject: [Buildroot] [git commit] libcdio: make C++ support optional
Message-ID: <20140127210827.9EF868C5BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9eefa845a2617333318a59d767fa61363a39e4cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

C++ support is only needed for the example programs (that we don't build)
and C++ bindings.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcdio/Config.in  |    4 ----
 package/libcdio/libcdio.mk |    4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libcdio/Config.in b/package/libcdio/Config.in
index d2d61e7..555eb29 100644
--- a/package/libcdio/Config.in
+++ b/package/libcdio/Config.in
@@ -1,11 +1,7 @@
 config BR2_PACKAGE_LIBCDIO
 	bool "libcdio"
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  The GNU Compact Disc Input and Control library.
 
 	  http://www.gnu.org/software/libcdio/
-
-comment "libcdio needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
index b114809..b9aec9e 100644
--- a/package/libcdio/libcdio.mk
+++ b/package/libcdio/libcdio.mk
@@ -15,6 +15,10 @@ ifeq ($(BR2_ENABLE_LOCALE),)
 LIBCDIO_DEPENDENCIES += libiconv
 endif
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),)
+LIBCDIO_CONF_OPT += --disable-cxx
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 LIBCDIO_DEPENDENCIES += ncurses
 else
