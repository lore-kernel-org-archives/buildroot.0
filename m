From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Jul 2021 14:32:05 +0200
Subject: [Buildroot] [PATCH 1/2] package/granite: link with -lintl if needed
Message-ID: <20210704123206.3278173-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Link with TARGET_NLS_LIBS if needed to avoid the following build
failure:

/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/xtensa-buildroot-linux-uclibc/9.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: lib/libgranite.so.5.4.0.p/meson-generated_Application.c.o: in function `_vala_array_free.constprop.0':
Application.c:(.text+0x340): undefined reference to `libintl_bindtextdomain'

Fixes:
 - http://autobuild.buildroot.org/results/d754cb776a1e11031cef4e66d45619aad5c4575d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/granite/granite.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/granite/granite.mk b/package/granite/granite.mk
index d5dd1fa1ff..037113f715 100644
--- a/package/granite/granite.mk
+++ b/package/granite/granite.mk
@@ -6,10 +6,17 @@
 
 GRANITE_VERSION = 5.4.0
 GRANITE_SITE = $(call github,elementary,granite,$(GRANITE_VERSION))
-GRANITE_DEPENDENCIES = host-pkgconf host-vala libgee libglib2 libgtk3
+GRANITE_DEPENDENCIES = \
+	host-pkgconf \
+	host-vala \
+	libgee \
+	libglib2 \
+	libgtk3 \
+	$(TARGET_NLS_DEPENDENCIES)
 GRANITE_INSTALL_STAGING = YES
 GRANITE_LICENSE = LGPL-3.0+
 GRANITE_LICENSE_FILES = COPYING
+GRANITE_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 GRANITE_CONF_OPTS += -Dintrospection=true
-- 
2.30.2
