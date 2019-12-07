From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Sat, 7 Dec 2019 12:39:33 +0100
Subject: [Buildroot] [PATCH v2 2/9] use host-systemctl preset all to
 enable units
In-Reply-To: <20191205130743.GK2539@scaer>
References: <20191111172443.6874-1-jeremy.rosen@smile.fr>
 <20191111172443.6874-3-jeremy.rosen@smile.fr>
 <20191205130743.GK2539@scaer>
Message-ID: <CAFvCimVWuAkUD5uuoqvdgGjAob51BuVvaPNQm7yJAr9A9-P2XA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Are you sure you want me to do that ?

I mean... I'll use SYSTEMD_PKGDIR in the systemd recipe, but for all the
others I rather leave the
code as it was previously. Yes it's cleaner but it's an independent fix (I
don't touch those lines in
the first place)

the general replacement packages/xxx => XXX_PKGDIR is also needed in other
places in these recipes
that have nothing to do with systemd, so it would be a half fix at best.

Moreover, those are tricky to test since it means compiling in lots of
packages.

I'd rather keep this cleanup as a separate thing, it's probably better done
with some sort of automated tool

Le jeu. 5 d?c. 2019 ? 14:07, Yann E. MORIN <yann.morin.1998@free.fr> a
?crit :

> J?r?my, All,
>
> An additional comment, see below...
>
> On 2019-11-11 18:24 +0100, J?r?my Rosen spake thusly:
> > since v234 upstream recommands using systemctl preset-all to enable
> units.
> [--SNIP--]
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index d1db60b5ef..dc2ed80e7d 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> [--SNIP--]
> > -define SYSTEMD_INSTALL_SERVICE_BOOT_CHECK
> > -     mkdir -p
> $(TARGET_DIR)/etc/systemd/system/boot-complete.target.requires
> > -     ln -sf
> ../../../../lib/systemd/system/systemd-boot-check-no-failures.service \
> > -
>  $(TARGET_DIR)/etc/systemd/system/boot-complete.target.requires/systemd-boot-check-no-failures.service
> > +define SYSTEMD_INSTALL_PRESET
> > +     $(INSTALL) -D -m 644 package/systemd/80-buildroot.preset
> $(TARGET_DIR)/usr/lib/systemd/system-preset/80-buildroot.preset
>
> We have a variable that refers to the directory of the package:
>     $(INSTALL) -D -m 644 $(SYSTEMD_PKGDIR)/80-buildroot.preset [...]
>
> Note that this comment is applicable to other patches in your series (at
> least the wpasuplicant one, for example).
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>


-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191207/031fd3c5/attachment.html>
