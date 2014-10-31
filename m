From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Fri, 31 Oct 2014 16:30:00 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-28
In-Reply-To: <87oass72wu.fsf@dell.be.48ers.dk>
References: <20141029073016.28E5B1008B6@stock.ovh.net>
 <1414653431.5132.3.camel@posteo.de>
 <20141030054636.0124d5d5@core2quad.morethan.org>
 <1414713303.9427.2.camel@posteo.de> <87oass72wu.fsf@dell.be.48ers.dk>
Message-ID: <1414769400.1988.1.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fr, 2014-10-31 at 15:02 +0100, Peter Korsgaard wrote:
> >>>>> "J?rg" == J?rg Krause <jkrause@posteo.de> writes:
> 
>  > On Do, 2014-10-30 at 05:46 -0500, Mike Zick wrote:
>  >> On Thu, 30 Oct 2014 08:17:11 +0100
>  >> J?rg Krause <jkrause@posteo.de> wrote:
>  >> 
>  >> > >      powerpc |                    mp4v2-2.0.0 | NOK |
>  >> > > http://autobuild.buildroot.net/results/e93653ccc815c805f4af55910c2995372587e7b4/  
>  >> > 
>  >> > toolchain error?
>  >> >         powerpc-ctng_e500v2-linux-gnuspe-g++: error: unrecognized
>  >> >         command line option '-mfloat-Wa,-me500x2'
>  >> >         
>  >> 
>  >> Run together options.
>  >> Or
>  >> the compiler was not able to compute subtracting 
>  >> 'Warn All' from -mfloat.  
>  >> ;)
> 
>  > You're right! It should be -mabi=spe -mfloat-gprs=double -Wa,-me500x2.
> 
>  > How can this happen?
> 
> I believe it comes from this snippet in configure.ac:
> 
> ###############################################################################
> # disable debugging
> ###############################################################################
> 
> if test "$enable_debug" = "no"; then
>     changequote(<<,>>)dnl
>     if test "$GCC" = "yes"; then
>         CFLAGS=`echo "$CFLAGS" | sed -e 's/-g[^ ]*[ ]*//' -e 's/^ //' -e 's/ $//'`
>     fi
>     if test "$GXX" = "yes"; then
>         CXXFLAGS=`echo "$CXXFLAGS" | sed -e 's/-g[^ ]*[ ]*//' -e 's/^ //' -e 's/ $//'`
>     fi
> 
> Which looks fairly broken. As far as I can see this is the only thing
> --disable-debug does, so the easiest fix is just to always passs
> --enable-debug.
> 
> I'll fix that.
> 

This is a really stupid mistake! Many thanks for the investigation and
the workaround!
