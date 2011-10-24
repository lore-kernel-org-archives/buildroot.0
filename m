From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Oct 2011 17:38:15 +0200
Subject: [Buildroot] Some topics for the Buildroot Developer Day
Message-ID: <20111024173815.2277c6dd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As discussed on IRC, I am posting below a list of topics that might be
discussed during the developer day. Note that this is just _my_ list of
topics, note the one of the Buildroot project as a whole. Moreover,
it's very likely that not all topics will be covered during our meeting
day. However, feel free to add your opinion and/or your additional
topics, especially if you can't make it to the Developer day.

Regards,

Thomas

ELCE 2011 meeting agenda
========================

 * Migration to the Ascii-doc format, what remains to be done ?
   Infrastructure on the web server side ?

 * Extract sources in a new output/sources/ directory, and do
   out-of-tree build of packages.

   Pros:

    - Allows more natural integration with the override source
      directory mechanism. No rsync needed here, especially useful for
      big packages such as the kernel.

    - Allows to extract only once the source code for utitilies built
      for the host and the target (X.org components, Glib/Gtk stack,
      etc.)

    - Should work fine for all CMake-based and autotools-based packages.

   Cons:

    - Not all packages support out-of-tree build. The infrastructure
      should support a <pkg>_OUTOFTREE boolean, defaulting to NO for
      all packages, overriden to YES for autotools-based and
      CMake-based packages. When set to NO, the infrastructure will
      have to copy/rsync the source code to the build directory. This
      adds an additional copy of the source code for packages that
      don't support out-of-tree build.

 * Website improvement. The website is ugly, never changes, not
   representative of the vivacity of the community. At least improve
   the design. Wiki ? Blog ?

 * Maintainance/patch review/merge. How to spread the load ? Should we
   move to a model with trusted maintainers for specific parts of
   Buildroot ? Usage of patchwork/Gerrit ?

 * Host packages visible in menuconfig. Discussion has taken place on
   the list, consensus reached between several contributors,
   implementation proposed. What do we do ?

   + proposal of Arnout to derive host dependencies from target
     dependencies.

 * Per-package device files handling, proposed by Maxime Ripard.

 * Testing infrastructure. Possible to put build results on the Web
   server ? Common format for them ?

 * Tracking of files installed by packages. Do we care ? Is this an
   important feature of Buildroot ? Won't the added complexity make
   Buildroot more complicated to understand ?

   Which solution ? Two solutions:

    - Change the installation steps of packages so that each package
      installs in a different directory.

      Pros:

        seems to be the cleanest solution.

        allows to easily detect packages overriding files installed by
        other packages.

      Cons:

        requires modifications of all gentargets packages to use
        $$(STAGING_DIR) and $$(TARGET_DIR) instead of $(STAGING_DIR)
        and $(TARGET_DIR).

        strange handling of host packages. DESTDIR isn't used, the
        prefix is the absolute path to HOST_DIR.

    - Keep installing package files in their normal directory, but
      detect new files and modified files.

      Pros:

        no need to change anything in the current package installation
        procedures.

      Cons:

        need to scan the TARGET_DIR, STAGING_DIR and HOST_DIR after
        every package installation.

        hard to detect modified/overwritten files, except by storing
        hashes of installed files.

 * Next big directions. What are the next big directions for Buildroot
   ? The major features we want to implement ?



-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
