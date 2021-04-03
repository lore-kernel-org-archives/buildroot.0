From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  3 Apr 2021 15:23:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/cifs-utils: add missing python
 dependencies
Message-ID: <20210403132349.2220750-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add missing python dependencies which have been forgotten when bumping
to version 6.12 in commit b5dede7d1a03ab2b8caa0a8e79b09c8df6c62fe4

Fixes:
 - http://autobuild.buildroot.org/results/acdbf7c58ec8ae648f8048bc75650dcdcdca6285

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cifs-utils/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/cifs-utils/Config.in b/package/cifs-utils/Config.in
index 0e61243de4..55829e3dc2 100644
--- a/package/cifs-utils/Config.in
+++ b/package/cifs-utils/Config.in
@@ -18,9 +18,16 @@ if BR2_PACKAGE_CIFS_UTILS
 
 config BR2_PACKAGE_CIFS_UTILS_SMBTOOLS
 	bool "smbtools"
+	depends on BR2_USE_WCHAR # python
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python
+	depends on !BR2_STATIC_LIBS # python
 	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON # runtime
 	help
 	  Install the smb tools smbinfo and smb2-quota (python
 	  implementations).
 
+comment "smbtools needs a toolchain w/ wchar, threads, dynamic library"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
+
 endif
-- 
2.30.2
