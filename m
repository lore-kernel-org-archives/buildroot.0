From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 15:20:33 +0100
Subject: [Buildroot] [PATCH next v8 1/6] core: implement per-package SDK
 and target
In-Reply-To: <20191105164646.23820-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 5 Nov 2019 17:46:40 +0100")
References: <20191105164646.23820-1-thomas.petazzoni@bootlin.com>
 <20191105164646.23820-2-thomas.petazzoni@bootlin.com>
Message-ID: <87muceahn2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This commit implements the core of the move to per-package SDK and
 > target directories. The main idea is that instead of having a global
 > output/host and output/target in which all packages install files, we
 > switch to per-package host and target directories, that only contain
 > their explicit dependencies.

 > There are two main benefits:

 >  - Packages will now see only the dependencies they explicitly list in
 >    their <pkg>_DEPENDENCIES variable, and the recursive dependencies
 >    thereof.

 >  - We can support top-level parallel build properly, because a package
 >    only "sees" its own host directory and target directory, isolated
 >    from the build of other packages that can happen in parallel.

 > It works as follows:

 >  - A new output/per-package/ directory is created, which will contain
 >    one sub-directory per package, and inside it, a "host" directory
 >    and a "target" directory:

 >    output/per-package/busybox/target
 >    output/per-package/busybox/host
 >    output/per-package/host-fakeroot/target
 >    output/per-package/host-fakeroot/host

 >    This output/per-package/ directory is PER_PACKAGE_DIR.

 >  - The global TARGET_DIR and HOST_DIR variable now automatically point
 >    to the per-package directory when PKG is defined. So whenever a
 >    package references $(HOST_DIR) or $(TARGET_DIR) in its build
 >    process, it effectively references the per-package host/target
 >    directories. Note that STAGING_DIR is a sub-dir of HOST_DIR, so it
 >    is handled as well.

 >  - Of course, packages have dependencies, so those dependencies must
 >    be installed in the per-package host and target directories. To do
 >    so, we simply rsync (using hard links to save space and time) the
 >    host and target directories of the direct dependencies of the
 >    package to the current package host and target directories.

 >    We only need to take care of direct dependencies (and not
 >    recursively all dependencies), because we accumulate into those
 >    per-package host and target directories the files installed by the
 >    dependencies. Note that this only works because we make the
 >    assumption that one package does *not* overwrite files installed by
 >    another package.

 >    This is done for "extract dependencies" at the beginning of the
 >    extract step, and for "normal dependencies" at the beginning of the
 >    configure step.

 > This is basically enough to make per-package SDK and target work. The
 > only gotcha is that at the end of the build, output/target and
 > output/host are empty, which means that:

 >  - The filesystem image creation code cannot work.

 >  - We don't have a SDK to build code outside of Buildroot.

 > In order to fix this, this commit extends the target-finalize step so
 > that it starts by populating output/target and output/host by
 > rsync-ing into them the target and host directories of all packages
 > listed in the $(PACKAGES) variable. It is necessary to do this
 > sequentially in the target-finalize step and not in each
 > package. Doing it in package installation means that it can be done in
 > parallel. In that case, there is a chance that two rsyncs are creating
 > the same hardlink or directory at the same time, which makes one of
 > them fail.

 > This change to per-package directories has an impact on the RPATH
 > built into the host binaries, as those RPATH now point to various
 > per-package host directories, and no longer to the global host
 > directory. We do not try to rewrite such RPATHs during the build as
 > having such RPATHs is perfectly fine, but we still need to handle two
 > fallouts from this change:

 >  - The check-host-rpath script, which verifies at the end of each
 >    package installation that it has the appropriate RPATH, is modified
 >    to understand that a RPATH to $(PER_PACKAGE_DIR)/<pkg>/host/lib is
 >    a correct RPAT.

 >  - The fix-rpath script, which mungles the RPATH mainly for the SDK
 >    preparation, is modified to rewrite the RPATH to not point to
 >    per-package directories. Indeed the patchelf --make-rpath-relative
 >    call only works if the RPATH points to the ROOTDIR passed as
 >    argument, and this ROOTDIR is the global host directory. Rewriting
 >    the RPATH to not point to per-package host directories prior to
 >    this is an easy solution to this issue.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I think it is finally time to get this merged - Committed to next,
thanks!

-- 
Bye, Peter Korsgaard
