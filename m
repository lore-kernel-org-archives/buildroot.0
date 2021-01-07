From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  7 Jan 2021 07:40:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/htop: needs dynamic library
Message-ID: <20210107064031.257459-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

htop unconditionally uses dlopen since version 3.0.3 and
https://github.com/htop-dev/htop/commit/2a9e8ca07475e61e74d7b6f0afd0a5fd272cb07f

Fixes:
 - http://autobuild.buildroot.org/results/2976729b0b95bf822c3095efbcf3f86d6c71874f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/htop/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/htop/Config.in b/package/htop/Config.in
index 7bb0fe6e07..214a9a1c99 100644
--- a/package/htop/Config.in
+++ b/package/htop/Config.in
@@ -1,9 +1,14 @@
 config BR2_PACKAGE_HTOP
 	bool "htop"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # dlopen()
 	select BR2_PACKAGE_NCURSES
 	help
 	  htop is an interactive text-mode process viewer for Linux.
 	  It aims to be a better top.
 
 	  https://htop.dev/
+
+comment "htop needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
-- 
2.29.2
