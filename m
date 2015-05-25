From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 May 2015 23:56:43 +0200
Subject: [Buildroot] [PATCH v4 2015.08 0/4] Generate package size statistics
Message-ID: <1432591007-27689-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is the fourth iteration of the patches adding a 'size-stats'
feature, which mainly allows to generate a pie chart of the size
contribution of each package to the overall root filesystem size.

This code is also available at:

  http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=size-stats-v4

Remaining questions:

 - How to handle files added by post-build script and rootfs overlays?
   Handling rootfs overlays like the skeleton is done today is
   possible, but it doesn't work for post-build scripts. One
   possibility is to use the script suggested by Romain Naour: to add
   an explicit call to step_pkg_size_start before copying the
   overlays, and a call to step_pkg_size_end after copying the
   overlays, with a fake package name:

	$(call step_pkg_size_start,rootfs-overlay)
	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
		$(call MESSAGE,"Copying overlay $(d)"); \
		rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
			--chmod=Du+w --exclude .empty --exclude '*~' \
			$(d)/ $(TARGET_DIR)$(sep))
	$(call step_pkg_size_end,rootfs-overlay)

   We could do the same for the post-build script and the skeleton,
   and reduce the complexity in the size-stats script itself.

   What do you think?

Changes since v3:

 - Remove the BR2_COLLECT_FILE_SIZE_STATS option, and collect the
   necessary data unconditionally. This was suggested by Yann
   E. Morin, who did some testing of the performance impact, and found
   that it was so insignificant that it is negligible. See Yann's
   analysis at
   http://lists.busybox.net/pipermail/buildroot/2015-February/119431.html.

 - Store the temporary files listing the files before/after inside
   each package build directory, rather than in $(BUILD_DIR)
   directly. This was suggested by Yann E. Morin.

   They are now named .br_filelist_before and .br_filelist_after. They
   are also no longer removed after the step_pkg_size_end hook, as
   they don't consume that much space and could be useful for
   analysis. If anyone finds that annoying, I'll be happy to change
   this back to remove them.

 - As suggested by Arnout, make a number of improvements to the
   size-stats Python script:

   * Use collections.defaultdict()

   * Use a dict of tuples (package name, file size) for the filesdict,
     instead of a dict of dict containing just two entries.

   * Factorize code between build_skeleton_dict() and
     build_package_dict() into a add_file() function.

   * Use [2:] instead of .replace("./", "") to remove the leading "./"
     in relative file paths returned by find.

   * Many other small things: one digit for percentages, use sum()
     when possible, rename pkgdict to filesdict where it makes sense,
     etc.

 - In the main Makefile:

   * Use mkdir -p instead of install -d, as suggested by Arnout.

   * Use $(Q) instead of @, as suggested by Arnout

   * Do not cd into $(CONFIG_DIR), as it would break out of tree
     build, since the path to the skeleton is passed as a relative
     path.

 - Add a new patch updating the manual with a new section describing
   this feature.

Changes since v2:

 - Use print0 in find and -0 in xargs to support spaces in filenames,
   just in case. Suggested by J?r?me Pouiller.

 - Support custom skeleton locations, instead of assuming the skeleton
   comes from system/skeleton.

 - Fix the size-stats target to actually call the size-stats script,
   and not graph-size, which was the old name of the script in
   previous versions of the series.

 - Fix usage of the size-stats target in out of tree build
   situations. For consistency reasons, we chose to mimic what
   graph-depends already does, even if size-stats does not necessarily
   need to be executed from within CONFIG_DIR.

 - Add one patch to make sure that 'make clean' removes the graphs/
   subdirectory in the output directory, which wasn't done today. This
   issue isn't specific to size-stats, and already existed with
   graph-build and graph-depends.

Changes since v1:

 - Improve the logic to properly take into account packages that
   overwrite files installed by other packages.

 - Make the new pkg_step hook optional.

 - Extend the facility to not only generate a graph, but also CSV
   files. As a consequence, everything was renamed from 'graph-size'
   to 'size-stats'.

Best regards,

Thomas

Thomas Petazzoni (4):
  pkg-generic: add step_pkg_size global instrumentation hook
  support/scripts: add size-stats script
  Makefile: implement a size-stats target
  docs/manual: add section about size graphing

 Makefile                     |   9 ++
 docs/manual/common-usage.txt |  39 +++++++
 package/pkg-generic.mk       |  32 ++++++
 support/scripts/size-stats   | 238 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 318 insertions(+)
 create mode 100755 support/scripts/size-stats

-- 
2.1.0
