From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 14:14:05 +0200
Subject: [Buildroot] [git commit] package/exim: fix build error with
	external arc toolchain due to missing libnsl
Message-ID: <20150329121415.317B38082B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6cf848cabded26868ba9fa17bb610e30da78b24
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/331/331ed781b422448205fb9e7c9730ec0c438d6306/
http://autobuild.buildroot.net/results/402/402d64965ac7ac6e1d4e1990080394958802fe8c/
http://autobuild.buildroot.net/results/960/9605bac2972d3e3d3fb91947ae6921e89210247b/
http://autobuild.buildroot.net/results/6b6/6b61ea80a3a6dcead233c4b408eba8b8d647e841/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/exim/exim.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 34a6893..f39445d 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -62,6 +62,13 @@ define EXIM_USE_DEFAULT_CONFIG_FILE_CLAMAV
 endef
 endif
 
+# this specific toolchain lacks libnsl
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12),y)
+define EXIM_REMOVE_LIBNSL_FROM_MAKEFILE
+	$(SED) 's/-lnsl//g' $(@D)/OS/Makefile-Linux
+endef
+endif
+
 define EXIM_CONFIGURE_TOOLCHAIN
 	$(call exim-config-add,CC,$(TARGET_CC))
 	$(call exim-config-add,CFLAGS,$(TARGET_CFLAGS))
@@ -69,6 +76,7 @@ define EXIM_CONFIGURE_TOOLCHAIN
 	$(call exim-config-add,RANLIB,$(TARGET_RANLIB))
 	$(call exim-config-add,HOSTCC,$(HOSTCC))
 	$(call exim-config-add,HOSTCFLAGS,$(HOSTCFLAGS))
+	$(EXIM_REMOVE_LIBNSL_FROM_MAKEFILE)
 endef
 
 ifneq ($(call qstrip,$(BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE)),)
