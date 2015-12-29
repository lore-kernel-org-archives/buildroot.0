From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2015 19:06:00 +0100
Subject: [Buildroot] [PATCHv5 2/2] pkg-generic: improve incorrectly used
 package detection
In-Reply-To: <1444382106-16019-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1444382106-16019-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1444382106-16019-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20151229180600.GC3445@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-10-09 11:15 +0200, Thomas Petazzoni spake thusly:
> The package infrastructure now detects when a target package is being
> built even if its corresponding Config.in option is not enabled, and
> aborts with an error. However, it does not indicate *which* package is
> improperly depending on the current package without selecting it at
> the kconfig level.
> 
> So, in this commit, in addition to displaying an error, we try to help
> the user by saying which packages could be the culprit. To achieve
> this, we register the reverse dependencies of each package in a
> variable called <pkg>_DEPENDENT_OF, and display this variable for the
> problematic package when the error is detected. Many thanks to Yann
> E. Morin for the idea and implementation!
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-generic.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index a831199..1266a47 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -150,6 +150,8 @@ ifeq ($(MAKECMDGOALS),)
>  	@if test "$($(PKG)_TYPE)" = "target" -a -z "$($($(PKG)_KCONFIG_VAR))" ; then \
>  		echo "ERROR: A package must have added $($(PKG)_NAME) to its _DEPENDENCIES line but" ; \
>  		echo "forgot to add the corresponding select / depends on $($(PKG)_KCONFIG_VAR)." ; \
> +		echo "Potential culprits:" ; \
> +		for p in $($(PKG)_DEPENDENT_OF) ; do echo " - $$p" ; done ; \

This does only work for first-level culprits.

For example, I added;
    BUSYBOX_DEPENDENCIES += exim

And I get:

    >>> berkeleydb 5.3.28 Patching libtool
    ERROR: A package must have added berkeleydb to its _DEPENDENCIES line but
    forgot to add the corresponding select / depends on BR2_PACKAGE_BERKELEYDB.
    Potential culprits:
    make[1]: *** [.../berkeleydb-5.3.28/.stamp_configured] Error 1
    make: *** [_all] Error 2

That's because the real culprit is not directly the cause of the
berkeleydb dependency; the depenency chain is two-or-more levels deep.

So, NAK on this patch (even though that was my idea originally, IIRC).

I'll (later!) to find a solution...

Regards,
Yann E. MORIN.

>  		exit 1 ; \
>  	fi
>  endif
> @@ -777,6 +779,12 @@ endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
>  # configuration
>  ifeq ($$($$($(2)_KCONFIG_VAR)),y)
>  
> +# Store reverse build-dependency information: we add the name of the
> +# current package to the <pkg>_DEPENDENT_OF variable of all packages
> +# the current package depends on.
> +$$(eval $$(foreach d,$$($(2)_FINAL_ALL_DEPENDENCIES),\
> +	$$(call UPPERCASE,$$(d))_DEPENDENT_OF += $(1)$$(sep)))
> +
>  # Ensure the calling package is the declared provider for all the virtual
>  # packages it claims to be an implementation of.
>  ifneq ($$($(2)_PROVIDES),)
> -- 
> 2.6.1
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
