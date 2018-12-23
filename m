From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon, 24 Dec 2018 00:37:42 +0200
Subject: [Buildroot] [PATCH 2/2] package: Use $(PKG)_AUTOGEN instead of
 calling autogen.sh manually
In-Reply-To: <20181223223742.23710-1-vadim4j@gmail.com>
References: <20181223223742.23710-1-vadim4j@gmail.com>
Message-ID: <20181223223742.23710-3-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use $(PKG)_AUTOGEN variable whenever it is possible instead of
custom pre-configure hooks which calls autogen.sh manually.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 package/faifa/faifa.mk | 10 +---------
 package/gpm/gpm.mk     |  8 +-------
 package/sdl/sdl.mk     | 10 +---------
 3 files changed, 3 insertions(+), 25 deletions(-)

diff --git a/package/faifa/faifa.mk b/package/faifa/faifa.mk
index af7a1741ff..0af87c841f 100644
--- a/package/faifa/faifa.mk
+++ b/package/faifa/faifa.mk
@@ -10,18 +10,10 @@ FAIFA_INSTALL_STAGING = YES
 FAIFA_DEPENDENCIES = libpcap host-autoconf
 FAIFA_LICENSE = BSD-3-Clause
 FAIFA_LICENSE_FILES = COPYING
+FAIFA_AUTOGEN = YES
 
 FAIFA_MAKE_OPTS += GIT_REV=$(FAIFA_VERSION)
 
-# This package uses autoconf, but not automake, so we need to call
-# their special autogen.sh script, and have custom target and staging
-# installation commands.
-
-define FAIFA_RUN_AUTOGEN
-	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
-endef
-FAIFA_PRE_CONFIGURE_HOOKS += FAIFA_RUN_AUTOGEN
-
 define FAIFA_INSTALL_TARGET_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
 		PREFIX=/usr \
diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
index f59d059a41..ebe210b908 100644
--- a/package/gpm/gpm.mk
+++ b/package/gpm/gpm.mk
@@ -11,6 +11,7 @@ GPM_LICENSE = GPL-2.0+
 GPM_LICENSE_FILES = COPYING
 GPM_INSTALL_STAGING = YES
 GPM_DEPENDENCIES = host-bison
+GPM_AUTOGEN = YES
 
 # if not already installed in staging dir, gpm Makefile may fail to find some
 # of the headers needed to generate build dependencies, the first time it is
@@ -34,13 +35,6 @@ endif
 # http://invisible-island.net/ncurses/ncurses.faq.html#using_gpm_lib
 GPM_CONF_OPTS = --without-curses
 
-# configure is missing but gpm seems not compatible with our autoreconf
-# mechanism so we have to do it manually instead of using GPM_AUTORECONF = YES
-define GPM_RUN_AUTOGEN
-	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
-endef
-GPM_PRE_CONFIGURE_HOOKS += GPM_RUN_AUTOGEN
-
 GPM_DEPENDENCIES += host-automake host-autoconf host-libtool
 
 # gpm tries to build/install .info doc even if makeinfo isn't installed on the
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 0a6a7de139..a0fa69d6df 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -10,15 +10,7 @@ SDL_SITE = http://www.libsdl.org/release
 SDL_LICENSE = LGPL-2.1+
 SDL_LICENSE_FILES = COPYING
 SDL_INSTALL_STAGING = YES
-
-# we're patching configure.in, but package cannot autoreconf with our version of
-# autotools, so we have to do it manually instead of setting SDL_AUTORECONF = YES
-define SDL_RUN_AUTOGEN
-	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
-endef
-
-SDL_PRE_CONFIGURE_HOOKS += SDL_RUN_AUTOGEN
-HOST_SDL_PRE_CONFIGURE_HOOKS += SDL_RUN_AUTOGEN
+SDL_AUTOGEN = YES
 
 SDL_DEPENDENCIES += host-automake host-autoconf host-libtool
 HOST_SDL_DEPENDENCIES += host-automake host-autoconf host-libtool
-- 
2.14.1
