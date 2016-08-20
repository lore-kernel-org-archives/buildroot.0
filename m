From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 16:18:13 +0200
Subject: [Buildroot] [PATCH 2/2] package/fftw: Enable multiple precision
 installation
In-Reply-To: <1962c82d-04d8-9dd5-0826-da1f3aff3673@flatmax.org>
References: <1471588192-2273-1-git-send-email-flatmax@flatmax.org>
 <20160819162003.5c6a9109@free-electrons.com>
 <1962c82d-04d8-9dd5-0826-da1f3aff3673@flatmax.org>
Message-ID: <20160820161813.417db94f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Aug 2016 13:36:41 +1000, Matt Flax wrote:

> > I don't see where you are passing this option, so from the look of it,
> > your four packages would install over each other. Or is
> > --enable-type-prefix the default ?  
> There are now 4 mk files. Each builds in a separate directory (fftw, 
> fftwf, fftwl, fftwq) and installs as per the recommendations from fftw. 
> All fftw packages  inherit the version, source, site, license, env, 
> conf_opts, cflags from fftw.mk. By inheriting from one single set of 
> macros, we can bump versions very easily.
> The different precisions are added like so :
> fftwf.mk : FFTWF_CONF_OPTS += --enable-single
> fftwl.mk : FFTL_CONF_OPTS += --enable-long-double
> fftwq.mk : FFTQ_CONF_OPTS += --enable-quad-precision

I'm not talking about the Buildroot code, but what each fftw package
will be installing. My understanding is that if you don't pass
--enable-type-prefix, each fftw package will install exactly the same
files, overwriting the ones written by the other fftw packages, making
the all adventure useless.

> Regarding dev files, the header files are all the same - in fact from 
> the fftw site, http://www.fftw.org/fftw2_doc/fftw_6.html#SEC69 it is 
> recommended that they all install ontop of each other :
> ./configure; make; make install; make clean
> ./configure --ebale-single; make; make install; make clean
> and so on ...

Read again this very same section, they tell you to do:

./configure --enable-type-prefix [ other options ]
make
make install
make clean
./configure --enable-float --enable-type-prefix [ other options ]
make
make install

See that they are using the --enable-type-prefix option I'm referring
to?

> > Another concern is that one --enable-type-prefix is used, then all
> > packages that use fftw will have to use the right library name and
> > header name depending on the precision they want to use. Are they all
> > ready for that?
> >
> > Could you check the different Buildroot packages in the tree that use
> > FFTW, and see how they behave, and whether they need to be changed to
> > accommodate your patch?
> >
> > There's at least alsa-lib, gnuradio, httping, imagemagick, libvips,
> > liquid-dsp and pulseaudio to look at.  
> 
> Actually "type-prefixes" aren't used and no changes are made to the 
> names.  Double precision remains libfftw3.so.3, single precision remains 
> libfftw3f.so.3 .... and so on. There is one header file used by all and 
> it is constant.

See above.

> Literally, this patch simply allows side by side installation, as it is 
> intended to be.

I don't see how side by side installation is possible if all four
variants of the library install to the same libfftw3.so.3 file. Could
you expand a bit on this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
