From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 09:56:50 +0100
Subject: [Buildroot] [PATCH 4/4] bctoolbox: disable rpath
In-Reply-To: <20170215052846.yxjzvhmsgdc3hy57@tarshish>
References: <20170214224402.8785-1-joerg.krause@embedded.rocks>
 <20170214224402.8785-4-joerg.krause@embedded.rocks>
 <20170215052846.yxjzvhmsgdc3hy57@tarshish>
Message-ID: <20170215095650.236f21b5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Feb 2017 07:28:46 +0200, Baruch Siach wrote:
> Hi J?rg,
> 
> On Tue, Feb 14, 2017 at 11:44:02PM +0100, J?rg Krause wrote:
> > By default, bctoolbox adds the rpath to the shared library. Prevent this
> > by setting `CMAKE_SKIP_RPATH` [1] to a true value.
> > 
> > [1] https://cmake.org/cmake/help/latest/variable/CMAKE_SKIP_RPATH.html
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> > ---
> >  package/bctoolbox/bctoolbox.mk | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/bctoolbox/bctoolbox.mk b/package/bctoolbox/bctoolbox.mk
> > index 5eea0575f..76737aa3c 100644
> > --- a/package/bctoolbox/bctoolbox.mk
> > +++ b/package/bctoolbox/bctoolbox.mk
> > @@ -11,11 +11,14 @@ BCTOOLBOX_LICENSE_FILES = COPYING
> >  BCTOOLBOX_DEPENDENCIES = mbedtls
> >  BCTOOLBOX_INSTALL_STAGING = YES
> >  
> > +# Set CMAKE_SKIP_RPATH to prevent bctoolbox from adding the rpath to
> > +# shared library.
> >  BCTOOLBOX_CONF_OPTS = \
> >  	-DENABLE_STRICT=OFF \
> >  	-DENABLE_TESTS_COMPONENT=OFF \
> >  	-DENABLE_TESTS=OFF \
> > -	-DGIT_EXECUTABLE=OFF
> > +	-DGIT_EXECUTABLE=OFF \
> > +	-DCMAKE_SKIP_RPATH=ON  
> 
> Shouldn't we have this in package/pkg-cmake.mk? Samuel?

Indeed, it's a generic CMake option, so it should be in
package/pkg-cmake.mk IMO.

Worth mentioning that there is both CMAKE_SKIP_RPATH and
CMAKE_SKIP_INSTALL_RPATH. The former skips adding the rpath during both
the build and install steps, which prevents from running the binary
from the build directory. The latter only skips the rpath during the
install step. But since we're cross-compiling, running on the host
machine from the build directory anyway doesn't make sense. So
CMAKE_SKIP_RPATH is OK.

See https://cmake.org/cmake/help/v3.0/variable/CMAKE_SKIP_RPATH.html.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
