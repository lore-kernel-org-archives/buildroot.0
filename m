From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Tue, 7 Feb 2017 10:46:45 +0100
Subject: [Buildroot] [PATCH v3] gqrx: new package
In-Reply-To: <41224157-4708-6eb4-114b-3ce5a51472df@gmail.com>
References: <20170129112759.1690-1-gwenj@trabucayre.com>
 <27187297-48bf-e44a-81c5-d44181588dbf@gmail.com>
 <20170206203432.146570d7@x230.trabucayre.com>
 <41224157-4708-6eb4-114b-3ce5a51472df@gmail.com>
Message-ID: <20170207104645.1b20b4be@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Mon, 6 Feb 2017 20:55:47 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> Hi Gwenhael,
> 
[...]
> >>> +
> >>> diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
> >>> new file mode 100644
> >>> index 0000000..fadd5a2
> >>> --- /dev/null
> >>> +++ b/package/gqrx/Config.in
> >>> @@ -0,0 +1,36 @@
> >>> +comment "gqrx needs a toolchain w/ C++, threads, wchar, dynamic
> >>> library"
> >>> +	depends on !BR2_INSTALL_LIBSTDCPP
> >>> || !BR2_TOOLCHAIN_HAS_THREADS || \
> >>> +		!BR2_USE_WCHAR || BR2_STATIC_LIBS
> >>> +
> >>> +comment "gqrx needs gnuradio, fftw's single precision, alsa-lib
> >>> or portaudio"
> >>> +	depends on !BR2_PACKAGE_GNURADIO
> >>> || !BR2_PACKAGE_FFTW_PRECISION_SINGLE || \
> >>> +		!(BR2_PACKAGE_ALSA_LIB || BR2_PACKAGE_PORTAUDIO)
> >>> +
> >>> +config BR2_PACKAGE_GQRX
> >>> +	bool "gqrx"
> >>> +	depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE # gnuradio
> >>> +	depends on BR2_PACKAGE_GNURADIO
> >>> +	depends on BR2_PACKAGE_ALSA_LIB || BR2_PACKAGE_PORTAUDIO
> >>> # gr-audio    
> >>
> >> I'm not sure if PORTAUDIO is really a dependency here since you
> >> enable only the gr-audio backend.
> >>
> >> If you want to support gqrx with Portaudio support, you should
> >> probably enable Portaudio backend. Otherwise keep only ALSA_LIB in
> >> the dependency.
> >>  
> > gr-audio depends on BR2_PACKAGE_ALSA_LIB || BR2_PACKAGE_PORTAUDIO
> > consequently if I select this option I must to check if this
> > dependencies are verified no?  
> 
> I don't really know gqrx, but what's happen when gr-audio package is
> build with portaudio support and gqrx is build with Gr-audio backend?
> Because portaudio support seems to be disabled in that case (i.e
> build without -DWITH_PORTAUDIO). I did a test build and it build
> fine... but I didn't test at runtime.
> 
> If it's ok for you, then ok :)
> 
line
GQRX_CONF_OPTS = -DLINUX_AUDIO_BACKEND=Gr-audio
Is used to enable gr-audio as backend instead of, default, portaudio.
The choice is exclusive, consequently if the backend is gr-audio, the
build skip portaudio backend. The runtime work fine.

Thanks,
Gwen
[...]
