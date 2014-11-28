From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Nov 2014 07:25:27 -0300
Subject: [Buildroot] [PATCH] bind: not available for static builds
Message-ID: <1417170327-10829-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/e27/e27111f484f72c77d2179fa1a29ea7b5271ff9fa/

While at it rename patches to new convention.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../bind/{bind-01-disable-tests.patch => 0001-disable-tests.patch}   | 0
 package/bind/{bind-02-cross.patch => 0002-cross.patch}               | 0
 package/bind/Config.in                                               | 5 +++--
 3 files changed, 3 insertions(+), 2 deletions(-)
 rename package/bind/{bind-01-disable-tests.patch => 0001-disable-tests.patch} (100%)
 rename package/bind/{bind-02-cross.patch => 0002-cross.patch} (100%)

diff --git a/package/bind/bind-01-disable-tests.patch b/package/bind/0001-disable-tests.patch
similarity index 100%
rename from package/bind/bind-01-disable-tests.patch
rename to package/bind/0001-disable-tests.patch
diff --git a/package/bind/bind-02-cross.patch b/package/bind/0002-cross.patch
similarity index 100%
rename from package/bind/bind-02-cross.patch
rename to package/bind/0002-cross.patch
diff --git a/package/bind/Config.in b/package/bind/Config.in
index 4f65e1c..8e3b824 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_BIND
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  BIND (Berkeley Internet Name Domain) is an implementation of
 	  the Domain Name System (DNS) protocols and provides an openly
@@ -38,6 +39,6 @@ config BR2_PACKAGE_BIND_TOOLS
 
 endif
 
-comment "bind needs a toolchain w/ largefile, IPv6"
+comment "bind needs a toolchain w/ largefile, IPv6, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !(BR2_LARGEFILE || BR2_INET_IPV6)
+	depends on !BR2_LARGEFILE || !BR2_INET_IPV6 || BR2_PREFER_STATIC_LIB
-- 
2.0.4
