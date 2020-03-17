From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Mar 2020 21:49:05 +0100
Subject: [Buildroot] [PATCH] Makefile: fix locale purge when
 BR2_PER_PACKAGE_DIRECTORIES=y
In-Reply-To: <20200316154623.972632-1-thomas.petazzoni@bootlin.com>
References: <20200316154623.972632-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200317204905.GT19677@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-03-16 16:46 +0100, Thomas Petazzoni spake thusly:
> With BR2_PER_PACKAGE_DIRECTORIES=y, we have the following code in the
> main Makefile:
> 
> target-finalize: $(PACKAGES) $(TARGET_DIR) host-finalize
> 	@$(call MESSAGE,"Finalizing target directory")
> 	$(call per-package-rsync,$(sort $(PACKAGES)),target,$(TARGET_DIR))
> 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
> 
> The per-package-rsync call creates the global $(TARGET_DIR) from the
> per-package $(TARGET_DIR). Then, we call the TARGET_FINALIZE_HOOKS.
> 
> One of the TARGET_FINALIZE_HOOKS, PURGE_LOCALES, remove locales that
> are not desired by the user. It does so using a loop with the
> $(wildcard ...) function.
> 
> However, the $(wildcard ...) function is expanded at the moment the
> rule is evaluated. And with per-package directory, at the time the
> rule is evaluated, the global $(TARGET_DIR) is empty, so $(wildcard
> ...) will return nothing. It is indeed only after the call to
> per-package-rsync that the TARGET_DIR will be populated.
> 
> This commit fixes that by moving away from $(wildcard ...) and use a
> shell test instead, since we are anyway in big block of shell code.
> 
> With this, locales are properly purged again when
> BR2_PER_PACKAGE_DIRECTORIES=y.
> 
> Fixes: c4e6d5c8be6ada8e7c60950e3b499c55d48761cb ("core: implement per-package SDK and target")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, with a small code-style fix, see below...

> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 074d08c04a..cc65d7ca09 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -698,8 +698,9 @@ define PURGE_LOCALES
>  	rm -f $(LOCALE_WHITELIST)
>  	for i in $(LOCALE_NOPURGE) locale-archive; do echo $$i >> $(LOCALE_WHITELIST); done
>  
> -	for dir in $(wildcard $(addprefix $(TARGET_DIR),/usr/share/locale /usr/share/X11/locale /usr/lib/locale)); \
> +	for dir in $(addprefix $(TARGET_DIR),/usr/share/locale /usr/share/X11/locale /usr/lib/locale); \
>  	do \
> +		if [ ! -d $$dir ] ; then continue ; fi ; \

The code around does not have a space in front of the semicolon, so I
removed it here too.

THan I pushed to master, thanks!

Regards,
Yann E. MORIN.

>  		for langdir in $$dir/*; \
>  		do \
>  			if [ -e "$${langdir}" ]; \
> -- 
> 2.24.1
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
