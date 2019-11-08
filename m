From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Nov 2019 20:19:20 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/sudo: fix rmdir
In-Reply-To: <20191108173719.27345-1-fontaine.fabrice@gmail.com>
References: <20191108173719.27345-1-fontaine.fabrice@gmail.com>
Message-ID: <20191108191920.GI3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-11-08 18:37 +0100, Fabrice Fontaine spake thusly:
> Pass --ignore-fail-on-non-empty to rmdir to fix the following error:
> 
> rmdir /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/target/etc/sudoers.d
> rmdir: failed to remove '/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/target/etc/sudoers.d': Directory not empty
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0cfc61a98760c1d3a98aa0f1e126767881c49abd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I expanded the commit log with a blurb about why 'rm -rf' is not
adequate, and pushed to master now. Thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Pass --ignore-fail-on-non-empty option to rmdir instead of $(RM) -rf
> 
>  package/sudo/sudo.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
> index 7d52eb0b57..a7966047f8 100644
> --- a/package/sudo/sudo.mk
> +++ b/package/sudo/sudo.mk
> @@ -66,7 +66,7 @@ endef
>  
>  define SUDO_REMOVE_DIST_EXAMPLES
>  	$(RM) $(TARGET_DIR)/etc/sudoers.dist
> -	rmdir $(TARGET_DIR)/etc/sudoers.d
> +	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/etc/sudoers.d
>  endef
>  SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_REMOVE_DIST_EXAMPLES
>  
> -- 
> 2.23.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
