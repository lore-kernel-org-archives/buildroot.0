From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Sun, 15 Mar 2015 21:00:19 +0100
Subject: [Buildroot] [PATCH v4 1/1] fftw: add compile precision option
In-Reply-To: <20150315192610.GD4104@free.fr>
References: <1426436126-23486-1-git-send-email-gwenj@trabucayre.com>
 <20150315192610.GD4104@free.fr>
Message-ID: <20150315210019.437be037@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 15 Mar 2015 20:26:10 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Gwenhael, All,
> 
> On 2015-03-15 17:15 +0100, Gwenhael Goavec-Merou spake thusly:
> > fftw has options to select compile precision between single, long-double and
> > quad. These options are exclusives. This patch adds choice to select precision
> > option.
> > 
> > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> So, I have tested this patch in different configurations:
>   - x86, all of none, single, double and quad
>   - arm, all of none single, and double
> 
> All did build successfuly.
> 
> However, I am a bit worried that we do not have a disbling condition for
> 'none'...
>
The none have no existence because fftw by default has no options enabled.
This choice is only present to reflect the default behaviour. 
>
> [--SNIP--]
> > diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
> > index 3b302df..80cc0dc 100644
> > --- a/package/fftw/fftw.mk
> > +++ b/package/fftw/fftw.mk
> > @@ -10,4 +10,13 @@ FFTW_INSTALL_STAGING = YES
> >  FFTW_LICENSE = GPLv2+
> >  FFTW_LICENSE_FILES = COPYING
> >  
> 
> Maybe we could have something like:
> 
>     # Disable everything, and then selectively enable what we want
>     FFTW_CONF_OPTS = --disable-single --disable-long-double --disable-quad-precision
> 
>     ifeq ($(BR2_PACKAGE_FFTW_PRECISION_SINGLE),y)
>     FFTW_CONF_OPTS = --enable-single
>     endif
> 
>     ifeq ($(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),y)
>     FFTW_CONF_OPTS = --enable-long-double
>     endif
> 
>     ifeq ($(BR2_PACKAGE_FFTW_PRECISION_QUAD),y)
>     FFTW_CONF_OPTS = --enable-quad-precision
>     endif
> 
> When we have both --disabe/--enable, the latter wins. So we can simply
> disable everything, and then enable only the one we need.
> 
> I got it that they are mutually exclusive, but if the user selects
> 'none', we do not have any '--enable-XXX' so what happens?
>
Nothing this is the default situation ;-) In fact fftw configure don't care
about disable-{single,quad,...}. Only enable-xxx is taken into account. This is
why I do nothing if none is selected.
>
> Alternatively, you could do:
> 
>     FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_SINGLE),--enable,--disable)-single
>     FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),--enable,--disable)-long-double
>     FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-quad-precision
> 
> Not sure which I prefer...
> 
> Regards,
> Yann E. MORIN.
> 
Regards,
Gwen
