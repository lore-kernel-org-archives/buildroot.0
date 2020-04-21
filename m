From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Apr 2020 16:53:15 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/selinux-python: fix dependency
Message-ID: <20200421145315.3562089-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 791292c48d5165515ca08f35d8cbc1ef78d3ed95 forgot to add
!BR2_PACKAGE_PYTHON dependency, without it the following error will be
raised if the user selects BR2_PACKAGE_PYTHON and python-selinux:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON3
  Depends on [n]: !BR2_PACKAGE_PYTHON [=y] && BR2_USE_WCHAR [=y] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n]
  Selected by [y]:
  - BR2_PACKAGE_SELINUX_PYTHON [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n]

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Fix commit message, keep select and add a !BR2_PACKAGE_PYTHON
   dependency

 package/selinux-python/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/selinux-python/Config.in b/package/selinux-python/Config.in
index 1a610b29f0..862a63095a 100644
--- a/package/selinux-python/Config.in
+++ b/package/selinux-python/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SELINUX_PYTHON
 	bool "selinux-python"
+	depends on !BR2_PACKAGE_PYTHON
 	depends on BR2_USE_MMU
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -37,6 +38,9 @@ config BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN
 
 endif
 
+comment "selinux-python needs python3"
+	depends on BR2_PACKAGE_PYTHON
+
 comment "selinux-python packages needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-- 
2.25.1
