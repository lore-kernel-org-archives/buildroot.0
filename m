From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jul 2014 16:59:40 +0200
Subject: [Buildroot] [git commit] inadyn: not available for static
Message-ID: <20140710150058.25A9F9C46A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a27d7f2f6d21d0a4d6d43069a50ee57871c2f35f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

inadyn isn't static-build friendly, even if we pull in the libz link
line for the failure stated below it'll fail when trying to link to
libdl and using dlopen for the plugins. Fixes:
http://autobuild.buildroot.net/results/1a1/1a1a184e8248e5c51fa730d0c9721fe67a9c84a4/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/inadyn/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
