From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Dec 2015 20:08:55 +0100
Subject: [Buildroot] [PATCH 2/2] package/jack2: add missing optional
	dependencies
In-Reply-To: <cover.1451329553.git.yann.morin.1998@free.fr>
References: <cover.1451329553.git.yann.morin.1998@free.fr>
Message-ID: <5f7632a3d6ed3e3ab0f324e31be21a0ea18245d4.1451329553.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

jack2 can optionally use opus, readline and eigen3, but those
dependencies were not expressed in out jack2 package, potentially
leading to unreproducible builds.

Add them.

Note that the optinal dependency on celt is not added, because we only
have celt-0.5.1 and jack2 requires celt >= 0.5.2 (even though it does
look for celt >= 0.5.0, it does not build with celt- < 0.5.2). Sinc ewe
can not upgrade celt (for now), we just never make jack2 depend on
celt051, and it won;t find it either, as it just searches for celt.pc
and we have celt051.pc.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/jack2/jack2.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index e4ad36e..5566b78 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -24,6 +24,23 @@ JACK2_DEPENDENCIES += dbus
 JACK2_CONF_OPTS += --dbus
 endif
 
+ifeq ($(BR2_PACKAGE_OPUS),y)
+JACK2_DEPENDENCIES += opus
+endif
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+JACK2_DEPENDENCIES += readline
+endif
+
+ifeq ($(BR2_PACKAGE_EIGEN),y)
+JACK2_DEPENDENCIES += eigen
+endif
+
+# Even though it advertises support for celt-0.5.x, jack2 really requires
+# celt >= 0.5.2 but we only have 0.5.1.3 and we can not upgrade, so we do
+# not add a dependency to celt051, which it can't find anyway as it looks
+# for celt.pc but we only have celt-51.pc.
+
 define JACK2_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS)	\
-- 
1.9.1
