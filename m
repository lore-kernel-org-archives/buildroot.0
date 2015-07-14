From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Tue, 14 Jul 2015 08:29:08 -0500
Subject: [Buildroot] [PATCH v2 1/1] linux: add server options for NFSD
In-Reply-To: <1436830463-90993-1-git-send-email-ryan.barnett@rockwellcollins.com>
References: <1436830463-90993-1-git-send-email-ryan.barnett@rockwellcollins.com>
Message-ID: <CAMQcK5LasX0hcDX4dQ4Skhmfbgcmw-KrkXCxBeUpDwn93xLr4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Mon, Jul 13, 2015 at 6:34 PM, Ryan Barnett
<ryan.barnett@rockwellcollins.com> wrote:
> When nfs-utils packages is selected, automatically enable the kernel
> options for NFSD. This will allow for an NFS server to work by only
> adding /etc/exports to the filesystem.
>
> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> ---
> Test with qemu_x86_defconfig
>
> Changes v1 -> v2:
>   - Only enable CONFIG_NFSD (suggested by Arnout)
> ---
>  linux/linux.mk | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index b602a04..90396e6 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -229,6 +229,8 @@ define LINUX_KCONFIG_FIXUP_CMDS
>         $(if $(BR2_PACKAGE_XTABLES_ADDONS),
>                 $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK,$(@D)/.config)
>                 $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK,$(@D)/.config))
> +       $(if $(BR2_PACKAGE_NFS_UTILS),
> +               $(call KCONFIG_ENABLE_OPT,CONFIG_NFSD,$(@D)/.config))

I need to add to add the following line:

$(call KCONFIG_ENABLE_OPT,CONFIG_NFSD_V3,$(@D)/.config))

In my hesitation to test yesterday - I didn't do a clean build and was
caught by having a kernel already having the correct option enabled.

I will be sending a v3 here shortly.

>         $(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
>                 $(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
>  endef

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
