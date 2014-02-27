From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2014 15:31:27 +0100
Subject: [Buildroot] [git commit] vlc: fix shared library building
Message-ID: <20140227144133.788409A88B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=929f371cb078f96f64391af10c066bd45aa85bb9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes e.g.
http://autobuild.buildroot.net/results/9c7/9c7a97882d446a42cabcb07e4af7e6825192e70b

VLC cannot build static and shared libraries at the same time.

Also, live555 only has a static library, and VLC tries to link this into
a shared library. Therefore, disable the live555 plugin unless static
linking is selected. It would be better to build live555 as a shared
library, but that's for another patch.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.mk |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 9bcedd1..94010c8 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -33,6 +33,11 @@ VLC_CONF_OPT += \
 	--without-mtp \
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
 VLC_CONF_OPT += --without-libxml2
 endif
 
-ifeq ($(BR2_PACKAGE_LIVE555),y)
+# live555 installs a static library only, and vlc tries to link it into a
+# shared library - which doesn't work. So only enable live555 if static.
+ifeq ($(BR2_PACKAGE_LIVE555)$(BR2_PREFER_STATIC_LIB),yy)
 VLC_CONF_OPT += --enable-live555
 VLC_DEPENDENCIES += live555
 VLC_CONF_ENV += \
