From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Jul 2014 09:40:37 -0300
Subject: [Buildroot] [PATCH] inadyn: not available for static
Message-ID: <1404996037-12695-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

inadyn isn't static-build friendly, even if we pull in the libz link
line for the failure stated below it'll fail when trying to link to
libdl and using dlopen for the plugins. Fixes:
http://autobuild.buildroot.net/results/1a1/1a1a184e8248e5c51fa730d0c9721fe67a9c84a4/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/inadyn/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/inadyn/Config.in b/package/inadyn/Config.in
index a2dfa74..a436111 100644
--- a/package/inadyn/Config.in
+++ b/package/inadyn/Config.in
@@ -1,9 +1,13 @@
 config BR2_PACKAGE_INADYN
 	bool "inadyn"
 	depends on BR2_USE_MMU # Uses fork()
+	depends on !BR2_PREFER_STATIC_LIB # dlopen()
 	help
 	  INADYN is a free DynDNS client. It gives the possibility
 	  to have your own fixed hostname registered on the internet,
 	  although your IP might be changing.
 
 	  https://github.com/troglobit/inadyn
+
+comment "inadyn needs a toolchain w/ dynamic library"
+        depends on BR2_PREFER_STATIC_LIB
-- 
1.8.5.5
