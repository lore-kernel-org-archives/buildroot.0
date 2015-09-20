From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sun, 20 Sep 2015 09:47:54 -0500
Subject: [Buildroot] [1/1] make: disable guile support when static linking
	enabled
Message-ID: <1442760474-29793-1-git-send-email-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building in a static only configuration with guile package
enabled, the following error happens:

 gc_pthread_redirects.h:37:22: fatal error: dlfcn.h: No such file or
 directory
   #   include <dlfcn.h>

The file gc_pthread_redirects.h comes from bdwgc, which gets built
before make in the autobuild test case you're pointing to. This header
file is known to incorrectly include <dlfcn.h>, unless GC_NO_DLOPEN is
specified.

IF GC_NO_DLOPEN is defined, another issue arises due to libguile and
libintl both defining locale_charset.

Thus disable guile support in make when BR2_STATIC_LIBS is set.

Fixes:
  http://autobuild.buildroot.net/results/814/8143ae0afac139845e5016058d85c800dc8527ad

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
---
 package/make/make.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/make/make.mk b/package/make/make.mk
index ebfa2f0..d12676e 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -16,7 +16,8 @@ ifeq ($(BR2_STATIC_LIBS),y)
 MAKE_CONF_OPTS += --disable-load
 endif
 
-ifeq ($(BR2_PACKAGE_GUILE),y)
+# Only enable guile support when dynamic libraries are used.
+ifeq ($(BR2_PACKAGE_GUILE)$(BR2_STATIC_LIBS),y)
 MAKE_DEPENDENCIES += guile
 MAKE_CONF_OPTS += --with-guile
 else
-- 
1.9.1
