From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Oct 2014 18:41:29 +0200
Subject: [Buildroot] [PATCH] set simple network setup via the system
 configuration submenu
In-Reply-To: <1410178412-31282-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1410178412-31282-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <543EA3B9.4080309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/09/14 14:13, J?r?my Rosen wrote:
> This patch allows the setup of simple /etc/network/interfaces via the
> configuration menus instead of using an overlay

 I definitely like the idea of that!

 I think that this is where buildroot can still grow a little: simple system
configuration through the Kconfig interface.

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

 Anyway that could be done in later patches. Better first let this functionality
be tested for a while and then extend it.

> 
> With regards to systemd, as far as I could figure it still uses
> /etc/network/interfaces but with different names. AFAIU there is no sane
> default to replace the "eth0" name so I did not put a different default
> when systemd is used

 In the meantime you know better :-). If you don't implement the
systemd-networkd support in the end, then I suggest you mention it in comments
in generate-interfaces.sh


> ---
>  Makefile                               |  1 +
>  support/scripts/generate-interfaces.sh | 75 ++++++++++++++++++++++++++++++++
>  system/Config.in                       | 78 ++++++++++++++++++++++++++++++++++
>  3 files changed, 154 insertions(+)
>  create mode 100755 support/scripts/generate-interfaces.sh
> 
> diff --git a/Makefile b/Makefile
> index e788f1b..71cad7d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -477,6 +477,7 @@ $(BUILD_DIR)/.root:
>  	@ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
>  	@mkdir -p $(TARGET_DIR)/usr
>  	@ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
> +	./support/scripts/generate-interfaces.sh $(TARGET_DIR)

 +1 for moving it to TARGET_FINALIZE_HOOKS.

 But I think it should be conditional on BR2_SIMPLE_NETWORK=y.

>  	touch $@
>  
>  $(TARGET_DIR): $(BUILD_DIR)/.root
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


 You can just source the config, that's a lot simpler than all this magic. If
you really want you could grep out the BR2_SIMPLE_NETWORK part but really I
don't see the point.

> +
> +
> +IFACE_FILE=$TARGET_DIR/etc/network/interfaces
> +echo -n > $IFACE_FILE # empty the file

 Perhaps, just to be sure, an mkdir -p of /etc/network ?

 Just a minor nit, but wouldn't it be simpler to put all of the below in a
function which you then call with

do_generate_interfaces > $TARGET_DIR/etc/network/interfaces

? Then you don't have to redirect all the time. Or you could also just do

exec > $TARGET_DIR/etc/network/interfaces

> +
> +if [ $BR2_SIMPLE_NETWORK_LO_ENABLE ] ; then

 I didn't know that this worked... I always thought you had to put quotes to
protect against an empty string, but it turns out that [ ] works perfectly.
Thanks for teaching me!

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

 If you follow my suggestion of redirecting once, then this should of course be
1>&2 (which would be a good idea anyway).

 I would actually prefer to check things like this in the .mk file, so you see
the error earlier. However, in this case, that would make things way to
complicated I'm afraid.

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

 Only address is really required. ifconfig will derive the netmask from the
address (though in practice that usually doesn't work anymore nowadays, because
of CIDR and because we use network-local IP addresses with a much smaller range
than the default 192.168.0.0/16). Broadcast is derived from the netmask, and the
gateway is only needed if you want non-local access.

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

 So the last three should be conditional on whether it is defined.

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
>  	  directory / images directory. The arguments in this option will be
>  	  passed *after* those.
>  
> +menuconfig BR2_SIMPLE_NETWORK
> +	bool "Generate simple network configuration"
> +	default n

 Since we currently do generate this, I think it should default to y.

 Also, I think this menu should go before the rootfs overlay option, so it
corresponds to the order in which we do things. Maybe even just after the
remount option.

> +	help
> +	  Use buildroot to set network configuration during the build process

 Suggested more complete help text:

	  Let buildroot create the network configuration file during the build
	  process. This is /etc/network/interfaces when using ifupdown, and
	  /etc/systemd/network/<iface>.network when using systemd-networkd.

	  The simple network configuration only supports the loopback interface
	  and a single other network interface using a static or DHCP-allocated
	  IPv4 address. If you need something more complicate, create your own
	  configuration file in the BR2_ROOTFS_OVERLAY.

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

 I wonder if these auto things really make sense. Why would you ever want it
non-auto? I mean, I can imagine a lot of situations, but then you anyway don't
want to use the simple network management.

 Actually, I even doubt it makes sense to leave out the loopback interface.
Without loopback, things tend to be pretty fragile, so I wouldn't put that
option in a _simple_ network configuration. Too much ammo to shoot yourself in
the foot, and you can make your own /etc/network/interfaces if you really want to.

> +	   
> +endif
> +
> +menuconfig BR2_SIMPLE_NETWORK_1_ENABLE
> +	bool "enable first network interface"
> +	default y
> +	help
> +	   Enable the first network interface

 As long as we support only one interface, calling it the first one doesn't make
much sense.

 Also, if the loopback option is removed, then nesting it another level doesn't
make much sense. And even if the loopback stays, I would do the second-level
nesting with indentation (i.e. config instead of menuconfig and rely on the
condition to indent it).

> +
> +if BR2_SIMPLE_NETWORK_1_ENABLE
> +config BR2_SIMPLE_NETWORK_1_AUTO
> +	bool "enable first network interface at startup"
> +	default y
> +	help 
> +	   Should the first network inteface be brought up automatically at startup

 Again, I don't think it's useful to have this option.

> +
> +config BR2_SIMPLE_NETWORK_1_NAME
> +	string "name of the first physical network interface"

 Since this is already in the 'first network interface' menu, there is no point
in repeating 'first physical network interface' everywhere. Same story if it is
indented.


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

 Call this "IPv4 with static IP address"

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

 Actually, does it make sense to specify a broadcast address? When is it ever
different from default?


 Bottom line: I'd limit the configurability to the minimum useful set, and leave
the rest for a rootfs overlay.

 Regards,
 Arnout

> +
> +config BR2_SIMPLE_NETWORK_1_IPV4_GATEWAY
> +	string "Address of the gateway for the first network interface"
> +endif
> +
> +endif
> +
> +endif
> +
> +
>  endmenu
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
