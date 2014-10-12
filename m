From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 12 Oct 2014 11:08:08 +0200
Subject: [Buildroot] [PATCH] set simple network setup via the system
 configuration submenu
In-Reply-To: <1410178412-31282-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1410178412-31282-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <543A44F8.5060104@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HiJ?r?my,

Le 08/09/2014 14:13, J?r?my Rosen a ?crit :
> This patch allows the setup of simple /etc/network/interfaces via the
> configuration menus instead of using an overlay
>
> * supports the loopback interface
> * supports one normal interface (renamable)
> * supports manual ipv4 configuration
> * supports dhcp configuration
>
> Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
>
> ---
>
> This patch is here to avoid having to do an overlay for the most common
> cases (ipv4 with fixed IP or DHCP)
>
> I can make it more complex (second network if, support ipv6) depending on
> what people want/need, but I want to keep it simple. The point is to avoid
> having to tweak overlays to change stuff that everybody needs to change for
> prototyping
The idea is good, some comments below.
>
> With regards to systemd, as far as I could figure it still uses
> /etc/network/interfaces but with different names. AFAIU there is no sane
> default to replace the "eth0" name so I did not put a different default
> when systemd is used
I checked on my Fedora machine that use systemd and there is no 
directory /etc/network.
Instead there is a /etc/networks file.
But I don't know systemd so much...
> ---
>   Makefile                               |  1 +
>   support/scripts/generate-interfaces.sh | 75 ++++++++++++++++++++++++++++++++
>   system/Config.in                       | 78 ++++++++++++++++++++++++++++++++++
>   3 files changed, 154 insertions(+)
>   create mode 100755 support/scripts/generate-interfaces.sh
>
> diff --git a/Makefile b/Makefile
> index e788f1b..71cad7d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -477,6 +477,7 @@ $(BUILD_DIR)/.root:
>   	@ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
>   	@mkdir -p $(TARGET_DIR)/usr
>   	@ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
> +	./support/scripts/generate-interfaces.sh $(TARGET_DIR)
generate-interfaces.sh is only called when the target directory is created.
What happen if the Buildroot's configuration is modified ?
What's about calling this script from target-finalize ?

If unlikely another interfaces file exist on the overlay directory which
network configuration must be used ?

Also, $(TOPDIR) must be used here instead of '.'
>   	touch $@
>   
>   $(TARGET_DIR): $(BUILD_DIR)/.root
> diff --git a/support/scripts/generate-interfaces.sh b/support/scripts/generate-interfaces.sh
> new file mode 100755
> index 0000000..b685669
> --- /dev/null
> +++ b/support/scripts/generate-interfaces.sh
> @@ -0,0 +1,75 @@
> +#!/bin/sh
> +
> +
> +#extract  our parameters from the config file
> +for PARAM in \
> +	BR2_SIMPLE_NETWORK_LO_ENABLE \
> +	BR2_SIMPLE_NETWORK_LO_AUTO \
> +	\
> +	BR2_SIMPLE_NETWORK_1_ENABLE \
> +	BR2_SIMPLE_NETWORK_1_AUTO \
> +	BR2_SIMPLE_NETWORK_1_IPV4_DHCP \
> +	BR2_SIMPLE_NETWORK_1_IPV4_MANUAL \
> +	; do
> +TMP=$(sed -r -e "/^$PARAM=(.*)$/!d;" -e 's//\1/;' $BR2_CONFIG)
> +	export $PARAM=$TMP
> +done
> +
> +for PARAM in \
> +	BR2_SIMPLE_NETWORK_1_NAME \
> +	BR2_SIMPLE_NETWORK_1_IPV4_ADDRESS \
> +	BR2_SIMPLE_NETWORK_1_IPV4_NETMASK \
> +	BR2_SIMPLE_NETWORK_1_IPV4_BROADCAST \
> +	BR2_SIMPLE_NETWORK_1_IPV4_GATEWAY \
> +	; do
> +TMP=$(sed -r -e "/^$PARAM=\"(.*)\"$/!d;" -e 's//\1/;' $BR2_CONFIG)
> +	export $PARAM=$TMP
> +done
> +
> +
> +
> +IFACE_FILE=$TARGET_DIR/etc/network/interfaces
> +echo -n > $IFACE_FILE # empty the file
> +
> +if [ $BR2_SIMPLE_NETWORK_LO_ENABLE ] ; then
> +	if [ $BR2_SIMPLE_NETWORK_LO_AUTO ] ; then
> +		echo "auto lo">> $IFACE_FILE
> +	fi
> +	echo "iface lo inet loopback">> $IFACE_FILE
> +	echo >>$IFACE_FILE
> +fi
> +
> +if [ $BR2_SIMPLE_NETWORK_1_ENABLE ] ; then
> +	if [ -z $BR2_SIMPLE_NETWORK_1_NAME ] ; then
> +		echo ERROR no name specified for first network interface
> +		exit 1
> +	fi
> +	if [ $BR2_SIMPLE_NETWORK_1_AUTO ] ; then
> +		echo "auto  $BR2_SIMPLE_NETWORK_1_NAME">> $IFACE_FILE
> +	fi
> +	if [ $BR2_SIMPLE_NETWORK_1_IPV4_DHCP ] ; then
> +		echo "iface $BR2_SIMPLE_NETWORK_1_NAME inet dhcp">> $IFACE_FILE
> +	elif [ $BR2_SIMPLE_NETWORK_1_IPV4_MANUAL ] ; then
> +		for PARAM in \
> +			BR2_SIMPLE_NETWORK_1_IPV4_ADDRESS \
> +			BR2_SIMPLE_NETWORK_1_IPV4_NETMASK \
> +			BR2_SIMPLE_NETWORK_1_IPV4_BROADCAST \
> +			BR2_SIMPLE_NETWORK_1_IPV4_GATEWAY \
> +			; do
> +			eval VALUE=\$$PARAM
> +			if [ -z $VALUE ] ; then
> +				echo ERROR $PARAM not set
> +				exit 1
> +			fi
> +		done
> +		echo "iface $BR2_SIMPLE_NETWORK_1_NAME inet static">> $IFACE_FILE
> +		echo "	address $BR2_SIMPLE_NETWORK_1_IPV4_ADDRESS">> $IFACE_FILE
> +		echo "	netmask $BR2_SIMPLE_NETWORK_1_IPV4_NETMASK">> $IFACE_FILE
> +		echo "	broadcast $BR2_SIMPLE_NETWORK_1_IPV4_BROADCAST">> $IFACE_FILE
> +		echo "	gateway $BR2_SIMPLE_NETWORK_1_IPV4_GATEWAY">> $IFACE_FILE
> +	else
> +		echo Incorrect buildroot configuration
> +		exit 1
> +	fi
> +	echo >>$IFACE_FILE
> +fi
> diff --git a/system/Config.in b/system/Config.in
> index e7e146a..d5711bc 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -389,4 +389,82 @@ config BR2_ROOTFS_POST_SCRIPT_ARGS
>   	  directory / images directory. The arguments in this option will be
>   	  passed *after* those.
>   
> +menuconfig BR2_SIMPLE_NETWORK
> +	bool "Generate simple network configuration"
> +	default n
> +	help
> +	  Use buildroot to set network configuration during the build process
> +
> +if BR2_SIMPLE_NETWORK
> +menuconfig BR2_SIMPLE_NETWORK_LO_ENABLE
> +	bool "enable loopback device"
> +	default y
> +	help
> +	   Enables the loopback interface at startup
> +
> +if BR2_SIMPLE_NETWORK_LO_ENABLE
> +config BR2_SIMPLE_NETWORK_LO_AUTO
> +	bool "enable loopback interface at startup"
> +	default y
> +	help
> +	   Should the loopback inteface be brought up automatically at startup
> +	
> +endif
> +
> +menuconfig BR2_SIMPLE_NETWORK_1_ENABLE
> +	bool "enable first network interface"
> +	default y
> +	help
> +	   Enable the first network interface
> +
> +if BR2_SIMPLE_NETWORK_1_ENABLE
> +config BR2_SIMPLE_NETWORK_1_AUTO
> +	bool "enable first network interface at startup"
> +	default y
> +	help
> +	   Should the first network inteface be brought up automatically at startup
> +
> +config BR2_SIMPLE_NETWORK_1_NAME
> +	string "name of the first physical network interface"
> +	default "eth0"
> +	help
> +	   The name used to recognise the first network interface as reported by the kernel
> +	
> +choice
> +	prompt "Configuration type"
> +	default BR2_SIMPLE_NETWORK_1_DHCP
> +	help
> +	   The type of configuration to use for the first physical interface
> +
> +config BR2_SIMPLE_NETWORK_1_IPV4_DHCP
> +	bool "IPv4 with DHCP"
> +	help
> +	   Use DHCP to configure this interface
> +	   using the IPv4 protocol
> +
> +config BR2_SIMPLE_NETWORK_1_IPV4_MANUAL
> +	bool "IPv4 with parameters manually specified"
> +	help
> +	   Configure IPv4 by specifying each parameter separately
> +endchoice
> +
> +if BR2_SIMPLE_NETWORK_1_IPV4_MANUAL
> +config BR2_SIMPLE_NETWORK_1_IPV4_ADDRESS
> +	string "IP Address of the first network interface"
> +
> +config BR2_SIMPLE_NETWORK_1_IPV4_NETMASK
> +	string "Netmask of the first network interface"
> +
> +config BR2_SIMPLE_NETWORK_1_IPV4_BROADCAST
> +	string "Broadcast Address of the first network interface"
> +
> +config BR2_SIMPLE_NETWORK_1_IPV4_GATEWAY
> +	string "Address of the gateway for the first network interface"
> +endif
These configs settings needs a default value (like for the interface name)
otherwise the script generate-interface will failif only
BR2_SIMPLE_NETWORK_1_IPV4_MANUAL has been selected.
> +
> +endif
> +
> +endif
> +
> +
>   endmenu

Best regards,
Romain
