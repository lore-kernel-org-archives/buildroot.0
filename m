From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jan 2013 08:48:08 +0100
Subject: [Buildroot] [git commit] directfb: fixup input/gfx drivers handling
	after 0e4d25ff0fc5
Message-ID: <20130121075019.729E99A556@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d4f2f892885a3e57a21312547328cf3f297f8024
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The input/gfx drivers handling got broken by the ':=' -> '=' conversion,
as we redefine the variables in terms of themselves, causing recursion.

Fix it by directly assigning the result to DIRECTFB_CONF_OPT instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/directfb.mk |   14 ++++++--------
 1 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 05a6c50..0df866f 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -63,13 +63,12 @@ DIRECTFB_GFX = \
 	$(if $(BR2_PACKAGE_DIRECTFB_EP9X),ep9x)
 
 ifeq ($(strip $(DIRECTFB_GFX)),)
-DIRECTFB_GFX = none
+DIRECTFB_CONF_OPT += --with-gfxdrivers=none
 else
-DIRECTFB_GFX = $(subst $(space),$(comma),$(strip $(DIRECTFB_GFX)))
+DIRECTFB_CONF_OPT += \
+	--with-gfxdrivers=$(subst $(space),$(comma),$(strip $(DIRECTFB_GFX)))
 endif
 
-DIRECTFB_CONF_OPT += --with-gfxdrivers=$(DIRECTFB_GFX)
-
 DIRECTFB_INPUT = \
 	$(if $(BR2_PACKAGE_DIRECTFB_LINUXINPUT),linuxinput) \
 	$(if $(BR2_PACKAGE_DIRECTFB_KEYBOARD),keyboard) \
@@ -82,13 +81,12 @@ DIRECTFB_DEPENDENCIES += tslib
 endif
 
 ifeq ($(strip $(DIRECTFB_INPUT)),)
-DIRECTFB_INPUT = none
+DIRECTFB_CONF_OPT += --with-inputdrivers=none
 else
-DIRECTFB_INPUT = $(subst $(space),$(comma),$(strip $(DIRECTFB_INPUT)))
+DIRECTFB_CONF_OPT += \
+	--with-inputdrivers=$(subst $(space),$(comma),$(strip $(DIRECTFB_INPUT)))
 endif
 
-DIRECTFB_CONF_OPT += --with-inputdrivers=$(DIRECTFB_INPUT)
-
 ifeq ($(BR2_PACKAGE_DIRECTFB_GIF),y)
 DIRECTFB_CONF_OPT += --enable-gif
 else
