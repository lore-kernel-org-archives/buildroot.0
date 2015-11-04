From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 4 Nov 2015 23:48:15 +0100
Subject: [Buildroot] Illegal instruction by python's xmlrpclib on
 powerpc64, gcc-4.9
In-Reply-To: <CAM+bi4umtQ1ExSDbSHk32Udqz4TX8aQ3gwNawZgwkikUVdom8g@mail.gmail.com>
References: <CAM+bi4sfbXMkgow7-ku+u2f5ypEM1WGPAuRRvkkjUA-Z05KnqQ@mail.gmail.com>
 <20151103151730.1e9dcc3c@free-electrons.com>
 <CAM+bi4sGFXwL3AqiqmVoxQtOXXVyHH32sVEfpKp+-0PO32afpg@mail.gmail.com>
 <20151104114923.67eb85d6@free-electrons.com>
 <CAM+bi4tcURvBDSKHieDumCMrDG7o1xkXJ8fizHNAtQtcYnwo1A@mail.gmail.com>
 <CAM+bi4umtQ1ExSDbSHk32Udqz4TX8aQ3gwNawZgwkikUVdom8g@mail.gmail.com>
Message-ID: <563A8B2F.7070203@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04-11-15 16:24, Alvaro Gamez wrote:
[snip]
> I've tried to test this, but before I realized that buildroot didn't include
> support for mcpu=e6500, so I applied the following patch:
> diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
> index 95bcaee..cafafea 100644
> --- a/arch/Config.in.powerpc
> +++ b/arch/Config.in.powerpc
> @@ -200,6 +200,7 @@ config BR2_GCC_TARGET_CPU
>         default "e300c2"        if BR2_powerpc_e300c2
>         default "e300c3"        if BR2_powerpc_e300c3
>         default "e500mc"        if BR2_powerpc_e500mc
> +       default "e6500"         if BR2_powerpc_e6500
>         default "power4"        if BR2_powerpc_power4
>         default "power5"        if BR2_powerpc_power5
>         default "power6"        if BR2_powerpc_power6

 Right, Gustavo forgot to add that when he added e5500 and e6500. Patch follows.

> 
> Now, however, the problem is pretty different, as when compiling glibc, I
> stumbled upon this:
> 
> ../sysdeps/powerpc/powerpc64/start.S: Assembler messages:
> ../sysdeps/powerpc/powerpc64/start.S:77: Error: syntax error; found `@',
> expected `('
> ../sysdeps/powerpc/powerpc64/start.S:77: Error: junk at end of line: `@toc(2)'
> [...]
> ../sysdeps/powerpc/powerpc64/crtn.S: Assembler messages:
> ../sysdeps/powerpc/powerpc64/crtn.S:42: Error: unsupported relocation against
> FRAME_MIN_SIZE_PARM
> ../sysdeps/powerpc/powerpc64/crtn.S:48: Error: unsupported relocation against
> FRAME_MIN_SIZE_PARM
> [...]
> ../sysdeps/powerpc/powerpc64/crti.S: Assembler messages:
> ../sysdeps/powerpc/powerpc64/crti.S:64: Error: unrecognized opcode: `entry_2(_init)'
> ../sysdeps/powerpc/powerpc64/crti.S:66: Error: unrecognized opcode: `body_label'
> ../sysdeps/powerpc/powerpc64/crti.S:67: Error: unrecognized opcode:
> `localentry(_init)'
> ../sysdeps/powerpc/powerpc64/crti.S:72: Error: syntax error; found `@', expected `,'
> ../sysdeps/powerpc/powerpc64/crti.S:72: Error: junk at end of line: `@toc at ha'
> ../sysdeps/powerpc/powerpc64/crti.S:73: Error: syntax error; found `@', expected `('
> ../sysdeps/powerpc/powerpc64/crti.S:73: Error: junk at end of line: `@toc at l(9)'
> ../sysdeps/powerpc/powerpc64/crti.S:82: Error: unrecognized opcode: `entry_2(_fini)'
> ../sysdeps/powerpc/powerpc64/crti.S:84: Error: unrecognized opcode: `body_label'
> ../sysdeps/powerpc/powerpc64/crti.S:85: Error: unrecognized opcode:
> `localentry(_fini)'
> [...]
> ../sysdeps/powerpc/powerpc64/dl-machine.h: In function 'elf_machine_runtime_setup':
> ../sysdeps/powerpc/powerpc64/dl-machine.h:342:26: error: initialization from
> incompatible pointer type [-Werror]
>        Elf64_Dyn **info = map->l_info;
> ../sysdeps/powerpc/powerpc64/dl-machine.h:361:11: error: cast from pointer to
> integer of different size [-Werror=pointer-to-int-cast]
>     dlrr = (Elf64_Addr) (profile ? _dl_profile_resolve
> [Several other identical errors referring to different casts]
> [...]
> /tmp/test/build/glibc-2.21/build/gnu/lib-names.h:10:31: fatal error:
> gnu/lib-names-32.h: No such file or directory
> compilation terminated.
> /tmp/test/build/glibc-2.21/build/sysd-rules:857: recipe for target
> '/tmp/test/build/glibc-2.21/build/csu/unwind-resume.os' failed
> 
> 
> And now I just simply don't know how to continue. Any ideas?

 The problem is that the compiler doesn't seem to build 64-bit binaries unless
-m64 is specified, but glibc is configured for 64-bit.

 Just adding -m64 to BR2_TARGET_OPTIMIZATION works around the issue.

 Now that we have the toolchain wrapper, we could just add -DBR_64 in
toolchain-wrapper.mk whenever BR2_ARCH_IS_64. However, I'm not sure how that
will play with n32, ilp32 and x32 ABIs. Adding Vicente, Bamvor and Guido who
added those ABIs.


 Regards,
 Arnout

> This toolchain with
> previous patch to buildroot results in
> Using built-in specs.
> COLLECT_GCC=/test/output/host/usr/bin/powerpc64-buildroot-linux-gnu-gcc.br_real
> COLLECT_LTO_WRAPPER=/test/output/host/usr/libexec/gcc/powerpc64-buildroot-linux-gnu/4.9.3/lto-wrapper
> Target: powerpc64-buildroot-linux-gnu
> Configured with: ./configure  --prefix=/test/output/host/usr 
> --sysconfdir=/test/output/host/etc  --localstatedir=/test/output/host/var 
> --enable-shared  --disable-static  --disable-gtk-doc  --disable-gtk-doc-html 
> --disable-doc  --disable-docs  --disable-documentation  --disable-debug 
> --with-xmlto=no  --with-fop=no  --disable-dependency-tracking 
> --target=powerpc64-buildroot-linux-gnu 
> --with-sysroot=/test/output/host/usr/powerpc64-buildroot-linux-gnu/sysroot 
> --disable-__cxa_atexit  --with-gnu-ld  --disable-libssp  --disable-multilib 
> --with-gmp=/test/output/host/usr  --with-mpfr=/test/output/host/usr 
> --with-pkgversion='Buildroot 2015.11-git-00919-g73eb930-dirty' 
> --with-bugurl=http://bugs.buildroot.net/  --disable-libquadmath  --enable-tls 
> --disable-libmudflap  --enable-threads  --with-mpc=/test/output/host/usr 
> --without-isl  --without-cloog  --disable-decimal-float  --with-cpu=e6500 
> --enable-languages=c  --disable-shared  --without-headers  --disable-threads 
> --with-newlib  --disable-largefile  --disable-nls
> Thread model: single
> gcc version 4.9.3 (Buildroot 2015.11-git-00919-g73eb930-dirty)
> 
> 
> Thanks, best regards!
> 
> -- 
> ?lvaro G?mez Machado
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
