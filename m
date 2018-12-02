From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 2 Dec 2018 12:23:14 +0100
Subject: [Buildroot] [PATCH 1/1] minizip: fix display of comment
In-Reply-To: <875zwckymo.fsf@tkos.co.il>
References: <20181202102427.16747-1-fontaine.fabrice@gmail.com>
 <875zwckymo.fsf@tkos.co.il>
Message-ID: <CAPi7W82Sj-M4=cd4gwv_6W99q9hFdj-uD7j3u+X9rLOmz3K=KQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch,

Le dim. 2 d?c. 2018 ? 11:32, Baruch Siach <baruch@tkos.co.il> a ?crit :
>
> Hi Fabrice,
>
> Fabrice Fontaine writes:
> > Commit e13855c48f21eaee07a81f8b02678839be274a45 wrongly added
> > depends on BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU
> > to display the comment "minizip needs a toolchain w/ threads, wchar"
>
> Why is it wrong? This dependency is meant to hide the comment in the
> !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU) case.
It is wrong because, in commit
e13855c48f21eaee07a81f8b02678839be274a45, I added in minizip/Config.in
(and in libbsd/Config.in):
config BR2_PACKAGE_MINIZIP
   depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU) # libbsd
[...]
comment "minizip needs a toolchain w/ threads, wchar"
    depends on BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU
    depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR

As a result, the comment is not displayed with an uclibc toolchain
with MMU but without wchar.
So, the user don't know that it has just to select wchar to be able to
select minizip.
>
> > Set the correct dependency:
> > depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/minizip/Config.in | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/minizip/Config.in b/package/minizip/Config.in
> > index 4bc12a0d7e..ff8b5b209a 100644
> > --- a/package/minizip/Config.in
> > +++ b/package/minizip/Config.in
> > @@ -20,5 +20,5 @@ config BR2_PACKAGE_MINIZIP_DEMOS
> >
> >  comment "minizip needs a toolchain w/ threads, wchar"
> >       depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
> > -     depends on BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU
> > +     depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
> >       depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

Best Regards,

Fabrice
