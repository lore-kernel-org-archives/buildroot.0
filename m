From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 19:25:08 +0100
Subject: [Buildroot] [git commit] libnetfilter_conntrack: fix static linking
Message-ID: <20150114182636.429CA807CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=17cac79d6628b47448f529f35f052063b06ce251
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It has a hardcoded -ldl link invocation, so drop it. Fixes:
http://autobuild.buildroot.net/results/66ba5f76694d0738b113463579ce6b2fa49a89d6/

Also add hash file and rename uclinux patch to new naming convention.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...nntrack-01-uclinux.patch => 0001-uclinux.patch} |    0
 .../0002-src-Makefile.am-drop-hardcoded-ldl.patch  |   27 ++++++++++++++++++++
 .../libnetfilter_conntrack.hash                    |    3 ++
 .../libnetfilter_conntrack.mk                      |    1 +
 4 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/libnetfilter_conntrack/libnetfilter_conntrack-01-uclinux.patch b/package/libnetfilter_conntrack/0001-uclinux.patch
similarity index 100%
rename from package/libnetfilter_conntrack/libnetfilter_conntrack-01-uclinux.patch
rename to package/libnetfilter_conntrack/0001-uclinux.patch
diff --git a/package/libnetfilter_conntrack/0002-src-Makefile.am-drop-hardcoded-ldl.patch b/package/libnetfilter_conntrack/0002-src-Makefile.am-drop-hardcoded-ldl.patch
new file mode 100644
index 0000000..e5ad3ba
--- /dev/null
+++ b/package/libnetfilter_conntrack/0002-src-Makefile.am-drop-hardcoded-ldl.patch
@@ -0,0 +1,27 @@
+From b8d32eff8dbfff5a93b6ea6ee9f5747e16cb32c4 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 14 Jan 2015 10:53:20 -0300
+Subject: [PATCH] src/Makefile.am: drop hardcoded -ldl
+
+This breaks static builds where the toolchain completely lacks libdl.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ src/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 7d6c905..374598a 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -11,6 +11,6 @@ lib_LTLIBRARIES = libnetfilter_conntrack.la
+ libnetfilter_conntrack_la_LIBADD = conntrack/libnfconntrack.la \
+ 				   expect/libnfexpect.la \
+ 				   ${LIBNFNETLINK_LIBS} ${LIBMNL_LIBS}
+-libnetfilter_conntrack_la_LDFLAGS = -Wc,-nostartfiles -lnfnetlink -ldl 	\
++libnetfilter_conntrack_la_LDFLAGS = -Wc,-nostartfiles -lnfnetlink \
+ 				    -version-info $(LIBVERSION)
+ libnetfilter_conntrack_la_SOURCES = main.c callback.c
+-- 
+2.0.5
+
diff --git a/package/libnetfilter_conntrack/libnetfilter_conntrack.hash b/package/libnetfilter_conntrack/libnetfilter_conntrack.hash
new file mode 100644
index 0000000..13fde40
--- /dev/null
+++ b/package/libnetfilter_conntrack/libnetfilter_conntrack.hash
@@ -0,0 +1,3 @@
+# From ftp://ftp.netfilter.org/pub/libnetfilter_conntrack/libnetfilter_conntrack-1.0.4.tar.bz2.{md5sum,sha1sum}
+md5	18cf80c4b339a3285e78822dbd4f08d7 	libnetfilter_conntrack-1.0.4.tar.bz2
+sha1	34fae1a30cbd51d46945e9f35790118c3462b0c6	libnetfilter_conntrack-1.0.4.tar.bz2
diff --git a/package/libnetfilter_conntrack/libnetfilter_conntrack.mk b/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
index df037b9..7841f27 100644
--- a/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
+++ b/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
@@ -9,6 +9,7 @@ LIBNETFILTER_CONNTRACK_SOURCE = libnetfilter_conntrack-$(LIBNETFILTER_CONNTRACK_
 LIBNETFILTER_CONNTRACK_SITE = http://www.netfilter.org/projects/libnetfilter_conntrack/files
 LIBNETFILTER_CONNTRACK_INSTALL_STAGING = YES
 LIBNETFILTER_CONNTRACK_DEPENDENCIES = host-pkgconf libnfnetlink libmnl
+# For 0001-uclinux.patch & 0002-src-Makefile.am-drop-hardcoded-ldl.patch
 LIBNETFILTER_CONNTRACK_AUTORECONF = YES
 LIBNETFILTER_CONNTRACK_LICENSE = GPLv2+
 LIBNETFILTER_CONNTRACK_LICENSE_FILES = COPYING
