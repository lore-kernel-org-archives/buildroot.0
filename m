From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Nov 2015 23:21:46 +0100
Subject: [Buildroot] [PATCH] package/fastd: propagate libcap dependency
Message-ID: <1447539706-15504-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libcap neds headers >= 3.0, so propagate that down to fastd which
selects libcap.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Alexander Dahl <post@lespocky.de>
---
 package/fastd/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/fastd/Config.in b/package/fastd/Config.in
index 07118f3..4170ea1 100644
--- a/package/fastd/Config.in
+++ b/package/fastd/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_FASTD
 	bool "fastd"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libcap
 	select BR2_PACKAGE_LIBUECC
 	select BR2_PACKAGE_LIBSODIUM
 	select BR2_PACKAGE_LIBCAP
@@ -21,6 +22,7 @@ config BR2_PACKAGE_FASTD_STATUS_SOCKET
 
 endif
 
-comment "fastd needs a toolchain w/ threads"
+comment "fastd needs a toolchain w/ threads, headers >= 3.0"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-- 
1.9.1
