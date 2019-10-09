From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Oct 2019 00:06:39 +0200
Subject: [Buildroot] [PATCH 2/4] package/selinux-python: remove redundant
 dependencies
In-Reply-To: <20191009220641.24605-1-arnout@mind.be>
References: <20191009220641.24605-1-arnout@mind.be>
Message-ID: <20191009220641.24605-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The selinux-python package has two sub-packages, audit2allow and
sepolgen. Both of these repeat the dependencies (and comment) of the
top-level selinux-python package. Remove those redundant dependencies
(and comments).

This redundancy was introduced by commit 9d6da7a26. Originally, sepolgen
was a separate package and audit2allow was a sub-package of
policycoreutils, so both of them had these dependencies. When the two
options were moved into selinux-python, the dependencies stayed.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/selinux-python/Config.in | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/package/selinux-python/Config.in b/package/selinux-python/Config.in
index 2e314cb60d..8f78a7b825 100644
--- a/package/selinux-python/Config.in
+++ b/package/selinux-python/Config.in
@@ -16,10 +16,6 @@ if BR2_PACKAGE_SELINUX_PYTHON
 
 config BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW
 	bool "audit2allow"
-	depends on BR2_USE_WCHAR # sepolgen
-	depends on BR2_USE_MMU # sepolgen
-	depends on BR2_TOOLCHAIN_HAS_THREADS # sepolgen, checkpolicy
-	depends on !BR2_STATIC_LIBS # sepolgen
 	depends on !BR2_arc # checkpolicy
 	select BR2_PACKAGE_CHECKPOLICY
 	select BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN
@@ -33,28 +29,13 @@ config BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW
 	  audit2why - translates SELinux audit messages into a
 	  description of why the access was denied (audit2allow -w)
 
-comment "audit2allow needs a toolchain w/ wchar, threads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on !BR2_arc
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
-- 
2.21.0
