From: Dan Walkes <danwalkes@trellis-logic.com>
Date: Mon, 14 Oct 2019 15:38:07 -0600
Subject: [Buildroot] Linux kernel configuration changes and out of tree
 module builds
In-Reply-To: <20191014225803.0b1765cc@windsurf.home>
References: <CAAhKrJ0GObte8z-NSqyUHwJY-0A1rbyrL-F5pW9G7LO_gyz3hQ@mail.gmail.com>
 <20191014225803.0b1765cc@windsurf.home>
Message-ID: <CAAhKrJ2tKTbj=Tx+RHrk8BX7XBnbEjdKNM7YyHoKgb9wOmYYjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks very much for the response Thomas,

On Mon, Oct 14, 2019 at 2:58 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Dan,
>
> On Mon, 14 Oct 2019 14:00:09 -0600
> Dan Walkes <danwalkes@trellis-logic.com> wrote:
> >
> > * When a FOO_DEPENDENCIES package is rebuilt, the package foo is not
> > automatically rebuilt.  For example, a linux kernel module which
> > depends on linux will not be automatically rebuilt when the kernel
> > configuration changes.  For this reason it may be safer to use a full
> > rebuild when modifying linux kernel configuration.
>
> Correct, but I would perhaps not use the example of the Linux kernel
> here. Even though it was the situation that got you into realizing
> this, it applies to any other package, and using Linux as an example
> may be confusing, because it's a very specific and complicated package,
> while this statement really applies to all packages.
>
> Also, it's not only about a FOO_DEPENDENCIES package being rebuilt, but
> also being removed. In the above example, let's assume libfoo was an
> optional dependency of bar. You do a first build with libfoo and bar
> enabled: bar is built with libfoo support, and is linked against it.
> Now, you change the Buildroot configuration, disable libfoo and run
> "make". There is nothing that will rebuild "bar".
>

Understood.  How about this modification?

* When a +FOO_DEPENDENCIES+ package is rebuilt or removed, the package
foo is not automatically rebuilt.  For example, if a package +bar+ is
listed in +FOO_DEPENDENCIES+ with +FOO_DEPENDENCIES = bar+ and the
configuration of the +bar+ package is changed, the configuration
change would not result in a rebuild of package package +foo+
automatically.  In this scenario, you may need to either rebuild any
packages in your build which reference +bar+ in their +DEPENDENCIES+,
or perform a full rebuild to ensure any +bar+ dependent packages are
up to date.

> > I'd also suggest the second sentence below in the generic package
> > reference for LIBFOO_DEPENDENCIES [5]:
> >
> > These dependencies are guaranteed to be compiled and installed before
> > the configuration of the current package starts.  *However,
> > modifications to configuration of these dependencies will not force a
> > rebuild of the current package.*
>
> Correct.
>

Great, I will include this in a documentation patch.

> > Finally, I'd suggest a mention in the "Infrastructure for packages
> > building kernel modules" section [6] with the second sentence below:
> >
> > The dependency on linux is automatically added, so it is not needed to
> > specify it in FOO_DEPENDENCIES.  *Since FOO_DEPENDENCIES does not
> > automatically rebuild kernel modules when the kernel configuration
> > changes, you should either manually rebuild your kernel module or
> > perform a full rebuild.*
>
> Right, though as said above, I'm not sure we need to repeat this
> specifically for the case of kernel modules, it really applies to all
> packages.
>

Understood, I'll leave this out of the patch.

Dan
