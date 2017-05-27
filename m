From: Ilias Apalodimas <apalos@gmail.com>
Date: Sat, 27 May 2017 15:47:47 +0300
Subject: [Buildroot] [PATCH 1/1] keepalived: Allow the package to be
	selected only if linux-headers >= 3.4
Message-ID: <1495889267-7358-1-git-send-email-apalos@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

This patch fixes build issues of keepalived reported here:
http://autobuild.buildroot.net/results/770d8fd2f3bacbdbe233da1b4d6e64e20a84d5a5
http://autobuild.buildroot.net/results/1adb710b915427f681eae37452a0942833ce533e
http://autobuild.buildroot.net/results/70b31547e51ec7213372d2ef07bec34c5df77560

These builds are all using an external toolchain and linux-3.2 headers.
Keepalived includes linux_ip_set.h when ipset package is enabled,
which conflicts with linux xt_set.h header(prior to 3.4).

As Yann Morin suggested we are making keepalived depending on the kernel-headers
version.

Regards
Ilias

Signed-off-by: Ilias Apalodimas <apalos@gmail.com>
---
 package/keepalived/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/keepalived/Config.in b/package/keepalived/Config.in
index efa745a..790cc03 100644
--- a/package/keepalived/Config.in
+++ b/package/keepalived/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_KEEPALIVED
 	bool "keepalived"
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS # uses libdl
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_POPT
 	help
@@ -15,6 +16,6 @@ config BR2_PACKAGE_KEEPALIVED
 
 	  http://www.keepalived.org/
 
-comment "keepalived needs a toolchain w/ dynamic library"
+comment "keepalived needs a toolchain w/ dynamic library w/ headers >= 3.4"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
-- 
1.9.1
