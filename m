From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Mon, 13 Oct 2014 17:34:04 +0200 (CEST)
Subject: [Buildroot] [PATCH] set simple network setup via the system
 configuration submenu
In-Reply-To: <543A44F8.5060104@openwide.fr>
Message-ID: <713198091.26528967.1413214443914.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



----- Mail original -----
> HiJ?r?my,
> 

<...>

> >
> > With regards to systemd, as far as I could figure it still uses
> > /etc/network/interfaces but with different names. AFAIU there is no
> > sane
> > default to replace the "eth0" name so I did not put a different
> > default
> > when systemd is used
> I checked on my Fedora machine that use systemd and there is no
> directory /etc/network.
> Instead there is a /etc/networks file.
> But I don't know systemd so much...



* systemv init

configuration is done by net-utils (or busybox) via /etc/network/*

inittab calls /etc/rc.d/S40network which calls ifup -a

(this file is part of skeleton/ so is always here)

this is the well known configuration infrastructure we all know and
love. 


* systemd without networkd

buildroot will automatically add a network.service which will do
the equivalent of S40network (i.e : call "ifup -a") The same
infrastructue is used, so the script still works

* systemd with networkd

systemd-networkd is in charge of setting up the network using
systemd rules it will find throughout the filesystem 
(/etc/systemd/network /usr/lib/systemd/network) 

I don't generate a networkd rule in this case. I don't know if
this is a wanted feature. I'll have a look at how complicated
this is...


> > ---
> >   Makefile                               |  1 +
> >   support/scripts/generate-interfaces.sh | 75
> >   ++++++++++++++++++++++++++++++++
> >   system/Config.in                       | 78
> >   ++++++++++++++++++++++++++++++++++
> >   3 files changed, 154 insertions(+)
> >   create mode 100755 support/scripts/generate-interfaces.sh
> >
> > diff --git a/Makefile b/Makefile
> > index e788f1b..71cad7d 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -477,6 +477,7 @@ $(BUILD_DIR)/.root:
> >   	@ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
> >   	@mkdir -p $(TARGET_DIR)/usr
> >   	@ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
> > +	./support/scripts/generate-interfaces.sh $(TARGET_DIR)
> generate-interfaces.sh is only called when the target directory is
> created.
> What happen if the Buildroot's configuration is modified ?
> What's about calling this script from target-finalize ?
> 
> If unlikely another interfaces file exist on the overlay directory
> which
> network configuration must be used ?
> 

I have moved this to system/system.mk which is where most of
the system submenu stuff is added. These are all added to
TARGET_FINALIZE which works for me. If a user adds an 
overlay, the overlay is applied after TARGET_FINALIZE so
the user's version of the file would be use, which seems to
me like the correct behaviour

> Also, $(TOPDIR) must be used here instead of '.'

fixed, will respin

> >   	touch $@
> >   
> >   $(TARGET_DIR): $(BUILD_DIR)/.root
> > diff --git a/support/scripts/generate-interfaces.sh
> > b/support/scripts/generate-interfaces.sh
> > new file mode 100755
> > index 0000000..b685669
> > --- /dev/null
> > +++ b/support/scripts/generate-interfaces.sh
> > @@ -0,0 +1,75 @@
> > +#!/bin/sh
> > +
> > +
> > +#extract  our parameters from the config file
> > +for PARAM in \
> > +	BR2_SIMPLE_NETWORK_LO_ENABLE \
> > +	BR2_SIMPLE_NETWORK_LO_AUTO \
> > +	\
> > +	BR2_SIMPLE_NETWORK_1_ENABLE \
> > +	BR2_SIMPLE_NETWORK_1_AUTO \
> > +	BR2_SIMPLE_NETWORK_1_IPV4_DHCP \
> > +	BR2_SIMPLE_NETWORK_1_IPV4_MANUAL \
> > +	; do
> > +TMP=$(sed -r -e "/^$PARAM=(.*)$/!d;" -e 's//\1/;' $BR2_CONFIG)
> > +	export $PARAM=$TMP
> > +done
> > +
> > +for PARAM in \
> > +	BR2_SIMPLE_NETWORK_1_NAME \
> > +	BR2_SIMPLE_NETWORK_1_IPV4_ADDRESS \
> > +	BR2_SIMPLE_NETWORK_1_IPV4_NETMASK \
> > +	BR2_SIMPLE_NETWORK_1_IPV4_BROADCAST \
> > +	BR2_SIMPLE_NETWORK_1_IPV4_GATEWAY \
> > +	; do
> > +TMP=$(sed -r -e "/^$PARAM=\"(.*)\"$/!d;" -e 's//\1/;' $BR2_CONFIG)
> > +	export $PARAM=$TMP
> > +done
> > +
> > +
> > +
> > +IFACE_FILE=$TARGET_DIR/etc/network/interfaces
> > +echo -n > $IFACE_FILE # empty the file
> > +
> > +if [ $BR2_SIMPLE_NETWORK_LO_ENABLE ] ; then
> > +	if [ $BR2_SIMPLE_NETWORK_LO_AUTO ] ; then
> > +		echo "auto lo">> $IFACE_FILE
> > +	fi
> > +	echo "iface lo inet loopback">> $IFACE_FILE
> > +	echo >>$IFACE_FILE
> > +fi
> > +
> > +if [ $BR2_SIMPLE_NETWORK_1_ENABLE ] ; then
> > +	if [ -z $BR2_SIMPLE_NETWORK_1_NAME ] ; then
> > +		echo ERROR no name specified for first network interface
> > +		exit 1
> > +	fi
> > +	if [ $BR2_SIMPLE_NETWORK_1_AUTO ] ; then
> > +		echo "auto  $BR2_SIMPLE_NETWORK_1_NAME">> $IFACE_FILE
> > +	fi
> > +	if [ $BR2_SIMPLE_NETWORK_1_IPV4_DHCP ] ; then
> > +		echo "iface $BR2_SIMPLE_NETWORK_1_NAME inet dhcp">> $IFACE_FILE
> > +	elif [ $BR2_SIMPLE_NETWORK_1_IPV4_MANUAL ] ; then
> > +		for PARAM in \
> > +			BR2_SIMPLE_NETWORK_1_IPV4_ADDRESS \
> > +			BR2_SIMPLE_NETWORK_1_IPV4_NETMASK \
> > +			BR2_SIMPLE_NETWORK_1_IPV4_BROADCAST \
> > +			BR2_SIMPLE_NETWORK_1_IPV4_GATEWAY \
> > +			; do
> > +			eval VALUE=\$$PARAM
> > +			if [ -z $VALUE ] ; then
> > +				echo ERROR $PARAM not set
> > +				exit 1
> > +			fi
> > +		done
> > +		echo "iface $BR2_SIMPLE_NETWORK_1_NAME inet static">>
> > $IFACE_FILE
> > +		echo "	address $BR2_SIMPLE_NETWORK_1_IPV4_ADDRESS">> $IFACE_FILE
> > +		echo "	netmask $BR2_SIMPLE_NETWORK_1_IPV4_NETMASK">> $IFACE_FILE
> > +		echo "	broadcast $BR2_SIMPLE_NETWORK_1_IPV4_BROADCAST">>
> > $IFACE_FILE
> > +		echo "	gateway $BR2_SIMPLE_NETWORK_1_IPV4_GATEWAY">> $IFACE_FILE
> > +	else
> > +		echo Incorrect buildroot configuration
> > +		exit 1
> > +	fi
> > +	echo >>$IFACE_FILE
> > +fi
> > diff --git a/system/Config.in b/system/Config.in
> > index e7e146a..d5711bc 100644
> > --- a/system/Config.in
> > +++ b/system/Config.in
> > @@ -389,4 +389,82 @@ config BR2_ROOTFS_POST_SCRIPT_ARGS
> >   	  directory / images directory. The arguments in this option
> >   	  will be
> >   	  passed *after* those.
> >   
> > +menuconfig BR2_SIMPLE_NETWORK
> > +	bool "Generate simple network configuration"
> > +	default n
> > +	help
> > +	  Use buildroot to set network configuration during the build
> > process
> > +
> > +if BR2_SIMPLE_NETWORK
> > +menuconfig BR2_SIMPLE_NETWORK_LO_ENABLE
> > +	bool "enable loopback device"
> > +	default y
> > +	help
> > +	   Enables the loopback interface at startup
> > +
> > +if BR2_SIMPLE_NETWORK_LO_ENABLE
> > +config BR2_SIMPLE_NETWORK_LO_AUTO
> > +	bool "enable loopback interface at startup"
> > +	default y
> > +	help
> > +	   Should the loopback inteface be brought up automatically at
> > startup
> > +
> > +endif
> > +
> > +menuconfig BR2_SIMPLE_NETWORK_1_ENABLE
> > +	bool "enable first network interface"
> > +	default y
> > +	help
> > +	   Enable the first network interface
> > +
> > +if BR2_SIMPLE_NETWORK_1_ENABLE
> > +config BR2_SIMPLE_NETWORK_1_AUTO
> > +	bool "enable first network interface at startup"
> > +	default y
> > +	help
> > +	   Should the first network inteface be brought up automatically
> > at startup
> > +
> > +config BR2_SIMPLE_NETWORK_1_NAME
> > +	string "name of the first physical network interface"
> > +	default "eth0"
> > +	help
> > +	   The name used to recognise the first network interface as
> > reported by the kernel
> > +
> > +choice
> > +	prompt "Configuration type"
> > +	default BR2_SIMPLE_NETWORK_1_DHCP
> > +	help
> > +	   The type of configuration to use for the first physical
> > interface
> > +
> > +config BR2_SIMPLE_NETWORK_1_IPV4_DHCP
> > +	bool "IPv4 with DHCP"
> > +	help
> > +	   Use DHCP to configure this interface
> > +	   using the IPv4 protocol
> > +
> > +config BR2_SIMPLE_NETWORK_1_IPV4_MANUAL
> > +	bool "IPv4 with parameters manually specified"
> > +	help
> > +	   Configure IPv4 by specifying each parameter separately
> > +endchoice
> > +
> > +if BR2_SIMPLE_NETWORK_1_IPV4_MANUAL
> > +config BR2_SIMPLE_NETWORK_1_IPV4_ADDRESS
> > +	string "IP Address of the first network interface"
> > +
> > +config BR2_SIMPLE_NETWORK_1_IPV4_NETMASK
> > +	string "Netmask of the first network interface"
> > +
> > +config BR2_SIMPLE_NETWORK_1_IPV4_BROADCAST
> > +	string "Broadcast Address of the first network interface"
> > +
> > +config BR2_SIMPLE_NETWORK_1_IPV4_GATEWAY
> > +	string "Address of the gateway for the first network interface"
> > +endif
> These configs settings needs a default value (like for the interface
> name)
> otherwise the script generate-interface will fail if only
> BR2_SIMPLE_NETWORK_1_IPV4_MANUAL has been selected.

Yes, that's on purpose... There is no sane default afaik for IP 
address when nothing is known on about the intranet topology...

I am opened to any suggestion on default values but I think it's
safer to consider this an incorrect setup and refuse to build



At this point i'll wait a couple of days for extra comments and i'll
look into networkd generation.

After that I will respin the patch...



> > +
> > +endif
> > +
> > +endif
> > +
> > +
> >   endmenu
> 
> Best regards,
> Romain
> 
