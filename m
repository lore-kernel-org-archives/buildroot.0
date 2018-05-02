From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 3 May 2018 00:40:43 +0200
Subject: [Buildroot] [PATCH 1/1] dhcpcd: systemv and systemd services
 conflict with NetworkManager
In-Reply-To: <71FE4BA8-F083-4A73-A05D-262F9C28E9E2@impinj.com>
References: <71FE4BA8-F083-4A73-A05D-262F9C28E9E2@impinj.com>
Message-ID: <a48d7bc9-978c-9faa-eda7-83d4c66b9eab@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



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
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
