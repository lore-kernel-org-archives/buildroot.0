From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Apr 2010 02:30:37 +0200
Subject: [Buildroot] Anyone working on install-able packages (ipkg)
In-Reply-To: <20100415164504.11822b4a@surf>
References: <4BC61E50.4000902@gmail.com>
	<20100415164504.11822b4a@surf>
Message-ID: <20100417023037.1bd96a69@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 15 Apr 2010 16:45:04 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> During the Buildroot meeting at Brussels in February, we discussed how
> we wanted to implement package removal, i.e be able to unselect a
> package from menuconfig and then remove it cleanly from $(STAGING_DIR)
> and $(TARGET_DIR). I think that some of the work required to do this
> might be common with package support. I'll clean up my notes and share
> them on the list.

Ok, here are my notes, they are the result of a discussion between
Peter and I in Brussels in February. Of course, they are not necessarly
final decisions and they can be discussed on the list.

Our discussion was not focused on install-able packages, but rather on
being able to remove packages from the selection without having to
rebuild everything from scratch. And we would like to do this
recursively: i.e, if you remove openssl for the selection, it should
not only remove openssl's files in $(STAGING_DIR) and $(TARGET_DIR),
but it should also rebuild the packages that have an optional
dependency on openssl.

Therefore, we propose to (making the assumption that all packages use
the generic or the autotools infrastructure or any later infrastructure
that is based on the generic infrastructure) :

 * Change the semantic of <pkg>-uninstall so that it removes the files
   installed by the package in the $(TARGET_DIR) and $(STAGING_DIR)
   directory, and remove stamp files so that next time 'make' is run,
   the package gets reinstalled. <pkg>-uninstall is *not* recursive, so
   that if other packages depend on <pkg>, they might be broken.

   Of course, <pkg>-uninstall is implemented in a generic way in
   package/Makefile.package.in.

 * Change the semantic of <pkg>-clean so that it does <pkg>-uninstall +
   removal of the source directory in build/. Like <pkg>-uninstall,
   <pkg>-clean is non-recursive.

 * After the configure step, the name of the package being built should
   be added to the reverse dependencies files of the packages it
   depends on (listed in <pkg>_DEPENDENCIES). The reverse dependency
   file might be something like $(STAMP_DIR)/.<pkg>.rdeps.

 * Before the installation (host, staging or target), save the result
   of a find in $(TARGET_DIR), $(HOST_DIR) and $(STAGING_DIR) in some
   temporary location.

 * Then, do the installation steps as usual.

 * After the installation, redo the finds in $(TARGET_DIR),
   $(HOST_DIR), $(STAGING_DIR) and diff it with their previous result.
   Store the difference (i.e list of files installed by package) in
   files named $(STAMP_DIR)/.<pkg>.{host,staging,target}.

 * Implement <pkg>-remove, which:

    1. Remove files listed in $(STAMP_DIR)/.<pkg>.{host,staging,target}

    2. Call the <pkg>-remove target of all reverse dependencies (beware
       of possible duplicates)

    3. Remove the reverse dependency file

    4. Remove the install stamps of the current package

 * Change how targets are added to $(TARGETS), and add the
   <pkgname>-remove target to $(TARGETS_TO_CLEAN) when the package is
   not selected. In the top Makefile, run the $(TARGETS_TO_CLEAN)
   targets before $(TARGETS) targets.

Of course, this is just a rough design, and many implementation details
are left to be found/decided.

Paulius, do you have an idea on how you'd like to handle ipkg
generation ? I have questions like :

 * How do you handle dependencies ? As of today, the dependencies in
   Buildroot are expressed in terms of *source* dependencies, not
   *binary* dependencies.

 * What do you put in the package ? The files usually installed in
   $(TARGET_DIR) ? How do we modify the package infrastructure so that
   the package installs its files to another location ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
