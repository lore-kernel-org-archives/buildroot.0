From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun,  7 Mar 2021 15:04:07 +0100
Subject: [Buildroot] [PATCH 2/6] package/gnutls: disable package if binutils
 is affected from bug 21464
In-Reply-To: <20210307140411.3776544-1-giulio.benetti@benettiengineering.com>
References: <20210307140411.3776544-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210307140411.3776544-3-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is affected from binutils bug 21464, since there is no
workaround, let's disable it.

Fixes:
http://autobuild.buildroot.net/results/ce9/ce9050a183a3f1e31cefbc4d4a6d780235466e39/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/gnutls/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index 15b930b6bd..c4fa729e71 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_GNUTLS
 	# gnulib requires a library that implements wctomb().
 	# This is noticed only when linking with libgnutls.so.
 	depends on BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
 	select BR2_PACKAGE_LIBTASN1
 	select BR2_PACKAGE_NETTLE
 	select BR2_PACKAGE_PCRE
@@ -32,4 +33,5 @@ config BR2_PACKAGE_GNUTLS_TOOLS
 endif
 
 comment "gnutls needs a toolchain w/ wchar, dynamic library"
-	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
+		   !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
-- 
2.25.1
