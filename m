From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 19 Mar 2017 23:18:25 +0100
Subject: [Buildroot] [PATCH] package/ifupdown-scripts: new package
In-Reply-To: <1489916894-2692-1-git-send-email-yann.morin.1998@free.fr>
References: <1489916894-2692-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <e46f59ca-cf2f-f2fe-accf-6586c17f78f4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-03-17 10:48, Yann E. MORIN wrote:
> The ifupdown scripts can be used independently of the init system, be it
> sysv, busybox or systemd; they could even be used when there is no init
> system (i.e. the user is providing his own).
> 
> Currently, those ifupdown scripts are bundled in the skeleton.
> 
> But we soon will have a skeleton specific to systemd, so we would be
> missing those scripts (when systemd-networks is not enabled).
> 
> So, move those scripts to their own package.
> 
> This new package is selected by the various init systems that need it.

 I'd like to challenge this one.

 This package basically populates /etc/network with the ifupdown scripts. IMO
the ifupdown scripts have nothing to do with the init system, they only have
something to do with the network management system. We have (I think) 6
different network management systems:

- busybox ifupdown
- ifupdown
- systemd-networkd
- s6-networking
- network-manager
- connman

 As far as I understand, only the first two use /etc/network (I'm not sure if
/etc/network is still needed for the lo interface with network-manager and
connman, and I know nothing about s6-networking). On the other hand, even if
ifupdown is used, you may have custom scripts and not need this package. And
when you use e.g. network-manager, it doesn't hurt to also have /etc/network
scripts installed. (Ideally I should have checked this of course, to see if both
lo and eth0 come up if no /etc/network is installed but network-manager is
running...)

 Therefore, I would propose to make the package freely selectable, i.e. not
selected by nor depend on anything. Perhaps the only exception is that we want
to depend on !BR2_PACKAGE_SYSTEMD_NETWORKD because the two systemd services will
slightly conflict with each other (actually I don't think they will...).

 Maybe I'm wrong and S40networking is still needed for the lo interface, or
network-manager still uses the scripts in /etc/network/*.d. Even in that case, I
think one may want to enable this package e.g. when BR2_INIT_NONE - when you use
some custom init system, you still may want to call ifup to start the network.
In that case the init script won't be installed, but /etc/network is still relevant.


> This means that, no longer being part of the skeleton but being selected
> by the init systems, they are now available even when a custom skeleton
> is used, like our initscripts are.
> 
> Previously, the systemd service was provided by systemd, while the syv
> startup script was provided by initscripts. Both are moved to this new
> ifupdown-scripts package for consistency with the other scripts. We
> still intall the systemd service file because ifupdown-scripts cannot be
> enabled when systemd-networkd is enabled.
> 
> Instead of being a target-finalize hook, the scripts are installed as
> any other package are, with a package install-target command.

[snip]
> diff --git a/package/ifupdown/Config.in b/package/ifupdown/Config.in
> index e683201..74be59f 100644
> --- a/package/ifupdown/Config.in
> +++ b/package/ifupdown/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_IFUPDOWN
>  	# Default/our uclibc lacks wordexp()
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +	select BR2_PACKAGE_IFUPDOWN_SCRIPTS

 Doesn't this lead to a circular dependency when BR2_PACKAGE_SYSTEMD_NETWORKD is
selected?

 Also, I wonder why you do this for the ifupdown package, but not for busybox
ifupdown...

>  	# runtime for ip binary
>  	select BR2_PACKAGE_IPROUTE2 if !BR2_PACKAGE_BUSYBOX
>  	# runtime for run-parts
[snip]
> diff --git a/system/Config.in b/system/Config.in
> index 3ddf843..4fc037b 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -103,6 +103,7 @@ config BR2_INIT_BUSYBOX
>  	bool "BusyBox"
>  	select BR2_PACKAGE_BUSYBOX
>  	select BR2_PACKAGE_INITSCRIPTS
> +	select BR2_PACKAGE_IFUPDOWN_SCRIPTS
>  
>  config BR2_INIT_SYSV
>  	bool "systemV"

 Even if you disagree with everything I wrote and keep things like you put them
now, the package should definitely also be selected when BR2_INIT_SYSV.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
