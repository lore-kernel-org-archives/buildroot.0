From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Apr 2021 09:47:31 +0200
Subject: [Buildroot] [PATCH 2/3] package/bash: add option to keep or
 remove loadable examples
In-Reply-To: <20210423202356.37681-2-thomas.petazzoni@bootlin.com>
References: <20210423202356.37681-1-thomas.petazzoni@bootlin.com>
 <20210423202356.37681-2-thomas.petazzoni@bootlin.com>
Message-ID: <20210424074731.GO298901@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-04-23 22:23 +0200, Thomas Petazzoni spake thusly:
> bash has a concept of "loadables", which are "plugins" that can be
> loaded at runtime by bash to add new builtin. For example:
> 
> whoami is /usr/bin/whoami
> root
> whoami is a shell builtin
> root

I was not sure what you meant with those examples, so I've rewritten
that part with a capture of a session enabling and disabling whoami
as a shell builtin.

> bash comes with a set of example loadables, installed in
> /usr/lib/bash/. They take 312 KB on ARM32, and are by default not
> used, and provide builtins that are for the most part already
> available as external commands in Busybox/coreutils:
> 
> Makefile.inc  finfo         mkfifo        realpath      sync
> accept        head          mktemp        rm            tee
> basename      id            mypid         rmdir         truefalse
> csv           ln            pathchk       seq           tty
> cut           loadables.h   print         setpgid       uname
> dirname       logname       printenv      sleep         unlink
> fdflags       mkdir         push          strftime      whoami
> 
> So instead of having them unconditionally installed, add an option to
> enable/disable their installation (their build apparently cannot be
> disabled via a configure option).
> 
> Normally, we try to keep backward compatibility by preserving the
> existing behavior. In this case, this would have meant making this
> option "default y". But this also breaks our principle of "being
> minimal by default", and in this case, it feels preferable to be
> "minimal by default" than preserving existing behavior.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/bash/Config.in | 14 ++++++++++++++
>  package/bash/bash.mk   | 13 +++++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/package/bash/Config.in b/package/bash/Config.in
> index 5a9ebb8d02..0212df6bfd 100644
> --- a/package/bash/Config.in
> +++ b/package/bash/Config.in
> @@ -9,3 +9,17 @@ config BR2_PACKAGE_BASH
>  	  The standard GNU Bourne again shell.
>  
>  	  http://tiswww.case.edu/php/chet/bash/bashtop.html
> +
> +if BR2_PACKAGE_BASH
> +
> +config BR2_PACKAGE_BASH_LOADABLE_EXAMPLES
> +	bool "loadable examples"
> +	depends on !BR2_STATIC_LIBS
> +	help
> +	  This option will enable the installation of the "loadable"
> +	  examples, which are dynamically loadable extension providing
> +	  additional built-ins commands to bash. There are typically
> +	  not needed as they are provided as regular, external
> +	  commands.
> +
> +endif
> diff --git a/package/bash/bash.mk b/package/bash/bash.mk
> index 996c6a6097..6913ccafd8 100644
> --- a/package/bash/bash.mk
> +++ b/package/bash/bash.mk
> @@ -48,6 +48,19 @@ define BASH_REMOVE_UNUSED_FILES
>  endef
>  BASH_POST_INSTALL_TARGET_HOOKS += BASH_REMOVE_UNUSED_FILES
>  
> +ifeq ($(BR2_PACKAGE_BASH_LOADABLE_EXAMPLES),y)
> +define BASH_REMOVE_LOADABLE_UNUSED_FILES
> +	rm -f $(TARGET_DIR)/usr/lib/bash/Makefile.inc
> +	rm -f $(TARGET_DIR)/usr/lib/bash/loadables.h
> +endef
> +BASH_POST_INSTALL_TARGET_HOOKS += BASH_REMOVE_LOADABLE_UNUSED_FILES
> +else
> +define BASH_REMOVE_LOADABLE_EXAMPLES
> +	rm -rf $(TARGET_DIR)/usr/lib/bash
> +endef
> +BASH_POST_INSTALL_TARGET_HOOKS += BASH_REMOVE_LOADABLE_EXAMPLES
> +endif
> +
>  # Add /bin/bash to /etc/shells otherwise some login tools like dropbear
>  # can reject the user connection. See man shells.
>  define BASH_ADD_MKSH_TO_SHELLS
> -- 
> 2.30.2
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
