From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 16 Apr 2015 22:12:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: Fix ranlib check when
	cross-compiling
In-Reply-To: <1429215155-2085-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429215155-2085-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429215155-2085-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/d13/d13488a43f6e034623104a36c07114db99325b8d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/0016-ranlib.patch |   35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/ffmpeg/0016-ranlib.patch

diff --git a/package/ffmpeg/0016-ranlib.patch b/package/ffmpeg/0016-ranlib.patch
new file mode 100644
index 0000000..e88b25f
--- /dev/null
+++ b/package/ffmpeg/0016-ranlib.patch
@@ -0,0 +1,35 @@
+Fix ranlib check when cross-compiling
+
+Without this patch /usr/bin/ranlib is tested for "-D", not ranlib from the
+cross-compiler suite being in use.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr ffmpeg-2.6.2.org/configure ffmpeg-2.6.2/configure
+--- ffmpeg-2.6.2.org/configure	2015-04-12 00:47:55.000000000 +0200
++++ ffmpeg-2.6.2/configure	2015-04-16 21:53:24.313202517 +0200
+@@ -2719,11 +2719,6 @@
+ nm_default="nm -g"
+ objformat="elf"
+ pkg_config_default=pkg-config
+-if ranlib 2>&1 | grep -q "\-D "; then
+-    ranlib_default="ranlib -D"
+-else
+-    ranlib_default="ranlib"
+-fi
+ strip_default="strip"
+ yasmexe_default="yasm"
+ windres_default="windres"
+@@ -3001,6 +2996,12 @@
+         die "Must specify target arch and OS when cross-compiling"
+ fi
+ 
++if "${cross_prefix}ranlib" 2>&1 | grep -q "\-D "; then
++    ranlib_default="ranlib -D"
++else
++    ranlib_default="ranlib"
++fi
++
+ test -n "$valgrind" && toolchain="valgrind-memcheck"
+ 
+ case "$toolchain" in
-- 
1.7.10.4
