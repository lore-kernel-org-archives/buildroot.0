From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Fri,  4 Apr 2014 20:04:38 +0400
Subject: [Buildroot] [PATCH] linphone: arc: Undefine __arc__ when building
	for ARC processors
Message-ID: <1396627478-13712-1-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is similar to 821a6d63. Libexosip2 defines symbol __arc__, which
gets in contradiction with same symbol defined by the GCC for the Synopsys
DesignWare ARC cores. Previous patch undefined __arc__ for libosip2 and
libexosip2, however linphone includes headers from libexosip2, which causes
build failure unless same patch is applied to it.

This patch fixes
http://autobuild.buildroot.net/results/0d2e19d40d6d0df4048e6ebae5f77022f89ca7cb/

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 package/linphone/linphone.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index 91830ae..5e960a0 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -17,6 +17,11 @@ LINPHONE_DEPENDENCIES = host-pkgconf ortp mediastreamer libeXosip2 speex
 LINPHONE_LICENSE = GPLv2+
 LINPHONE_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_arc),y)
+# toolchain __arc__ define conflicts with libosip2 source
+LINPHONE_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -U__arc__"
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_XORG7),yy)
 LINPHONE_CONF_OPT += --enable-gtk_ui
 LINPHONE_DEPENDENCIES += libgtk2
-- 
1.8.4.1
