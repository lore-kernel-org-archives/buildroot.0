From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 09 Oct 2012 23:29:39 +0200
Subject: [Buildroot] [PATCH] mplayer: fix compilation of NEON assembly
	in libavcodec
In-Reply-To: <87pq4s3e0t.fsf@macbook.be.48ers.dk>
References: <1349478193-13673-1-git-send-email-arnout@mind.be>
 <87pq4s3e0t.fsf@macbook.be.48ers.dk>
Message-ID: <50749743.5010700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/10/12 22:27, Peter Korsgaard wrote:
>   Arnout>  +diff -Nrup mplayer-1.1.orig/configure mplayer-1.1/configure
>   Arnout>  +--- mplayer-1.1.orig/configure	2012-10-06 00:31:57.706985824 +0200
>   Arnout>  ++++ mplayer-1.1/configure	2012-10-06 00:49:32.618948116 +0200
>   Arnout>  +@@ -2935,6 +2935,9 @@ if arm ; then
>   Arnout>  +     inline_asm_check '"vadd.i16 q0, q0, q0"'&&  neon=yes
>   Arnout>  +   fi
>   Arnout>  +   echores "$neon"
>   Arnout>  ++  if test $neon = "yes" ; then
>   Arnout>  ++    extra_cflags="$extra_cflags -mfpu=neon -mfloat-abi=softfp"
>
> Why softfp? Is that just an optimization or is it needed? How does that
> work with a hardfp toolchain/libraries?
>
> Please document why this is needed (if it is) in the commit message and
> resubmit, thanks.

  neon fpu (like vfp* fpu) can only be used with the softfp abi, so both are
needed.  This is kind of standard ARM knowledge :-)  Admittedly, it's silly
of gcc that it doesn't automatically set the float-abi to the only supported
one...

  Toolchains that hardcode -mfloat-abi=hard cannot have neon instructions,
I suppose.  I haven't tested it though.

  I also don't know what happens with an external toolchain that has
BR2_VFP_FLOAT set, because that option adds an -mfpu=vfp to the toolchain
command line.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
