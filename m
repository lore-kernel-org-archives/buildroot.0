From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Jun 2015 19:48:03 +0200
Subject: [Buildroot] [v3 2/4] package/nodejs: symlink
 /usr/lib/node_modules/.bin/* to /usr/bin
In-Reply-To: <1435660966-11347-2-git-send-email-martin@barkynet.com>
References: <1435660966-11347-1-git-send-email-martin@barkynet.com>
 <1435660966-11347-2-git-send-email-martin@barkynet.com>
Message-ID: <20150630174803.GB3900@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2015-06-30 11:42 +0100, Martin Bark spake thusly:
> This patch symlinks all executables in /usr/lib/node_modules/.bin
> to /usr/bin so that node.js modules installed using
> BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL are accessible from the command line.
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3
>  - Create symlinks instead of setting PATH (Suggested by Yann E. MORIN)
> 
> Changes v1 -> v2
>  - Improved commit message
> ---
>  package/nodejs/nodejs.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 59e03b0..0b3f8a5 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -111,6 +111,14 @@ define NODEJS_INSTALL_MODULES
>  		$(HOST_DIR)/usr/bin/npm install \
>  		$(NODEJS_MODULES_LIST) \
>  	)
> +
> +	# Symlink all executables in $(TARGET_DIR)/usr/lib/node_modules/.bin to
> +	# $(TARGET_DIR)/usr/bin so they are accessible from the command line
> +	cd $(TARGET_DIR)/usr/bin; \
> +	for f in ../../usr/lib/node_modules/.bin/*; do \
> +		[ -f "$${f}" -a -x "$${f}" ] || continue; \
> +		ln -sf "$${f}" "$${f##*/}" || exit 1; \
> +	done
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
