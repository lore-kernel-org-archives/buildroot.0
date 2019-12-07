From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Dec 2019 17:42:28 +0100
Subject: [Buildroot] [PATCH v2 2/9] use host-systemctl preset all to
 enable units
In-Reply-To: <CAFvCimVWuAkUD5uuoqvdgGjAob51BuVvaPNQm7yJAr9A9-P2XA@mail.gmail.com>
References: <20191111172443.6874-1-jeremy.rosen@smile.fr>
 <20191111172443.6874-3-jeremy.rosen@smile.fr>
 <20191205130743.GK2539@scaer>
 <CAFvCimVWuAkUD5uuoqvdgGjAob51BuVvaPNQm7yJAr9A9-P2XA@mail.gmail.com>
Message-ID: <20191207164228.GM2539@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my, All,

Please, do not top-post, please...

On 2019-12-07 12:39 +0100, J?r?my ROSEN spake thusly:
> Are you sure you want me to do that ?
> I mean... I'll use SYSTEMD_PKGDIR in the systemd recipe, but for all the others I rather leave the?

No, it is just about the usage _you_ are introducing. Of course, I
am not suggesting that you change the existing ones, unless you are
actually touching that code too.

Regards,
Yann E. MORIN.

> code as it was previously. Yes it's cleaner but it's an independent?fix (I don't touch those lines in
> the first place)
> the general replacement packages/xxx => XXX_PKGDIR is also needed in other places in these recipes
> that have nothing to do with systemd, so it would be a half fix at best.
> Moreover, those are tricky to test since it means compiling in lots of packages.
> I'd rather keep this cleanup as a separate thing, it's probably better done with some sort of automated tool
> Le?jeu. 5 d?c. 2019 ??14:07, Yann E. MORIN < [1]yann.morin.1998@free.fr> a ?crit?:
> 
>   J?r?my, All,
> 
>   An additional comment, see below...
> 
>   On 2019-11-11 18:24 +0100, J?r?my Rosen spake thusly:
>   > since v234 upstream recommands using systemctl preset-all to enable units.
>   [--SNIP--]
>   > diff --git a/package/systemd/ [2]systemd.mk b/package/systemd/ [3]systemd.mk
>   > index d1db60b5ef..dc2ed80e7d 100644
>   > --- a/package/systemd/ [4]systemd.mk
>   > +++ b/package/systemd/ [5]systemd.mk
>   [--SNIP--]
>   > -define SYSTEMD_INSTALL_SERVICE_BOOT_CHECK
>   > -? ? ?mkdir -p $(TARGET_DIR)/etc/systemd/system/boot-complete.target.requires
>   > -? ? ?ln -sf ../../../../lib/systemd/system/systemd-boot-check-no-failures.service \
>   > -? ? ? ? ? ?
>   ?$(TARGET_DIR)/etc/systemd/system/boot-complete.target.requires/systemd-boot-check-no-failures.service
>   > +define SYSTEMD_INSTALL_PRESET
>   > +? ? ?$(INSTALL) -D -m 644 package/systemd/80-buildroot.preset
>   $(TARGET_DIR)/usr/lib/systemd/system-preset/80-buildroot.preset
> 
>   We have a variable that refers to the directory of the package:
>   ? ? $(INSTALL) -D -m 644 $(SYSTEMD_PKGDIR)/80-buildroot.preset [...]
> 
>   Note that this comment is applicable to other patches in your series (at
>   least the wpasuplicant one, for example).
> 
>   Regards,
>   Yann E. MORIN.
> 
>   --
>   .-----------------.--------------------.------------------.--------------------.
>   |? Yann E. MORIN? | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>   | +33 662 376 056 | Software? Designer | \ / CAMPAIGN? ? ?|? ___? ? ? ? ? ?
>   ? ?|
>   | +33 561 099 427 `------------.-------:? X? AGAINST? ? ? |? \e/? There is no? |
>   | [6]http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL? ? |? ?v? ?conspiracy.? |
>   '------------------------------^-------^------------------^--------------------'
> 
> --
> 
> +-----------------------------------------------------------------------------------------------------------------------+
> |                               | J?r?my ROSEN                                                                |
> | [7]3D"SMILE"[8] ?        | Architecte technique                                                                  |
> |                               | [9]3D"email" ? [10]jeremy.rosen at smile.fr?                                   |
> | 20 rue des Jardins            | [11]3D"phone" ? +33 6 88 25 87 42?                                          |
> | 92600 Asni?res-sur-Seine | [12]3D"url" ? [13]http://www.smile.eu                                            |
> |                               | [14]3D"Twitter" ? [15]3D"Facebook" ? [16]3D"LinkedIn" ? [17]3D"Github" |
> +-----------------------------------------------------------------------------------------------------------------------+
> 
> [18]3D"D?couvrez
> 
> Links:
> 1. mailto:yann.morin.1998 at free.fr
> 2. http://systemd.mk
> 3. http://systemd.mk
> 4. http://systemd.mk
> 5. http://systemd.mk
> 6. http://ymorin.is-a-geek.org/
> 7. http://www.smile.eu/
> 8. http://www.smile.eu/
> 9. Image: http://ftp.smile.fr/client/Communication/signature/img/mail.png
> 10. mailto:jeremy.rosen at smile.fr
> 11. Image: http://ftp.smile.fr/client/Communication/signature/img/phone.png
> 12. Image: http://ftp.smile.fr/client/Communication/signature/img/web.png
> 13. http://www.smile.eu/
> 14. https://twitter.com/GroupeSmile
> 15. https://www.facebook.com/smileopensource
> 16. https://www.linkedin.com/company/smile
> 17. https://github.com/Smile-SA
> 18. https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
