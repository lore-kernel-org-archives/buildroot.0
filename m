From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Jan 2010 17:04:12 +0100
Subject: [Buildroot] [git commit master] gstreamer: fix unaligned detection
	for x86-64
Message-ID: <20100118160513.73EB5776BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0099ed2bf03e9686cae43e1ec426804269c02aba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    6 ++--
 ....10.25-fix-unaligned-detectiob-for-x86-64.patch |   36 ++++++++++++++++++++
 2 files changed, 39 insertions(+), 3 deletions(-)
 create mode 100644 package/multimedia/gstreamer/gstreamer-0.10.25-fix-unaligned-detectiob-for-x86-64.patch

diff --git a/CHANGES b/CHANGES
index 0516e10..772a414 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,9 +5,9 @@
 	New packages: libcdaudio, libdvdnav, libdvdread, hostapd, tcpreplay
 
 	Updated/fixed packages: autoconf, bind, binutils, bootutils, busybox,
-	directfb, e2fsprogs, gst-plugins-bad, hal, iw, jpeg, libfuse, libpcap,
-	libungif, lighttpd, mesa, mpg123, mtd-utils, neon, pcre, qt, rpm,
-	sshfs, tremor, u-boot, usbutils, xfsprogs
+	directfb, e2fsprogs, gstreamer, gst-plugins-bad, hal, iw, jpeg,
+	libfuse, libpcap, libungif, lighttpd, mesa, mpg123, mtd-utils, neon,
+	pcre, qt, rpm, sshfs, tremor, u-boot, usbutils, xfsprogs
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/multimedia/gstreamer/gstreamer-0.10.25-fix-unaligned-detectiob-for-x86-64.patch b/package/multimedia/gstreamer/gstreamer-0.10.25-fix-unaligned-detectiob-for-x86-64.patch
new file mode 100644
index 0000000..1635fe7
--- /dev/null
+++ b/package/multimedia/gstreamer/gstreamer-0.10.25-fix-unaligned-detectiob-for-x86-64.patch
@@ -0,0 +1,36 @@
+[PATCH] gst-arch.m4: fix unaligned detection for x86-64 when cross compiling
+
+Submitted upstream at https://bugzilla.gnome.org/show_bug.cgi?id=607317
+
+Commit 4221e9dc (amd64/x86_64 allows unaligned memory access too) added
+x86-64 to the unaligned access whitelist, but missed the trailing
+wildcards, so the test never succeeds (host is something like
+x86_64-unknown-linux-gnu).
+
+When building natively, this isn't a big deal as the AC_TRY_RUN test
+correctly detects it, but that doesn't work when cross compiling so
+the build dies with:
+
+configure: error: cannot run test program while cross compiling
+See `config.log' for more details.
+
+Fix it by adding the trailing wildcards.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ configure |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: gstreamer-0.10.25/configure
+===================================================================
+--- gstreamer-0.10.25.orig/configure
++++ gstreamer-0.10.25/configure
+@@ -15655,7 +15655,7 @@ $as_echo_n "checking if unaligned memory
+         $as_echo_n "(blacklisted) " >&6
+         as_cv_unaligned_access=no
+ 	;;
+-      i?86*|x86_64|amd64|powerpc*|m68k*|cris*)
++      i?86*|x86_64*|amd64*|powerpc*|m68k*|cris*)
+         $as_echo_n "(whitelisted) " >&6
+         as_cv_unaligned_access=yes
+ 	;;
-- 
1.6.3.3
