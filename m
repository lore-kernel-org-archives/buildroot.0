From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 5 Nov 2015 12:13:49 +0100
Subject: [Buildroot] Illegal instruction by python's xmlrpclib on
 powerpc64, gcc-4.9
In-Reply-To: <CAM+bi4v7jN-HxYSExBuL7VhxLoxU7wry8nQQ1Y2zyLbMRGwDMA@mail.gmail.com>
References: <CAM+bi4sfbXMkgow7-ku+u2f5ypEM1WGPAuRRvkkjUA-Z05KnqQ@mail.gmail.com>
 <20151103151730.1e9dcc3c@free-electrons.com>
 <CAM+bi4sGFXwL3AqiqmVoxQtOXXVyHH32sVEfpKp+-0PO32afpg@mail.gmail.com>
 <20151104114923.67eb85d6@free-electrons.com>
 <CAM+bi4tcURvBDSKHieDumCMrDG7o1xkXJ8fizHNAtQtcYnwo1A@mail.gmail.com>
 <CAM+bi4umtQ1ExSDbSHk32Udqz4TX8aQ3gwNawZgwkikUVdom8g@mail.gmail.com>
 <563A8B2F.7070203@mind.be>
 <CAM+bi4v7jN-HxYSExBuL7VhxLoxU7wry8nQQ1Y2zyLbMRGwDMA@mail.gmail.com>
Message-ID: <563B39ED.9080104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05-11-15 11:27, Alvaro Gamez wrote:
> Hi, Arnout
>
> 2015-11-04 23:48 GMT+01:00 Arnout Vandecappelle <arnout@mind.be
> <mailto:arnout@mind.be>>:
>
>      The problem is that the compiler doesn't seem to build 64-bit binaries unless
>     -m64 is specified, but glibc is configured for 64-bit.
>
>      Just adding -m64 to BR2_TARGET_OPTIMIZATION works around the issue.
>
>
> Well... that's seems to be not enough, as after adding this, compilation still
> fails:
>
> /tmp/test/output/host/usr/bin/powerpc64-buildroot-linux-gnu-gcc   -nostdlib
> -nostartfiles -r -o /tmp/test/output/build/glibc-2.21/build/elf/librtld.map.o
> '-Wl,-('/tmp/test/output/build/glibc-2.21/build/elf/dl-allobjs.os
> /tmp/test/output/build/glibc-2.21/build/libc_pic.a -lgcc '-Wl,-)'
> -Wl,-Map,/tmp/test/output/build/glibc-2.21/build/elf/librtld.mapT
>
/tmp/test/output/host/usr/lib/gcc/powerpc64-buildroot-linux-gnu/4.9.3/../../../../powerpc64-buildroot-linux-gnu/bin/ld:
> skipping incompatible
> /tmp/test/output/host/usr/lib/gcc/powerpc64-buildroot-linux-gnu/4.9.3/libgcc.a
> when searching for -lgcc
>
/tmp/test/output/host/usr/lib/gcc/powerpc64-buildroot-linux-gnu/4.9.3/../../../../powerpc64-buildroot-linux-gnu/bin/ld:
> cannot find -lgcc
> collect2: error: ld returned 1 exit status

Oops, you're right, I wrote my mail before compilation was completely finished...

So we have to convince gcc to really build a ppc64 compiler. I can't readily
find a configure option to do that - except for the powerpc64-* tuple which we
already set.

 Any ppc64 expert out there that can give a hint? Gustavo?

>
> If I also set BR2_TARGET_LDFLAGS="-melf64ppc", then the following happens:
>
> checking whether __attribute__((visibility())) is supported... yes
> checking for broken __attribute__((visibility()))... no
> checking for broken __attribute__((alias()))... no
> checking whether to put _rtld_local into .sdata section... no
> checking for .preinit_array/.init_array/.fini_array support... no
> configure: error: Need linker with .init_array/.fini_array support.
> package/pkg-generic.mk:178 <http://pkg-generic.mk:178>: recipe for target
> '/tmp/test/output/build/glibc-2.21/.stamp_configured' failed
> make[1]: *** [/tmp/test/output/build/glibc-2.21/.stamp_configured] Error 1
> common.mk:41 <http://common.mk:41>: recipe for target 'default' failed
> make: *** [default] Error 2
>
> Patching toolchain-wrapper.mk <http://toolchain-wrapper.mk> as you suggested:
> diff --git a/toolchain/toolchain-wrapper.mk <http://toolchain-wrapper.mk>
> b/toolchain/toolchain-wrapper.mk <http://toolchain-wrapper.mk>
> index af39071..de9124c 100644
> --- a/toolchain/toolchain-wrapper.mk <http://toolchain-wrapper.mk>
> +++ b/toolchain/toolchain-wrapper.mk <http://toolchain-wrapper.mk>
> @@ -30,6 +30,10 @@ ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
>  TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
>  endif
>
> +ifeq ($(BR2_ARCH_IS_64),y)
> +TOOLCHAIN_WRAPPER_ARGS += -DBR_64
> +endif
> +
>  # For simplicity, build directly into the install location
>  define TOOLCHAIN_BUILD_WRAPPER
>         $(Q)mkdir -p $(HOST_DIR)/usr/bin
>
> The end result is the same as the first case, with ld complaining about -lgcc

Obviously, since it has exactly the same effect as setting it in
BR2_TARGET_OPTIMIZATION.


Regards,
Arnout

>
> Best regards
>
> --
> ?lvaro G?mez Machado


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
