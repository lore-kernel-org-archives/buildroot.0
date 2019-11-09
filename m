From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Nov 2019 23:08:17 +0100
Subject: [Buildroot] [PATCH 06/15] package/avahi: adapt to preset-all
In-Reply-To: <CAFvCimX3m6+Ft=zxK-36VrB=xkLFRx4rNJG+Wpr=eMmeQTuKZA@mail.gmail.com>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
 <20191103165640.21819-7-jeremy.rosen@smile.fr>
 <CADvTj4r_o-HqfRQUOpi+6h92R=AX9kLN5yQr3y-pV8LSGKoYxQ@mail.gmail.com>
 <CAFvCimX3m6+Ft=zxK-36VrB=xkLFRx4rNJG+Wpr=eMmeQTuKZA@mail.gmail.com>
Message-ID: <20191109220817.GS3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my, All,

On 2019-11-03 18:17 +0100, J?r?my ROSEN spake thusly:
> that's probably correct, but I tried to be compatible.
> Dropping that patch will do "the correct thing"

I understand your position, and it is sensible.

However, doing it after the patch that calls systemctl preset-all. means
that from patch 2 to 5, avahi is enabled at boot.

So, we have two options here:

 1. move this avahi patch before using systemctl preset-all
 2. consider that systemctl prest-all is also a fix for incorrectly
    registered service files, and thus in patch 2 add a blurb in the
    commit log: "And this also properly registers services installed
    by other packages".

I am fine with either option, but I'd favour (2): if the user has
enabled a package, that's not for the size increase alone; it is most
probably because it needs the features of that package, so it makes
sense to enable the services.

So, I would be in favour if dropping that patch, indeed.

Regards,
Yann E. MORIN.

> Le?dim. 3 nov. 2019 ??18:15, James Hilliard < [1]james.hilliard1@gmail.com> a ?crit?:
> 
>   On Sun, Nov 3, 2019 at 11:57 AM J?r?my Rosen < [2]jeremy.rosen@smile.fr> wrote:
>   >
>   > avahi was not enabled, we now need to disable it explicitly
>   Isn't avahi not being enabled a bug? Why do we want to have it disabled?
>   >
>   > Signed-off-by: J?r?my Rosen < [3]jeremy.rosen@smile.fr>
>   > ---
>   >? package/avahi/50-avahi.preset | 3 +++
>   >? package/avahi/ [4]avahi.mk? ? ? ? | 2 ++
>   >? 2 files changed, 5 insertions(+)
>   >? create mode 100644 package/avahi/50-avahi.preset
>   >
>   > diff --git a/package/avahi/50-avahi.preset b/package/avahi/50-avahi.preset
>   > new file mode 100644
>   > index 0000000000..998772ea96
>   > --- /dev/null
>   > +++ b/package/avahi/50-avahi.preset
>   > @@ -0,0 +1,3 @@
>   > +disable avahi-daemon.service
>   > +disable avahi-daemon.socket
>   > +disable avahi-dnsconfd.service
>   > diff --git a/package/avahi/ [5]avahi.mk b/package/avahi/ [6]avahi.mk
>   > index 53021f6b6d..2df63c5273 100644
>   > --- a/package/avahi/ [7]avahi.mk
>   > +++ b/package/avahi/ [8]avahi.mk
>   > @@ -198,6 +198,8 @@ endef
>   >? endif
>   >
>   >? define AVAHI_INSTALL_INIT_SYSTEMD
>   > +? ? ? ?$(INSTALL) -D -m 644 package/avahi/50-avahi.preset \
>   > +? ? ? ? ? ? ? ?$(TARGET_DIR)/usr/lib/systemd/system-preset/50-avahi.preset
>   >? ? ? ? ?$(INSTALL) -D -m 644 package/avahi/avahi_tmpfiles.conf \
>   >? ? ? ? ? ? ? ? ?$(TARGET_DIR)/usr/lib/tmpfiles.d/avahi.conf
>   >
>   > --
>   > 2.24.0.rc1
>   >
>   > _______________________________________________
>   > buildroot mailing list
>   > [9]buildroot at busybox.net
>   > [10]http://lists.busybox.net/mailman/listinfo/buildroot
> 
> --
> 
> +-----------------------------------------------------------------------------------------------------------------------+
> |                               | J?r?my ROSEN                                                                |
> | [11]3D"SMILE"[12] ?      | Architecte technique                                                                  |
> |                               | [13]3D"email" ? [14]jeremy.rosen at smile.fr?                                  |
> | 20 rue des Jardins            | [15]3D"phone" ? +33 6 88 25 87 42?                                          |
> | 92600 Asni?res-sur-Seine | [16]3D"url" ? [17]http://www.smile.eu                                            |
> |                               | [18]3D"Twitter" ? [19]3D"Facebook" ? [20]3D"LinkedIn" ? [21]3D"Github" |
> +-----------------------------------------------------------------------------------------------------------------------+
> 
> [22]3D"D?couvrez
> 
> Links:
> 1. mailto:james.hilliard1 at gmail.com
> 2. mailto:jeremy.rosen at smile.fr
> 3. mailto:jeremy.rosen at smile.fr
> 4. http://avahi.mk
> 5. http://avahi.mk
> 6. http://avahi.mk
> 7. http://avahi.mk
> 8. http://avahi.mk
> 9. mailto:buildroot at busybox.net
> 10. http://lists.busybox.net/mailman/listinfo/buildroot
> 11. http://www.smile.eu/
> 12. http://www.smile.eu/
> 13. Image: http://ftp.smile.fr/client/Communication/signature/img/mail.png
> 14. mailto:jeremy.rosen at smile.fr
> 15. Image: http://ftp.smile.fr/client/Communication/signature/img/phone.png
> 16. Image: http://ftp.smile.fr/client/Communication/signature/img/web.png
> 17. http://www.smile.eu/
> 18. https://twitter.com/GroupeSmile
> 19. https://www.facebook.com/smileopensource
> 20. https://www.linkedin.com/company/smile
> 21. https://github.com/Smile-SA
> 22. https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature

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
