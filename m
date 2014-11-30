From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:17:52 +0100
Subject: [Buildroot] [PATCHv3 49/74] qtuio: add error handling to for
	loop
In-Reply-To: <1417357142-14307-50-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-50-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130171752.GC4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/qtuio/qtuio.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/qtuio/qtuio.mk b/package/qtuio/qtuio.mk
> index 9925f84..9af0136 100644
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
> +		($(MAKE) -C $(@D)/examples/$${example}) || exit 1; \

Why is that parenthesised?

>  	done
>  endef
>  endif
> @@ -46,7 +46,7 @@ endef
>  ifeq ($(BR2_QTUIO_EXAMPLES),y)
>  define QTUIO_INSTALL_EXAMPLES
>  	for example in $(QTUIO_EXAMPLES) ; do \
> -		($(INSTALL) -D -m 0755 $(@D)/examples/$${example}/$${example} $(TARGET_DIR)/usr/share/qtuio/$${example}) ; \
> +		($(INSTALL) -D -m 0755 $(@D)/examples/$${example}/$${example} $(TARGET_DIR)/usr/share/qtuio/$${example} || exit 1) ; \

Ditto, why parenthesis?

Besides, that will not work, because the exit is in the parenthesis. So
the sub-shell will indeed exit with a non-zero exit code, but that will
not exit the shell spawned by make.

NAK.

Regards,
Yann E. MORIN.

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
