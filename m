From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Aug 2016 09:43:36 +0200
Subject: [Buildroot] [git commit] package/sconeserver: needs shared libs
Message-ID: <20160829074506.65C1081ED2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a845798aa8af0535b85ea0e46cc9e8af9d1ffed1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sconeserver wants to use dlopen(), unconditionally: it does not try to
detect it, and it can't work without it (the code is not conditional).

Fixes:
    http://autobuild.buildroot.org/results/e92/e929799366e6f574c7b08d8635b18623afd3e3e1/

[Peter: drop uClibc dependency, adjust commit message]
Reported-by: Matthew Weber <matt@thewebers.ws>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sconeserver/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 4083aa7..f03af8d 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -2,6 +2,7 @@ menuconfig BR2_PACKAGE_SCONESERVER
 	bool "sconeserver"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_STATIC_LIBS # dlopen()
 	select BR2_PACKAGE_PCRE
 	help
 	  Sconeserver is a modular, object-orientated and extremely versatile
@@ -102,5 +103,6 @@ comment "ui module requires X.org"
 
 endif # BR2_PACKAGE_SCONESERVER
 
-comment "sconeserver needs a toolchain w/ C++, NPTL"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
+comment "sconeserver needs a toolchain with dynamic library, C++, NPTL"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
+		|| BR2_STATIC_LIBS
