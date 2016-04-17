From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Apr 2016 22:30:47 +0200
Subject: [Buildroot] [PATCH 1/2] linux-firmware: drop revision handling
 for iwlwifi
In-Reply-To: <1460743888-19967-1-git-send-email-gustavo@zacarias.com.ar>
References: <1460743888-19967-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160417223047.5b2b76fa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Apr 2016 15:11:27 -0300, Gustavo Zacarias wrote:
> It's problematic since newer kernel versions for different chipsets
> (3168, 7260, 7265) aren't version tied. See:
> http://lxr.free-electrons.com/source/drivers/net/wireless/intel/iwlwifi/iwl-7000.c?v=4.5#L69
> 
> For 3168 the abs minimum is v20, normal minimum v20, and maximum v20.
> For 7260 the abs minimum is v13, normal minimum v13, and maximum v17.
> For 7265 the abs minimum is v13, normal minimum v13, and maximum v17.
> 
> And for the upcoming 7265D abs min v13, normal min v13 and max v20, with
> minimum available version being v10 for previous (<4.5) kernels.
> 
> This gives an impossible to satisfy logical combination with one
> revision knob for all 3 chipsets, and adding more knobs will add a lot
> of complexity.

I don't really see where the impossible combination is, but I agree
that this involves creating many many config knobs, so I'm fine with
the general idea.

>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160),y)
> -LINUX_FIRMWARE_FILES += iwlwifi-3160-$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV).ucode
> +LINUX_FIRMWARE_FILES += \
> +	$(foreach version,7 8 9 10 12 13 16,iwlwifi-3160-$(version).ucode)

It would be nicer if we could find a way of using wildcards here, as it
would make it more future proof (i.e it would automatically handle new
firmware revisions).

Could you have a look and see if it's doable?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
