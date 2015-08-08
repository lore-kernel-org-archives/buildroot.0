From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Aug 2015 10:56:13 -0000
Subject: [Buildroot] [git commit branch/next] gptfdisk: fix static linking
	issue with iconv
Message-ID: <20150808105601.2930781778@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6fe42d07fa6f5ab4ff175be5f8014734954c5b52
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
http://autobuild.buildroot.net/results/e89/e891a5bab72690a530781ad87d5804a53a209b5c/

Similar to libintl, some of the gptfdisk dependencies may link against
libiconv, so we need to do so as well when linking statically.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gptfdisk/gptfdisk.mk |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index c11b1d9..e84e3d3 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -21,13 +21,17 @@ ifeq ($(BR2_PACKAGE_GPTFDISK_CGDISK),y)
 GPTFDISK_DEPENDENCIES += ncurses
 endif
 
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE)$(BR2_STATIC_LIBS),yy)
-GPTFDISK_MAKE_OPTS += LDLIBS=-lintl
+ifeq ($(BR2_STATIC_LIBS),y)
+# gptfdisk dependencies may link against libintl/libiconv, so we need
+# to do so as well when linking statically
+GPTFDISK_LDLIBS = \
+	$(if $(BR2_PACKAGE_GETTEXT),-lintl) \
+	$(if $(BR2_PACKAGE_LIBICONV),-liconv)
 endif
 
 define GPTFDISK_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		$(GPTFDISK_MAKE_OPTS) $(GPTFDISK_TARGETS_y)
+		LDLIBS='$(GPTFDISK_LDLIBS)' $(GPTFDISK_TARGETS_y)
 endef
 
 define GPTFDISK_INSTALL_TARGET_CMDS
