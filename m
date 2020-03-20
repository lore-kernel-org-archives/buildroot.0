From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Mar 2020 23:13:38 +0100
Subject: [Buildroot] [PATCH v4 1/4] boot/arm-trusted-firmware: Disable
 bin copy for rk3399
In-Reply-To: <1584614812-20061-2-git-send-email-sunil@amarulasolutions.com>
References: <20200318215216.187d07bd@windsurf.home>
 <1584614812-20061-1-git-send-email-sunil@amarulasolutions.com>
 <1584614812-20061-2-git-send-email-sunil@amarulasolutions.com>
Message-ID: <20200320231338.01c1a61f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sunil,

On Thu, 19 Mar 2020 16:16:49 +0530
sunil at amarulasolutions.com wrote:

>  define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
> +if [ -e $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/*.bin ]; then \
>  	$(foreach f,$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES)), \
> -		cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/$(f) $(BINARIES_DIR)/
> -	)
> +		cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/$(f) $(BINARIES_DIR)/ \
> +	) ; \
> +fi

I'm sorry, but this is still not good. First, why checking for *.bin ?
The value of $(BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES) can be something
else ?

In your case, the solution is simple: define
BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES to the empty value in your
defconfig. This loop will then install nothing, which is what you want.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
