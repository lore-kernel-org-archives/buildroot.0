From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Aug 2018 10:02:17 +0200
Subject: [Buildroot] [PATCH] package/rauc: needs kernel headers >= 3.0
Message-ID: <20180824080217.16181-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rauc includes <linux/mmc/ioctl.h> which was introduced only in
linux 3.0.

Also change order to have arch dependencies first.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Andrey Yurovsky <yurovsky@gmail.com>
---
 package/rauc/Config.in | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/rauc/Config.in b/package/rauc/Config.in
index 6433b827d3..864aa6b9c6 100644
--- a/package/rauc/Config.in
+++ b/package/rauc/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_RAUC
 	bool "rauc"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_DBUS # run-time dependency
@@ -32,6 +33,7 @@ config BR2_PACKAGE_RAUC_JSON
 
 endif
 
-comment "rauc needs a toolchain w/ wchar, threads"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+comment "rauc needs a toolchain w/ wchar, threads, headers >= 3.0"
 	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-- 
2.14.1
