From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Sat, 21 Nov 2015 12:09:36 +0100
Subject: [Buildroot] [PATCH] apitrace: do not use bundled version of libpng
Message-ID: <1448104176-19721-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In case libpng is not found apitrace its own version of libpng. However
current bundled version (1.1.16) is impacted by
https://sourceforge.net/p/libpng/bugs/230/. We simplify problem by
forcing use of external libpng.

Notice this patch also impact use of zlib. Apitrace also use its own
version of zlib if none was found. Since we select libpng, external
zlib is also selected.

Fix:
  http://autobuild.buildroot.net/results/ac790191127cf4d8b19d0c7c640981264772f503/

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/apitrace/Config.in   | 1 +
 package/apitrace/apitrace.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/apitrace/Config.in b/package/apitrace/Config.in
index 4fe82aa..a977712 100644
--- a/package/apitrace/Config.in
+++ b/package/apitrace/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_APITRACE
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_LIBPNG
 	help
 	  Trace and replay OpenGL and OpenGL ES APIs calls to/from a
 	  file. You may install apitrace GUI from your distribution to
diff --git a/package/apitrace/apitrace.mk b/package/apitrace/apitrace.mk
index 28a40e4..fbd957c 100644
--- a/package/apitrace/apitrace.mk
+++ b/package/apitrace/apitrace.mk
@@ -9,7 +9,7 @@ APITRACE_SITE = $(call github,apitrace,apitrace,$(APITRACE_VERSION))
 APITRACE_LICENSE = MIT
 APITRACE_LICENSE_FILES = LICENSE
 
-APITRACE_DEPENDENCIES = xlib_libX11 host-python
+APITRACE_DEPENDENCIES = xlib_libX11 host-python libpng
 
 # Gui was never tested, so we prefer to explicitly disable it
 APITRACE_CONF_OPTS += -DENABLE_GUI=false
-- 
2.6.2
