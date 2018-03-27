From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Mar 2018 14:43:39 +0200
Subject: [Buildroot] [PATCHv2] core: alternate solution to disable C++
In-Reply-To: <20180327111234.kf2qvwnyo5svpfpu@sapphire.tkos.co.il>
References: <20180327110022.19980-1-yann.morin.1998@free.fr>
 <20180327111234.kf2qvwnyo5svpfpu@sapphire.tkos.co.il>
Message-ID: <20180327144339.23542eb9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Mar 2018 15:04:32 +0300, Baruch Siach wrote:
> Hi Yann,
> 
> On Tue, Mar 27, 2018 at 01:00:22PM +0200, Yann E. MORIN wrote:
> > Some packages that use libtool really need some love to be able to
> > disable C++ support.
> > 
> > This is because libtool will want to call AC_PROG_CXXCPP as soon as CXX
> > is set non-empty to something different from 'no'. Then, AC_PROG_CXXCPP
> > will want a C++ preprocessor that works on valid input *and* fail on
> > invalid input.
> > 
> > So, providing 'false' as the C++ compiler will then require that we do
> > have a working C++ preprocessor. Which is totally counter-productive
> > since we do not have a C++ compiler to start with...
> > 
> > bd39d11d2e (core/infra: fix build on toolchain without C++) was a
> > previous attempt at fixing this, by using the host's C++ preprocessor.
> > 
> > However, that is very incorrect (that's my code, I can say so!) because
> > the set of defines will most probably be different for the host and the
> > target, thus causign all sorts of trouble. For example, on ARM we'd have
> > to include different headers for soft-float vs hard-float, which is
> > decided based on a macro, which is not defined for x86, and thus may
> > redirect to the wrong (and missing) header.
> > 
> > Instead, we notice that libtool uses the magic value 'no' to decide that
> > a C++ compiler is not available, in which case it skeips the call to

skeips -> skips


> > +# We need anything that is invalid. Traditionally, we'd have used 'false' (and
> > +# we did so in the past). However, that breaks libtool for packages that have
> > +# optional C++ support (e.g. gnutls), because libtool will *require* a *valid*
> > +# C++ preprocessor as long as CXX is not 'no'.
> > +# Now, whether we use 'no' or 'false' for CXX as the same side effect: it is an
> > +# invalid C++ compiler, and thus will cause detection of C++ to fail (which is
> > +# expected and what we want), while at the same time taming libtool into
> > +# silence.
> >  ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
> > -TARGET_CONFIGURE_OPTS += CXX=false CXXCPP=cpp
> > +TARGET_CONFIGURE_OPTS += CXX=no  
> 
> What about CXXCPP? Your v1 patch set it to 'no'.

I think Yann's commit log explains it: if you specify CXX=no, then
libtool will not try to search for a C++ pre-processor, hence it is no
longer necessary to pass CXXCPP. At least that's my understanding of
Yann's commit log.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
