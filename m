From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Feb 2018 14:05:44 +0100
Subject: [Buildroot] [git commit branch/next] autofs: allow to use libtirpc
Message-ID: <20180206130615.7C7D788327@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=873040371b1436d480fb9153427504ce9e3d78cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

uClibc-ng removed internal RPC implementation as it
is ipv4 only and can not be used for most important RPC software
rpcbind and nfs-utils.
musl does not implement RPC and GNU C library deprecated the
internal implementation a while ago.
It is still possible to use the C library implementation.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Thomas: change to use libtirpc when available, not just when the
toolchain does not have RPC support.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/autofs/Config.in | 7 +++----
 package/autofs/autofs.mk | 9 ++++++++-
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/autofs/Config.in b/package/autofs/Config.in
index 8e08357a4e..efb0ec28ee 100644
--- a/package/autofs/Config.in
+++ b/package/autofs/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_AUTOFS
 	bool "autofs"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on !BR2_STATIC_LIBS # dlfcn
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  Autofs controls the operation of the automount daemons. The
 	  automount daemons automatically mount filesystems when they
@@ -15,7 +15,6 @@ config BR2_PACKAGE_AUTOFS
 
 	  http://www.linuxfromscratch.org/blfs/view/svn/general/autofs.html
 
-comment "autofs needs a toolchain w/ NPTL, RPC, dynamic library"
+comment "autofs needs a toolchain w/ NPTL and dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
index 90cc38de55..87a218441e 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -9,7 +9,7 @@ AUTOFS_SOURCE = autofs-$(AUTOFS_VERSION).tar.xz
 AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
 AUTOFS_LICENSE = GPL-2.0+
 AUTOFS_LICENSE_FILES = COPYING COPYRIGHT
-AUTOFS_DEPENDENCIES = host-flex host-bison
+AUTOFS_DEPENDENCIES = host-flex host-bison host-pkgconf
 
 # autofs looks on the build machine for the path of modprobe, so tell
 # it explicitly where it will be located on the target.
@@ -31,4 +31,11 @@ AUTOFS_CONF_OPTS = \
 
 AUTOFS_MAKE_ENV = DONTSTRIP=1
 
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+AUTOFS_CONF_OPTS += --with-libtirpc
+AUTOFS_DEPENDENCIES += libtirpc
+else
+AUTOFS_CONF_OPTS += --without-libtirpc
+endif
+
 $(eval $(autotools-package))
