From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 24 Oct 2019 23:40:27 +0200
Subject: [Buildroot] [PATCH v2 3/3] toolchain-external: add support for
 D language
In-Reply-To: <9eb2d7a3-3f21-ae07-4dea-5efd2eb36eef@smile.fr>
References: <20191024181621.29349-1-eric.le.bihan.dev@free.fr>
 <20191024181621.29349-4-eric.le.bihan.dev@free.fr>
 <9eb2d7a3-3f21-ae07-4dea-5efd2eb36eef@smile.fr>
Message-ID: <20191024213906.GA31903@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 2019-10-24 21:21, Romain Naour wrote:
> Hi Eric,
>
> Le 24/10/2019 ? 20:16, Eric Le Bihan a ?crit?:
> > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> > ---
> >  toolchain/toolchain-external/pkg-toolchain-external.mk    | 4 ++++
> >  .../toolchain-external-custom/Config.in.options           | 8 ++++++++
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> > index c00211d59c..9c5321ea36 100644
> > --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> > +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> > @@ -148,6 +148,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_OPENMP),y)
> >  TOOLCHAIN_EXTERNAL_LIBS += libgomp.so.*
> >  endif
> >
> > +ifeq ($(BR2_TOOLCHAIN_HAS_DLANG),y)
> > +TOOLCHAIN_EXTERNAL_LIBS += libgdruntime.so* libgphobos.so*
> > +endif
> > +
> >  TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
> >
> >
> > diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> > index 83d9ed61d7..f686cb3305 100644
> > --- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> > +++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> > @@ -415,6 +415,14 @@ config BR2_TOOLCHAIN_EXTERNAL_CXX
> >  	  support. If you don't know, leave the default value,
> >  	  Buildroot will tell you if it's correct or not.
> >
> > +config BR2_TOOLCHAIN_EXTERNAL_DLANG
> > +	bool "Toolchain has D support?"
> > +	select BR2_TOOLCHAIN_HAS_DLANG
> > +	help
> > +	  Select this option if your external toolchain has D
> > +	  support. If you don't know, leave the default value,
> > +	  Buildroot will tell you if it's correct or not.
> > +
>
> I believe we need to add a check in the toolchain helper to check if D compiler
> is present and is working (as for other language C++ and Fortran [1])
>
> Also D support should be listed in the manual, at least in the "dependencies
> target toolchain options" [2].

OK. It will be added in the next version.

> While adding GCC 9 in Buildroot, I did not add D support because there is
> currently not package using it. Did you plan to add new packages using this
> language?

The D programming language has no "killer" application and may be
considered as a niche programming language given that the reference
compiler (DMD) was only targeting x86 and was not fully open-source
until recently. But GDC (GCC-based compiler) and LDC (LLVM-based
compiler) broaden the scope and may increase interest for this language.

DUB [1] the package and build manager is written in D. So adding a
package to build it from source would require having a host variant of
GDC at hand or providing one (which is kind of cumbersome). It is
possible, though, to provide a package of the binary host variant of DUB
(host-dub-bin), not unlike host-{rust,cargo}-bin for Rust.

Meson also supports D.

One popular program written in D is Vibe.d [2], a web and concurrency
framework. Unfortunately, it relies on RDMD [3], a front-end to DMD for
running D programs like scripts, which is not compatible with GDC.

GtkD [4], the binding for Gtk+, on the other hand, uses Make as its
build system and is more GDC-friendly. Latest attempt at cross-compiling
it ended up with some errors, but these should be fixable.

So, no new packages using D on the horizon ATM. I submitted this series
because I think one of Buildroot's strengths is its ability to easily
provide tools for embedded systems. So having a D cross-compiler at hand
may benefit some users for creating new applications.

Thanks for the review!

[1] https://code.dlang.org/packages/dub
[2] https://vibed.org/
[3] https://dlang.org/rdmd.html
[4] https://gtkd.org/

Regards,

--
ELB
