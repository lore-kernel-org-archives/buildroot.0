From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Jun 2015 00:44:30 +0200
Subject: [Buildroot] [v2 4/6] package/nodejs: Add
 /usr/lib/node_modules/.bin to PATH
In-Reply-To: <1435370498-25473-4-git-send-email-martin@barkynet.com>
References: <1435370498-25473-1-git-send-email-martin@barkynet.com>
 <1435370498-25473-4-git-send-email-martin@barkynet.com>
Message-ID: <20150627224430.GE30876@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2015-06-27 03:01 +0100, Martin Bark spake thusly:
> This patch adds /usr/lib/node_modules/.bin to PATH so that global
> node_modules are accessible from the command line
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> 
> ---
> Changes v1 -> v2
>  - Improved commit message
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  package/nodejs/nodejs.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 59e03b0..5d95f77 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -111,6 +111,11 @@ define NODEJS_INSTALL_MODULES
>  		$(HOST_DIR)/usr/bin/npm install \
>  		$(NODEJS_MODULES_LIST) \
>  	)
> +
> +	# Add global node_modules to PATH
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/profile.d
> +	printf "export PATH=\x24PATH:/usr/lib/node_modules/.bin\n" \

Nice trick, but what about the slightly-more readable;

    printf 'PATH="$${PATH}:/usr/lib/node_modules/.bin"\n' \
        >$(TARGET_DIR)/etc/profile.d/node_modules.sh

  - because this is in a Makefile, so we need to $-escape the $.

  - because we do not want that $ to be interpreted by the shell (at build
    time!), we single-quote it.

  - because whoever knows what PATH is made of would be a fool (and
    because the world is cruel), we double-quote it (at runtime!)

Otherwise, what is the reason to have nodejs modules available as
commands from a login (!) shell? (Note: nodejs-noob speaking!)

Regards,
Yann E. MORIN.

> +		>$(TARGET_DIR)/etc/profile.d/node_modules.sh
>  endef
>  endif
>  
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
