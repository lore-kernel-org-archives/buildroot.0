From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 20 Jul 2015 23:15:15 +0200
Subject: [Buildroot] [PATCH 3/3] package/libtirpc: Do not build unsupported
	API files
In-Reply-To: <1437426915-4608-1-git-send-email-joerg.krause@embedded.rocks>
References: <1437426915-4608-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1437426915-4608-3-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 0.3.2 re-enables some APIs for backward compatibility with
glibc's SunRPC:
  - key_prot
  - netname
  - rtime

Unfortunalty, this breaks building libtirpc with uClibc and musl:
  getpublickey.c:41:28: fatal error: rpcsvc/yp_prot.h: No such file or directory

We disable those API files again to support building libtirpc with these two
libc's.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../0007-Do-not-build-unsupported-API-files.patch  | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/libtirpc/0007-Do-not-build-unsupported-API-files.patch

diff --git a/package/libtirpc/0007-Do-not-build-unsupported-API-files.patch b/package/libtirpc/0007-Do-not-build-unsupported-API-files.patch
new file mode 100644
index 0000000..c0beb29
--- /dev/null
+++ b/package/libtirpc/0007-Do-not-build-unsupported-API-files.patch
@@ -0,0 +1,42 @@
+From 1c074c8aa9dec92586bf01fb8bdbc59f828ca3d4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Mon, 20 Jul 2015 22:49:41 +0200
+Subject: [PATCH 7/7] Remove unsupported API files
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Version 0.3.2 re-enables some APIs for backward compatibility with
+glibc's SunRPC:
+  - key_prot
+  - netname
+  - rtime
+
+Unfortunalty, this breaks building libtirpc with uClibc and musl:
+  getpublickey.c:41:28: fatal error: rpcsvc/yp_prot.h: No such file or directory
+
+We disable those API files to support building libtirpc with these two libc's.
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ src/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index cf8a8ca..2b26a29 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -68,8 +68,8 @@ if GSS
+     libtirpc_la_CFLAGS = -DHAVE_RPCSEC_GSS $(GSSAPI_CFLAGS)
+ endif
+ 
+-libtirpc_la_SOURCES += key_call.c key_prot_xdr.c getpublickey.c
+-libtirpc_la_SOURCES += netname.c netnamer.c rtime.c
++#libtirpc_la_SOURCES += key_call.c key_prot_xdr.c getpublickey.c
++#libtirpc_la_SOURCES += netname.c netnamer.c rtime.c
+ 
+ CLEANFILES	       = cscope.* *~
+ DISTCLEANFILES	       = Makefile.in
+-- 
+2.4.6
+
-- 
2.4.6
