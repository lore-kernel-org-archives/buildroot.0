From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 23 May 2016 21:15:54 +0200
Subject: [Buildroot] [PATCH 2/2] package/ustr: disable on musl
In-Reply-To: <1464030954-22737-1-git-send-email-bernd.kuhls@t-online.de>
References: <1464030954-22737-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1464030954-22737-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libsemanage is the only package depending on ustr, both packages do not
build using a musl-based toolchain, suggested by Thomas:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/149138

Fixes
http://autobuild.buildroot.net/results/a41/a416001516d98d58849f1d1f8f49f49d3d28f3a2/
http://autobuild.buildroot.net/results/f51/f5115516bd514afbb71a9460e82c889bcc18e7e2/
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ustr/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ustr/Config.in b/package/ustr/Config.in
index 0d9c272..9d6561c 100644
--- a/package/ustr/Config.in
+++ b/package/ustr/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_USTR
 	bool "ustr"
 	# unconditionally builds a shared library
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL # broken vsnprintf detection
 	help
 	  A small, safe string library.
 
@@ -9,3 +10,4 @@ config BR2_PACKAGE_USTR
 
 comment "ustr needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL
-- 
2.8.1
