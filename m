From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Nov 2014 22:44:46 +0100
Subject: [Buildroot] [PATCH v3 4/5] package: matchbox-keyboard: use
 install instead of cp
In-Reply-To: <1416244750-24256-5-git-send-email-guido@vanguardiasur.com.ar>
References: <1416244750-24256-1-git-send-email-guido@vanguardiasur.com.ar>
 <1416244750-24256-5-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20141117214446.GH12473@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guido, All,

On 2014-11-17 14:19 -0300, Guido Mart?nez spake thusly:
> in order to not depend on the previous permissions of the file
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> ---
>  package/matchbox/matchbox-keyboard/matchbox-keyboard.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
> index ebf23e4..48a50de 100644
> --- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
> +++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
> @@ -15,7 +15,7 @@ MATCHBOX_KEYBOARD_DEPENDENCIES = host-pkgconf matchbox-lib matchbox-fakekey expa
>  MATCHBOX_KEYBOARD_CONF_ENV = expat=yes
>  
>  define MATCHBOX_KEYBOARD_POST_INSTALL_FIXES
> -	cp -dpf ./package/matchbox/matchbox-keyboard/mb-applet-kbd-wrapper.sh $(TARGET_DIR)/usr/bin/
> +	$(INSTALL) -m 0755 ./package/matchbox/matchbox-keyboard/mb-applet-kbd-wrapper.sh $(TARGET_DIR)/usr/bin/

This should be:

    $(INSTALL) -D -m 0755 package/matchbox/matchbox-keyboard/mb-applet-kbd-wrapper.sh \
                          $(TARGET_DIR)/usr/bin/mb-applet-kbd-wrapper.sh

That is:
  - full path to the destination file. Otherwise, if $(TARGET_DIR)/usr/bin
    does not exist (in case of a custom skeleton, for example),
    'install' will create a file named "$(TARGET_DIR)/usr/bin" instead
    of creating a directory and copying into it;
  - the leading ./ to the source is not needed.

Regards,
Yann E. MORIN.

>  endef
>  
>  MATCHBOX_KEYBOARD_POST_INSTALL_TARGET_HOOKS += MATCHBOX_KEYBOARD_POST_INSTALL_FIXES
> -- 
> 2.1.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
