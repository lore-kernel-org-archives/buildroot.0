From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Nov 2016 23:28:58 +0100
Subject: [Buildroot] [PATCH] xapp_xload: fix musl build
Message-ID: <20161120222858.10102-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xapp_xload tries to include protocols/rwhod.h, which isn't available on
musl. Fortunately, the package also has stub code that can be enabled
with -DRLOADSTUB (this is done e.g. on Cygwin).

This should probably be detected in configure, but that's a lot more
work.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xapp_xload/xapp_xload.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/x11r7/xapp_xload/xapp_xload.mk b/package/x11r7/xapp_xload/xapp_xload.mk
index 1db0db5..364d247 100644
--- a/package/x11r7/xapp_xload/xapp_xload.mk
+++ b/package/x11r7/xapp_xload/xapp_xload.mk
@@ -11,4 +11,9 @@ XAPP_XLOAD_LICENSE = MIT
 XAPP_XLOAD_LICENSE_FILES = COPYING
 XAPP_XLOAD_DEPENDENCIES = xlib_libXaw
 
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+# musl doesn't have rwhod.h, but xload can replace it with stubs
+XAPP_XLOAD_CONF_OPTS += CFLAGS="$(TARGET_CFLAGS) -DRLOADSTUB"
+endif
+
 $(eval $(autotools-package))
-- 
2.10.2
