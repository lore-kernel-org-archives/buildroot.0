From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 Dec 2012 13:21:21 +0100
Subject: [Buildroot] [PATCHv3] linux: Support multiple device tree build
In-Reply-To: <87txrgyf5y.fsf@dell.be.48ers.dk>
References: <1355993289-31804-1-git-send-email-maxime.ripard@free-electrons.com>
 <87txrgyf5y.fsf@dell.be.48ers.dk>
Message-ID: <50D45441.4050704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/12/12 15:24, Peter Korsgaard wrote:
>>>>>> "Maxime" == Maxime Ripard<maxime.ripard@free-electrons.com>  writes:
>
>   Maxime>  Signed-off-by: Maxime Ripard<maxime.ripard@free-electrons.com>
>
> Committed, thanks.
>
>   Maxime>   define LINUX_INSTALL_DTB
>   Maxime>  -	cp $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb $(BINARIES_DIR)/
>   Maxime>  +	cp $(addprefix $(KERNEL_ARCH_PATH)/boot/, \
>   Maxime>  +		$(addsuffix .dtb, $(call qstrip, $(KERNEL_DTS_NAME)))) \
>   Maxime>  +		$(BINARIES_DIR)/
>
> Not directly related to your patch, but this is broken by the recent
> (post-3.7) change to put .dtb files in arch/arm/boot/dts. I wonder how
> the best way of handling this is?

  How about adding this to LINUX_POST_PATCH_HOOKS

if [ ! -e $(KERNEL_ARCH_PATH)/boot/dts ]; then \
	ln -s . $(KERNEL_ARCH_PATH)/boot/dts; \
fi

  and adding dts to the path everywhere we use it?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
