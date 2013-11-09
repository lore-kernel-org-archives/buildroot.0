From: universe II <universeii@gmx.de>
Date: Sat, 09 Nov 2013 15:55:23 +0100
Subject: [Buildroot] Patch for re-activating rshd and rlogind build
In-Reply-To: <trinity-4957780b-fc6b-4034-a1cf-56fff1642edd-1383921125839@3capp-gmx-bs05>
References: <trinity-4957780b-fc6b-4034-a1cf-56fff1642edd-1383921125839@3capp-gmx-bs05>
Message-ID: <527E4CDB.8040807@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No comment on that?
Do you want to apply this patch to make my work available to all 
buildroot users?

Andreas

On 11/08/2013 03:32 PM, universeII at gmx.de wrote:
> All,
> when trying to setup my target system to start rshd I figured out some 
> problems. Below you can find a description and and patch to fix the 
> problems. Result is a working rshd and rlogind.
> Please no comments like "use ssh, that's more secure". Usage of rsh is 
> mandatory in my setup as the existing and qualified test system uses 
> rsh to perform software tests on the target. Changing the test system 
> is no option (due to qualification effort).
> I found out that build of rshd and rlogind is commented out in 
> Config.in of package rsh-redone. Re-activating them lead to compile 
> errors of the rsh-redone package (when linking with pam). After a 
> while I found the root cause. The make targets are wrong: rshd and 
> rlogind must be replaces by in.rshd and in.rlogind. With these changes 
> rshd and rlogind are compiled and are running fine on my target. Just 
> activate them in inetd.conf and adjust some PAM settings. That's all.
> Please let me know, if you need more details or if the patch is in a 
> wrong format (this is my first patch contribution).
> Regards,
> Andreas
> P.S.: I did not succeed in re-activating rcp as there is an compile 
> error in the rsh-redone sources.
> diff -purN rsh-redone_org/Config.in rsh-redone/Config.in
> --- rsh-redone_org/Config.in    2013-09-17 13:42:07.000000000 +0200
> +++ rsh-redone/Config.in        2013-10-24 08:22:47.324184620 +0200
> @@ -17,15 +17,15 @@ config BR2_PACKAGE_RSH_REDONE_RLOGIN
>         depends on BR2_PACKAGE_RSH_REDONE
>
>  # requires PAM
> -#config BR2_PACKAGE_RSH_REDONE_RLOGIND
> -#      bool "rlogind"
> -#      depends on BR2_PACKAGE_RSH_REDONE
> +config BR2_PACKAGE_RSH_REDONE_RLOGIND
> +       bool "rlogind"
> +       depends on BR2_PACKAGE_RSH_REDONE
>
>  config BR2_PACKAGE_RSH_REDONE_RSH
>         bool "rsh"
>         depends on BR2_PACKAGE_RSH_REDONE
>
>  # requires PAM
> -#config BR2_PACKAGE_RSH_REDONE_RSHD
> -#      bool "rshd"
> -#      depends on BR2_PACKAGE_RSH_REDONE
> +config BR2_PACKAGE_RSH_REDONE_RSHD
> +       bool "rshd"
> +       depends on BR2_PACKAGE_RSH_REDONE
> diff -purN rsh-redone_org/rsh-redone.mk rsh-redone/rsh-redone.mk
> --- rsh-redone_org/rsh-redone.mk        2013-09-17 13:42:07.000000000 
> +0200
> +++ rsh-redone/rsh-redone.mk    2013-10-24 08:23:00.643065545 +0200
> @@ -13,8 +13,8 @@ rsh-redone-bin-$(BR2_PACKAGE_RSH_REDONE_
>  rsh-redone-bin-$(BR2_PACKAGE_RSH_REDONE_RLOGIN) += rlogin
>  rsh-redone-bin-$(BR2_PACKAGE_RSH_REDONE_RSH) += rsh
>  rsh-redone-sbin-y =
> -rsh-redone-sbin-$(BR2_PACKAGE_RSH_REDONE_RLOGIND) += rlogind
> -rsh-redone-sbin-$(BR2_PACKAGE_RSH_REDONE_RSHD) += rshd
> +rsh-redone-sbin-$(BR2_PACKAGE_RSH_REDONE_RLOGIND) += in.rlogind
> +rsh-redone-sbin-$(BR2_PACKAGE_RSH_REDONE_RSHD) += in.rshd
>
>  define RSH_REDONE_BUILD_CMDS
>         $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) 
> BIN="$(rsh-redone-bin-y)" SBIN="$(rsh-redone-sbin-y)"
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131109/91d9fb26/attachment.html>
