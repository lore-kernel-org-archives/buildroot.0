From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jul 2016 22:34:56 +0200
Subject: [Buildroot] [PATCH] package/systemd: import daemon needs headers >=
	3.11
Message-ID: <1468182896-8355-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... since it uses O_TMPFILE as an open(2) flag, and it was only
introduced in 3.11.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gabe Evans <gabe@hashrabbit.co>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/systemd/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index ddaf3e2..4a2aa33 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -144,6 +144,7 @@ config BR2_PACKAGE_SYSTEMD_HWDB
 config BR2_PACKAGE_SYSTEMD_IMPORTD
 	bool "enable import daemon"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # O_TMPFILE
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_BZIP2
@@ -157,6 +158,10 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
 
 	  http://www.freedesktop.org/software/systemd/man/machinectl.html#Image%20Transfer%20Commands
 
+comment "import daemon needs a toolchain w/ headers >= 3.11"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
+
 config BR2_PACKAGE_SYSTEMD_KDBUS
 	bool "enable kdbus support"
 	help
-- 
2.7.4
