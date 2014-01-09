From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  9 Jan 2014 20:20:14 -0300
Subject: [Buildroot] [PATCH] openssl: fix bug #6770
Message-ID: <1389309614-17911-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openssl 1.0.1f Makefile.org doesn't quote $(CC) when passing the
parameter in another invocation of make, hence breaking when the
compiler string contains a space with multiple strings (for example with
ccache).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssl/openssl-003-quote-cc.patch | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 package/openssl/openssl-003-quote-cc.patch

diff --git a/package/openssl/openssl-003-quote-cc.patch b/package/openssl/openssl-003-quote-cc.patch
new file mode 100644
index 0000000..2c035d9
--- /dev/null
+++ b/package/openssl/openssl-003-quote-cc.patch
@@ -0,0 +1,21 @@
+From 9aef04d9baa0a4bb5b8db92e9ab93b0a857a7659 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Thu, 9 Jan 2014 20:08:04 -0300
+Subject: [PATCH] Makefile.org: enclose CC parameter passing in quotes
+
+The compiler invocation might contain a space like when using ccache.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura openssl-1.0.1f.orig/Makefile.org openssl-1.0.1f/Makefile.org
+--- openssl-1.0.1f.orig/Makefile.org	2014-01-09 19:57:23.324040960 -0300
++++ openssl-1.0.1f/Makefile.org	2014-01-09 20:11:23.821070726 -0300
+@@ -302,7 +302,7 @@
+ 			FIPSLD_CC="$(CC)"; CC=$(FIPSDIR)/bin/fipsld; \
+ 			export CC FIPSLD_CC FIPSLD_LIBCRYPTO; \
+ 		fi; \
+-		$(MAKE) -e SHLIBDIRS=crypto  CC=$${CC:-$(CC)} build-shared; \
++		$(MAKE) -e SHLIBDIRS=crypto  CC="$${CC:-$(CC)}" build-shared; \
+ 		touch -c fips_premain_dso$(EXE_EXT); \
+ 	else \
+ 		echo "There's no support for shared libraries on this platform" >&2; \
-- 
1.8.3.2
