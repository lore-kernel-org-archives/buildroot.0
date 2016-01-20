From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jan 2016 22:34:34 +0100
Subject: [Buildroot] [PATCH] alsa-lib: disable libdl for static only
 builds
In-Reply-To: <1453303278-15283-1-git-send-email-ltrimas@synopsys.com>
References: <1453303278-15283-1-git-send-email-ltrimas@synopsys.com>
Message-ID: <20160120223434.0d6cd9a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lada Trimasova,

On Wed, 20 Jan 2016 18:21:18 +0300, Lada Trimasova wrote:
> -ldl includes the reference to the library that has
> the symbols for loading dynamic libraries.
> So there is no need for this library for static only builds.
> Even though alsa-lib uses dlopen, it has functions snd_dlopen
> and others which can emulate dynamic linking for the static
> build of the alsa-lib library and there is no need in libdl
> dlopen when static build only.
> This patch fixes build failures of the shairport-sync
> (and probably other packages) when static libs are used.
> 
> Fixes:
> http://autobuild.buildroot.net/results/85a/85a3f01bcd4eb2ce7ac480e63b4cc04bf7c8f3e5/
> 
> Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/alsa-lib/alsa-lib.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
> index ea2351c..6a4d14f 100644
> --- a/package/alsa-lib/alsa-lib.mk
> +++ b/package/alsa-lib/alsa-lib.mk
> @@ -21,6 +21,7 @@ ALSA_LIB_CONF_OPTS = \
>  # Can't build with static & shared at the same time (1.0.25+)
>  ifeq ($(BR2_STATIC_LIBS),y)
>  ALSA_LIB_CONF_OPTS += --enable-shared=no
> +ALSA_LIB_CONF_OPTS += --without-libdl

We generally use a single assignment in such cases, so I've changed this
to:

ALSA_LIB_CONF_OPTS += \
        --enable-shared=no \
        --without-libdl

and applied your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
