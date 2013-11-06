From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 6 Nov 2013 16:50:22 +0100
Subject: [Buildroot] [PATCH v2 1/1] Avoid toolchain download when it is
	preinstalled
In-Reply-To: <527A623C.7090007@gezedo.com>
References: <527A623C.7090007@gezedo.com>
Message-ID: <CAAXf6LWwaR3U+xzq4K0Avt5-UoKhXAnjXv=Q5Tcgk_4P2Tzxag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 6, 2013 at 4:37 PM, Laurent GONZALEZ <br2@gezedo.com> wrote:
> For configurations using a toolchain that is preinstalled on
> the host, <pkg>_SITE and <pkg>_SOURCE variables must be kept
> empty to avoid downloading any toolchain package.
>
> Signed-off-by: GONZALEZ Laurent <br2@gezedo.com>
> ---
>  toolchain/toolchain-external/toolchain-external.mk |    5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 2722600..5eb86c7 100644
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
> @@ -347,6 +348,10 @@ else
>  TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
>  TOOLCHAIN_EXTERNAL_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
>  endif
> +else
> +TOOLCHAIN_EXTERNAL_SITE =
> +TOOLCHAIN_EXTERNAL_SOURCE =
> +endif
>
>  TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
>

Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
