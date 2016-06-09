From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Jun 2016 23:19:11 +0200
Subject: [Buildroot] [PATCH 1/1] kodi: fix build when
 BR2_PACKAGE_LIBFSLVPUWRAP=y
In-Reply-To: <20160609224203.599c50c1@free-electrons.com>
References: <1463500440-25200-1-git-send-email-sebastien.szymanski@armadeus.com>
 <20160609224203.599c50c1@free-electrons.com>
Message-ID: <20160609211911.GC3826@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, S?bastien, All,

On 2016-06-09 22:42 +0200, Thomas Petazzoni spake thusly:
> On Tue, 17 May 2016 17:54:00 +0200, S?bastien Szymanski wrote:
> > Kodi now needs the following headers to sucessfully build on some i.MX
> > platforms:
> > 
> > * ipu.h and mxcfb.h from the kernel
> > * g2d.h from the imx-gpu-viv package
> > 
> > Add the missing dependencies.
> > 
> > Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> > ---
> > Note: I had to install .py files to test Kodi on my target (APF6D) with 
> > BR2_PACKAGE_PYTHON_PY_PYC otherwise Kodi complained that it couldn't find 
> > site.py and crashed at startup.
> 
> This is a known bug in Kodi, which nobody has investigated so far.

Saying that "nobody has investigated" is wrong. Both Bernd and I have
done some research on the topic [0].

And we concluded that upstream is unwilling to take patches that will
accept only .pyc or .pyo to be present. Upstream *wants* to have the .py
files present. Period.

So indeed, noone has tried to fix it, because the fix has *zero* chance
of getting upstream.

I however submitted two proposals that would make it impossible to have
that situation, but you did not like them (FTR: one was to hide Kodi
away when .py files were not present, the other was to add options for
packages to require .py files to be kept).

So, unless we revise our position, the bug will stay. And it is a
Buildroot bug, not an upstream one.

[0] this is somewhere in the archives, I'm a bit lazy at digging them
up...

> > @@ -58,6 +58,7 @@ menuconfig BR2_PACKAGE_KODI
> >  	select BR2_PACKAGE_FONTCONFIG
> >  	select BR2_PACKAGE_FREETYPE
> >  	select BR2_PACKAGE_GIFLIB
> > +	select BR2_PACKAGE_IMX_GPU_VIV_G2D if BR2_PACKAGE_LIBFSLVPUWRAP
> 
> I would prefer this to be:
> 
> 	select BR2_PACKAGE_IMX_GPU_VIV_G2D if BR2_PACKAGE_IMX_GPU_VIV
> 
> >  	select BR2_PACKAGE_JASPER
> >  	select BR2_PACKAGE_JPEG
> >  	select BR2_PACKAGE_LIBASS
> > diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> > index e163c24..394b174 100644
> > --- a/package/kodi/kodi.mk
> > +++ b/package/kodi/kodi.mk
> > @@ -54,8 +54,10 @@ KODI_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads
> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_LIBFSLVPUWRAP),y)
> 
> Change this to:
> 
> ifeq ($(BR2_PACKAGE_IMX_GPU_VIV)$(BR2_PACKAGE_LIBFSLVPUWRAP),y)
> 
> > -KODI_DEPENDENCIES += libfslvpuwrap
> > +# imx-lib needs access to imx-specific kernel headers
> 
> You're talking about imx-lib here, but it doesn't appear anywhere, so
> this comment is confusing, and can be removed IMO.
> 
> > +KODI_DEPENDENCIES += imx-gpu-viv libfslvpuwrap linux
> 
> Remove linux from this line. libfslvpuwrap already depends on it, so
> it's not really useful to have it.

Note: it's not usefull because Kodi itself does not depend on the kernel
sources.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
