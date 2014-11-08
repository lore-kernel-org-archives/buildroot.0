From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Nov 2014 13:22:53 +0100
Subject: [Buildroot] [git commit] arptables: needs dynamic linking support
	for dlopen()
Message-ID: <20141108122621.59AE1B2515@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8a242179a446fa6f54f5da8ff6459ab1fc1afe2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/b96/b9642befef82e479cc50839e07114cb87314d156/
http://autobuild.buildroot.net/results/57f/57ffebbe925391badf81f6867fdbf16975b4af6f/
http://autobuild.buildroot.net/results/5f1/5f1966f1a7c8800846a8405b7e74f4893f3fcd14/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/arptables/Config.in |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/arptables/Config.in b/package/arptables/Config.in
index 414fabb..15414a0 100644
--- a/package/arptables/Config.in
+++ b/package/arptables/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_ARPTABLES
 	bool "arptables"
-	# needs fork()
-	depends on BR2_USE_MMU
+	depends on BR2_USE_MMU # needs fork()
+	depends on !BR2_PREFER_STATIC_LIB # needs dlopen()
 	help
 	  Tool to set up, maintain, and inspect the tables of ARP rules.
 
 	  http://ebtables.sourceforge.net
+
+comment "arptables needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_PREFER_STATIC_LIB
