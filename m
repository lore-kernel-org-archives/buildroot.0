From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Jun 2015 00:11:12 +0200
Subject: [Buildroot] [v2 2/6] package/nodejs: Update to allow selecting
 node.js version
In-Reply-To: <1435370498-25473-2-git-send-email-martin@barkynet.com>
References: <1435370498-25473-1-git-send-email-martin@barkynet.com>
 <1435370498-25473-2-git-send-email-martin@barkynet.com>
Message-ID: <20150627221112.GC30876@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2015-06-27 03:01 +0100, Martin Bark spake thusly:
> Signed-off-by: Martin Bark <martin@barkynet.com>
[--SNIP--]
> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> index 3140683..61419fd 100644
> --- a/package/nodejs/Config.in
> +++ b/package/nodejs/Config.in
> @@ -22,6 +22,20 @@ comment "nodejs needs a toolchain w/ C++, threads"
>  
>  if BR2_PACKAGE_NODEJS
>  
> +choice
> +	prompt "Node.js Version"
> +	default BR2_BR2_PACKAGE_NODEJS_0_10_39
> +	help
> +	  Select the version of Node.js you wish to use.
> +
> +	config BR2_BR2_PACKAGE_NODEJS_0_10_39
> +		bool "v0.10.39"

We normally do not indent the config options in a choice block.

> +endchoice
> +
> +config BR2_PACKAGE_NODEJS_VERSION_STRING
> +	string
> +	default "0.10.39"	if BR2_BR2_PACKAGE_NODEJS_0_10_39
>  menu "Module Selection"

Missinge empty line before the menu definition.

Otherwise, looks good; when you fix the above, you can add my:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  config BR2_PACKAGE_NODEJS_NPM
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 4293c70..59e03b0 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NODEJS_VERSION = 0.10.39
> +NODEJS_VERSION = $(call qstrip,$(BR2_PACKAGE_NODEJS_VERSION_STRING))
>  NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
>  NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
>  NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
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
