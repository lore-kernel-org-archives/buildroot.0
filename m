From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Mar 2018 10:15:12 +0100
Subject: [Buildroot] [PATCH 1/1] mpd: add support for libupnp18
In-Reply-To: <CAPi7W82xkhPt-QUimyskbwS4XTqNBZzcaKzTr_Mg1fyWQ1jncQ@mail.gmail.com>
References: <20180310224056.3860-1-fontaine.fabrice@gmail.com>
 <20180311045752.ns6kotqmnwsf653w@sapphire.tkos.co.il>
 <CAPi7W82xkhPt-QUimyskbwS4XTqNBZzcaKzTr_Mg1fyWQ1jncQ@mail.gmail.com>
Message-ID: <20180311091512.GD2429@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, Baruch, All,

On 2018-03-11 10:04 +0100, Fabrice Fontaine spake thusly:
> Dear Baruch,
> 2018-03-11 5:57 GMT+01:00 Baruch Siach < [1]baruch@tkos.co.il>:
> 
>   Hi Fabrice,
>   On Sat, Mar 10, 2018 at 11:40:56PM +0100, Fabrice Fontaine wrote:
>   > Instead of selecting BR2_PACKAGE_LIBUPNP, makes UPnP option depending on
>   > BR2_PACKAGE_LIBUPNP or BR2_PACKAGE_LIBUPNP18 and let the user choose his
>   > preferred libupnp version
>   >
>   > Signed-off-by: Fabrice Fontaine < [2]fontaine.fabrice@gmail.com>
>   > ---
>   >? package/mpd/Config.in | 5 ++++-
>   >? package/mpd/ [3]mpd.mk? ? | 4 +++-
>   >? 2 files changed, 7 insertions(+), 2 deletions(-)
>   >
>   > diff --git a/package/mpd/Config.in b/package/mpd/Config.in
>   > index 5991b6f4bb..eee25c4c07 100644
>   > --- a/package/mpd/Config.in
>   > +++ b/package/mpd/Config.in
>   > @@ -308,11 +308,14 @@ config BR2_PACKAGE_MPD_TCP
>   >
>   >? config BR2_PACKAGE_MPD_UPNP
>   >? ? ? ?bool "UPnP"
>   > +? ? ?depends on BR2_PACKAGE_LIBUPNP || BR2_PACKAGE_LIBUPNP18
>   >? ? ? ?select BR2_PACKAGE_EXPAT
>   > -? ? ?select BR2_PACKAGE_LIBUPNP
> 
>   Why not
> 
>   ? select BR2_PACKAGE_LIBUPNP if !BR2_PACKAGE_LIBUPNP18
> 
>   ?
> 
> Because this creates a recursive dependency. Indeed, BR2_PACKAGE_LIBUPNP18 depends on !BR2_PACKAGE_LIBUPNP as both libraries can't
> be enabled at the same time.

Then: select BR2_PACKAGE_LIBUPNP18 if !BR2_PACKAGE_LIBUPNP
which seems to work for me here...

Regards,
Yann E. MORIN.

>   >? ? ? ?help
>   >? ? ? ? ?Enable MPD UPnP client support.
>   >
>   > +comment "UPnP client support needs libupnp or libupnp18"
>   > +? ? ?depends on !BR2_PACKAGE_LIBUPNP && !BR2_PACKAGE_LIBUPNP18
>   > +
>   >? endif
>   >
>   >? comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
>   > diff --git a/package/mpd/ [4]mpd.mk b/package/mpd/ [5]mpd.mk
>   > index 26e82af0a8..f50e3d90c7 100644
>   > --- a/package/mpd/ [6]mpd.mk
>   > +++ b/package/mpd/ [7]mpd.mk
>   > @@ -236,7 +236,9 @@ MPD_CONF_OPTS += --disable-twolame-encoder
>   >? endif
>   >
>   >? ifeq ($(BR2_PACKAGE_MPD_UPNP),y)
>   > -MPD_DEPENDENCIES += expat libupnp
>   > +MPD_DEPENDENCIES += \
>   > +? ? ?expat \
>   > +? ? ?$(if $(BR2_PACKAGE_LIBUPNP), libupnp,libupnp18)
>   >? MPD_CONF_OPTS += --enable-upnp
>   >? else
>   >? MPD_CONF_OPTS += --disable-upnp
> 
>   baruch
> 
>   --
>   ? ? ? [8]http://baruch.siach.name/blog/? ? ? ? ? ? ? ? ? ~. .~?
>   ?Tk Open Systems
>   =}------------------------------------------------ooO--U-- Ooo------------{=
>   ? ?- [9]baruch at tkos.co.il - tel: [10]+972.2.679.5364, [11]http://www.tkos.co.il -
> 
> Best Regards,
> 
> Fabrice
> 
> Links:
> 1. mailto:baruch at tkos.co.il
> 2. mailto:fontaine.fabrice at gmail.com
> 3. http://mpd.mk
> 4. http://mpd.mk
> 5. http://mpd.mk
> 6. http://mpd.mk
> 7. http://mpd.mk
> 8. http://baruch.siach.name/blog/
> 9. mailto:baruch at tkos.co.il
> 10. tel:%2B972.2.679.5364
> 11. http://www.tkos.co.il

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
