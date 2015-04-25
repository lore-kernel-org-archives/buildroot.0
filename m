From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 11:26:46 +0200
Subject: [Buildroot] [git commit] package/libdcadec: new package
Message-ID: <20150425093942.5F6F680830@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36371d22d9803f8da78065b6dfd998263450859c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for next ffmpeg release:
http://git.videolan.org/?p=ffmpeg.git;a=blobdiff;f=Changelog;h=4542e324d8ab722468ed251325a3efddb28bff8e;hp=46304d83a90d2a846421a61f9391dfcd1e52ba31;hb=72025ac36c740f031d7e413041fdfe97087c83c4;hpb=6fe2641d6e410b7bc203138fa97e1118b411f16d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |    1 +
 package/libdcadec/Config.in    |    7 +++++++
 package/libdcadec/libdcadec.mk |   28 ++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7e25109..3370d59 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -896,6 +896,7 @@ endmenu
 menu "Multimedia"
 	source "package/libass/Config.in"
 	source "package/libbluray/Config.in"
+	source "package/libdcadec/Config.in"
 	source "package/libdvbcsa/Config.in"
 	source "package/libdvbsi/Config.in"
 	source "package/libdvdnav/Config.in"
diff --git a/package/libdcadec/Config.in b/package/libdcadec/Config.in
new file mode 100644
index 0000000..2687a18
--- /dev/null
+++ b/package/libdcadec/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBDCADEC
+	bool "libdcadec"
+	help
+	  dcadec is a free DTS Coherent Acoustics decoder with support
+	  for HD extensions.
+
+	  https://github.com/foo86/dcadec
diff --git a/package/libdcadec/libdcadec.mk b/package/libdcadec/libdcadec.mk
new file mode 100644
index 0000000..1c423f0
--- /dev/null
+++ b/package/libdcadec/libdcadec.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# libdcadec
+#
+################################################################################
+
+LIBDCADEC_VERSION = 7b3b44cd180c9345c98be9062eac701eab5c7454
+LIBDCADEC_SITE = $(call github,foo86,dcadec,$(LIBDCADEC_VERSION))
+LIBDCADEC_LICENSE = LGPLv2.1+
+LIBDCADEC_LICENSE_FILES = COPYING.LGPLv2.1
+LIBDCADEC_INSTALL_STAGING = YES
+
+define LIBDCADEC_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -std=gnu99" -C $(@D)
+endef
+
+define LIBDCADEC_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		DESTDIR=$(STAGING_DIR) PREFIX=/usr install
+endef
+
+define LIBDCADEC_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) PREFIX=/usr install
+endef
+
+$(eval $(generic-package))
