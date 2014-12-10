From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 10 Dec 2014 23:53:45 +0100
Subject: [Buildroot] [PATCH v3 00/12] Paranoid header and library path
	checking
Message-ID: <1418252037-26636-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a new iteration of the patch series adding paranoid checking
to the header and library paths, to avoid seeing host paths being used
when cross-compiling things for the target.

It would be good to get some quick testing from others, to help
getting this series merged. Once merged, we can enable it in the
autobuilders.

Thanks!

Thomas

Changes since v2:
 * In ext toolchain wrapper, remove an empty line (Romain Naour)

 * Update the gcc/binutils patches for arc-2014.08 toolchain (Romain Naour)

Changes since v1:

 * In ext toolchain wrapper, make the unsafe_paths variable a static
   variable, as suggested by Yann.

 * In ext toolchain wrapper, add "/lib" to the list of paths to
   checks.

 * In ext toolchain wrapper, print the program name when showing a
   warning/error, using program_invocation_short_name. Suggested by
   Yann.

 * In ext toolchain wrpaper, Make a few improvements in the loop
   checking for -I and -L, suggested by Yann.

 * Update the binutils and gcc patches to the current versions in
   master.

 * Added Acked-by tags from Yann E. Morin on certain patches.

Thomas Petazzoni (12):
  toolchain-external: instrument wrapper to warn about unsafe paths
  binutils/2.24: add patch to warn about unsafe library paths
  binutils/2.23: add patch to warn about unsafe library paths
  binutils/2.22: add patch to warn about unsafe library paths
  binutils/arc-2014.08: add patch to warn about unsafe library paths
  gcc/4.9: add patch to warn about unsafe header paths
  gcc/4.8: add patch to warn about unsafe header paths
  gcc/arc-2014.08: add patch to warn about unsafe header paths
  gcc/4.7: add patch to warn about unsafe header paths
  gcc: enable poison system directories option
  binutils: enable poison system directories option
  Add option for paranoid unsafe path checking

 Config.in                                          |  20 ++
 package/Makefile.in                                |   4 +
 .../2.22/600-poison-system-directories.patch       | 274 ++++++++++++++++++++
 .../2.23.2/600-poison-system-directories.patch     | 279 +++++++++++++++++++++
 .../2.24/600-poison-system-directories.patch       | 279 +++++++++++++++++++++
 .../600-poison-system-directories.patch            | 279 +++++++++++++++++++++
 package/binutils/binutils.mk                       |   1 +
 .../4.7.4/910-gcc-poison-system-directories.patch  | 207 +++++++++++++++
 .../4.8.3/910-gcc-poison-system-directories.patch  | 207 +++++++++++++++
 .../4.9.2/910-gcc-poison-system-directories.patch  | 207 +++++++++++++++
 .../910-gcc-poison-system-directories.patch        | 221 ++++++++++++++++
 package/gcc/gcc-final/gcc-final.mk                 |   1 +
 .../toolchain-external/ext-toolchain-wrapper.c     |  52 ++++
 13 files changed, 2031 insertions(+)
 create mode 100644 package/binutils/2.22/600-poison-system-directories.patch
 create mode 100644 package/binutils/2.23.2/600-poison-system-directories.patch
 create mode 100644 package/binutils/2.24/600-poison-system-directories.patch
 create mode 100644 package/binutils/arc-2014.08/600-poison-system-directories.patch
 create mode 100644 package/gcc/4.7.4/910-gcc-poison-system-directories.patch
 create mode 100644 package/gcc/4.8.3/910-gcc-poison-system-directories.patch
 create mode 100644 package/gcc/4.9.2/910-gcc-poison-system-directories.patch
 create mode 100644 package/gcc/arc-2014.08/910-gcc-poison-system-directories.patch

-- 
1.9.3
