From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 21:27:02 +0200
Subject: [Buildroot] [git commit] package/pcsc-lite: disable documentation
Message-ID: <20190518192133.C3A6F88D36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a2ed15e98f19c04212d65e931c747e3aa916baf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/a6cd53b060c00e916b40d7bd6c99bd8232d0f978

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-Add-disable-documentation-option.patch    | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/package/pcsc-lite/0002-Add-disable-documentation-option.patch b/package/pcsc-lite/0002-Add-disable-documentation-option.patch
new file mode 100644
index 0000000000..6a083f5aa0
--- /dev/null
+++ b/package/pcsc-lite/0002-Add-disable-documentation-option.patch
@@ -0,0 +1,63 @@
+From 77ac8fcb78e3085577cd4eb5c4ac7746a5444f13 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 17 May 2019 15:48:35 +0200
+Subject: [PATCH] Add --disable-documentation option
+
+This option allows the user to disable man pages which can be useful if
+podman is not available
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/LudovicRousseau/PCSC/pull/60]
+---
+ configure.ac        | 7 +++++++
+ src/spy/Makefile.am | 2 ++
+ 2 files changed, 9 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 0fa5168..7d20c6e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -144,6 +144,12 @@ esac
+ AC_DEFINE_UNQUOTED(PCSC_ARCH, "$PCSC_ARCH", [PC/SC target architecture])
+ PCSCLITE_FEATURES="${PCSCLITE_FEATURES} $PCSC_ARCH $host"
+ 
++# --disable-documentation
++AC_ARG_ENABLE(documentation,
++	AS_HELP_STRING([--disable-documentation],[do not build documentation]),
++	[ enable_doc="${enableval}" ], [ enable_doc="yes" ] )
++AM_CONDITIONAL(ENABLE_DOC, test "$enable_doc" != "no")
++
+ # See if socket() is found from libsocket
+ AC_CHECK_LIB(socket, socket, [LIBS="$LIBS -lsocket"])
+ 
+@@ -446,6 +452,7 @@ use libsystemd:         ${use_libsystemd}
+ systemd unit directory: ${with_systemdsystemunitdir}
+ serial config dir.:     ${confdir_exp}
+ filter:                 ${use_filter}
++documentation:          ${enable_doc}
+ 
+ PCSCLITE_FEATURES:      ${PCSCLITE_FEATURES}
+ 
+diff --git a/src/spy/Makefile.am b/src/spy/Makefile.am
+index 3c3daee..0a83371 100644
+--- a/src/spy/Makefile.am
++++ b/src/spy/Makefile.am
+@@ -6,6 +6,7 @@ dist_bin_SCRIPTS = pcsc-spy
+ libpcscspy_la_SOURCES = \
+ 	libpcscspy.c
+ 
++if ENABLE_DOC
+ man_MANS = pcsc-spy.1
+ 
+ pcsc-spy.1: pcsc-spy.pod
+@@ -13,6 +14,7 @@ pcsc-spy.1: pcsc-spy.pod
+ 		--center="PC/SC lite" \
+ 		--release="$(PACKAGE_NAME) $(PACKAGE_VERSION)" \
+ 		$(srcdir)/pcsc-spy.pod > $@
++endif
+ 
+ EXTRA_DIST = install_spy.sh uninstall_spy.sh pcsc-spy.pod
+ CLEANFILES = pcsc-spy.1
+-- 
+2.20.1
+
