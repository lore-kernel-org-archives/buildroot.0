From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Feb 2021 22:43:33 +0100
Subject: [Buildroot] [PATCH] package/readline: disable bracketed paste
 by default
In-Reply-To: <20210226200821.2992417-1-mmayer@broadcom.com>
References: <20210226200821.2992417-1-mmayer@broadcom.com>
Message-ID: <20210226214333.GA2390841@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, All,

On 2021-02-26 12:08 -0800, Markus Mayer via buildroot spake thusly:
> As of readline 8.1, "bracketed paste" is enabled by default. However,
> the feature causes control characters to appear in captured (telnet)
> session output. This can throw off pattern matching if the output is to
> be processed by scripts.
> 
> Let's keep the previous default of leaving this feature disabled and
> provide a configuration option for users to enable it.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
> 
> We started running into issues after bringing in the changes of the upcoming
> BR 2021.02 release, because raw output with the feature enabled looks like
> this, with interspersed escape sequences like "<ESC>.[?2004h":
[--SNIP--]
> Our automated test setup didn't like that too much. And others might be
> facing similar issues.

Yup, I can see where that would hurt...

[--SNIP--]
> diff --git a/package/readline/Config.in b/package/readline/Config.in
> index 7021472623c8..ed63e00cc8f3 100644
> --- a/package/readline/Config.in
> +++ b/package/readline/Config.in
> @@ -7,3 +7,17 @@ config BR2_PACKAGE_READLINE
>  	  as they are typed in.
>  
>  	  https://tiswww.case.edu/php/chet/readline/rltop.html
> +
> +config BR2_PACKAGE_READLINE_BRACKETED_PASTE
> +	bool "Enable bracketed paste"
> +	depends on BR2_PACKAGE_READLINE
> +	help
> +	  Enable the "bracketed paste" feature in libreadline. Bracketed paste
> +	  is helpful for interactive sessions when one wants to prevent pasted
> +	  text from being interpreted as typed-in commands. However, it also
> +	  causes control characters to show up in the raw output of a (telnet)
> +	  session. This can cause issues and throw off pattern matching if the
> +	  session output is being captured for automated processing.
> +	  See
> +	      https://cirw.in/blog/bracketed-paste
> +	  for further information on this feature and whether you may want it.

    $ make check-package
    package/readline/Config.in:15: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/readline/Config.in:16: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/readline/Config.in:17: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/readline/Config.in:18: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/readline/Config.in:19: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/readline/Config.in:23: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

This is too bad, because you had managed to have a very nicely justified
block of help text that I foudn really good to look at... Alas, it does
not match the coding rules... <Sob...>

> diff --git a/package/readline/readline.mk b/package/readline/readline.mk
> index 326cffab1880..ce2a08b9375b 100644
> --- a/package/readline/readline.mk
> +++ b/package/readline/readline.mk
> @@ -16,6 +16,10 @@ READLINE_LICENSE = GPL-3.0+
>  READLINE_LICENSE_FILES = COPYING
>  READLINE_CPE_ID_VENDOR = gnu
>  
> +ifeq ($(BR2_PACKAGE_READLINE_BRACKETED_PASTE),)
> +	READLINE_CONF_OPTS += --disable-bracketed-paste-default
> +endif

No indentation in conditional blocks in makefiles (yup, that' goes counter
best practices, I'm not fan either, but that's what we do everywhere
else (mostly), and consistency wins.)

Also, we want explicit enable/disable, and we prefer positive logic:

    ifeq ($(BR2_PACKAGE_READLINE_BRACKETED_PASTE),y)
    READLINE_CONF_OPTS += --enable-bracketed-paste-default
    else
    READLINE_CONF_OPTS += --disable-bracketed-paste-default
    endif

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

> +
>  define READLINE_INSTALL_INPUTRC
>  	$(INSTALL) -D -m 644 package/readline/inputrc $(TARGET_DIR)/etc/inputrc
>  endef
> -- 
> 2.25.1
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
