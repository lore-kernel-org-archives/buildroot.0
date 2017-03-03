From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Fri, 3 Mar 2017 13:16:41 +1100
Subject: [Buildroot] [PATCH v2 1/2] package/sdl2: disable altivec
 built-in function for PowerPC
In-Reply-To: <82dda896-2811-a049-ff52-23b06ce2015a@gmail.com>
References: <20170228232453.3550-1-romain.naour@gmail.com>
 <20170301021311.GA13728@tungsten.ozlabs.ibm.com>
 <82dda896-2811-a049-ff52-23b06ce2015a@gmail.com>
Message-ID: <20170303021641.GA2776@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 01, 2017 at 08:52:27PM +0100, Romain Naour wrote:
> Hi Sam,
> 
> Le 01/03/2017 ? 03:13, Sam Bobroff a ?crit :
> > On Wed, Mar 01, 2017 at 12:24:52AM +0100, Romain Naour wrote:
> >> As reported in this bug report [1], altivec support in SDL break
> >> arbitrary C++ code.
> >>
> >> Issue reported by test-pkg script while testing supertux package:
> >>     error: could not convert 'true' from 'bool' to '__vector(4) __bool int'
> >>
> >> [1] https://bugs.debian.org/cgi-bin/bugreport.cgi/?bug=770670
> >>
> >> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> >> Cc: Sam Bobroff <sam.bobroff@au1.ibm.com>
> > 
> > Hi Romain,
> > 
> > If you want to keep alitvec support on you can probably work around this
> > problem by using -std=gnu99 (which I used for mpv, see
> > package/mpv/0002-fix-powerpc64-altivec.patch).
> 
> Thanks for the help!
> 
> But the error come from a C++ build :
> In file included from
> output/build/supertux-0.5.1/external/tinygettext/src/dictionary_manager.cpp:30:0:
> output/build/supertux-0.5.1/external/tinygettext/include/tinygettext/po_parser.hpp:50:96:
> error: could not convert ?true? from ?bool? to ?__vector(4) __bool int?
>    POParser(const std::string& filename, std::istream& in_, Dictionary& dict_,
> bool use_fuzzy = true);
> 
> What do you think about removing altivec.h from SDL_cpuinfo.h as suggested in
> the bug report ?
> 
> Otherwise, I'm not using a powerpc so we can keep altivec support disabled for
> now...
> 
> Best regards,
> Romain

Oh, I hadn't seen this with c++ before but I reproduced it easily when
using -std=c++0x (as discussed in the bug report you linked).

Were you using that flag during your compile?

If you don't need c++0x, removing it might work around the problem but
if you can't do that (or it doesn't work), and your problem is showing
up in a non-altivec context (e.g. the code is expecting bool to be a
normal bool) then I think you can #undef the re-defined keywords (the
altivec header suggests that this is OK for C++). e.g.:

#include <altivec.h>
#undef bool
#undef vector
#undef pixel

Might work!

Cheers,
Sam.
