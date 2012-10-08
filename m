From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Oct 2012 22:27:46 +0200
Subject: [Buildroot] [PATCH] mplayer: fix compilation of NEON assembly
	in libavcodec
In-Reply-To: <1349478193-13673-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 6 Oct 2012 01:03:13 +0200")
References: <1349478193-13673-1-git-send-email-arnout@mind.be>
Message-ID: <87pq4s3e0t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> Compilation of the NEON assembly fails unless neon is enabled in the
 Arnout> compiler options.  This is probably not needed for all combinations of
 Arnout> gcc/binutils, but at least some need it and it certainly doesn't hurt.

 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Arnout> ---
 Arnout>  .../multimedia/mplayer/mplayer-1.1-fix-neon.patch   |   19 +++++++++++++++++++
 Arnout>  1 file changed, 19 insertions(+)

 Arnout> diff --git a/package/multimedia/mplayer/mplayer-1.1-fix-neon.patch b/package/multimedia/mplayer/mplayer-1.1-fix-neon.patch
 Arnout> new file mode 100644
 Arnout> index 0000000..38c2adc
 Arnout> --- /dev/null
 Arnout> +++ b/package/multimedia/mplayer/mplayer-1.1-fix-neon.patch
 Arnout> @@ -0,0 +1,19 @@
 Arnout> +Compilation of the NEON assembly fails unless neon is enabled in the
 Arnout> +compiler options.  This is probably not needed for all combinations of
 Arnout> +gcc/binutils, but at least some need it and it certainly doesn't hurt.
 Arnout> +
 Arnout> +Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Arnout> +---
 Arnout> +diff -Nrup mplayer-1.1.orig/configure mplayer-1.1/configure
 Arnout> +--- mplayer-1.1.orig/configure	2012-10-06 00:31:57.706985824 +0200
 Arnout> ++++ mplayer-1.1/configure	2012-10-06 00:49:32.618948116 +0200
 Arnout> +@@ -2935,6 +2935,9 @@ if arm ; then
 Arnout> +     inline_asm_check '"vadd.i16 q0, q0, q0"' && neon=yes
 Arnout> +   fi
 Arnout> +   echores "$neon"
 Arnout> ++  if test $neon = "yes" ; then
 Arnout> ++    extra_cflags="$extra_cflags -mfpu=neon -mfloat-abi=softfp"

Why softfp? Is that just an optimization or is it needed? How does that
work with a hardfp toolchain/libraries?

Please document why this is needed (if it is) in the commit message and
resubmit, thanks.

-- 
Bye, Peter Korsgaard
