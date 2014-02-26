From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 27 Feb 2014 00:55:32 +0100
Subject: [Buildroot] [PATCH] vlc: fix some configure options
In-Reply-To: <87ob1uhk68.fsf@dell.be.48ers.dk>
References: <1393360566-4849-1-git-send-email-spdawson@gmail.com>
 <87sir6hklp.fsf@dell.be.48ers.dk> <87ob1uhk68.fsf@dell.be.48ers.dk>
Message-ID: <530E7EF4.5080906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/02/14 00:00, Peter Korsgaard wrote:
>>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:
> 
>>>>>> "Simon" == Simon Dawson <spdawson@gmail.com> writes:
>  >> Fix a large number of incorrect configure options for vlc.
>  >> Configure warnings reported by Arnout Vandecappelle, in his analysis of vlc
>  >> autobuild failures.
> 
>  >> ---
>  >> package/vlc/vlc.mk | 70 +++++++++++++++++++++++++++---------------------------
>  >> 1 file changed, 35 insertions(+), 35 deletions(-)
> 
>  >> diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
>  >> index 0e76e11..9bcedd1 100644
>  >> --- a/package/vlc/vlc.mk
>  >> +++ b/package/vlc/vlc.mk
>  >> @@ -14,23 +14,23 @@ VLC_AUTORECONF = YES
>  
>  >> VLC_CONF_OPT += \
>  >> --disable-a52 \
>  >> -	--disable-shout \
>  >> -	--disable-twolame \
>  >> -	--disable-dca \
>  >> -	--disable-dirac \
>  >> -	--disable-schroedinger \
>  >> -	--disable-quicksync \
>  >> -	--disable-fluidsynth \
>  >> +	--without-shout \
>  >> +	--without-twolame \
>  >> +	--without-dca \
>  >> +	--without-dirac \
>  >> +	--without-schroedinger \
>  >> +	--without-quicksync \
>  >> +	--without-fluidsynth \
> 
>  > Did you test these?
> 
>  > From a quick look:
> 
>  > ./configure --help | egrep 'a52|shout|twolame|dca|dirac|schroedinger|quicksync|fluidsynth'
>  >   --enable-shout          libshout output plugin [default=auto]
>  >   --enable-twolame        MPEG Audio Layer 2 encoder [default=auto]
>  >   --enable-a52            A/52 support with liba52 (default enabled)
>  >   --with-a52=PATH         a52 headers and libraries
>  >   --with-a52-tree=PATH    a52dec tree for static linking
>  >   --enable-dca            DTS Coherent Acoustics support with libdca
>  >   --enable-dirac          dirac encoder [default=auto]
>  >   --enable-schroedinger   dirac decoder and encoder using schroedinger
>  >   --enable-quicksync      Intel QuickSync MPEG4-Part10/MPEG2 (aka H.264/H.262)
>  >   --enable-fluidsynth     MIDI synthetiser with libfluidsynth [default=auto]
> 
>  > So they all seem to be of the --enable / --disable form and not --with / --without.
> 
> Ahh, now I get it. Our autoreconf somehow converts all those --enable /
> --disable to --with / --without.
> 
> Anybody that has any idea why this is so? It quite unfortunate as we
> will have to change all of this back once we bump the vlc version and no
> longer need VLC_AUTORECONF = YES.

 OK, I got it.

 VLC defines their own version of PKG_WITH_MODULES in m4/with_pkg.m4.
However, our autoreconf takes the one from host/usr/share/aclocal/pkg.m4
(which comes from host-pkgconf). The two implementations are identical,
except for replacing the enable/disable with with/without.

 pkg-config itself currently doesn't have this macro, so it's not very
likely that VLC will use the "standard" one from pkgconf in the short term.

 So I think it's OK to do this enable->with change, but adding a comment
that this changes when AUTORECONF is removed.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
