From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Jul 2015 01:22:08 +0200
Subject: [Buildroot] [PATCH 1/1] linux: add server options for NFSD
In-Reply-To: <1436829189-90663-1-git-send-email-ryan.barnett@rockwellcollins.com>
References: <1436829189-90663-1-git-send-email-ryan.barnett@rockwellcollins.com>
Message-ID: <55A44820.3080406@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/14/15 01:13, Ryan Barnett wrote:
> When nfs-utils packages is selected, automatically enable the kernel
> options for NFSD. This will allow for an NFS server to work by only
> adding /etc/exports to the filesystem.
> 
> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> ---
> 
> Test with qemu_x86_defconfig
> 
> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> ---
>  linux/linux.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index b602a04..ef876c4 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -229,6 +229,9 @@ define LINUX_KCONFIG_FIXUP_CMDS
>  	$(if $(BR2_PACKAGE_XTABLES_ADDONS),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK,$(@D)/.config)
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK,$(@D)/.config))
> +	$(if $(BR2_PACKAGE_NFS_UTILS),
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_NFSD,$(@D)/.config)
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_NFSD_V4,$(@D)/.config))

 Since v4 is currently disabled in nfs-utils, this isn't useful at the moment,
right?

 Regards,
 Arnout

>  	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
>  endef
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
