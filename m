From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 12:00:56 +0100
Subject: [Buildroot] [PATCH v2 1/1] fs/common.mk: enable multithreaded
 xz compression
In-Reply-To: <CANQCQpYtgRvwtv1Bz9KprT1ARqF6J9ed9a8HV_jyO1dPmK+qYg@mail.gmail.com>
References: <1548318453-25435-1-git-send-email-james.hilliard1@gmail.com>
 <CANQCQpbkzWAf=fomzWqqqcFmityJutDyqajq+5ZexJ-7SHuniA@mail.gmail.com>
 <CANQCQpYtgRvwtv1Bz9KprT1ARqF6J9ed9a8HV_jyO1dPmK+qYg@mail.gmail.com>
Message-ID: <20190204120056.0ee4277a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 4 Feb 2019 04:36:56 -0600
Matthew Weber <matthew.weber@collins.com> wrote:

> > # If BR2_JLEVEL is 0, scale the maximum concurrency with the number of
> > # CPUs. An additional job is used in order to keep processors busy
> > # while waiting on I/O.
> > # If the number of processors is not available, assume one.
> > ifeq ($(BR2_JLEVEL),0)
> > PARALLEL_JOBS := $(shell echo \
> >         $$((1 + `getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1`)))
> > else
> > PARALLEL_JOBS := $(BR2_JLEVEL)
> > endif
> >  
> 
> When we eventually do filesystem creation in a top level parallel
> build, if we add xz multithreaded compression based on parallel jobs
> variable, I assume we'll create a problem with cpu loading?  Maybe
> this isn't a concern at this point or is there a previous
> assumption/discussions on how this was going to be handled with
> different build systems (GO, ninja based, etc) which may be called in
> parallel while building pkgs.

We have no real solution for non-make based build systems. For ninja
specifically, there is this open issue:
https://github.com/ninja-build/ninja/issues/1139. For other build
systems, I don't think there's a good solution.

For the filesystem generation, I don't think there will really be an
actual problem. Indeed, by the time you generate the filesystem images,
all packages have completed building, so the system load should be
quite low. And most reasonable configurations don't have a lot of
different filesystem formats enabled. Even if you have 3 or 4 of them,
I don't think the parallel xz used for each instance will really cause
a CPU load that isn't manageable. Of course, testing needed to verify
those claims.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
