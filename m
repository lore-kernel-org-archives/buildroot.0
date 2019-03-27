From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Mar 2019 19:46:26 +0100
Subject: [Buildroot] [git commit] package/openvmtools: add resolutionkms
 option
Message-ID: <20190327184419.6F074880CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fad79feac2249dac036ffc3029ff6e5b10d0d4c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

resolutionkms has been added in version 10.2.5 and
https://github.com/vmware/open-vm-tools/commit/dc95efcb7d4bb7d865b7d37f9aaafe6fb8009e59

It depends on udev and libdrm's vmwgfx option

Fixes:
 - http://autobuild.buildroot.org/results/92f7c88917066b1d3e15ee0d1baafe01c0cb29c8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openvmtools/Config.in      | 14 ++++++++++++++
 package/openvmtools/openvmtools.mk |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index 72c0293de7..97860f8c6f 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -45,6 +45,20 @@ config BR2_PACKAGE_OPENVMTOOLS_PAM
 comment "PAM support needs a glibc toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
 
+config BR2_PACKAGE_OPENVMTOOLS_RESOLUTIONKMS
+	bool "resolutionkms support"
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	depends on BR2_i386 || BR2_x86_64 # libdrm vmwgfx
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBDRM_VMWGFX
+	help
+	  Enable support for resolutionkms
+
+comment "resolutionkms needs udev, a toolchain w/ threads"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS
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
