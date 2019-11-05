From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Nov 2019 19:51:14 +0100
Subject: [Buildroot] [PATCH] package/sudo: new config to add sudo group
 and rule
In-Reply-To: <20191103214153.24621-1-stephan@asklandd.dk>
References: <20191103214153.24621-1-stephan@asklandd.dk>
Message-ID: <20191105185114.GM2710@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stephan, All,

On 2019-11-03 22:41 +0100, Stephan Henningsen spake thusly:
> From: Stephan Henningsen <stephan+buildroot@asklandd.dk>
> 
> Signed-off-by: Stephan Henningsen <stephan+buildroot@asklandd.dk>
> ---
>  package/sudo/Config.in | 15 +++++++++++++++
>  package/sudo/sudo.mk   | 13 +++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/package/sudo/Config.in b/package/sudo/Config.in
> index cbef15d67b..403d634ceb 100644
> --- a/package/sudo/Config.in
> +++ b/package/sudo/Config.in
> @@ -9,3 +9,18 @@ config BR2_PACKAGE_SUDO
>  	  but still allow people to get their work done.
>  
>  	  http://www.sudo.ws/sudo/
> +
> +
> +if BR2_PACKAGE_SUDO
> +
> +config BR2_PACKAGE_SUDO_GROUP_AND_RULE
> +	bool "add group 'sudo' and enable associated sudo rule"
> +	select BR2_PACKAGE_SUDO_GROUP
> +	help
> +	  Creates a group named 'sudo', and enables the following rule
> +	  in the /etc/sudoers configuration file that allows members of
> +	  group 'sudo' to execute any command as root:
> +
> +	  %sudo ALL=(ALL) ALL

I thought the conclusion from the previous iteration was that the
addition of the group and sudo rules were to be non-optional.

> +endif
> diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
> index cf8b63b1db..5df39b193e 100644
> --- a/package/sudo/sudo.mk
> +++ b/package/sudo/sudo.mk
> @@ -64,4 +64,17 @@ define SUDO_PERMISSIONS
>  	/usr/bin/sudo f 4755 0 0 - - - - -
>  endef
>  
> +ifeq ($(BR2_PACKAGE_SUDO_GROUP_AND_RULE),y)
> +define SUDO_USERS
> +    -               -1   sudo            -1   -             -            -         -

When the username is '-', even the uid is ignored, we usually make it
'-' too. Also, there are too many spaces (see PERMISSIONS above).

So, I removed the condition (and thus the Config.in option), tweaked the
USERS variable, and pushed to master now.

Thanks!

Regards,
Yann E. MORIN.

> +endef
> +
> +define SUDO_ENABLE_SUDO_GROUP_RULE
> +	$(SED) '/^# \%sudo\tALL=(ALL) ALL/s/^# //' $(TARGET_DIR)/etc/sudoers
> +endef
> +
> +SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_ENABLE_SUDO_GROUP_RULE
> +
> +endif
> +
>  $(eval $(autotools-package))
> -- 
> 2.17.1
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
