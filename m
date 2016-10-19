From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 22:10:35 +0200
Subject: [Buildroot] Report from the Buildroot Meeting in Berlin
Message-ID: <20161019221035.2350c181@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

From Friday to Sunday last week, a Buildroot Developers meeting was
organized in Berlin, right after the Embedded Linux Conference Europe.

A number of people participated to this meeting:

 - Peter Korsgaard
 - Samuel Martin
 - Romain Naour
 - Maxime Hadjinlian
 - Thomas Petazzoni
 - Arnout Vandecappelle
 - Julien Rosener (only on Friday)
 - Waldemar Brodkorb (except Sunday)
 - Vicente Olivert Riera
 - Luca Ceresoli (except Sunday)
 - Yann E. Morin
 - Martin Thomas (only on Friday morning)

The meeting was kindly hosted by IN-Berlin, a local non-profit
Internet provider. Special thanks to Sven Guckes from IN-Berlin, who
really helped organizing the event.

Thanks also to our sponsors:

 - Essenssium/Mind, who sponsored the Friday dinner for all the
   participants!

 - Free Electrons, who sponsored the event by making a donation to the
   IN-Berlin organization, who hosted the event.

In total, 161 patches have been merged during the meeting. The
interesting changes merged have been:

 - Finally got rid of the texinfo dependency for gdb and binutils.

 - Added new options for the MIPS architecture to select specific
   cores. Patches from Vicente.

 - Merged the packages for vexpress-firmware and arm-trusted-firmware,
   useful for ARM64 platforms. Patches from Joao Pinto.

 - Merged many patches adding $(TARGET_MAKE_ENV) when calling
   $(MAKE). Patches from Gustavo Zacarias.

 - Removed entirely the BR2_DEPRECATED mechanism. Now, when a feature
   needs to be removed, it is removed immediately, and the
   Config.in.legacy mechanism warns the user. Patches from Arnout
   Vandecappelle.

 - Merged the multi-BR2_EXTERNAL patch series, at last. This allows to
   have multiple BR2_EXTERNAL directories listed in the BR2_EXTERNAL
   variable. Patches from Yann E. Morin.

On Friday, we had a long discussion session, on various topics,
prepared by a few participants. The discussion is summarized in the
Wiki at http://elinux.org/Buildroot:DeveloperDaysELCE2016#Report. The
topics covered were:

 - Optimizing the Git download method to avoid re-fetching the same
   data over and over again. This topic was raised by Julien Rosener,
   and discussed during a long time. A general design has been
   discussed, and should now be implemented.

 - Improving the developer experience when using _OVERRIDE_SRCDIR or
   "local" packages. Currently, since the source code is copied in the
   build directory, the build errors and warnings refers to the build
   directory. That's not convenient for users running an IDE, since
   clicking on the warning or error does not bring to the correct
   file. After much discusion, it appears that the only reasonable
   solution is to implement per-package out-of-tree build.

 - Multi BR2_EXTERNAL. Yann presented the motivation for this feature,
   and then the current state of the patches.

 - Runtime testing infrastructure. Thomas Petazzoni presented the
   prototype he has so far, showed a few examples of test cases.

 - Security. We had a long discussion around providing LTS releases
   for Buildroot, the effort behind it, and tooling to track for CVEs
   that apply to our packages. The conclusion was that we should first
   implement the tools to track for CVEs, and once that's done, we'll
   see what we can do for LTS releases.

 - Google Summer of Code. Whether we should candidate or not in
   2017. General opinion is that we should candidate, despite the
   failure the last two years.

Other topics have been discussed during the meeting, while reviewing
patch series:

 - Toolchain wrapper and CFLAGS. A patch series from Jan Heylen that
   changes the toolchain wrapper to also wrap 'ld' triggered a fairly
   lengthy discussion on how we handle CFLAGS. Some of them are
   encoded in the wrapper, some are not, with no clear
   definition. After this long discussion, we came to the conclusion
   that wrapping 'ld' was not needed (packages should not use 'ld'
   directly), and that the wrapper/CFLAGS handling should be reworked
   as follows:

   * Combine BR2_TARGET_OPTIMIZATION and BR2_TARGET_LDFLAGS into a
     single BR2_TARGET_EXTRA_FLAGS

   * Have a make variable called TARGET_WRAPPER_FLAGS that includes
     all flags we want to include in the wrapper:

      * $(TARGET_ABI)
      * $(TARGET_CPPFLAGS)
      * $(BR2_TARGET_EXTRA_FLAGS)
      * Custom flags added by package/Makefile.in

     $(TARGET_OPTIMIZATION) and $(TARGET_DEBUGGING) are *NOT* in the
     wrapper.

   * TARGET_CFLAGS = $(TARGET_WRAPPER_CFLAGS) $(TARGET_OPTIMIZATION) \
                     $(TARGET_DEBUGGING)
     TARGET_CXXFLAGS = $(TARGET_CFLAGS)
     TARGET_LDFLAGS = $(TARGET_CFLAGS)
     TARGET_FCFLAGS = $(TARGET_CFLAGS)

   * The wrapper, instead of having special cases for different flags,
     just receives (at build time), the list of hardcoded flag. A
     special logic needs to be put in place to handle conflicting
     flags (mcpu, march, mtune, mfloat-abi, etc.), for which the
     command-line passed flag must be preserved if passed.

   Arnout has volunteered to do this work.

 - The patch series from Samuel doing RPATH cleanup and other related
   RPATH activities was discussed. This patch series does multiple
   things at once, which makes it a bit lengthy and scary. It was
   generally agreed that handling each topic separately would be
   better. The different topics are:

    - Misc cleanups and improvements in the main Makefile to ensure
      the build is done from a canonical path. These patches were
      almost ready, so we suggested to Samuel to only resend those 3-4
      patches, and get them merged. Samuel did so by the end of the
      meeting.

    - Tweak the RPATH of host binaries and libraries so that they are
      relative instead of absolute. This currently requires more than
      700 lines of complicated shell script, which nobody really
      likes. Instead, it was suggested to add such a feature directly
      to the "patchelf" utility, and contribute it upstream. Then this
      step could just be turned into calling patchelf on all binaries.

    - Tweak the RPATH of target binaries and libraries so that they
      don't contain RPATH referencing paths of the build machine. This
      also uses the same complicated shell script logic. It turns out
      that patchelf already has a feature to filter rpaths based on a
      list of "allowed prefixes". This can be extended with a list of
      "forbidden prefixes".

    - Detect other "leaks" of build machine paths into the target,
      simply by grepping in all files. This part looked generally
      good, and we probably want more checks at the end of the build
      (that libraries needed by programs and other libraries are
      present, that all files are built for the right architecture,
      etc.).

 - Discussed the patch from Eric Le Bihan adding the meson build
   system. This build system is not used by any package in Buildroot,
   and we do not foresee any package using it in the near
   future. Therefore, we decide to reject the patch, as we don't want
   to support build system that are not even used/tested within
   Buildroot itself.

 - We also discussed the patches from Eric Le Bihan adding support for
   the Rust language. Arnout did a detailed review of the patches, but
   mainly, we decided that such tools (compilers like rust or go)
   should have a user-visible Config.in.host entry.

 - Following a patch from Gustavo Zacarias adding a python-libxml2
   package that uses the same source as the libxml2 package, but only
   to build the Python libxml2 module, we discussed whether we should
   start adding Config.in options for host packages.

   Generally, the opinion is that we should start doing this. Of
   course, most of those options would remain blind options, so there
   is no user-visible change. But there are many reasons for which
   this is desirable. People interested in this topic are welcome to
   help.

Besides those things that have been merged, a number of topics have
been worked on:

 - The testing infrastructure proposed by Thomas has been analyzed by
   Luca Ceresoli, and then Maxime Hadjinlian took over to improve the
   Python code written by Thomas. The conclusion of this is that Luca
   and Maxime believe the testing infrastructure is generally good,
   and we should go with it. At the end of the meeting, Maxime was
   finalizing his Python cleanup pass.

   In parallel, Peter Korsgaard looked at replacing the telnet usage
   to interact with Qemu by just the standard input/output, using the
   pexpect module. This is needed to allow running tests in parallel
   (the test infrastructure currently runs Qemu with the telnet port
   on TCP 1234, which doesn't allow multiple instances of Qemu to run
   at the same time).

 - autobuild.buildroot.org SQL database. The SQL database at
   autobuild.buildroot.org not only contains the build results, but
   also the configuration of each build result. This is supposed to
   allow queries like "which sucessful builds in the last month had
   BR2_PACKAGE_FOO=y". Unfortunately, the table storing the per-build
   result configuration is enormous (the entire database is more than
   50 GB) and the queries take ages. Thomas discussed the problem with
   Arnout and Maxime, and they came up with a possible new database
   schema to solve this issue. Maxime is working on this topic.

 - Splitting the toolchain-external package. This is a topic that
   Thomas started working on a while ago, and Romain Naour has now
   taken over the work. He rebased Thomas work (which required a huge
   effort), and then started fixing the remaining problems.

   Thanks to this, we hope to simplify a bit the external toolchain
   logic, and also to allow external toolchains to be provided by
   BR2_EXTERNAL.

 - Adding a Qemu defconfig for the NIOS2 architecture has been started
   by Romain Naour and Waldemar Brodkorb. Indeed, support for this
   architecture was contributed in Qemu upstream, and we can therefore
   now use it in Buildroot.

 - The CMake handling had a few issues, which Samuel and Maxime worked
   on. Especially around setting the BUILD_TYPE, and how flags are
   passed to CMake packages. A number of iterations have been posted
   on the mailing list, with lots of review from Arnout. Hopefully,
   the latest set of patches posted on the mailing list can be merged.

I'd like to thank all the participants, but also our sponsors who made
this event possible!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
