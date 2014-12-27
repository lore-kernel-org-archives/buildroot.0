From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Dec 2014 14:30:52 +0100
Subject: [Buildroot] [PATCH] package/nftables: do not build docs
Message-ID: <1419687052-24398-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building docs requires dblatex with a working Jade Wrapper (jw) which
may well be missing on the build machine, and we do not build our own.

Since docs are anyway removed from the target, just do not build them to
start with.

Note: patching the Makefile.am is the most straightforward way of doing
it, although we may also pre-set a bunch of variables when calling
./configure;
  - DBLATEX=no to disable PDF generation
  - DOCBOOK2X_MAN=no, DOCBOOK2MAN=no and DB2X_DOCBOOK2MAN=no to disable
    manpage generation

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/nftables/0001-dont-build-docs.patch | 24 ++++++++++++++++++++++++
 package/nftables/nftables.mk                |  8 ++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 package/nftables/0001-dont-build-docs.patch

diff --git a/package/nftables/0001-dont-build-docs.patch b/package/nftables/0001-dont-build-docs.patch
new file mode 100644
index 0000000..945010f
--- /dev/null
+++ b/package/nftables/0001-dont-build-docs.patch
@@ -0,0 +1,24 @@
+Makefile: do not build docs
+
+Building docs fail with:
+
+    [...]
+      GEN    nft.8
+      GEN    nft.pdf
+    Usage: jw [<options>] <sgml_file>
+    where <options> are:
+    [...]
+
+Since we are not interested in docs on the target, just do not build
+them to start with.
+ 
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+diff -durN nftables-0.4.orig/Makefile.am nftables-0.4/Makefile.am
+--- nftables-0.4.orig/Makefile.am	2014-11-14 18:37:53.491326930 +0100
++++ nftables-0.4/Makefile.am	2014-12-27 14:06:35.929187185 +0100
+@@ -2,5 +2,4 @@
+ 
+ SUBDIRS = 	src	\
+ 		include	\
+-		doc	\
+ 		files
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 9f18df7..9d71240 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -12,6 +12,14 @@ NFTABLES_DEPENDENCIES = gmp libmnl libnftnl readline host-bison host-flex \
 NFTABLES_LICENSE = GPLv2
 NFTABLES_LICENSE_FILES = COPYING
 
+# Touching Makefile.am:
+NFTABLES_AUTORECONF = YES
+
+define NFTABLES_M4_DIR
+	mkdir -p $(@D)/m4
+endef
+NFTABLES_POST_PATCH_HOOKS += NFTABLES_M4_DIR
+
 NFTABLES_LIBS = -lncurses
 ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_LIBNFTNL_JSON),yy)
 NFTABLES_LIBS += -ljansson -lm
-- 
1.9.1
