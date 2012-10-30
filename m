From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 31 Oct 2012 00:04:37 +0100
Subject: [Buildroot] mpg123 segfaults on A8 (imx53)
In-Reply-To: <1A05C4080C29496381D223141719DD30@JohanW7>
References: <1A05C4080C29496381D223141719DD30@JohanW7>
Message-ID: <50905D05.5010000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/30/12 11:08, Sagaert Johan wrote:
> So i had a look at the configuration options and i think it might have something to do the the option  --with-cpu not
> being correct..

  arm_nofpu should work for any ARM processor...

> I tried :
> MPG123_CPU = neon
> But the build fails:
> ....
> dct64_neon_float.S:125: Error: selected processor does not support ARM mode `vmul.f32 q7,q11,q14'
> dct64_neon_float.S:127: Error: selected processor does not support ARM mode `vdup.32 q12,d31[0]'
> dct64_neon_float.S:128: Error: selected processor does not support ARM mode `vmov d31,d30'
> dct64_neon_float.S:130: Error: selected processor does not support ARM mode `vsw
> ....

  Depending on how the toolchain is compiled, you may need to add
-mfloat-abi=softfp -mfpu=neon or -mfloat-abi=hard -mfpu=neon to the CFLAGS
to get neon support.

  But I doubt that that's the issue - illegal instructions give SIGILL, not
SIGSEGV.  So your only option is to debug mpg123 with gdbserver or valgrind.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
