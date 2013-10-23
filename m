From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 23 Oct 2013 22:26:11 +0200
Subject: [Buildroot] [PATCH 1/2] docker: change into generic-package
Message-ID: <1382559972-24299-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

docker is using autotools-package while it is in fact just a plain make
package.

Remove docker-1.5-skip-configure.patch which was just a hack to avoid
calling the non-existent configure script.

Remove docker-1.5-pkgconfig.patch which is not needed when PATH is set
appropriately.

Add a XLIBPATH option to the command line to avoid linking with
/usr/X11R6/lib.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I discovered this while testing Fabio's parallel make patches: the
changed dependency on .stamp_configured made the build fail.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/docker/docker-1.5-pkgconfig.patch      | 23 -----------------------
 package/docker/docker-1.5-skip-configure.patch |  4 ----
 package/docker/docker.mk                       | 19 +++++++++----------
 3 files changed, 9 insertions(+), 37 deletions(-)
 delete mode 100644 package/docker/docker-1.5-pkgconfig.patch
 delete mode 100644 package/docker/docker-1.5-skip-configure.patch

diff --git a/package/docker/docker-1.5-pkgconfig.patch b/package/docker/docker-1.5-pkgconfig.patch
deleted file mode 100644
index 1b56b1b..0000000
--- a/package/docker/docker-1.5-pkgconfig.patch
+++ /dev/null
@@ -1,23 +0,0 @@
---- a/Makefile	2002-11-20 05:20:49.000000000 -0500
-+++ b/Makefile	2008-04-28 12:36:23.000000000 -0400
-@@ -20,7 +20,6 @@ CFLAGS=-pedantic -Wall -W -O
- 
- PACKAGE=docker
- VERSION=1.5
--
- target=docker
- sources=docker.c kde.c icons.c xproperty.c net.c
- headers=docker.h kde.h icons.h xproperty.h net.h version.h
-@@ -31,10 +30,10 @@ all: $(target) $(sources) $(headers)
- 
- $(target): $(sources:.c=.o)
- 	$(CC) $(CFLAGS) -L$(XLIBPATH) -lX11 \
--		`pkg-config --libs glib-2.0` $^ -o $@
-+		`$(PKG_CONFIG) --libs glib-2.0` $^ -o $@
- 
- %.o: %.c
--	$(CC) -c $(CFLAGS) `pkg-config --cflags glib-2.0` $<
-+	$(CC) -c $(CFLAGS) `$(PKG_CONFIG) --cflags glib-2.0` $<
- 
- version.h: version.h.in Makefile
- 	sed -e "s/@VERSION@/$(VERSION)/" version.h.in > $@
diff --git a/package/docker/docker-1.5-skip-configure.patch b/package/docker/docker-1.5-skip-configure.patch
deleted file mode 100644
index 441f9b0..0000000
--- a/package/docker/docker-1.5-skip-configure.patch
+++ /dev/null
@@ -1,4 +0,0 @@
---- a/.stamp_configured	2008-03-19 03:34:24.425005162 -0400
-+++ b/.stamp_configured	2008-03-19 14:25:33.000000000 -0400
-@@ -0,0 +1 @@
-+ 
diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index 82cabec..168ee94 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -7,15 +7,14 @@
 DOCKER_VERSION = 1.5
 DOCKER_SITE = http://icculus.org/openbox/2/docker
 
-DOCKER_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_LD)" \
-					CFLAGS="-I$(STAGING_DIR)/usr/include \
-						-I$(STAGING_DIR)/usr/include/glib-2.0 \
-						-I$(STAGING_DIR)/usr/lib/glib-2.0/include" \
-					PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-					LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib"
+define DOCKER_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		XLIBPATH=$(STAGING_DIR)/usr/lib
+endef
 
-DOCKER_INSTALL_TARGET_OPT = PREFIX=$(TARGET_DIR)/usr install
+define DOCKER_INSTALL_TARGET_CMD
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		XLIBPATH=$(STAGING_DIR)/usr/lib PREFIX=$(TARGET_DIR)/usr install
+endef
 
-DOCKER_DEPENDENCIES = host-pkgconf libglib2 xlib_libX11
-
-$(eval $(autotools-package))
+$(eval $(generic-package))
-- 
1.8.4.rc3
