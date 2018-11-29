From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Thu, 29 Nov 2018 07:27:40 +0100
Subject: [Buildroot] [PATCH 02/11] alsa-utils: update DEPENDENCIES to
 fft-single and add select in Config.in
In-Reply-To: <87woow77fw.fsf@tkos.co.il>
References: <1543421561-37355-1-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-2-git-send-email-gwenj@trabucayre.com>
 <87zhts7bps.fsf@tkos.co.il>
 <20181129063824.57b81964@x230.trabucayre.com>
 <87woow77fw.fsf@tkos.co.il>
Message-ID: <20181129072740.68683a45@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
On Thu, 29 Nov 2018 07:56:35 +0200
Baruch Siach <baruch@tkos.co.il> wrote:
> Gwenhael Goavec-Merou writes:
> > On Thu, 29 Nov 2018 06:24:15 +0200
> > Baruch Siach <baruch@tkos.co.il> wrote:  
> >> Gwenhael Goavec-Merou writes:
> >>  
> >> > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> >> >
> >> > Signed-off-by: Gwenhael Goavec-Merou
> >> > <gwenhael.goavec-merou@trabucayre.com> ---
> >> >  package/alsa-utils/Config.in     | 5 ++---
> >> >  package/alsa-utils/alsa-utils.mk | 2 +-
> >> >  2 files changed, 3 insertions(+), 4 deletions(-)
> >> >
> >> > diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
> >> > index 012f28aef4..950278d173 100644
> >> > --- a/package/alsa-utils/Config.in
> >> > +++ b/package/alsa-utils/Config.in
> >> > @@ -74,15 +74,14 @@ config BR2_PACKAGE_ALSA_UTILS_ASEQNET
> >> >  	select BR2_PACKAGE_ALSA_LIB_SEQ
> >> >
> >> >  config BR2_PACKAGE_ALSA_UTILS_BAT
> >> > +	select BR2_PACKAGE_FFTW
> >> > +	select BR2_PACKAGE_FFTW_PRECISION_SINGLE
> >> >  	bool "bat"
> >> >  	help
> >> >  	  ALSABAT (ALSA Basic Audio Tester) is a simple command-line
> >> >  	  utility intended to help automate audio driver and sound
> >> >  	  server testing with little human interaction.
> >> >
> >> > -	  Note that analysis support in alsabat requires fftw single
> >> > -	  precision.
> >> > -
> >> >  config BR2_PACKAGE_ALSA_UTILS_IECSET
> >> >  	bool "iecset"
> >> >  	select BR2_PACKAGE_ALSA_LIB_PCM
> >> > diff --git a/package/alsa-utils/alsa-utils.mk
> >> > b/package/alsa-utils/alsa-utils.mk index 986a745399..9e0094f343 100644
> >> > --- a/package/alsa-utils/alsa-utils.mk
> >> > +++ b/package/alsa-utils/alsa-utils.mk
> >> > @@ -41,7 +41,7 @@ endif
> >> >  ifeq ($(BR2_PACKAGE_ALSA_UTILS_BAT),y)
> >> >  ALSA_UTILS_CONF_OPTS += --enable-bat
> >> >  # Analysis support requires fftw single precision
> >> > -ALSA_UTILS_DEPENDENCIES += $(if
> >> > $(BR2_PACKAGE_FFTW_PRECISION_SINGLE),fftw) +ALSA_UTILS_DEPENDENCIES +=
> >> > fftw-single  
> >>
> >> This turns the optional fftw dependency into a mandatory one. Is there a
> >> reason for that?
> >>  
> > It may be a misunderstanding on my part but it is explicitly noted "Analysis
> > support requires fftw single". This assumption is confirmed by my
> > distribution (gentoo) where fftw is added as dependency when bat option is
> > selected.  
> 
> fftw is required for analysis support. However analysis support itself
> is optional. See the alsa-utils configure.ac:
> 
> if test x$bat = xtrue; then
>   ...
>   AC_CHECK_LIB([fftw3f], [fftwf_malloc], , [have_libfftw3="no"])
>   ...
> if
> 
Ok. My fault, I've not seen the "analysis support". I must modify this patch
but I will wait a little for others  potential reviews to avoid spamming the
mailing-list with  long serie of patches.

Gwen
