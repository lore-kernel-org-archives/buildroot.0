From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Wed, 14 Apr 2010 15:31:02 +0300
Subject: [Buildroot] [PATCH 2/2] libdrm: enable/disable features according
	to driver	selection
In-Reply-To: <20100414122805.17586.64124.stgit@localhost.localdomain>
References: <20100414122805.17586.64124.stgit@localhost.localdomain>
Message-ID: <20100414123102.17586.38501.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also cleanup autotools symbols and add libatomic_ops dependency
for Intel part.

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---

 package/libdrm/Config.in |    1 +
 package/libdrm/libdrm.mk |   13 +++++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 445eb72..ab8c2d8 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XPROTO_DRI2PROTO
 	select BR2_PACKAGE_PTHREAD_STUBS
+	select BR2_PACKAGE_LIBATOMIC_OPS if BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL
 	help
 	  Direct Rendering Manager
 
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 791e67d..38cb636 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -6,11 +6,20 @@
 LIBDRM_VERSION = 2.4.19
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm/
-LIBDRM_AUTORECONF = NO
 LIBDRM_LIBTOOL_PATCH = NO
 LIBDRM_INSTALL_STAGING = YES
-LIBDRM_INSTALL_TARGET = YES
 
 LIBDRM_DEPENDENCIES = xproto_glproto xproto_xf86vidmodeproto xlib_libXxf86vm xlib_libXmu xproto_dri2proto pthread-stubs
 
+ifeq ($(BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL),y)
+LIBDRM_CONF_OPT += --enable-intel
+LIBDRM_DEPENDENCIES += libatomic_ops
+else
+LIBDRM_CONF_OPT += --disable-intel
+endif
+
+ifneq ($(BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI),y)
+LIBDRM_CONF_OPT += --disable-radeon
+endif
+
 $(eval $(call AUTOTARGETS,package,libdrm))
