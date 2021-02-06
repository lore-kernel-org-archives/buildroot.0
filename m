From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Feb 2021 12:35:08 +0100
Subject: [Buildroot] [PATCH 1/2] package/netopeer2: set
 SYSREPO_SHM_PREFIX and cleanup shm files after installation
In-Reply-To: <20210206105736.29429-1-heiko.thiery@gmail.com>
References: <20210206105736.29429-1-heiko.thiery@gmail.com>
Message-ID: <20210206113508.GD2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2021-02-06 11:57 +0100, Heiko Thiery spake thusly:
> On install step the host tool syrepoctl is used to install some YANG
> modules. Unfortunatly syrepoctl creates some files in /dev/shm folder and
> does not cleanup afterwards. This files can be incompatible depending on
> the used sysrepo version. This causes autobuilder failures when updating
> the package [1].
> 
> To make sure we can remove this leftovers of sysrepoctl we specify a
> build specific SYSREPO_SHM_PREFIX. With this the files can deleted safely
> after installation is completed. This also ensures that concurrent
> parallel builds will not affected mutualy.
> 
> Fixes:
>  [1] http://autobuild.buildroot.net/results/6e559c4f98b7ed93d7b5af638264e907492a6532/
> 
> Co-Developed-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/netopeer2/netopeer2.mk | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
> index bc02e0dc93..af30d8417a 100644
> --- a/package/netopeer2/netopeer2.mk
> +++ b/package/netopeer2/netopeer2.mk
> @@ -13,9 +13,23 @@ NETOPEER2_DEPENDENCIES = libnetconf2 libyang sysrepo
>  
>  NETOPEER2_CONF_OPTS = -DBUILD_CLI=$(if $(BR2_PACKAGE_NETOPEER2_CLI),ON,OFF)
>  
> +# Set a build specific SYSREPO_SHM_PREFIX to ensure we can safely delete the
> +# files. This also ensures that concurrent parallel builds will not be
> +# affected mutualy.
> +SYSREPO_SHM_PREFIX = sr_buildroot$(subst /,_,$(CONFIG_DIR))

It should be named after the current package, ie. NETOPEER2_SHM_PREFIX.

So, I sent this proposal late yesterday, and of course I forgot some
corner cases.

If we have two (independent) packages that call the host sysrepo during
build/instal, then we will still have the concurrency issue with
top-level parallel builds.

So, this prefix must also contain the name of the current package, i.e.
probably something along the lines of:

    NETOPEER2_SHM_PREFIX = sr_buildroot$(subst /,_,$(CONFIG_DIR))_netopeer2

Of course, ideally, we would like to make that generic, but this is
still too early for now. That would probably imply a macro helper, like:

    sysrepo-make-shm-prefix = sr_buildroot$(subst /,_,$(CONFIG_DIR))_$(PKG)

and then packages would use it as:

    NETOPEER2_SHM_PREFIX = $(call sysrepo-make-shm-prefix)

(the 'call' is superfluous, but it since we already have a bunch of
helpers that have to be called, it is nicer that they all should be.)

But really, that's still too early...

> +NETOPEER2_MAKE_ENV = SYSREPO_SHM_PREFIX=$(SYSREPO_SHM_PREFIX)
> +
>  define NETOPEER2_INSTALL_INIT_SYSV
>  	$(INSTALL) -m 755 -D package/netopeer2/S52netopeer2 \
>  		$(TARGET_DIR)/etc/init.d/S52netopeer2
>  endef
>  
> +# The host sysrepo used to install the netopeer2 modules will leave
> +# its shared memory files lingering about. Clean up in it's stead...

s/it's/its/

https://dictionary.cambridge.org/grammar/british-grammar/it-s-or-its

When I said I hand-edited the patch, and that it may be broken, that was
not the part I was thinking about... ;-)

No need to resend, I'll fix those when applying...

Regards,
Yann E. MORIN.

> +define NETOPEER2_CLEANUP
> +   rm -f /dev/shm/$(SYSREPO_SHM_PREFIX)*
> +endef
> +NETOPEER2_PRE_INSTALL_TARGET_HOOKS += NETOPEER2_CLEANUP
> +NETOPEER2_POST_INSTALL_TARGET_HOOKS += NETOPEER2_CLEANUP
> +
>  $(eval $(cmake-package))
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
