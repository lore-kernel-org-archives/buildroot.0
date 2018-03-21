From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 21 Mar 2018 21:04:59 +0200
Subject: [Buildroot] [PATCH] tpm2-tools: propagate dependencies of selected
 packages
Message-ID: <0bc695b6c1b76b30190ebddff065b6adb5d755f9.1521659099.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes (libglib):
http://autobuild.buildroot.net/results/786/786859fccc477de1519d85d8a180626bb8ebe062/
http://autobuild.buildroot.net/results/df6/df6518f331c16b477c6e934914d0e56dc102c228/

Cc: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/tpm2-tools/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
index 6429b24531b1..3bde934daef5 100644
--- a/package/tpm2-tools/Config.in
+++ b/package/tpm2-tools/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_TPM2_TOOLS
 	bool "tpm2-tools"
+	depends on BR2_USE_MMU # dbus, libglib
+	depends on BR2_USE_WCHAR # libglib -> gettext
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBGLIB2
@@ -14,3 +17,7 @@ config BR2_PACKAGE_TPM2_TOOLS
 	  implementation.
 
 	  https://github.com/tpm2-software/tpm2-tools
+
+comment "tpm2-tools need a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.16.2
