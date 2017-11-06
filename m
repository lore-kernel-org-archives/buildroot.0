From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Nov 2017 15:17:45 +0100
Subject: [Buildroot] [git commit] openssl: disable libressl on uClibc noMMU
Message-ID: <20171106141125.BC94A81151@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f1a242e62c0654893e6563d09eb90a2ae807334
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc doesn't implement __register_atfork() on noMMU systems, causing
a build failure of libressl. Since openssl is available as an
alternative on such platforms, we just disable libressl on
uClibc/noMMU systems.

Fixes:

/home/thomas/projets/buildroot/output/build/libressl-2.5.5/crypto/.libs/libcrypto.a(arc4random.o): In function `_rs_init.part.1':
arc4random.c:(.text+0x74): undefined reference to `__register_atfork'
collect2: error: ld returned 1 exit status

This build issue is not visible in the autobuilders, because libressl
is only selectable through a choice, which isn't randomized by the
autobuilder logic.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssl/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index e33320a..d840331 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -48,6 +48,8 @@ endif
 config BR2_PACKAGE_LIBRESSL
 	bool "libressl"
 	depends on !BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	# uClibc on noMMU doesn't provide __register_atfork()
+	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
 	help
 	  LibreSSL is a version of the TLS/crypto stack forked from
 	  OpenSSL in 2014, with goals of modernizing the codebase,
