From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Apr 2020 11:48:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/selinux: fix circular dependency
Message-ID: <20200421094849.2476332-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix circular dependency added by commit
791292c48d5165515ca08f35d8cbc1ef78d3ed95

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/selinux-python/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/selinux-python/Config.in b/package/selinux-python/Config.in
index 1a610b29f0..2d547582e5 100644
--- a/package/selinux-python/Config.in
+++ b/package/selinux-python/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SELINUX_PYTHON
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  A set of SELinux tools written in python that help with
 	  managing a system with SELinux enabled. If no packages are
@@ -37,6 +37,9 @@ config BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN
 
 endif
 
+comment "selinux-python needs python3"
+	depends on !BR2_PACKAGE_PYTHON3
+
 comment "selinux-python packages needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-- 
2.25.1
