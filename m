From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 26 Jul 2018 12:01:07 -0700
Subject: [Buildroot] [PATCH v6 4/4] chromium: new package
In-Reply-To: <1532611912386-0.post@n4.nabble.com>
References: <20180710234212.4297-1-joseph.kogut@gmail.com>
 <20180710234212.4297-5-joseph.kogut@gmail.com>
 <1532611912386-0.post@n4.nabble.com>
Message-ID: <CAMWSM7ikcADGP3Y7_wpSjot8fD_OA_v+R7bZf3fD+APRR-Kc1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Hao,

On Thu, Jul 26, 2018 at 6:37 AM Hao HU <huhao526200@gmail.com> wrote:
>
> Hello Joseph,
>
> I have applied your v6 patch to the Buildroot 2018.05 and wanted to build
> the chrome in a x86 arch.
>
> The Target option is like this :
>
> /Target Architecture  : i386
> Target Architecture Variant i586/
>
> And I have added the following in the lld.mk
>
> HOST_LLD_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON -DLLVM_DYLIB_COMPONENTS=all
>
> +ifeq ($(BR2_PACKAGE_CHROMIUM_PROPRIETARY_CODECS),y)
> +CHROMIUM_OPTS += proprietary_codecs=true ffmpeg_branding=\"Chrome\"
> +endif
>
> And finally I have comment the following in the chromium.mk
>
> +ifeq ($(BR2_PACKAGE_CHROMIUM_PROPRIETARY_CODECS),y)
> + # CHROMIUM_OPTS += proprietary_codecs=true ffmpeg_branding=\"Chrome\"
> +endif
>

I'm not sure what the intent is here. Chromium codec options belong in
the Chromium makefile, not the LLD makefile. Were you encountering a
build error related to enabling Chromium proprietary codecs?

> But now there is still a problem
>
> /home/as_huhao/eolane/x2m/buildroot-2018.05-IHMI/output/host/bin/ld.lld:
> error: can't create dynamic relocation R_386_32 against local symbol in
> readonly segment; recompile object files with -fPIC
> >>> defined in obj/third_party/ffmpeg/libffmpeg_yasm.a(ffmpeg_yasm/dct32.o)
> >>> referenced by ../../third_party/ffmpeg/libavcodec/x86/dct32.asm
> >>>               ffmpeg_yasm/dct32.o:(ff_dct32_float_sse) in archive
> >>> obj/third_party/ffmpeg/libffmpeg_yasm.a
>

I've encountered the same issue, and I'm still working on a solution,
which is why I haven't submitted v7 of this patchset. Apparently the
Chromium team compiles i386 builds with GNU gold instead of LLD. LLD
is more strict, and by default errors out when trying to dynamically
relocate symbols in read only segments.

Consequently, the upstream build is broken on i386 when linking with LLD.

> could you please tell me how to fix this problem?
>

I'm testing a couple of solutions. In the mean time, try setting
use_gold=false in CHROMIUM_OPTS, and let me know if that helps.
