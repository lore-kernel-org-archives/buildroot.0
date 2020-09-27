From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 27 Sep 2020 11:39:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/rsh-redone: disable rlogind on musl
Message-ID: <20200927093940.1491555-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit f89ca996b6deb660b53c33196b8b309fac659bf9 enabled linux-pam on
musl however rlogind fails to build on musl because it uses logwtmp:

/home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/8.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: rlogind.c:(.text.startup+0x9ec): undefined reference to `logwtmp'

As this package is unmaintained, just disable back rlogind on musl

Fixes:
 - http://autobuild.buildroot.org/results/f2eb1c0bab7c6c32d6c561da0f85a530bd419206

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rsh-redone/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/rsh-redone/Config.in b/package/rsh-redone/Config.in
index 5647d7edef..53ff2bea7f 100644
--- a/package/rsh-redone/Config.in
+++ b/package/rsh-redone/Config.in
@@ -17,12 +17,13 @@ config BR2_PACKAGE_RSH_REDONE_RLOGIND
 	bool "rlogind"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_ENABLE_LOCALE && BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 
-comment "rlogind needs a toolchain w/ wchar, locale, dynamic library"
+comment "rlogind needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
 
 config BR2_PACKAGE_RSH_REDONE_RSH
 	bool "rsh"
-- 
2.28.0
