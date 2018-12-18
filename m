From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Dec 2018 20:27:28 +0100
Subject: [Buildroot] [PATCH 1/4] system cfg: introduce option
 BR2_SYSTEM_DEFAULT_PATH
In-Reply-To: <20181218005116.17435-2-mmayer@broadcom.com>
References: <20181218005116.17435-1-mmayer@broadcom.com>
 <20181218005116.17435-2-mmayer@broadcom.com>
Message-ID: <20181218192728.GB24194@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, All,

On 2018-12-17 16:51 -0800, Markus Mayer spake thusly:
> The configuration option BR2_SYSTEM_DEFAULT_PATH allows the user to
> override the default path, which can be used by /etc/profile and some
> system daemons.
> 
> It defaults to the value previously hard-coded in /etc/profile. This
> default should be suitable for most users.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  system/Config.in | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 0f77b9b6721a..93458c0011b7 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -386,6 +386,16 @@ comment "automatic network configuration via DHCP needs ifupdown or busybox or n
>  
>  endif # BR2_ROOTFS_SKELETON_DEFAULT
>  
> +config BR2_SYSTEM_DEFAULT_PATH
> +	string "Set the system's default PATH"
> +	default "/bin:/sbin:/usr/bin:/usr/sbin" if !BR2_ROOTFS_MERGED_USR
> +	default "/bin:/sbin" if BR2_ROOTFS_MERGED_USR

Do we really care to have a different value at all?

In the merged-/usr case: if the command exists, it is found in either
/bin or /sbin, and the lookup stops there. If the command does not
exist, it is looked for in the four locations, instead of only two.

This does not look like too much of an overhead, does it?

Anyway, if we really want different values, then:
  - we can simplify it a bit,
  - and use the realy locations rahter than the  symlinks:

    default "/usr/bin:/usr/sbin" if BR2_ROOTFS_MERGED_USR
    default "/bin:/sbin:/usr/bin:/usr/sbin"

(kconfig will stop on the fiurst default that is valid.)

But for my part, I think a single default as is currently used is
enough (i.e. /bin:/sbin:/usr/bin:/usr/sbin).

Regards,
Yann E. MORIN.

> +	help
> +	  Sets the system's default PATH. It is being used in /etc/profile
> +	  in the skeleton-init-common package and by some daemons.
> +
> +	  The default should work in most cases.
> +
>  config BR2_ENABLE_LOCALE_PURGE
>  	bool "Purge unwanted locales"
>  	default y
> -- 
> 2.17.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
