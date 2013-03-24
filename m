From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 12:45:41 +0100
Subject: [Buildroot] [PATCH] Add cortex-a8 cpu spec to ffmpeg neon
 config.
In-Reply-To: <1335136731-4509-1-git-send-email-d_mo1234@yahoo.com>
References: <1335136731-4509-1-git-send-email-d_mo1234@yahoo.com>
Message-ID: <20130324124541.28f79c87@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Sun, 22 Apr 2012 19:18:51 -0400, Danomi Manchego wrote:
> Since neon support is specific to Arm Cortex-A8, and buildroot
> recognizes this by having a specific Cortex-A8 clause in ffmpeg.mk,
> let's add the --cpu needed to make the ffmpeg configuration actually
> report the arch as "arm (cortex-a8)", instead of just "arm (generic)".
> 
> Signed-off-by: Danomi Manchego <d_mo1234@yahoo.com>
> ---
>  package/multimedia/ffmpeg/ffmpeg.mk |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
> index 4cc29ee..633ec9e 100644
> --- a/package/multimedia/ffmpeg/ffmpeg.mk
> +++ b/package/multimedia/ffmpeg/ffmpeg.mk
> @@ -145,7 +145,7 @@ FFMPEG_CONF_OPT += --enable-armvfp
>  endif
>  # NEON is optional for A9
>  ifeq ($(BR2_cortex_a8),y)
> -FFMPEG_CONF_OPT += --enable-neon
> +FFMPEG_CONF_OPT += --enable-neon --cpu=cortex-a8
>  endif

I believe this patch is not useful, because the only effect of
--cpu=<foo> options in ffmpeg configure is to add the relevant -march,
-mcpu and al. gcc options. But Buildroot is already passing them: in
the internal and Crosstool-NG toolchain backends, the toolchain is
built to automatically generate code for the selected CPU, and for the
external toolchain backend, a wrapper automatically passes
-mcpu/-march/-mtune to the compiler.

Therefore, this patch is not needed IMO, and I've removed it from the
patch work. If you don't agree, do not hesitate to send an updated
version that includes more details as to why it is needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
