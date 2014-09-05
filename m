From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  5 Sep 2014 13:44:41 +0200
Subject: [Buildroot] [PATCH] package/monit: do not forcibly build a static
	binary
Message-ID: <1409917481-14205-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Static linking with glibc is not really supported, because of the NSS
libraries that are still to be dynamically-loaded at runtime.

Also, Buildroot explicitly does not support statically linking with
glibc.

Reported-by: Peter K?mmel <syntheticpp@gmx.net>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/monit/monit-0001-no-force-static.patch | 20 ++++++++++++++++++++
 package/monit/monit.mk                         |  9 +++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 package/monit/monit-0001-no-force-static.patch

diff --git a/package/monit/monit-0001-no-force-static.patch b/package/monit/monit-0001-no-force-static.patch
new file mode 100644
index 0000000..edb619b
--- /dev/null
+++ b/package/monit/monit-0001-no-force-static.patch
@@ -0,0 +1,20 @@
+Do not force building a statically-linked binary
+
+Statically-linked binary do not work well with glibc, because it
+still dlopen()s the NSS libraries.
+
+Reported-by: Peter K?mmel <syntheticpp@gmx.net>
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN monit-5.7.orig/Makefile.am monit-5.7/Makefile.am
+--- monit-5.7.orig/Makefile.am	2014-02-20 09:00:42.000000000 +0100
++++ monit-5.7/Makefile.am	2014-09-05 12:49:43.711104001 +0200
+@@ -85,7 +85,7 @@
+ 		  src/process/sysdep_ at ARCH@.c
+  
+ monit_LDADD 	= libmonit/libmonit.la
+-monit_LDFLAGS 	= -static $(EXTLDFLAGS)
++monit_LDFLAGS 	= $(EXTLDFLAGS)
+ 
+ man_MANS 	= monit.1
+ 
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 25bb5a2..fa3a6d8 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -8,6 +8,15 @@ MONIT_VERSION = 5.7
 MONIT_SITE = http://mmonit.com/monit/dist
 MONIT_LICENSE = AGPLv3 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
+#
+# Touching Makefile.am:
+MONIT_AUTORECONF = YES
+
+# Missing m4/ directory in the source tree
+define MONIT_M4
+	mkdir $(@D)/m4
+endef
+MONIT_POST_PATCH_HOOKS += MONIT_M4
 
 MONIT_CONF_ENV = \
 	libmonit_cv_setjmp_available=yes \
-- 
1.9.1
