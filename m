From: =?ISO-8859-2?B?o3VrYXN6IFB1s2th?= <lukasz@oxnet.pl>
Date: Sun, 11 Dec 2011 11:48:51 +0100
Subject: [Buildroot] [PATCH] ffmpeg: add TARGET_CFLAGS to configure
In-Reply-To: <1323456835-16869-1-git-send-email-lukasz@oxnet.pl>
References: <1323456835-16869-1-git-send-email-lukasz@oxnet.pl>
Message-ID: <CALX2uoNb3s7T9QYNDF3y+yysN8N6R2fRaGdzm7Y3jcePqybnFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Without setting extra-cflags some optimzations are not enabled by configure (e.g. NEON), even if --enable-neon is used.
>
> Signed-off-by: Lukasz Pulka <lukasz@oxnet.pl>
> ---
> ?package/multimedia/ffmpeg/ffmpeg.mk | ? ?2 +-
> ?1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
> index ca41892..2517a62 100644
> --- a/package/multimedia/ffmpeg/ffmpeg.mk
> +++ b/package/multimedia/ffmpeg/ffmpeg.mk
> @@ -166,7 +166,7 @@ define FFMPEG_CONFIGURE_CMDS
> ? ? ? ? ? ? ? ?--host-cc="$(HOSTCC)" \
> ? ? ? ? ? ? ? ?--arch=$(BR2_ARCH) \
> ? ? ? ? ? ? ? ?--target-os=linux \
> - ? ? ? ? ? ? ? --extra-cflags=-fPIC \
> + ? ? ? ? ? ? ? --extra-cflags='-fPIC $(TARGET_CFLAGS)' \
> ? ? ? ? ? ? ? ?$(SHARED_STATIC_LIBS_OPTS) \
> ? ? ? ? ? ? ? ?$(FFMPEG_CONF_OPT) \
> ? ? ? ?)
> --
> 1.7.2.5
>

Hi,

Maybe I will present some more detailed information,  about this patch.

I want to build ffmpeg with NEON optimizations for Cortex A8 target,
if i use latest buildroot from git and  my following settings in my
board defconfig:

BR2_arm=y
BR2_cortex_a8=y
BR2_TARGET_OPTIMIZATION="-mfpu=neon -ftree-vectorize -mfloat-abi=softfp"

BR2_TOOLCHAIN_CTNG=y
BR2_TOOLCHAIN_CTNG_glibc=y
BR2_TOOLCHAIN_CTNG_CXX=y

after ffpmeg-reconfigure I see following output

big-endian                no
runtime cpu detection     no
ARMv5TE enabled           yes
ARMv6 enabled             yes
ARMv6T2 enabled           yes
ARM VFP enabled           no
IWMMXT enabled            no
NEON enabled              no
debug symbols             yes
strip symbols             yes
optimize for size         no
optimizations             yes
static                    yes

it is clear for me that NEON optimizations are not enabled, however
few lines above I can see the configure command line which ends with
"--enable-pthreads --enable-zlib --enable-armvfp --enable-neon".

If I add TARGET_CFLAGS to the extra-cflags configure option,  and
recofnigure ffmpeg, NEON is enabled (I belive that -mfpu=neon does the
trick).

big-endian                no
runtime cpu detection     no
ARMv5TE enabled           yes
ARMv6 enabled             yes
ARMv6T2 enabled           yes
ARM VFP enabled           yes
IWMMXT enabled            no
NEON enabled              yes
debug symbols             yes
strip symbols             yes
optimize for size         no
optimizations             yes
static                    yes
shared                    yes

Is there any other cleaner(without patching buildroot), way of
enabling NEON optimizations for ffmpeg ?

Best regards,
Lukasz Pulka
