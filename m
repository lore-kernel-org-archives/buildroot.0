From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 16 Apr 2019 12:21:25 +0200
Subject: [Buildroot] [PATCH] package/madplay: fix build failure due to old
 autotools macro
Message-ID: <20190416102125.124084-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MKINSTALLDIRS is not automatically called by autotools when
autoreconfigured.
This leads to have install stage error:
`/bin/sh @MKINSTALLDIRS@
/home/dawncrow/buildroot-test/scripts/instance-0/output/target/usr/share
/bin/sh: 0: Can't open @MKINSTALLDIRS@`
because @MKINSTALLDIRS@ doesn't get substituted during autoreconf.

Add patch that explicitly calls AM_MKINSTALLDIRS macro to substitute
every @MKINSTALLDIRS@ occurence in *.in Makefile.

Fixes:
http://autobuild.buildroot.net/results/744/7447c03426556f787f20f7ab2d36f0cacc4af1bd/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 ...4-configure-ac-call-AM_MKINSTALLDIRS.patch | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch

diff --git a/package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch b/package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch
new file mode 100644
index 0000000000..bc6c97efae
--- /dev/null
+++ b/package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch
@@ -0,0 +1,23 @@
+configure.ac: call AM_MKINSTALLDIRS to substitute @MKINSTALLDIRS@
+
+MKINSTALLDIRS is obsolete and doesn't get automatically called.
+
+Force call AM_MKINSTALLDIRS() macro to substitute every @MKINSTALLDIRS@
+occurence in *.in files.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+
+diff -urpN madplay-0.15.2b.orig/configure.ac madplay-0.15.2b/configure.ac
+--- madplay-0.15.2b.orig/configure.ac	2019-04-16 12:06:03.781018755 +0200
++++ madplay-0.15.2b/configure.ac	2019-04-16 12:07:48.399162610 +0200
+@@ -146,6 +146,10 @@ ALL_LINGUAS="en es fr hr no"
+ AM_GNU_GETTEXT([use-libtool])
+ AM_GNU_GETTEXT_VERSION(0.14.1)
+ 
++dnl Make sure AM_MKINSTALLDIRS gets called
++
++AM_MKINSTALLDIRS()
++
+ dnl Checks for header files.
+ 
+ AC_HEADER_STDC
-- 
2.17.1
