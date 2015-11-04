From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Wed, 4 Nov 2015 16:24:40 +0100
Subject: [Buildroot] Illegal instruction by python's xmlrpclib on
 powerpc64, gcc-4.9
In-Reply-To: <CAM+bi4tcURvBDSKHieDumCMrDG7o1xkXJ8fizHNAtQtcYnwo1A@mail.gmail.com>
References: <CAM+bi4sfbXMkgow7-ku+u2f5ypEM1WGPAuRRvkkjUA-Z05KnqQ@mail.gmail.com>
 <20151103151730.1e9dcc3c@free-electrons.com>
 <CAM+bi4sGFXwL3AqiqmVoxQtOXXVyHH32sVEfpKp+-0PO32afpg@mail.gmail.com>
 <20151104114923.67eb85d6@free-electrons.com>
 <CAM+bi4tcURvBDSKHieDumCMrDG7o1xkXJ8fizHNAtQtcYnwo1A@mail.gmail.com>
Message-ID: <CAM+bi4umtQ1ExSDbSHk32Udqz4TX8aQ3gwNawZgwkikUVdom8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi again!

2015-11-04 12:31 GMT+01:00 Alvaro Gamez <alvaro.gamez@hazent.com>:

>
> I've found on host-gcc-final-4.9.3/gcc/config/rs6000:
>   if ((flags & OPTION_MASK_PPC_GPOPT) != 0)
>     rs6000_define_or_undefine_macro (define_p, "_ARCH_PPCSQ");
>
> So it seems that this patch would make GPOPT be defined for e6500 CPU,
> which in turn will avoid _ARCH_PPCSQ from being defined. I guess once I
> test and very this, this should be a patch sent to the gcc people?
>
> diff -urN host-gcc-final-4.9.3/gcc/config/rs6000/rs6000-cpus.def
> host-gcc-final-4.9.3.mio/gcc/config/rs6000/rs6000-cpus.def
> --- host-gcc-final-4.9.3/gcc/config/rs6000/rs6000-cpus.def    2015-11-04
> 12:30:01.539224474 +0100
> +++ host-gcc-final-4.9.3.mio/gcc/config/rs6000/rs6000-cpus.def
> 2015-11-04 12:28:20.806611098 +0100
> @@ -157,7 +157,7 @@
>  RS6000_CPU ("e5500", PROCESSOR_PPCE5500,
>          MASK_POWERPC64 | MASK_PPC_GFXOPT | MASK_ISEL)
>  RS6000_CPU ("e6500", PROCESSOR_PPCE6500, POWERPC_7400_MASK |
> MASK_POWERPC64
> -        | MASK_MFCRF | MASK_ISEL)
> +        | MASK_MFCRF | MASK_ISEL | MASK_PPC_GPOPT)
>  RS6000_CPU ("860", PROCESSOR_MPCCORE, MASK_SOFT_FLOAT)
>  RS6000_CPU ("970", PROCESSOR_POWER4,
>          POWERPC_7400_MASK | MASK_PPC_GPOPT | MASK_MFCRF | MASK_POWERPC64)
>
>
I've tried to test this, but before I realized that buildroot didn't
include support for mcpu=e6500, so I applied the following patch:
diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 95bcaee..cafafea 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -200,6 +200,7 @@ config BR2_GCC_TARGET_CPU
        default "e300c2"        if BR2_powerpc_e300c2
        default "e300c3"        if BR2_powerpc_e300c3
        default "e500mc"        if BR2_powerpc_e500mc
+       default "e6500"         if BR2_powerpc_e6500
        default "power4"        if BR2_powerpc_power4
        default "power5"        if BR2_powerpc_power5
        default "power6"        if BR2_powerpc_power6

Now, however, the problem is pretty different, as when compiling glibc, I
stumbled upon this:

../sysdeps/powerpc/powerpc64/start.S: Assembler messages:
../sysdeps/powerpc/powerpc64/start.S:77: Error: syntax error; found `@',
expected `('
../sysdeps/powerpc/powerpc64/start.S:77: Error: junk at end of line:
`@toc(2)'
[...]
../sysdeps/powerpc/powerpc64/crtn.S: Assembler messages:
../sysdeps/powerpc/powerpc64/crtn.S:42: Error: unsupported relocation
against FRAME_MIN_SIZE_PARM
../sysdeps/powerpc/powerpc64/crtn.S:48: Error: unsupported relocation
against FRAME_MIN_SIZE_PARM
[...]
../sysdeps/powerpc/powerpc64/crti.S: Assembler messages:
../sysdeps/powerpc/powerpc64/crti.S:64: Error: unrecognized opcode:
`entry_2(_init)'
../sysdeps/powerpc/powerpc64/crti.S:66: Error: unrecognized opcode:
`body_label'
../sysdeps/powerpc/powerpc64/crti.S:67: Error: unrecognized opcode:
`localentry(_init)'
../sysdeps/powerpc/powerpc64/crti.S:72: Error: syntax error; found `@',
expected `,'
../sysdeps/powerpc/powerpc64/crti.S:72: Error: junk at end of line: `@toc at ha
'
../sysdeps/powerpc/powerpc64/crti.S:73: Error: syntax error; found `@',
expected `('
../sysdeps/powerpc/powerpc64/crti.S:73: Error: junk at end of line: `@toc at l
(9)'
../sysdeps/powerpc/powerpc64/crti.S:82: Error: unrecognized opcode:
`entry_2(_fini)'
../sysdeps/powerpc/powerpc64/crti.S:84: Error: unrecognized opcode:
`body_label'
../sysdeps/powerpc/powerpc64/crti.S:85: Error: unrecognized opcode:
`localentry(_fini)'
[...]
../sysdeps/powerpc/powerpc64/dl-machine.h: In function
'elf_machine_runtime_setup':
../sysdeps/powerpc/powerpc64/dl-machine.h:342:26: error: initialization
from incompatible pointer type [-Werror]
       Elf64_Dyn **info = map->l_info;
../sysdeps/powerpc/powerpc64/dl-machine.h:361:11: error: cast from pointer
to integer of different size [-Werror=pointer-to-int-cast]
    dlrr = (Elf64_Addr) (profile ? _dl_profile_resolve
[Several other identical errors referring to different casts]
[...]
/tmp/test/build/glibc-2.21/build/gnu/lib-names.h:10:31: fatal error:
gnu/lib-names-32.h: No such file or directory
compilation terminated.
/tmp/test/build/glibc-2.21/build/sysd-rules:857: recipe for target
'/tmp/test/build/glibc-2.21/build/csu/unwind-resume.os' failed


And now I just simply don't know how to continue. Any ideas? This toolchain
with previous patch to buildroot results in
Using built-in specs.
COLLECT_GCC=/test/output/host/usr/bin/powerpc64-buildroot-linux-gnu-gcc.br_real
COLLECT_LTO_WRAPPER=/test/output/host/usr/libexec/gcc/powerpc64-buildroot-linux-gnu/4.9.3/lto-wrapper
Target: powerpc64-buildroot-linux-gnu
Configured with: ./configure  --prefix=/test/output/host/usr
--sysconfdir=/test/output/host/etc  --localstatedir=/test/output/host/var
--enable-shared  --disable-static  --disable-gtk-doc
--disable-gtk-doc-html  --disable-doc  --disable-docs
--disable-documentation  --disable-debug  --with-xmlto=no  --with-fop=no
--disable-dependency-tracking  --target=powerpc64-buildroot-linux-gnu
--with-sysroot=/test/output/host/usr/powerpc64-buildroot-linux-gnu/sysroot
--disable-__cxa_atexit  --with-gnu-ld  --disable-libssp
--disable-multilib  --with-gmp=/test/output/host/usr
--with-mpfr=/test/output/host/usr  --with-pkgversion='Buildroot
2015.11-git-00919-g73eb930-dirty'  --with-bugurl=http://bugs.buildroot.net/
--disable-libquadmath  --enable-tls  --disable-libmudflap
--enable-threads  --with-mpc=/test/output/host/usr  --without-isl
--without-cloog  --disable-decimal-float  --with-cpu=e6500
--enable-languages=c  --disable-shared  --without-headers
--disable-threads  --with-newlib  --disable-largefile  --disable-nls
Thread model: single
gcc version 4.9.3 (Buildroot 2015.11-git-00919-g73eb930-dirty)


Thanks, best regards!

-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151104/a4c125fe/attachment.html>
