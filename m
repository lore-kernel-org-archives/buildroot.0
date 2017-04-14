From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Apr 2017 10:54:20 +0200
Subject: [Buildroot] [PATCH 1/1] ffmpeg: fix neon support for aarch64
In-Reply-To: <20170414070848.8639-1-bernd.kuhls@t-online.de>
References: <20170414070848.8639-1-bernd.kuhls@t-online.de>
Message-ID: <20170414105420.656c631f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Apr 2017 09:08:48 +0200, Bernd Kuhls wrote:
> ffmpeg ported arm 32-bit NEON code to aarch64 as hard dependency:
> http://ffmpeg.org/pipermail/ffmpeg-devel/2016-November/202733.html
> 
> Buildroot option BR2_ARM_CPU_HAS_NEON handles only the 32bit case:
> https://git.buildroot.net/buildroot/commit/?id=0976cd6cd64a128a2ac921e4f35f0e7cbe306692
> 
> For aarch64 we need to make sure to pass --enable-neon in order to
> prevent a link error, fixes
> 
> http://autobuild.buildroot.net/results/fa4/fa46003249664b1f97f6c18253c84cd3d6fb9cdb/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ffmpeg/ffmpeg.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index 059f8320e..c0c6705e1 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -432,9 +432,12 @@ FFMPEG_CONF_OPTS += --disable-vfp
>  endif
>  ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
>  FFMPEG_CONF_OPTS += --enable-neon
> +ifeq ($(BR2_aarch64),y)
> +FFMPEG_CONF_OPTS += --enable-neon

I don't understand this patch. How can it work? We're already in a
BR2_ARM_CPU_HAS_NEON condition, and if it's true we're passing
--enable-neon.

Are you sure you didn't want to use an "else ifeq" here ? Are you sure
your patch fixes anything ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
