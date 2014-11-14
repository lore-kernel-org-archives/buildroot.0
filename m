From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Nov 2014 23:28:41 +0100
Subject: [Buildroot] [PATCH 10/10] dhcpcd: use standard installation
In-Reply-To: <1415969096-3032-11-git-send-email-gustavo@zacarias.com.ar>
References: <1415969096-3032-1-git-send-email-gustavo@zacarias.com.ar>
 <1415969096-3032-11-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <54668219.4090202@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/11/14 13:44, Gustavo Zacarias wrote:
> Drop the custom/manual install cmds and do a normal make install.
> This gets dhcpcd-hooks installed which are useful for many accesory
> setup functions like dns, ntp server, and so on.
> Also install dhcpcd to /sbin since it's expected by debian ifupdown,

 Same think, network-manager.mk needs to be adapted.

 Regards,
 Arnout

> For busybox ifupdown when external dhcp clients are enabled (not in the
> default config we ship) will search the path.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/dhcpcd/dhcpcd.mk | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
> index 5f7c1a6..abd871f 100644
> --- a/package/dhcpcd/dhcpcd.mk
> +++ b/package/dhcpcd/dhcpcd.mk
> @@ -35,12 +35,7 @@ define DHCPCD_BUILD_CMDS
>  endef
>  
>  define DHCPCD_INSTALL_TARGET_CMDS
> -	$(INSTALL) -D -m 0755 $(@D)/dhcpcd \
> -		$(TARGET_DIR)/usr/sbin/dhcpcd
> -	$(INSTALL) -D -m 0644 $(@D)/dhcpcd.conf \
> -		$(TARGET_DIR)/etc/dhcpcd.conf
> -	$(INSTALL) -D -m 0755 $(@D)/dhcpcd-run-hooks \
> -		$(TARGET_DIR)/libexec/dhcpcd-run-hooks
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
>  endef
>  
>  # NOTE: Even though this package has a configure script, it is not generated
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
