From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 27 Feb 2014 00:21:16 +0100
Subject: [Buildroot] [PATCH] vlc: fix shared library building
Message-ID: <1393456876-8525-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes e.g.
http://autobuild.buildroot.net/results/9c7/9c7a97882d446a42cabcb07e4af7e6825192e70b

VLC cannot build static and shared libraries at the same time.

Also, live555 only has a static library, and VLC tries to link this into
a shared library. Therefore, disable the live555 plugin unless static
linking is selected. It would be better to build live555 as a shared
library, but that's for another patch.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I obviously haven't tested this very intensively, but it makes at least
one build work :-)

It would be nice if the frequency of vlc builds could be increased, to
get a better idea of remaining issues.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/vlc/vlc.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 0e76e11..923439d 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -33,6 +33,11 @@ VLC_CONF_OPT += \
 	--disable-mtp \
 	--without-opencv
 
+# Building static and shared doesn't work, so force static off.
+ifeq ($(BR2_PREFER_STATIC_LIB),)
+VLC_CONF_OPT += --disable-static
+endif
+
 # Set powerpc altivec appropriately
 ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
 VCL_CONF_OPT += --enable-altivec
@@ -209,7 +214,9 @@ else
 VLC_CONF_OPT += --disable-libxml2
 endif
 
-ifeq ($(BR2_PACKAGE_LIVE555),y)
+# live555 installs a static library only, and vlc tries to link it into a
+# shared library - which doesn't work. So only enable live555 if static.
+ifeq ($(BR2_PACKAGE_LIVE555)$(BR2_PREFER_STATIC_LIB),yy)
 VLC_CONF_OPT += --enable-live555
 VLC_DEPENDENCIES += live555
 VLC_CONF_ENV += \
-- 
1.9.0
