From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Sep 2015 23:15:01 +0200
Subject: [Buildroot] [PATCHv5 0/4] Generate package size statistics
Message-ID: <1441228505-23235-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is the fifth iteration of the patches adding a 'size-stats'
feature, which mainly allows to generate a pie chart of the size
contribution of each package to the overall root filesystem size.

This code is also available at:

  http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=size-stats-v5

Changes since v4:

 - Rebased on top of the latest master.

 - Now that the skeleton logic has been moved to a regular Buildroot
   package, remove all the skeleton specific handling in the
   size-stats script, as well as the passing of the --skeleton-path
   from the main Makefile to the size-stats script.

 - Added Reviewed-by/Tested-by from Ryan Barnett on "pkg-generic: add
   step_pkg_size global instrumentation hook".

 - Rework the commit log of "pkg-generic: add step_pkg_size global
   instrumentation hook" to not mention the Config.in option that no
   longer exists, and instead explain why we are doing the data
   collection unconditionally. Reported by Romain Naour.

 - Display the total filesystem on the generated graph. Suggested by
   Ryan Barnett.

 - Call matplotlib.use('Agg') to make sure matplotlib doesn't try to
   connect to a X server. Suggested by Claython Shotwell.

 - Added Reviewed-by/Tested-by from Ryan Barnett on "Makefile:
   implement a size-stats target".

 - Minor tweaks in the manual, suggested by Ryan Barnett. Also added
   Reviewed-by/Tested-by from Ryan on the manual patch.

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

 Makefile                     |   8 ++
 docs/manual/common-usage.txt |  40 ++++++++
 package/pkg-generic.mk       |  32 +++++++
 support/scripts/size-stats   | 217 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 297 insertions(+)
 create mode 100755 support/scripts/size-stats

-- 
2.5.1
