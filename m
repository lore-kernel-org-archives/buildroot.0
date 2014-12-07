From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Dec 2014 21:44:46 +0100
Subject: [Buildroot] [PATCHv2] qtuio: add error handling to for loop
In-Reply-To: <1417644344-3116-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417644344-3116-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141207204446.GA10809@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-03 23:05 +0100, Thomas Petazzoni spake thusly:
> Also remove unneeded sub-shell usage in the build and installation
> steps. It is kept for the configure step as it is actually useful, and
> works fine because "|| exit 1" is outside the sub-shell.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes v1 -> v2:
>  * Remove unneeded sub-shell usage, noticed by Yann E. Morin.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/qtuio/qtuio.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/qtuio/qtuio.mk b/package/qtuio/qtuio.mk
> index 9925f84..5fa10a7 100644
> --- a/package/qtuio/qtuio.mk
> +++ b/package/qtuio/qtuio.mk
> @@ -19,7 +19,7 @@ QTUIO_EXAMPLES = dials fingerpaint knobs pinchzoom
>  ifeq ($(BR2_QTUIO_EXAMPLES),y)
>  define QTUIO_CONFIGURE_EXAMPLES
>  	for example in $(QTUIO_EXAMPLES) ; do \
> -		(cd $(@D)/examples/$${example} && $(TARGET_MAKE_ENV) $(QT_QMAKE)) ; \
> +		(cd $(@D)/examples/$${example} && $(TARGET_MAKE_ENV) $(QT_QMAKE)) || exit 1; \
>  	done
>  endef
>  endif
> @@ -32,7 +32,7 @@ endef
>  ifeq ($(BR2_QTUIO_EXAMPLES),y)
>  define QTUIO_BUILD_EXAMPLES
>  	for example in $(QTUIO_EXAMPLES) ; do \
> -		($(MAKE) -C $(@D)/examples/$${example}) ; \
> +		$(MAKE) -C $(@D)/examples/$${example} || exit 1; \
>  	done
>  endef
>  endif
> @@ -46,7 +46,7 @@ endef
>  ifeq ($(BR2_QTUIO_EXAMPLES),y)
>  define QTUIO_INSTALL_EXAMPLES
>  	for example in $(QTUIO_EXAMPLES) ; do \
> -		($(INSTALL) -D -m 0755 $(@D)/examples/$${example}/$${example} $(TARGET_DIR)/usr/share/qtuio/$${example}) ; \
> +		$(INSTALL) -D -m 0755 $(@D)/examples/$${example}/$${example} $(TARGET_DIR)/usr/share/qtuio/$${example} || exit 1 ; \
>  	done
>  endef
>  endif
> -- 
> 2.1.0
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
