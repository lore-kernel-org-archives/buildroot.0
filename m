From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 2 Sep 2015 08:49:12 +0300
Subject: [Buildroot] [PATCH 1/2] dos2unix: add target support
In-Reply-To: <87a8t5q0r4.fsf@dell.be.48ers.dk>
References: <d04d05bf5fb09fd02747689fe348375cdff4fc6a.1441089817.git.baruch@tkos.co.il>
 <87a8t5q0r4.fsf@dell.be.48ers.dk>
Message-ID: <20150902054912.GU17874@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Sep 01, 2015 at 11:37:51PM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > From: James Knight <james.knight@rockwellcollins.com>
>  > Allow the `dos2unix` utility to be built and installed on the target
>  > system.
> 
>  > [baruch: properly handle target gettext]
>  > Signed-off-by: James Knight <james.knight@rockwellcollins.com>
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  > ---
>  > v2:
>  >    * Fix static build with gettext
>  >    * Support build without locale support
>  > ---
>  >  package/Config.in            |  3 +++
>  >  package/dos2unix/Config.in   | 11 +++++++++++
>  >  package/dos2unix/dos2unix.mk | 24 +++++++++++++++++++++---
>  >  3 files changed, 35 insertions(+), 3 deletions(-)
>  >  create mode 100644 package/dos2unix/Config.in
> 
>  > diff --git a/package/Config.in b/package/Config.in
>  > index 914b83833d3e..7c5fe4ec36b2 100644
>  > --- a/package/Config.in
>  > +++ b/package/Config.in
>  > @@ -115,6 +115,9 @@ menu "Development tools"
>  >  	source "package/cvs/Config.in"
>  >  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  >  	source "package/diffutils/Config.in"
>  > +endif
>  > +	source "package/dos2unix/Config.in"
>  > +if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> 
> Busybox does have a dos2unix applet, so this should also be inside the
> conditional.

Will fix.

>  >  	source "package/findutils/Config.in"
>  >  endif
>  >  	source "package/flex/Config.in"
>  > diff --git a/package/dos2unix/Config.in b/package/dos2unix/Config.in
>  > new file mode 100644
>  > index 000000000000..fdcd0700509b
>  > --- /dev/null
>  > +++ b/package/dos2unix/Config.in
>  > @@ -0,0 +1,11 @@
>  > +config BR2_PACKAGE_DOS2UNIX
>  > +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
>  > +	depends on BR2_USE_WCHAR # gettext
> 
> This looks odd - If wchar is only for gettext then we should allow
> non-locale builds without wchar. A quick test shows that dos2unix uses
> wchar several places, but this can be disabled if UCS= is passed on the
> make line (wchar_t is still referred in 3 error prints though).

It seems like most packages conditionally selecting BR2_PACKAGE_GETTEXT do not 
depend on BR2_USE_WCHAR. But then, how do you prevent gettext build when the 
toolchain has no wchar support? The autobuilder 
(http://autobuild.buildroot.net/?reason=gettext-0.19.5.1) shows no gettext 
build failure.

>  >  DOS2UNIX_VERSION = 7.0
>  >  DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
>  > -DOS2UNIX_DEPENDENCIES = host-gettext
>  >  DOS2UNIX_LICENSE = BSD-2c
>  >  DOS2UNIX_LICENSE_FILES = COPYING.txt
>  > +HOST_DOS2UNIX_DEPENDENCIES = host-gettext
> 
> If gettext is optional for target builds, why do we then force it for
> host builds?

Do we care about host packages binaries size?

In any case, this is a matter for another patch.

Thanks for reviewing,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
