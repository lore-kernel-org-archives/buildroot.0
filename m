From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 15 Oct 2019 21:23:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/bird: select at least one protocol
Message-ID: <20191015192303.28397-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bird needs at least one protocol so select BGP if no other protocols are
selected as BGP is already the default one

Fixes:
 - http://autobuild.buildroot.org/results/0b00948eed9bb8405b70f3f9112ecce99b365f35

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bird/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/bird/Config.in b/package/bird/Config.in
index c2951c74c3..3baf43f98e 100644
--- a/package/bird/Config.in
+++ b/package/bird/Config.in
@@ -1,6 +1,11 @@
 config BR2_PACKAGE_BIRD
 	bool "bird"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_BIRD_BGP if !(BR2_PACKAGE_BIRD_BABEL || \
+		BR2_PACKAGE_BIRD_BFD || BR2_PACKAGE_BIRD_MRT || \
+		BR2_PACKAGE_BIRD_OSPF || BR2_PACKAGE_BIRD_PERF || \
+		BR2_PACKAGE_BIRD_PIPE || BR2_PACKAGE_BIRD_RADV || \
+		BR2_PACKAGE_BIRD_RIP || BR2_PACKAGE_BIRD_STATIC)
 	help
 	  BIRD Internet Routing Daemon
 
@@ -38,7 +43,6 @@ comment "BFD protocol needs a toolchain w/ NPTL"
 
 config BR2_PACKAGE_BIRD_BGP
 	bool "bgp"
-	default y
 	help
 	  Enable BGP protocol.
 
-- 
2.23.0
