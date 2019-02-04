From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 4 Feb 2019 04:36:56 -0600
Subject: [Buildroot] [PATCH v2 1/1] fs/common.mk: enable multithreaded
 xz compression
In-Reply-To: <CANQCQpbkzWAf=fomzWqqqcFmityJutDyqajq+5ZexJ-7SHuniA@mail.gmail.com>
References: <1548318453-25435-1-git-send-email-james.hilliard1@gmail.com>
 <CANQCQpbkzWAf=fomzWqqqcFmityJutDyqajq+5ZexJ-7SHuniA@mail.gmail.com>
Message-ID: <CANQCQpYtgRvwtv1Bz9KprT1ARqF6J9ed9a8HV_jyO1dPmK+qYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Thomas,

On Thu, Jan 24, 2019 at 9:01 AM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> James,
>
>
> On Thu, Jan 24, 2019 at 2:28 AM <james.hilliard1@gmail.com> wrote:
> >
> > From: James Hilliard <james.hilliard1@gmail.com>
> >
> > xz help indicates only 1 thread is used unless we set threads:
> > -T, --threads=NUM   use at most NUM threads; the default is 1; set to 0
> >                     to use as many threads as there are processor cores
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >
>
> Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>
> > ---
> > Changes v1 -> v2:
> >   - use PARALLEL_JOBS to determine how many threads to compress with
> >   - disable multithreaded compression for reproducible builds
> > ---
> >  fs/common.mk | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/fs/common.mk b/fs/common.mk
> > index a560417..76da6d8 100644
> > --- a/fs/common.mk
> > +++ b/fs/common.mk
> > @@ -106,7 +106,11 @@ endif
> >  ifeq ($$(BR2_TARGET_ROOTFS_$(2)_XZ),y)
> >  ROOTFS_$(2)_DEPENDENCIES += host-xz
> >  ROOTFS_$(2)_COMPRESS_EXT = .xz
> > +ifeq ($(BR2_REPRODUCIBLE),y)
> >  ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
> > +else
> > +ROOTFS_$(2)_COMPRESS_CMD = xz -T $(PARALLEL_JOBS) -9 -C crc32 -c
>
> I double checked this logic below in package/Makefile.in for creating
> PARALLEL_JOBS still made sense for the use of the value above.
>
> # If BR2_JLEVEL is 0, scale the maximum concurrency with the number of
> # CPUs. An additional job is used in order to keep processors busy
> # while waiting on I/O.
> # If the number of processors is not available, assume one.
> ifeq ($(BR2_JLEVEL),0)
> PARALLEL_JOBS := $(shell echo \
>         $$((1 + `getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1`)))
> else
> PARALLEL_JOBS := $(BR2_JLEVEL)
> endif
>

When we eventually do filesystem creation in a top level parallel
build, if we add xz multithreaded compression based on parallel jobs
variable, I assume we'll create a problem with cpu loading?  Maybe
this isn't a concern at this point or is there a previous
assumption/discussions on how this was going to be handled with
different build systems (GO, ninja based, etc) which may be called in
parallel while building pkgs.

Matt
