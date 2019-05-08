From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 8 May 2019 11:49:03 +0200
Subject: [Buildroot] [PATCH 2/2] allow build infrastructure to pick up
 installed ninja tool
In-Reply-To: <20190507230008.0b3c354f@windsurf>
References: <20190503131851.12315-1-norbert.lange@andritz.com>
 <20190503131851.12315-2-norbert.lange@andritz.com>
 <20190507230008.0b3c354f@windsurf>
Message-ID: <CADYdroOeRcLwbKR9STVwUQ4v5nrLhN60LhrP-CzM3Rf45mGM9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Di., 7. Mai 2019 um 23:00 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello Norbert,
>
> On Fri,  3 May 2019 15:18:51 +0200
> Norbert Lange <nolange79@gmail.com> wrote:
>
> > From: Norbert Lange <nolange79@gmail.com>
> >
> > If a fitting ninja tool is detected it will be used,
> > otherwise the tool will be built from source.
> >
> > Replace the fixed dependencies to host-ninja,
> > notably from the meson infrastructure.
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
>
> Since host-meson cannot be changed to use the system-provided meson, as
> discussed with Peter Seiderer on PATCH 1/2, I don't think it's really
> worth doing the effort for host-ninja, which requires the same thing as
> host-meson: a host Python interpreter.

The effort is already done in the patch and not really a big one. Is
there anything bad about
having some additional requirements matched?
But yes, most of the time is spent building python (twice).

> I think the approaches to reduce the build time are:
>
>  - Make sure we only need to build one of host-python or host-python3,
>    and not both. This is what J?rg Krause is proposing in
>    http://patchwork.ozlabs.org/patch/1047119/.
>
>  - Or perhaps, try to go one step further, and see if we can use the
>    system-provided Python instead of a Python built by Buildroot. But
>    that would only work if the system provides Python 3, since Meson
>    requires Python 3.

maybe add some python-any dependency (resolves to either 2 or 3),
which is enough for bootstrapping host-ninja?

>
> > diff --git a/support/dependencies/check-host-ninja.mk b/support/dependencies/check-host-ninja.mk
> > new file mode 100644
> > index 0000000000..6d89255ee5
> > --- /dev/null
> > +++ b/support/dependencies/check-host-ninja.mk
> > @@ -0,0 +1,14 @@
> > +# Set this to either 1.8.2 or higher, depending on the highest minimum
> > +# version required by any of the packages bundled in Buildroot. If a
> > +# package is bumped or a new one added, and it requires a higher
> > +# version, our ninja infra will catch it and build its own.
>
> I know this comment is in other .mk files in the same directory, but it
> doesn't make any sense. There is no such thing as a "ninja infra" in
> Buildroot, and there is nothing that will "catch it" and build its own.
> If we forget to update BR2_NINJA_VERSION_MIN to the oldest Ninja
> version that is acceptable by all packages using Ninja in Buildroot, we
> will never notice until a user hits the problem.

That's something what your CI builder could catch.
packages break all the time with new compilers and libc's and I think
ninja should be pretty much painless in comparison.
The meta-buildsystems like mesons should be able to check for a matching version
(which might depend on the build, like C++20 modules will need some
features in ninja)

Norbert.
