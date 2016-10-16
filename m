From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 16 Oct 2016 11:25:26 +0100
Subject: [Buildroot] [PATCH v2] libiscsi: bump version to 1.18.0
Message-ID: <20161016102526.59060-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also...

- Switch to GitHub.
- Remove LD=CC logic in libscsi.mk. This is now handled by the configure
  script.
- Add patch to fix unsafe include paths issues. This patch has been sent
  upstream as a pull request.
- Use a hook to create the m4 directory so autoreconf doesn't fail.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
 - Do not run autogen.sh. Instead, create an empty m4 directory and use
   our autoreconf mechanism.

 ...lude.-This-is-unsafe-when-cross-compiling.patch | 67 ++++++++++++++++++++++
 package/libiscsi/libiscsi.hash                     |  2 +-
 package/libiscsi/libiscsi.mk                       | 15 +++--
 3 files changed, 78 insertions(+), 6 deletions(-)
 create mode 100644 package/libiscsi/0001-Do-not-use-I-usr-include.-This-is-unsafe-when-cross-compiling.patch

diff --git a/package/libiscsi/0001-Do-not-use-I-usr-include.-This-is-unsafe-when-cross-compiling.patch b/package/libiscsi/0001-Do-not-use-I-usr-include.-This-is-unsafe-when-cross-compiling.patch
new file mode 100644
index 0000000..dc047ef
--- /dev/null
+++ b/package/libiscsi/0001-Do-not-use-I-usr-include.-This-is-unsafe-when-cross-compiling.patch
@@ -0,0 +1,67 @@
+From f27bdf64f0c375352ca42928071a9178a5a04c46 Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Sun, 16 Oct 2016 10:53:13 +0100
+Subject: [PATCH] Do not use -I/usr/include. This is unsafe when cross-compiling.
+
+Upstream status: PR sent (https://github.com/sahlberg/libiscsi/pull/219)
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ examples/Makefile.am | 2 +-
+ lib/Makefile.am      | 2 +-
+ tests/Makefile.am    | 2 +-
+ utils/Makefile.am    | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/examples/Makefile.am b/examples/Makefile.am
+index 0de0b1f..42ad818 100644
+--- a/examples/Makefile.am
++++ b/examples/Makefile.am
+@@ -1,6 +1,6 @@
+ AM_CPPFLAGS=-I. -I${srcdir}/../include "-D_U_=__attribute__((unused))" \
+ 	"-D_R_(A,B)=__attribute__((format(printf,A,B)))"
+-AM_CFLAGS=$(WARN_CFLAGS) -I/usr/include
++AM_CFLAGS=$(WARN_CFLAGS)
+ LDADD = ../lib/libiscsi.la
+ 
+ noinst_PROGRAMS = iscsiclient iscsi-dd
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index d612fb7..47ffc33 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -29,7 +29,7 @@ libiscsi_la_CPPFLAGS = -I${srcdir}/../include -I$(srcdir)/include \
+ 	"-D_U_=__attribute__((unused))" \
+ 	"-D_R_(A,B)=__attribute__((format(printf,A,B)))"
+ 
+-AM_CFLAGS=$(WARN_CFLAGS) -I/usr/include
++AM_CFLAGS=$(WARN_CFLAGS)
+ 
+ dist_noinst_DATA = libiscsi.syms libiscsi.def
+ 
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 9d699fc..b4cbf21 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -1,6 +1,6 @@
+ AM_CPPFLAGS = -I../include "-D_U_=__attribute__((unused))" \
+ 	"-D_R_(A,B)=__attribute__((format(printf,A,B)))"
+-AM_CFLAGS = $(WARN_CFLAGS) -I/usr/include
++AM_CFLAGS = $(WARN_CFLAGS)
+ LDADD = ../lib/libiscsi.la
+ 
+ noinst_PROGRAMS = prog_reconnect prog_reconnect_timeout prog_noop_reply \
+diff --git a/utils/Makefile.am b/utils/Makefile.am
+index 657ca9d..bde1c81 100644
+--- a/utils/Makefile.am
++++ b/utils/Makefile.am
+@@ -1,6 +1,6 @@
+ AM_CPPFLAGS = -I${srcdir}/../include "-D_U_=__attribute__((unused))" \
+ 	"-D_R_(A,B)=__attribute__((format(printf,A,B)))"
+-AM_CFLAGS = $(WARN_CFLAGS) -I/usr/include
++AM_CFLAGS = $(WARN_CFLAGS)
+ LDADD = ../lib/libiscsi.la
+ 
+ bin_PROGRAMS = iscsi-inq iscsi-ls iscsi-perf iscsi-readcapacity16 \
+-- 
+2.10.0
+
diff --git a/package/libiscsi/libiscsi.hash b/package/libiscsi/libiscsi.hash
index 8ccc264..4f7d1af 100644
--- a/package/libiscsi/libiscsi.hash
+++ b/package/libiscsi/libiscsi.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 26aa5583053d4fe0d4686f76a76c216c7dce00130f008e652ece305b88758ff1  libiscsi-1.15.0.tar.gz
+sha256 464d104e12533dc11f0dd7662cbc2f01c132f94aa4f5bd519e3413ef485830e8  libiscsi-1.18.0.tar.gz
diff --git a/package/libiscsi/libiscsi.mk b/package/libiscsi/libiscsi.mk
index 71c10c1..37e06c2 100644
--- a/package/libiscsi/libiscsi.mk
+++ b/package/libiscsi/libiscsi.mk
@@ -4,14 +4,19 @@
 #
 ################################################################################
 
-LIBISCSI_VERSION = 1.15.0
-LIBISCSI_SITE = https://sites.google.com/site/libiscsitarballs/libiscsitarballs
+LIBISCSI_VERSION = 1.18.0
+LIBISCSI_SITE = $(call github,sahlberg,libiscsi,$(LIBISCSI_VERSION))
 LIBISCSI_LICENSE = GPLv2+, LGPLv2.1+
 LIBISCSI_LICENSE_FILES = COPYING LICENCE-GPL-2.txt LICENCE-LGPL-2.1.txt
 LIBISCSI_INSTALL_STAGING = YES
+LIBISCSI_AUTORECONF = YES
 
-# Force libiscsi to use gcc as the linker, otherwise it uses directly
-# ld, which doesn't work for certain architectures.
-LIBISCSI_CONF_ENV = LD="$(TARGET_CC)"
+# We need to create the m4 directory to make sure that autoreconf will
+# start calling libtoolize. Otherwise it will start with aclocal and it
+# will fail because the m4 directory doesn't exist.
+define LIBISCSI_CREATE_M4_DIR
+	mkdir -p $(@D)/m4
+endef
+LIBISCSI_POST_PATCH_HOOKS += LIBISCSI_CREATE_M4_DIR
 
 $(eval $(autotools-package))
-- 
2.10.0
