From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 15 Oct 2012 22:49:13 +0200
Subject: [Buildroot] [PATCH] mplayer: fix compilation of NEON assembly
	in libavcodec
In-Reply-To: <87d30qadw4.fsf@macbook.be.48ers.dk>
References: <1349478193-13673-1-git-send-email-arnout@mind.be>
 <87pq4s3e0t.fsf@macbook.be.48ers.dk> <50749743.5010700@mind.be>
 <87d30qadw4.fsf@macbook.be.48ers.dk>
Message-ID: <507C76C9.4080202@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/10/12 11:13, Peter Korsgaard wrote:
>   Arnout>   neon fpu (like vfp* fpu) can only be used with the softfp abi,
>   Arnout>  so both are needed.  This is kind of standard ARM knowledge:-)
>
> It is? I've never done any real work on platforms with neon, so it's
> certainly a bit fussy to me, but I don't understand what the relation is
> with the calling convention.
>
> Aren't the new linaro toolchains hardfp and support neon?

  So these are my conclusions.

- Neon with hard float abi is indeed possible - teaches me not to trust the
gcc manpages :-)  BTW, the float abi is not just the function calling convention,
but also how float variables are laid out in memory - that's why it has an
impact on assembly code as well.

- That means, you need mfloat-abi=softfp on soft abi libc (e.g. sourcery) and
mfloat-abi=hard on hard abi libc (e.g. linaro).  It will be tough for buildroot
to distinguish between them and select the right -mfloat-abi.  On Linaro,
-mfloat-abi=hard is the default so it can be left out, but on Sourcery,
-mfloat-abi=softfp is required (default is soft).

- Internal toolchains are soft abi unless
BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-float=hard" so they also need the
-mfloat-abi=softfp

- So we could just document in the external toolchains which options should be
given to enable neon.

- The vadd.i16 test in mplayer's configure script would detect that neon is not
available (because the -mfloat-abi and -mfpu options are not in CFLAGS) --
except that the test is disabled because we explicitly specify --enable-neon.

- ffmpeg itself always does the test, even if we give --enable-neon.


  So I propose to document the NEON options in the external toolchains, and to
remove --enable-neon from mplayer.  I'm not sure what to do with internal
and crosstool-ng toolchains.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
