From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 6 Nov 2013 15:35:46 +0100
Subject: [Buildroot] [PATCH 1/1] Avoid toolchain download when it is
	preinstalled
In-Reply-To: <527A1C86.8030909@gezedo.com>
References: <527A1C86.8030909@gezedo.com>
Message-ID: <CAAXf6LX=VxrdM8oC4DEOYLo2wMhAriAiQDopUftb+FKnOvg_sQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Laurent,

On Wed, Nov 6, 2013 at 11:40 AM, Laurent GONZALEZ <br2@gezedo.com> wrote:
> For configurations using a toolchain that is preinstalled on
> the host, <pkg>_SITE and <pkg>_SOURCE variables must be kept
> empty to avoid downloading any toolchain package.
>
> Signed-off-by: GONZALEZ Laurent <br2@gezedo.com>
> ---
>  toolchain/toolchain-external/toolchain-external.mk |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 2722600..6f4feb5 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -236,6 +236,7 @@ define TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
>         ln -sf . $(TARGET_DIR)/usr/lib/arm-linux-gnueabihf
>  endef
>
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
>  TOOLCHAIN_EXTERNAL_SOURCE = arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
> @@ -347,6 +348,7 @@ else
>  TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
>  TOOLCHAIN_EXTERNAL_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
>  endif
> +endif
>
>  TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
>

Can you be a bit more specific about the configuration you see this
problem with?
Although I can confirm that there is an attempted download when you
configure a pre-installed codesourcery toolchain, I can't fix the
problem completely with your patch:

$ make toolchain
>>> toolchain undefined Extracting
>>> toolchain undefined Patching toolchain//toolchain
>>> toolchain-external undefined Downloading
/toolchain-external-undefined.tar.gz: Scheme missing.
--2013-11-06 15:33:31--
http://sources.buildroot.net//toolchain-external-undefined.tar.gz

Thanks,
Thomas
