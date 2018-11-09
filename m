From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 9 Nov 2018 23:14:36 +0100
Subject: [Buildroot] [PATCH 2/2] linux: Make dtc install step more
 reliable
In-Reply-To: <20181108130417.1277-3-anaumann@ultratronik.de>
References: <20181108130417.1277-1-anaumann@ultratronik.de>
 <20181108130417.1277-3-anaumann@ultratronik.de>
Message-ID: <6a53c610-705f-41c6-5675-a514c61acb8d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/11/2018 14:04, Andreas Naumann wrote:
> Checking for the existence of the dtc binary built by the
> non-dependent dtc package may cause instable behaviour when giving more
> freedom on the order of how the packages are built (parallelization).
> 
> In addidion, when moving to per-package host/target method, the check
> would always trigger in the isolated host, leading to linux-dtc always
> being installed as dtc.
> This in turn may lead to undesired overwriting of the real host-dtc binary
> when finally assembling the global host dir.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>  linux/linux.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index f2bca17328..f87de02290 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -465,7 +465,7 @@ define LINUX_INSTALL_HOST_TOOLS
>  	# Installing dtc (device tree compiler) as host tool, if selected
>  	if grep -q "CONFIG_DTC=y" $(@D)/.config; then \
>  		$(INSTALL) -D -m 0755 $(@D)/scripts/dtc/dtc $(HOST_DIR)/bin/linux-dtc ; \
> -		if [ ! -e $(HOST_DIR)/bin/dtc ]; then \
> +		if [ "$(BR2_PACKAGE_HOST_DTC)" != "y" ]; then \
>  			ln -sf linux-dtc $(HOST_DIR)/bin/dtc ; \
>  		fi \

 Since now it's purely steered by a make variable, you can change it into

 		$(if $(BR2_PACKAGE_HOST_DTC),ln -sf linux-dtc $(HOST_DIR)/bin/dtc;) \


(note that the semicolon is still needed because it's in the CONFIG_DTC condition).

 Regards,
 Arnout


>  	fi
> 
