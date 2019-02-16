From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 16 Feb 2019 19:20:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/openvmtools: add resolutionkms
 option
Message-ID: <20190216182048.12331-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

resolutionkms has been added in version 10.2.5 and
https://github.com/vmware/open-vm-tools/commit/dc95efcb7d4bb7d865b7d37f9aaafe6fb8009e59

It depends on udev and libdrm's vmwgfx option

Fixes:
 - http://autobuild.buildroot.org/results/92f7c88917066b1d3e15ee0d1baafe01c0cb29c8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openvmtools/Config.in      | 11 +++++++++++
 package/openvmtools/openvmtools.mk |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index 72c0293de7..f63d691e01 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -45,6 +45,17 @@ config BR2_PACKAGE_OPENVMTOOLS_PAM
 comment "PAM support needs a glibc toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
 
+config BR2_PACKAGE_OPENVMTOOLS_RESOLUTIONKMS
+	bool "resolutionkms support"
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBDRM_VMWGFX
+	help
+	  Enable support for resolutionkms
+
+comment "resolutionkms needs udev"
+	depends on !BR2_PACKAGE_HAS_UDEV
+
 endif
 
 comment "openvmtools needs a glibc or musl toolchain w/ wchar, threads, RPC, locale"
diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 0dc2956d02..145ee61895 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -47,6 +47,13 @@ else
 OPENVMTOOLS_CONF_OPTS += --without-pam
 endif
 
+ifeq ($(BR2_PACKAGE_OPENVMTOOLS_RESOLUTIONKMS),y)
+OPENVMTOOLS_CONF_OPTS += --enable-resolutionkms
+OPENVMTOOLS_DEPENDENCIES += libdrm udev
+else
+OPENVMTOOLS_CONF_OPTS += --disable-resolutionkms
+endif
+
 # symlink needed by lib/system/systemLinux.c (or will cry in /var/log/messages)
 # defined in lib/misc/hostinfoPosix.c
 # /sbin/shutdown needed for Guest OS restart/shutdown from hypervisor
-- 
2.14.1
