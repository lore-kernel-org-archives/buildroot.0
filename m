From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Aug 2018 12:29:54 +0200
Subject: [Buildroot] [PATCH 3/6] package/Makefile.in: Use gcc spec files
 for PIE build flags
In-Reply-To: <CANQCQpYDuFNMYrwmWiJefh89NjOMoABQwCSne1sM1=-Kcjt9vA@mail.gmail.com>
References: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
 <20180711143113.11927-4-matthew.weber@rockwellcollins.com>
 <20180810225051.4f34fb06@windsurf>
 <CANQCQpYDuFNMYrwmWiJefh89NjOMoABQwCSne1sM1=-Kcjt9vA@mail.gmail.com>
Message-ID: <20180811122954.15470d8a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Aug 2018 19:42:32 -0500, Matthew Weber wrote:

> > I've read the whole discussion on this patch, but still I don't
> > understand which direction we want to take moving forward: move away
> > from handling options in the wrapper, and use a spec file for
> > everything ? Or keep the entire logic in the wrapper ?  
> 
> So far, the spec files are just fixing a conditional case where a
> option isn't compatible.  ie PIE and shared can't be used together.
> This prevents a lot of patchwork on all the packages.  I could move
> this string search and condition process to the wrapper but it seems
> cleaner to do that in the spec file.  I do want to note that we did
> not go to the extent that gentoo did where they use spec files to
> enable and do the conditional compatibility fixups at link time(PIE vs
> shared) for all the hardening options.

I understand the idea of using the spec file. However, I'm worried that
it further complicates the overall toolchain setup. In addition, the
-spec option passed in TARGET_CFLAGS/TARGET_LDFLAGS will only work with
packages that do obey to CFLAGS/LDFLAGS, and some broken packages
don't. Being in the wrapper allows to ensure the flags are used. And
additionally, what's done in the wrapper is also used when the
Buildroot toolchain is used "manually" (outside of the Buildroot
infrastructure) to build stuff.

> > I'm not happy at all with the approach of having some flags handled in
> > the wrapper, some flags handled through spec files. I believe choosing
> > the spec file direction makes this patch series more difficult to
> > merge, because we have to go through this whole discussion of spec file
> > vs. wrapper.  
> 
> Agree, the specfile even just doing the conditional fixup is a 3rd leg
> on this whole thing.  We can add it to the wrapper code but we will
> loose visibility to what the wrapper is doing vs with the spec we can
> dump and analyze the output.

That's not true: the wrapper looks at BR2_DEBUG_WRAPPER={1,2} to dump
what it is doing:

        /* Debug the wrapper to see actual arguments passed to
         * the compiler:
         * unset, empty, or 0: do not trace
         * set to 1          : trace all arguments on a single line
         * set to 2          : trace one argument per line
         */
        if ((env_debug = getenv("BR2_DEBUG_WRAPPER"))) {

> > I have nothing against using spec files, but right now, our logic is
> > based on a wrapper program. Therefore, I would be more comfortable with
> > an approach that relies on the wrapper program, so that it is in line
> > with what we are doing today. Then, separately, we can discuss how our
> > wrapper can be replaced, completely or partially, by a spec file.  
> 
> Ok. If the above feedback in this email doesn't change the view
> related to spec files, I can look at switching to a pure wrapper for
> fixups and static setting of variables with flags.

I think I'd be happier with a first step where the wrapper is being
used. Then in a second step, we can decide to rethink what the wrapper
is doing, and move more of its logic to a spec file. I think a wrapper
will still be needed anyway, at least to pass --sysroot and --spec.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
