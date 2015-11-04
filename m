From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Wed, 4 Nov 2015 12:31:37 +0100
Subject: [Buildroot] Illegal instruction by python's xmlrpclib on
 powerpc64, gcc-4.9
In-Reply-To: <20151104114923.67eb85d6@free-electrons.com>
References: <CAM+bi4sfbXMkgow7-ku+u2f5ypEM1WGPAuRRvkkjUA-Z05KnqQ@mail.gmail.com>
 <20151103151730.1e9dcc3c@free-electrons.com>
 <CAM+bi4sGFXwL3AqiqmVoxQtOXXVyHH32sVEfpKp+-0PO32afpg@mail.gmail.com>
 <20151104114923.67eb85d6@free-electrons.com>
Message-ID: <CAM+bi4tcURvBDSKHieDumCMrDG7o1xkXJ8fizHNAtQtcYnwo1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Thomas

2015-11-04 11:49 GMT+01:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Alvaro Gamez,
>
> Ok, so fsqrt is not available on this CPU core.
>
> I believe this problem might be fixed by glibc commit
> 08cee2a464f614a6d4275b5af6c52481f1aa16e6, which has been merged since
> glibc 2.21. Which glibc version have you been using so far ?
>
> See
>
> https://sourceware.org/git/?p=glibc.git;a=commit;h=08cee2a464f614a6d4275b5af6c52481f1aa16e6
> and https://sourceware.org/bugzilla/show_bug.cgi?id=16576.
>

Until now, I've been testing this with buildroots' glibc-2.21. I've just
done the same tests by selecting BR2_GLIBC_VERSION_2_22=y (I've confirmed
that libc.so.6 -> /lib64/libc-2.22.so), but it still compiles that with
fsqrt.

I've reviewed those patches and they are in fact applied on what buildroot
is downloading. However, that patch seems to depend on _ARCH_PPCSQ not
being defined.

I've found on host-gcc-final-4.9.3/gcc/config/rs6000:
  if ((flags & OPTION_MASK_PPC_GPOPT) != 0)
    rs6000_define_or_undefine_macro (define_p, "_ARCH_PPCSQ");

So it seems that this patch would make GPOPT be defined for e6500 CPU,
which in turn will avoid _ARCH_PPCSQ from being defined. I guess once I
test and very this, this should be a patch sent to the gcc people?

Thanks a lot for your guidance!


diff -urN host-gcc-final-4.9.3/gcc/config/rs6000/rs6000-cpus.def
host-gcc-final-4.9.3.mio/gcc/config/rs6000/rs6000-cpus.def
--- host-gcc-final-4.9.3/gcc/config/rs6000/rs6000-cpus.def    2015-11-04
12:30:01.539224474 +0100
+++ host-gcc-final-4.9.3.mio/gcc/config/rs6000/rs6000-cpus.def
2015-11-04 12:28:20.806611098 +0100
@@ -157,7 +157,7 @@
 RS6000_CPU ("e5500", PROCESSOR_PPCE5500,
         MASK_POWERPC64 | MASK_PPC_GFXOPT | MASK_ISEL)
 RS6000_CPU ("e6500", PROCESSOR_PPCE6500, POWERPC_7400_MASK | MASK_POWERPC64
-        | MASK_MFCRF | MASK_ISEL)
+        | MASK_MFCRF | MASK_ISEL | MASK_PPC_GPOPT)
 RS6000_CPU ("860", PROCESSOR_MPCCORE, MASK_SOFT_FLOAT)
 RS6000_CPU ("970", PROCESSOR_POWER4,
         POWERPC_7400_MASK | MASK_PPC_GPOPT | MASK_MFCRF | MASK_POWERPC64)



-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151104/993469ad/attachment.html>
