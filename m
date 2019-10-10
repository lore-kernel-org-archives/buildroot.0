From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 22:18:23 +0200
Subject: [Buildroot] [git commit] package/selinux-python: remove redundant
 dependencies
Message-ID: <20191010201354.B90A28C700@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0fd7a2876a869b7cf15bba067ebbc3c73e9ec935
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The selinux-python package has two sub-packages, audit2allow and
sepolgen. Both of these repeat the dependencies (and comment) of the
top-level selinux-python package. Remove those redundant dependencies
(and comments).

This redundancy was introduced by commit 9d6da7a26. Originally, sepolgen
was a separate package and audit2allow was a sub-package of
policycoreutils, so both of them had these dependencies. When the two
options were moved into selinux-python, the dependencies stayed.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/selinux-python/Config.in | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/package/selinux-python/Config.in b/package/selinux-python/Config.in
index 5e44b5deb0..00ca6b9c38 100644
--- a/package/selinux-python/Config.in
+++ b/package/selinux-python/Config.in
@@ -16,10 +16,6 @@ if BR2_PACKAGE_SELINUX_PYTHON
 
 config BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW
 	bool "audit2allow"
-	depends on BR2_USE_WCHAR # sepolgen
-	depends on BR2_USE_MMU # sepolgen
-	depends on BR2_TOOLCHAIN_HAS_THREADS # sepolgen, checkpolicy
-	depends on !BR2_STATIC_LIBS # sepolgen
 	select BR2_PACKAGE_CHECKPOLICY
 	select BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN
 	select BR2_PACKAGE_SEMODULE_UTILS
@@ -32,27 +28,13 @@ config BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW
 	  audit2why - translates SELinux audit messages into a
 	  description of why the access was denied (audit2allow -w)
 
-comment "audit2allow needs a toolchain w/ wchar, threads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
-
 config BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN
 	bool "sepolgen"
-	depends on BR2_USE_WCHAR
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_SEMODULE_UTILS
 	help
 	  This package contains a Python module that allows you to
 	  generate an initial SELinux policy module template.
 
-comment "sepolgen needs a toolchain w/ wchar, threads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
-
 endif
 
 comment "selinux-python packages needs a toolchain w/ wchar, threads, dynamic library"
