From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 14 Nov 2019 20:13:19 +0100
Subject: [Buildroot] [PATCH 3/5] package/spice: needs dynamic library
In-Reply-To: <20191114191321.11789-1-fontaine.fabrice@gmail.com>
References: <20191114191321.11789-1-fontaine.fabrice@gmail.com>
Message-ID: <20191114191321.11789-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

spice can optionally uses opus and celt051 which will result in a static
build failure as opus embeds its own celt version.

So add a dynamic library dependency on spice as this is the only package
using celt051 and because next version of spice will also fails to build
statically because of
https://gitlab.freedesktop.org/spice/spice-common/commit/16aa8c98d89fdfc49b7aa58d60f1cd82c075cb1f
which redefines the X509_NAME_add_entry_by_txt openssl function

Fixes:
 - http://autobuild.buildroot.org/results/96c786f85d35f33508e9c71778043d16b87f72cd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/spice/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/spice/Config.in b/package/spice/Config.in
index 2241b55b3d..586f4cb1ed 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -1,12 +1,14 @@
-comment "spice server needs a toolchain w/ wchar, threads"
+comment "spice server needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
 
 config BR2_PACKAGE_SPICE
 	bool "spice server"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL
-- 
2.23.0
