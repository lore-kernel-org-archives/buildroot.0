From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 May 2017 17:10:21 +0200
Subject: [Buildroot] [git commit] keepalived: needs headers >= 3.4
Message-ID: <20170527151043.23C4682816@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d01b0bbad04b97a5e8e1dd3ac3c1026555f793fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

keepalived fails to build on toolchains with headers older than 3.4,
because of a namespace clash between the xt_set.h header from the
kernel and the linux_ip_set.h header installed by ipset.

Even though keepalived does check for pre-3.4 headers, the check
somehow fails to work correctly.

We fix that by making keepalived depend on headers 3.4 or later.

Fixes:
http://autobuild.buildroot.org/results/770/770d8fd2f3bacbdbe233da1b4d6e64e20a84d5a5/
http://autobuild.buildroot.org/results/1ad/1adb710b915427f681eae37452a0942833ce533e/
http://autobuild.buildroot.org/results/70b/70b31547e51ec7213372d2ef07bec34c5df77560/
[...]

Signed-off-by: Ilias Apalodimas <apalos@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/keepalived/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/keepalived/Config.in b/package/keepalived/Config.in
index efa745a..0140e62 100644
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
+comment "keepalived needs a toolchain w/ dynamic library, headers >= 3.4"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
