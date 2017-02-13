From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Mon, 13 Feb 2017 09:38:39 +0100
Subject: [Buildroot] [PATCH v5] gqrx: new package
In-Reply-To: <20170212155348.0f14e2a3@free-electrons.com>
References: <20170210140112.26552-1-gwenj@trabucayre.com>
 <20170212155348.0f14e2a3@free-electrons.com>
Message-ID: <20170213093839.38b994c9@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Feb 2017 15:53:48 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Fri, 10 Feb 2017 15:01:12 +0100, Gwenhael Goavec-Merou wrote:
> > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > 
[...]
> 
> > diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
> > new file mode 100644
> > index 0000000..c6bef76
> > --- /dev/null
> > +++ b/package/gqrx/Config.in
> > @@ -0,0 +1,43 @@
> > +comment "gqrx needs a toolchain w/ C++, threads, wchar, dynamic
> > library"
> > +	depends on !BR2_INSTALL_LIBSTDCPP
> > || !BR2_TOOLCHAIN_HAS_THREADS || \
> > +		!BR2_USE_WCHAR || BR2_STATIC_LIBS
> > +
> > +comment "gqrx needs qt5, gnuradio, fftw's single precision,
> > alsa-lib or portaudio"
> > +	depends on !BR2_PACKAGE_GNURADIO
> > || !BR2_PACKAGE_FFTW_PRECISION_SINGLE || \
> > +		!(BR2_PACKAGE_ALSA_LIB || BR2_PACKAGE_PORTAUDIO)
> > || !BR2_PACKAGE_QT5 +
> > +config BR2_PACKAGE_GQRX
> > +	bool "gqrx"
> > +	depends on BR2_PACKAGE_ALSA_LIB || BR2_PACKAGE_PORTAUDIO #
> > gr-audio  
> 
> Not the default of this package, but this is really annoying. What do
> you think of changing the BR2_PACKAGE_GNURADIO_AUDIO option to do
> this:
> 
> 	select BR2_PACKAGE_ALSA_LIB if !BR2_PACKAGE_PORTAUDIO
> 
> This way, we're sure at least one of the two is selected, and we can
> then directly "select BR2_PACKAGE_GNURADIO_AUDIO" within having to
> worry about this anymore.
> 
I'm agree, maybe portaudio by default because gnuradio users seems to
use it preferentially.
> > +	depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE # gnuradio  
> 
> This one is also annoying. Did you see the work that was posted on the
> mailing list a while ago to allow building all variants of fftw? This
> would allow to select the fftw package like any other. It would be
> really really better. If you have some time to pick up this work and
> finalize it, it would be nice.
> 
Thanks to highlight this patch because I've missed this one. I've,
recently, looking at a way to build all flavors for this package
instead of just one.
Currently, according to the precision specified, fftw produce a dynamic
library with a name corresponding to the precision. All others files
(headers and doc) are the same and there are no risk with overwrite.
I must update this patch.

[...]
> 
> Thanks!
> 
> Thomas

Thanks
Gwen
