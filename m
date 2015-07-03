From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Jul 2015 00:02:37 +0200
Subject: [Buildroot] [PATCH] pkg-kconfig: .config target needs to take
 into account package dependencies
In-Reply-To: <1435956134-9543-1-git-send-email-arnout@mind.be>
References: <1435956134-9543-1-git-send-email-arnout@mind.be>
Message-ID: <20150703220237.GI3652@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-07-03 22:42 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> It is possible that the package's kconfig system needs one of its
> dependencies to be built before. This is for example the case for the
> linux-backports project, which needs a reference to the linux kernel
> configuration.
> 
> Therefore, the dependencies of $$($(2)_TARGET_CONFIGURE) should be
> copied as $(2)_DIR/.config's dependencies. The dependency on _PATCH was
> already there (implicitly, through $$($(2)_KCONFIG_FILE)), only the
> dependency on $$($(2)_DEPENDENCIES) should be added.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/pkg-kconfig.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index c86c340..6018b25 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -57,6 +57,11 @@ $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
>  		fi; \
>  	done
>  
> +# Generating the .config file is part of the configure step of the package
> +# infrastructure, so it should be ordered like it. IOW, it should take over
> +# its dependencies.
> +$$($(2)_DIR)/.config: | $$($(2)_FINAL_DEPENDENCIES)

OK, I see the point.

However, when Thomas DS. and I did the infra, we explicitly avoided this
dependency, for a simple reason: we did not want to have to build the
dependencies of a package just to 'menuconfig' it, like so:

    make menuconfig   <- enable kernel
    make linux-menuconfig

Currently, all we need@that moment is that linux be downloaded,
extracted and patched, then we can show the menuconfig.

With your proposed patch, it means all the Linux dependencies
(host-kmod, lzop...) will have to be built before we can show the
menuconfig. This was the situation we were in before we had the
kconfig-package infra, and it is *very* frustrating... :-(

I would like to avoid this as much as possible. Although I understand
the reason for linux-backports, can we find a better solution? I would
even be OK with an ad-hoc solution just for linux-backports...

Regards,
Yann E. MORIN.

>  # The specified source configuration file and any additional configuration file
>  # fragments are merged together to .config, after the package has been patched.
>  # Since the file could be a defconfig file it needs to be expanded to a
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
