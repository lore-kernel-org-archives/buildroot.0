From: Jim Brennan <jbrennan@impinj.com>
Date: Mon, 7 May 2018 18:01:03 +0000
Subject: [Buildroot] [PATCH 1/1] dhcpcd: systemv and systemd services
 conflict with NetworkManager
In-Reply-To: <a48d7bc9-978c-9faa-eda7-83d4c66b9eab@mind.be>
References: <71FE4BA8-F083-4A73-A05D-262F9C28E9E2@impinj.com>
 <a48d7bc9-978c-9faa-eda7-83d4c66b9eab@mind.be>
Message-ID: <3817CD56-89A4-43B5-9EC3-1602BCAF23B0@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

The behavior is that the dhcp eth0 address gets lost after NetworkManager spawns it's own instance of dhcpcd which seems to get killed by the master dhcpcd process coming from systemd.  After this occurs, NetworkManager cancels the DHCP transaction after it see's that it's spawned dhcpcd process was terminated.

I have NOT tested to see the interaction of ifup/ifdown scripts, so don't know if this interaction also occurs.

================
Here is with running the dhcpcd service which causes the FAILURE ...

?May 07 16:24:42 device-armv7l-17-00-06 NetworkManager[192]: <info>  [1525710282.1275] manager: NetworkManager state is now CONNECTING      
May 07 16:24:42 device-armv7l-17-00-06 NetworkManager[192]: <info>  [1525710282.1322] device (eth0): state change: prepare -> config (reason 'none', sys-iface-state: 'managed')     
May 07 16:24:42 device-armv7l-17-00-06 NetworkManager[192]: <info>  [1525710282.1376] device (eth0): state change: config -> ip-config (reason 'none', sys-iface-state: 'managed')   
May 07 16:24:42 device-armv7l-17-00-06 NetworkManager[192]: <info>  [1525710282.1407] dhcp4 (eth0): activation: beginning transaction (timeout in 45 seconds)       
May 07 16:24:42 device-armv7l-17-00-06 NetworkManager[192]: <info>  [1525710282.1476] dhcp4 (eth0): dhcpcd started with pid 315   
May 07 16:24:42 device-armv7l-17-00-06 dhcpcd[315]: sending commands to master dhcpcd process   
May 07 16:24:42 device-armv7l-17-00-06 dhcpcd[257]: control command: /sbin/dhcpcd -B -K -L -A -G -c /usr/libexec/nm-dhcp-helper eth0       
May 07 16:24:42 device-armv7l-17-00-06 NetworkManager[192]: <info>  [1525710282.1574] dhcp4 (eth0): client pid 315 exited with status 0    
May 07 16:24:42 device-armv7l-17-00-06 NetworkManager[192]: <info>  [1525710282.1581] dhcp4 (eth0): state changed unknown -> done 
May 07 16:24:42 device-armv7l-17-00-06 NetworkManager[192]: <info>  [1525710282.1588] dhcp4 (eth0): canceled DHCP transaction     
May 07 16:25:14 device-armv7l-17-00-06 NetworkManager[192]: <info>  [1525710314.0763] device (eth0): state change: ip-config -> failed (reason 'ip-config-unavailable', sys-iface-state: 'managed')   
May 07 16:25:14 device-armv7l-17-00-06 NetworkManager[192]: <info>  [1525710314.0778] manager: NetworkManager state is now DISCONNECTED    
May 07 16:25:14 device-armv7l-17-00-06 NetworkManager[192]: <warn>  [1525710314.0794] device (eth0): Activation: failed for connection 'Wired connection 1' 
May 07 16:25:14 device-armv7l-17-00-06 NetworkManager[192]: <info>  [1525710314.0826] device (eth0): state change: failed -> disconnected (reason 'none', sys-iface-state: 'managed') 
May 07 16:25:14 device-armv7l-17-00-06 NetworkManager[192]: <info>  [1525710314.1040] policy: auto-activating connection 'Wired connection 1'   

==================
This is what happens without the dhcpcd service running SUCCESS...

?May 07 16:54:37 device-armv7l-17-00-06 NetworkManager[167]: <info>  [1525712077.0995] manager: NetworkManager state is now CONNECTING
May 07 16:54:37 device-armv7l-17-00-06 NetworkManager[167]: <info>  [1525712077.1039] device (eth0): state change: prepare -> config (reason 'none', sys-iface-state: 'managed')   
May 07 16:54:37 device-armv7l-17-00-06 NetworkManager[167]: <info>  [1525712077.1077] device (eth0): state change: config -> ip-config (reason 'none', sys-iface-state: 'managed')      
May 07 16:54:37 device-armv7l-17-00-06 NetworkManager[167]: <info>  [1525712077.1136] dhcp4 (eth0): activation: beginning transaction (timeout in 45 seconds)      
May 07 16:54:37 device-armv7l-17-00-06 NetworkManager[167]: <info>  [1525712077.1247] dhcp4 (eth0): dhcpcd started with pid 243        
May 07 16:54:37 device-armv7l-17-00-06 dhcpcd[243]: DUID 00:03:00:01:02:16:25:17:00:06
May 07 16:54:37 device-armv7l-17-00-06 dhcpcd[243]: eth0: IAID 25:17:00:06
May 07 16:54:37 device-armv7l-17-00-06 dhcpcd[243]: eth0: soliciting a DHCP lease 
May 07 16:54:37 device-armv7l-17-00-06 dhcpcd[243]: eth0: soliciting an IPv6 router        
May 07 16:54:38 device-armv7l-17-00-06 dhcpcd[243]: eth0: offered 10.0.0.3 from 10.0.0.1   
May 07 16:54:38 device-armv7l-17-00-06 dhcpcd[243]: eth0: leased 10.0.0.3 for 300 seconds  
May 07 16:54:38 device-armv7l-17-00-06 dhcpcd[243]: eth0: adding route to 10.0.0.0/24      
May 07 16:54:38 device-armv7l-17-00-06 NetworkManager[167]: <info>  [1525712078.2904] dhcp4 (eth0):   address 10.0.0.3   
May 07 16:54:38 device-armv7l-17-00-06 NetworkManager[167]: <info>  [1525712078.2906] dhcp4 (eth0):   plen 24 (255.255.255.0) 
May 07 16:54:38 device-armv7l-17-00-06 NetworkManager[167]: <info>  [1525712078.2907] dhcp4 (eth0):   gateway 10.0.0.1   
May 07 16:54:38 device-armv7l-17-00-06 NetworkManager[167]: <info>  [1525712078.2910] dhcp4 (eth0):   lease time 300   
May 07 16:54:38 device-armv7l-17-00-06 NetworkManager[167]: <info>  [1525712078.2911] dhcp4 (eth0):   nameserver '10.0.0.1'   
May 07 16:54:38 device-armv7l-17-00-06 NetworkManager[167]: <info>  [1525712078.2912] dhcp4 (eth0): state changed unknown -> bound     
May 07 16:54:38 device-armv7l-17-00-06 NetworkManager[167]: <info>  [1525712078.3015] device (eth0): state change: ip-config -> ip-check (reason 'none', sys-iface-state: 'managed')    
May 07 16:54:38 device-armv7l-17-00-06 NetworkManager[167]: <info>  [1525712078.3109] device (eth0): state change: ip-check -> secondaries (reason 'none', sys-iface-state: 'managed')  
May 07 16:54:38 device-armv7l-17-00-06 NetworkManager[167]: <info>  [1525712078.3138] device (eth0): state change: secondaries -> activated (reason 'none', sys-iface-state: 'managed') 
May 07 16:54:38 device-armv7l-17-00-06 NetworkManager[167]: <info>  [1525712078.3158] manager: NetworkManager state is now CONNECTED_LOCAL  
May 07 16:54:38 device-armv7l-17-00-06 NetworkManager[167]: <info>  [1525712078.3193] manager: NetworkManager state is now CONNECTED_SITE
May 07 16:54:38 device-armv7l-17-00-06 NetworkManager[167]: <info>  [1525712078.3206] policy: set 'Wired connection 1' (eth0) as default for IPv4 routing and DNS
May 07 16:54:38 device-armv7l-17-00-06 NetworkManager[167]: <info>  [1525712078.3227] device (eth0): Activation: successful, device activated.
May 07 16:54:38 device-armv7l-17-00-06 NetworkManager[167]: <info>  [1525712078.3367] manager: startup complete
May 07 16:54:38 device-armv7l-17-00-06 NetworkManager[167]: <info>  [1525712078.3404] manager: NetworkManager state is now CONNECTED_GLOBAL   

?On 5/2/18, 3:40 PM, "Arnout Vandecappelle" <arnout@mind.be> wrote:    
    On 01-05-18 02:02, Jim Brennan wrote:
    > When NetworkManager and dhcpcd packages are both enabled,
    > dhcpcd services and NetworkManager both spawn dhcpcd.  This causes
    > the network port to retrieve an IP address and later lose it a few
    > seconds after startup.
    
     But then the second DHCP client also gets an IP address, so in the end all is
    well, right? I'm not saying that we shouldn't fix this, just trying to
    understand what's really going on.
    
    
    > This patch prevents dhcpcd services from launching dhcpcd if
    > NetworkManager is enabled.
    
     I think we need to take a step back here, and look at all the possibly
    conflicting combinations...
    
     We currently have:
    
    - ifupdown-scripts (installed by default if !systemd-networkd)
    - systemd-networkd
    - network-manager
    - dhcpcd
    
    that can possibly start a DHCP client.
    
     So, if we just select dhcpcd without network-manager, we actually have a
    similar problem: both S40networking and S41dhcpcd will start a DHCP client.
    
     Bottom line: I think the start scripts should just be removed entirely. And
    also, most likely the ifupdown-scripts package should depend on
    !BR2_PACKAGE_NETWORK_MANAGER. Or does the problem not exist for that situation?
    
     Regards,
     Arnout
    
    > 
    > Signed-off-by: Jim Brennan <jbrennan@impinj.com>
    > ---
    >  package/dhcpcd/dhcpcd.mk | 2 ++
    >  1 file changed, 2 insertions(+)
    > 
    > diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
    > index 92a78cd7ad..7536d71869 100644
    > --- a/package/dhcpcd/dhcpcd.mk
    > +++ b/package/dhcpcd/dhcpcd.mk
    > @@ -36,6 +36,7 @@ define DHCPCD_INSTALL_TARGET_CMDS
    >  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
    >  endef
    >  
    > +ifeq ($(BR2_PACKAGE_NETWORK_MANAGER),)
    >  define DHCPCD_INSTALL_INIT_SYSV
    >  	$(INSTALL) -m 755 -D package/dhcpcd/S41dhcpcd \
    >  		$(TARGET_DIR)/etc/init.d/S41dhcpcd
    > @@ -48,6 +49,7 @@ define DHCPCD_INSTALL_INIT_SYSTEMD
    >  	ln -sf ../../../../usr/lib/systemd/system/dhcpcd.service \
    >  		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dhcpcd.service
    >  endef
    > +endif
    >  
    >  # NOTE: Even though this package has a configure script, it is not generated
    >  # using the autotools, so we have to use the generic package infrastructure.
    > 
    
    -- 
    Arnout Vandecappelle                          arnout at mind be
    Senior Embedded Software Architect            +32-16-286500
    Essensium/Mind                                https://na01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.mind.be&data=02%7C01%7Cjbrennan%40impinj.com%7C62d74259aaf34ece4bd808d5b07dbf0a%7C6de70f0f73574529a415d8cbb7e93e5e%7C0%7C0%7C636608976485850686&sdata=S8GiVEG7idlNmPTDeq%2Fj9ld4KLIrt%2FG4T1VvzbUQhME%3D&reserved=0
    G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
    LinkedIn profile: https://na01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.linkedin.com%2Fin%2Farnoutvandecappelle&data=02%7C01%7Cjbrennan%40impinj.com%7C62d74259aaf34ece4bd808d5b07dbf0a%7C6de70f0f73574529a415d8cbb7e93e5e%7C0%7C0%7C636608976485850686&sdata=FyzOoed6pHQNUhMckYMYz%2FAdX67QBl%2B5BS8rTqSbJjo%3D&reserved=0
    GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
    
