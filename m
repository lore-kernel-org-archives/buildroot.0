From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2020 23:04:38 +0100
Subject: [Buildroot] [PATCH 2/2] package/pkg-generic: make file list
 logic parallel build compatible
In-Reply-To: <20200226194345.1087529-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 26 Feb 2020 20:43:44 +0100")
References: <20200226194345.1087529-1-thomas.petazzoni@bootlin.com>
 <20200226194345.1087529-3-thomas.petazzoni@bootlin.com>
Message-ID: <87a753lma1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The current solution use to collect the list of files installed by
 > packages does not work for top-level parallel build. Indeed, we rely
 > on a file created after the installation of the previous package to
 > build the list of files installed by the current package.

 > This works well when packages are built sequentially, but badly fails
 > when using top-level parallel build.

 > More specifically, top-level parallel build can fail with:

 > comm: /home/thomas/buildroot/output/build/.files-list-host.new: No such file or directory

 > Because that file has been removed concurrently by the build process
 > of another package.

 > This commit reworks the logic in a very straight-forward way. Before
 > the installation of each package, we store the list of files that are
 > already installed and store it in the package build directory. After
 > the installation of each package, we store again that list of files,
 > calculate the difference with the before file, and store that as the
 > list of files installed by that package, still in the package build
 > directory.

 > At the end of the build, in target-finalize we collect all the
 > collected information into the global package file lists, that
 > continue to be installed in the same location as before, with the same
 > name.

 > There are however some differences:

 >  (1) The files are no longer ordered in build order, but by alphabetic
 >      ordering of packages. Indeed, "build order" no longer makes any
 >      sense in the context of top-level parallel build.

 >  (2) Some files which were incorrectly tracked are no longer
 >      tracked. For example, the toolchain package is a target package,
 >      but it installs files in $(HOST_DIR). In the previous logic, the
 >      files installed by the toolchain package in $(HOST_DIR) were
 >      incorrectly affected to the next host package that was installed
 >      after the toolchain package. With our new logic, those files are
 >      no longer tracked at all. To fix this, we would have to change
 >      the logic to scan HOST_DIR/TARGET_DIR/STAGING_DIR for all
 >      installation steps, not just for the install-host, install-target
 >      and install-staging steps respecitively. But the result was
 >      already incorrect anyway, and therefore this should be fixed
 >      separately.

 > Note that the check_bin_arch hook needs to be adjusted: it was using
 > the global package-file-list.txt file, but this file is now created
 > only at the very end of the build. So instead, we use the current
 > package .file-list.txt file to know which packages have been installed
 > by the current package in $(TARGET_DIR).

 > Fixes:

 >   http://autobuild.buildroot.net/results/4e60fa31b1cd08bc7fdf9c5dd3a3f4941e029ba3/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
