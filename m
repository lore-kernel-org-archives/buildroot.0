From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Oct 2019 00:15:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/sudo: removed template config,
 added convenient 'sudo' group config options.
In-Reply-To: <20191023211439.7754-1-stephan+buildroot@asklandd.dk>
References: <20191023211439.7754-1-stephan+buildroot@asklandd.dk>
Message-ID: <e97fd4a9-2d28-1d36-1ad3-9ae3c4486fd8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Stephan,

 Thank you for this patch. I have a few comments, could you respin your patch
taking them into account?


On 23/10/2019 23:14, Stephan Henningsen wrote:
> Signed-off-by: Stephan Henningsen <stephan+buildroot@asklandd.dk>
> ---
>  package/sudo/Config.in | 21 ++++++++++++++++++++-
>  package/sudo/sudo.mk   | 20 ++++++++++++++++++++
>  2 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/package/sudo/Config.in b/package/sudo/Config.in
> index cbef15d67b..aee077fe3b 100644
> --- a/package/sudo/Config.in
> +++ b/package/sudo/Config.in
> @@ -1,4 +1,4 @@
> -config BR2_PACKAGE_SUDO
> +menuconfig BR2_PACKAGE_SUDO

 With just a few sub-options, it's not worth making an additional menu. Kconfig
will indent the sub-options when they're conditional on the immediately
preceding symbol, as is the case here. That's enough.

>  	bool "sudo"
>  	# uses fork()
>  	depends on BR2_USE_MMU
> @@ -9,3 +9,22 @@ config BR2_PACKAGE_SUDO
>  	  but still allow people to get their work done.
>  
>  	  http://www.sudo.ws/sudo/
> +
> +
> +if BR2_PACKAGE_SUDO
> +
> +config BR2_PACKAGE_SUDO_GROUP
> +	bool "add system group 'sudo'"
> +	help
> +	  Create a convenient system group named 'sudo' for
> +	  granting users sudo permissions.
> +
> +config BR2_PACKAGE_SUDO_GROUP_RULE
> +	bool "allow member of group 'sudo' to execute any command."
> +	select BR2_PACKAGE_SUDO_GROUP
> +	help
> +	  Reinserts this rule from the /etc/sudoers configuration file:
> +
> +	  %sudo ALL=(ALL) ALL

 Does it really make sense to have separate options for these two aspects? If
you add a sudo group, it's most likely because you have something like that in
your sudoers file. Without this option, you'll anyway need a custom sudoers file
so it's pretty much irrelevant what you have in it.

 In fact, does it make sense to have the sudo group optional to begin with?

> +
> +endif
> diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
> index cf8b63b1db..34b1869e98 100644
> --- a/package/sudo/sudo.mk
> +++ b/package/sudo/sudo.mk
> @@ -64,4 +64,24 @@ define SUDO_PERMISSIONS
>  	/usr/bin/sudo f 4755 0 0 - - - - -
>  endef
>  
> +ifeq ($(BR2_PACKAGE_SUDO_GROUP_RULE),y)
> +define SUDO_ENABLE_SUDO_GROUP_RULE
> +sed -e '/^# \%sudo\tALL=(ALL) ALL/s/^# //' -i $(TARGET_DIR)/etc/sudoers
> +endef
> +SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_ENABLE_SUDO_GROUP_RULE
> +endif
> +
> +
> +ifeq ($(BR2_PACKAGE_SUDO_GROUP),y)
> +define SUDO_USERS
> +    -               -1   sudo            -1   -             -            -         -
> +endef
> +endif
> +
> +define SUDO_REMOVE_GARBAGE

 Please split this into two patches, because they're doing two separate,
unrelated things. In fact, your commit message already suggests this because you
say "this and that".

 Speaking of the commit message: it should use imperative (remove, add) and
should not end with a dot (at least the summary line shouldn't).

> +	$(RM) -fv $(TARGET_DIR)/etc/sudoers.dist # Remove stray example file

 $(RM) already has the -f, and the -v is not neded. Also the comment is not needed.

> +	$(RM) -frv $(TARGET_DIR)/etc/sudoers.d # Remove unused configuration directory

 We don't usually remove those empty .d directories, but it's true that there's
no good reason to have it there.

 Maybe you could use -rmdir instead, because the directory is supposed to be
empty and if it's not, it's probably not a good idea to remove it (e.g. because
the skeleton installed something in it, or some other package that uses sudo and
that was installed before because it only has a runtime dependency).

 Regards,
 Arnout

> +endef
> +SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_REMOVE_GARBAGE
> +
>  $(eval $(autotools-package))
> 
