From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:23:52 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/madplay: fix
 build when NLS is enabled
Message-ID: <20190426130222.A822981470@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffb839ce3ea186f7593d832de86d3dbd56594bb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

MKINSTALLDIRS is not automatically called by autotools when
autoreconfigured.
This leads to the following error during install:

`/bin/sh @MKINSTALLDIRS@ /home/dawncrow/buildroot-test/scripts/instance-0/output/target/usr/share
/bin/sh: 0: Can't open @MKINSTALLDIRS@`

because @MKINSTALLDIRS@ doesn't get substituted during autoreconf.

This particular command only gets invoked when NLS is enabled.

Add patch that explicitly calls AM_MKINSTALLDIRS macro to substitute
every @MKINSTALLDIRS@ occurence in *.in Makefile.

Patch is not sent upstream since upstream is dead.

Fixes:
http://autobuild.buildroot.net/results/744/7447c03426556f787f20f7ab2d36f0cacc4af1bd/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 00b733a39b0fe3902c96f6734c4f82c310cffc26)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0004-configure-ac-call-AM_MKINSTALLDIRS.patch  | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch b/package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch
new file mode 100644
index 0000000000..7d3fb8ddc6
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
++dnl Substitute MKINSTALLDIRS
++
++AM_MKINSTALLDIRS()
++
+ dnl Checks for header files.
+ 
+ AC_HEADER_STDC
