From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Aug 2019 19:28:57 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/openvmtools: use
 libtirpc when toolchain has no native RPC
Message-ID: <20190804201500.4F2428E431@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=199be3604038a5a26bfde33aab127af6b689c38a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

openvmtools detects and uses an external RPC library if RPC is not
supported by the toolchain C library, so let's select package/libtirpc
when necessary.

Signed-off-by: Simon Rowe <simon.rowe@citrix.com>
[Thomas: add missing dependency on libtirpc]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit d006737faa8b0eb31db1ac216eaa872704a9f1a6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvmtools/Config.in      | 6 +++---
 package/openvmtools/openvmtools.mk | 4 ++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index 97860f8c6f..2bd5c272a9 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -4,11 +4,11 @@ config BR2_PACKAGE_OPENVMTOOLS
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_ENABLE_LOCALE
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBDNET
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  Open Virtual Machine Tools for VMware guest OS
 
@@ -61,9 +61,9 @@ comment "resolutionkms needs udev, a toolchain w/ threads"
 
 endif
 
-comment "openvmtools needs a glibc or musl toolchain w/ wchar, threads, RPC, locale"
+comment "openvmtools needs a glibc or musl toolchain w/ wchar, threads, locale"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_HAS_NATIVE_RPC || !BR2_ENABLE_LOCALE || \
+		!BR2_ENABLE_LOCALE || \
 		BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 145ee61895..e97eaf224e 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -20,6 +20,10 @@ OPENVMTOOLS_CONF_OPTS = --with-dnet \
 OPENVMTOOLS_CONF_ENV += CUSTOM_DNET_CPPFLAGS=" "
 OPENVMTOOLS_DEPENDENCIES = host-nfs-utils libglib2 libdnet
 
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+OPENVMTOOLS_DEPENDENCIES += libtirpc
+endif
+
 # When libfuse is available, openvmtools can build vmblock-fuse, so
 # make sure that libfuse gets built first
 ifeq ($(BR2_PACKAGE_LIBFUSE),y)
