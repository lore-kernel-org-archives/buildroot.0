From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 10 Aug 2018 19:42:32 -0500
Subject: [Buildroot] [PATCH 3/6] package/Makefile.in: Use gcc spec files
 for PIE build flags
In-Reply-To: <20180810225051.4f34fb06@windsurf>
References: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
 <20180711143113.11927-4-matthew.weber@rockwellcollins.com>
 <20180810225051.4f34fb06@windsurf>
Message-ID: <CANQCQpYDuFNMYrwmWiJefh89NjOMoABQwCSne1sM1=-Kcjt9vA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
On Fri, Aug 10, 2018 at 3:50 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Matt, Stefan,
>
> On Wed, 11 Jul 2018 09:31:10 -0500, Matt Weber wrote:
> > From: Stefan S?rensen <stefan.sorensen@spectralink.com>
> >
> > The PIE build flags are only intended for building executables and can not be
> > used in relocateable links (-r), static builds and shared library build -
> > including the flags here causes build errors.
> >
> > So instead of parsing the PIE flags directly on the command line to gcc,
> > include them in a gcc spec file where it is possible to only apply the flags
> > when other incompatible flags are not set.
> >
> > This method and the spec files are from the Fedora build system.
> >
> > Originally submitted as
> > http://patchwork.ozlabs.org/patch/907093/
> >
> > Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>
> I've read the whole discussion on this patch, but still I don't
> understand which direction we want to take moving forward: move away
> from handling options in the wrapper, and use a spec file for
> everything ? Or keep the entire logic in the wrapper ?

So far, the spec files are just fixing a conditional case where a
option isn't compatible.  ie PIE and shared can't be used together.
This prevents a lot of patchwork on all the packages.  I could move
this string search and condition process to the wrapper but it seems
cleaner to do that in the spec file.  I do want to note that we did
not go to the extent that gentoo did where they use spec files to
enable and do the conditional compatibility fixups at link time(PIE vs
shared) for all the hardening options.

>
> I'm not happy at all with the approach of having some flags handled in
> the wrapper, some flags handled through spec files. I believe choosing
> the spec file direction makes this patch series more difficult to
> merge, because we have to go through this whole discussion of spec file
> vs. wrapper.

Agree, the specfile even just doing the conditional fixup is a 3rd leg
on this whole thing.  We can add it to the wrapper code but we will
loose visibility to what the wrapper is doing vs with the spec we can
dump and analyze the output.

>
> I have nothing against using spec files, but right now, our logic is
> based on a wrapper program. Therefore, I would be more comfortable with
> an approach that relies on the wrapper program, so that it is in line
> with what we are doing today. Then, separately, we can discuss how our
> wrapper can be replaced, completely or partially, by a spec file.

Ok. If the above feedback in this email doesn't change the view
related to spec files, I can look at switching to a pure wrapper for
fixups and static setting of variables with flags.


Matt
