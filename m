From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun, 10 Nov 2013 20:33:15 +0000
Subject: [Buildroot] [PATCH] libmicrohttpd: disable on avr32
Message-ID: <1384115595-13780-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The epoll_create1 syscall is not available on avr32. Fixes build failures
such as the following.

  http://autobuild.buildroot.net/results/dbd/dbdc86321c6c85703dd9aed3f974843203124d92

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/libmicrohttpd/Config.in | 3 +++
 package/ola/Config.in           | 1 +
 2 files changed, 4 insertions(+)

diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index 15e3762..c0293f0 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBMICROHTTPD
 	bool "libmicrohttpd"
+	depends on !BR2_avr32 # no epoll_create1
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  GNU libmicrohttpd is a small C library that makes it easy to
@@ -18,6 +19,8 @@ config BR2_PACKAGE_LIBMICROHTTPD_SSL
 
 comment "libmicrohttpd needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_avr32
 
 comment "libmicrohttpd https support needs a toolchain w/ wchar"
 	depends on BR2_PACKAGE_LIBMICROHTTPD && !BR2_USE_WCHAR
+	depends on !BR2_avr32
diff --git a/package/ola/Config.in b/package/ola/Config.in
index eb24a3a..7c5e0fe 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -23,6 +23,7 @@ menu "bindings and interface"
 
 config BR2_PACKAGE_OLA_WEB
 	bool "http interface"
+	depends on !BR2_avr32 # libmicrohttpd
 	select BR2_PACKAGE_LIBMICROHTTPD
 	help
 	  Build OLA with browser interface.
-- 
1.8.3.2
