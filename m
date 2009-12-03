From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri,  4 Dec 2009 00:02:02 +0100
Subject: [Buildroot] [PATCH 2/3] tremor: add patch to export all symbols
In-Reply-To: <1259881323-4308-1-git-send-email-s.neumann@raumfeld.com>
References: <1259881323-4308-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1259881323-4308-2-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tremor comes with a Version_script file that limits the
list of exported symbols. Without these symbols we can't
build the ivorbisdec GStreamer plug-in (and probably other
application). This commit adds a patch that removes this
limitation and makes all global symbols available.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 .../tremor/tremor-export-all-symbols.patch         |   32 ++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/tremor/tremor-export-all-symbols.patch

diff --git a/package/multimedia/tremor/tremor-export-all-symbols.patch b/package/multimedia/tremor/tremor-export-all-symbols.patch
new file mode 100644
index 0000000..127d16b
--- /dev/null
+++ b/package/multimedia/tremor/tremor-export-all-symbols.patch
@@ -0,0 +1,32 @@
+--- tremor-16259-orig/configure.in	2009-12-02 11:45:11.000000000 +0100
++++ tremor-16259/configure.in	2009-12-03 16:50:19.000000000 +0100
+@@ -72,23 +72,6 @@
+ LDFLAGS="$LDFLAGS $ldflags_save"
+ 
+ 
+-# Test whenever ld supports -version-script
+-AC_PROG_LD
+-AC_PROG_LD_GNU
+-if test "x$lt_cv_prog_gnu_ld" = "xyes"; then
+-   SHLIB_VERSION_ARG="Wl,--version-script=Version_script"
+-
+-   dnl Set extra linker options
+-   case "$target_os" in
+-  linux* | solaris* )
+-    SHLIB_VERSION_ARG="-Wl,--version-script=Version_script"
+-    ;;
+-  *)
+-    ;;
+-   esac
+-   LDFLAGS="$LDFLAGS $SHLIB_VERSION_ARG"
+-fi
+-
+ dnl --------------------------------------------------
+ dnl Options 
+ dnl --------------------------------------------------
+@@ -128,4 +111,4 @@
+ AC_SUBST(DEBUG)
+ AC_SUBST(PROFILE)
+ 
+-AC_OUTPUT(Makefile Version_script)
++AC_OUTPUT(Makefile)
-- 
1.6.5.3
