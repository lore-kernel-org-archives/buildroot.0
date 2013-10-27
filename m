From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Oct 2013 10:39:52 +0100
Subject: [Buildroot] [PATCH] dhcpcd: add option to override dbdir
In-Reply-To: <1380548426-26780-1-git-send-email-luca@lucaceresoli.net>
References: <1380548426-26780-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <526CDF68.8050409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/09/13 15:40, Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>   package/dhcpcd/Config.in | 14 ++++++++++++++
>   package/dhcpcd/dhcpcd.mk |  1 +
>   2 files changed, 15 insertions(+)
>
> diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
> index a06a973..c144dd3 100644
> --- a/package/dhcpcd/Config.in
> +++ b/package/dhcpcd/Config.in
> @@ -6,5 +6,19 @@ config BR2_PACKAGE_DHCPCD
>
>   	  http://roy.marples.name/downloads/dhcpcd
>
> +if BR2_PACKAGE_DHCPCD
> +
> +config BR2_PACKAGE_DHCPCD_DBDIR
> +	string "database directory"
> +	default "/var/db"
> +	help
> +	  By default dhcpcd stores obtained DHCP leases and other info in
> +	  /var/db. Set this to any other directory you wish to use. This must
> +	  be on a read-write filesystem, otherwise dhcpcd will not work.
> +	  For example, you may want to change this directory if /var is on a
> +	  read-only filesystem in your embedded system.
> +
> +endif

  Hi Luca,

  After discussion on the buildroot developer day, we decided that this 
should not be configurable. Instead it should be hard-coded to some fixed 
path in /run, e.g. /run/db or something else that makes sense. (Note that 
/run is a symlink to /var/run which is a symlink to /tmp. We should use 
/run, not /var/run, because that conforms to the FHS.)

  Since you probably use this package, can you test this and send a patch?

  Regards,
  Arnout

> +
>   comment "dhcpcd requires a toolchain with IPV6 support"
>   	depends on !BR2_INET_IPV6
> diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
> index 5296db8..4d0e86c 100644
> --- a/package/dhcpcd/dhcpcd.mk
> +++ b/package/dhcpcd/dhcpcd.mk
> @@ -18,6 +18,7 @@ define DHCPCD_CONFIGURE_CMDS
>   	./configure \
>   		--target=$(BR2_GCC_TARGET_ARCH) \
>   		--os=linux \
> +		--dbdir=$(BR2_PACKAGE_DHCPCD_DBDIR) \
>   		$(DHCPCD_CONFIG_OPT) )
>   endef
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
