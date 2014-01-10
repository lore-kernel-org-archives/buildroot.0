From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2014 15:40:21 +0100
Subject: [Buildroot] [git commit] openssl: fix bug #6770
Message-ID: <20140110144314.680059BF3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e85696b9bf8733a94e9a9548c930ab15c38bef5a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openssl 1.0.1f Makefile.org doesn't quote $(CC) when passing the
parameter in another invocation of make, hence breaking when the
compiler string contains a space with multiple strings (for example with
ccache).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssl/openssl-003-quote-cc.patch |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

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
