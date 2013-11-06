From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Nov 2013 16:19:03 +0100
Subject: [Buildroot] [PATCH 1/1] Avoid toolchain download when it is
 preinstalled
In-Reply-To: <527A1C86.8030909@gezedo.com>
References: <527A1C86.8030909@gezedo.com>
Message-ID: <20131106161903.2b28e917@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Laurent GONZALEZ,

On Wed, 06 Nov 2013 11:40:06 +0100, Laurent GONZALEZ wrote:
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
>  	ln -sf . $(TARGET_DIR)/usr/lib/arm-linux-gnueabihf
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

I think the right fix would be something like:

ifeq ($(...codesourcery..),y)
...
else ifeq ($(...some other toolchain),y)
....
- else
+ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
# Custom toolchain
TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
TOOLCHAIN_EXTERNAL_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
- endif
+ else
TOOLCHAIN_EXTERNAL_SOURCE =
endif

So that TOOLCHAIN_EXTERNAL_SOURCE is empty when the external toolchain
is locally installed. Having an empty <pkg>_SOURCE is what tells the
package infrastructure to not download the thing.

Of course, approach above completely untested.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
