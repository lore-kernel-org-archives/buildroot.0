From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 6 Oct 2012 01:45:39 +0200
Subject: [Buildroot] [PATCH] mplayer: fix compilation of NEON assembly
	in libavcodec
In-Reply-To: <1349478193-13673-1-git-send-email-arnout@mind.be>
References: 506F6539.2060205@mind.be
 <1349478193-13673-1-git-send-email-arnout@mind.be>
Message-ID: <4E1BAE3FB98343E3A142EF4D798234F0@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi all

Thanks Arnout for the fix.

I did some tweaking in the makefile and found disabling the option MPLAYER_CONF_OPTS += --enable-neon 
yielded an errorfree build, but I lost the optimisation that way.


-----Oorspronkelijk bericht-----
Van: Arnout Vandecappelle (Essensium/Mind) [mailto:arnout at mind.be] 
Verzonden: zaterdag 6 oktober 2012 1:03
Aan: buildroot at busybox.net
CC: Arnout Vandecappelle (Essensium/Mind); Sagaert Johan
Onderwerp: [PATCH] mplayer: fix compilation of NEON assembly in libavcodec

Compilation of the NEON assembly fails unless neon is enabled in the compiler options.  This is probably not needed for all
combinations of gcc/binutils, but at least some need it and it certainly doesn't hurt.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 .../multimedia/mplayer/mplayer-1.1-fix-neon.patch   |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/multimedia/mplayer/mplayer-1.1-fix-neon.patch b/package/multimedia/mplayer/mplayer-1.1-fix-neon.patch
new file mode 100644
index 0000000..38c2adc
--- /dev/null
+++ b/package/multimedia/mplayer/mplayer-1.1-fix-neon.patch
@@ -0,0 +1,19 @@
+Compilation of the NEON assembly fails unless neon is enabled in the 
+compiler options.  This is probably not needed for all combinations of 
+gcc/binutils, but at least some need it and it certainly doesn't hurt.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+diff -Nrup mplayer-1.1.orig/configure mplayer-1.1/configure
+--- mplayer-1.1.orig/configure	2012-10-06 00:31:57.706985824 +0200
++++ mplayer-1.1/configure	2012-10-06 00:49:32.618948116 +0200
+@@ -2935,6 +2935,9 @@ if arm ; then
+     inline_asm_check '"vadd.i16 q0, q0, q0"' && neon=yes
+   fi
+   echores "$neon"
++  if test $neon = "yes" ; then
++    extra_cflags="$extra_cflags -mfpu=neon -mfloat-abi=softfp"
++  fi
+ 
+   echocheck "ARM THUMB"
+   if test $armthumb = "auto" ; then
--
tg: (2ba4eed..) t/mplayer-neon (depends on: master)
