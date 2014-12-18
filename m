From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 18 Dec 2014 09:04:17 +0100 (CET)
Subject: [Buildroot] [PATCH] Allow a single DHCP configuration via the
 system configuration submenu
In-Reply-To: <20141217212900.0df35c02@free-electrons.com>
Message-ID: <940385025.29419441.1418889857770.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


----- Mail original -----
> Dear J?r?my Rosen,
> 
> On Wed, 17 Dec 2014 17:15:46 +0100, J?r?my Rosen wrote:
> 
> >  support/scripts/generate-network-config.sh | 24
> >  ++++++++++++++++++++++++
> 
> Do we really need a helper script to do this?
>

That's... debatable. I think it's a bit long for inline, but it's 
a matter of taste. I'll inline in simplify it (do everythin without
functions to shorten a bit)

 
> NETWORK_IFACES = $(TARGET_DIR)/etc/network/interfaces
> NETWORK_DHCP_IFACE = $(call qstrip,$(BR2_SIMPLE_DHCP_INTERFACE))
> 
> define NETWORK_ADD_DHCP_INTERFACE
> 	echo "auto $(NETWORK_DHCP_IFACE)" >> $(NETWORK_IFACES)
> 	echo "iface $(NETWORK_DHCP_IFACE) inet dhcp" >> $(NETWORK_IFACES)
> endef
> 
> define NETWORK_CREATE_IFACES_FILE
> 	rm -f $(NETWORK_IFACES)
> 	echo "auto lo" >> $(NETWORK_IFACES)
> 	echo "iface lo inet loopback" >> $(NETWORK_IFACES)
> 	$(NETWORK_ADD_DHCP_INTERFACE)
> endef
> 
> TARGET_FINALIZE_HOOKS += NETWORK_CREATE_IFACES_FILE
> 
> > +config BR2_SIMPLE_DHCP
> > +	bool "automatic network configuration via DHCP"
> > +	default n
> > +	depends on !BR2_PACKAGE_SYSTEMD_NETWORKD
> > +	help
> > +	  Automatically do a DHCP request on startup on selected
> > interface at
> > +	  startup. For more complicated setups use an overlay.
> > +
> > +comment "automatic network configuration via DHCP is not
> > compatible with networkd"
> > +	depends on BR2_PACKAGE_SYSTEMD_NETWORKD
> > +
> > +config BR2_SIMPLE_DHCP_INTERFACE
> > +	string "name of the physical network interface to run DHCP on"
> > +	depends on BR2_SIMPLE_DHCP
> > +	default eth0
> > +	help
> > +	  The name of the network interface to configure automatically
> 
> Why two options? Just make the BR2_SIMPLE_DHCP_INTERFACE empty by
> default (does nothing), and when non-empty, used as the DHCP network
> interface.
> 

I did it for better presentation in the menuconfig menu, I thought
one option to activate and then another one to set, rather than
an empty-by-default one was cleaner... but if you think a single
one is better it's easy to change...


I'll wait for more comments and submit a v2 when I have more feedback


> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> 
