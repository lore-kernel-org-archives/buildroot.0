From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  2 Jul 2016 13:07:15 +0200
Subject: [Buildroot] [PATCH] package/libiio: libiio network backend needs
	threads
Message-ID: <1467457635-31517-1-git-send-email-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libiio network backend is enabled, NEED_THREADS is set in the
build system and require a toolchain with treads support.

Fixes:
http://autobuild.buildroot.net/results/cfc/cfc70094d8f4008f4e660250b1b90a35a2ab384d

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/libiio/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index 99da4c1..28a43f9 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -17,11 +17,15 @@ config BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
 
 config BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
 	bool "Network backend"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBXML2
 	default y
 	help
 	  Enable the network backend of the library.
 
+comment "IIO Network backend needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_LIBIIO_IIOD
 	bool "IIO Daemon"
 	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
-- 
2.5.5
