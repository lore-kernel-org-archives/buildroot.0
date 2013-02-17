From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 17 Feb 2013 14:50:22 +0100
Subject: [Buildroot] [PATCH] xlib_libpthread-stubs: needs -pthread when
	linking statically
Message-ID: <1361109023-21403-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Fixes http://autobuild.buildroot.net/results/392512cb348123d76962df02e38675a80eae41b1

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
My gcc manual only documents the -pthread option for some architectures,
but it seems to work for x86, sh and arm as well.
---
 package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk b/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
index 909253c..40d9a0b 100644
--- a/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
+++ b/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
@@ -9,6 +9,10 @@ XLIB_LIBPTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist/
 
 XLIB_LIBPTHREAD_STUBS_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+XLIB_LIBPTHREAD_STUBS_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -pthread"
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
-- 
1.7.10.4
