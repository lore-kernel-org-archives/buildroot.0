From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Aug 2014 15:06:33 +0200
Subject: [Buildroot] [PATCH 00/12] toolchain: warn for unsafe library/header
	paths
Message-ID: <1408540005-26934-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series is a respin of the patch I sent a long time ago to improve
the external toolchain wrapper to warn/error when unsafe library or
header paths are used.

This series extend this significantly by:

 - Making sure the external toolchain wrapper logic will work even if
   Buildroot is built from /usr. To do this, we assume only
   /usr/include and /usr/local/include are unsafe header paths, and
   /usr/lib and /usr/local/lib are unsafe library paths. Other
   locations in /usr are assumed to be safe.

 - Covering the internal toolchain backend as well, by
   borrowing/adapting gcc and binutils patches from
   CodeSourcery/Yocto. The compiler and linker directly check for
   unsafe paths in -I/-L options.

 - Adding a Config.in option to control the usage of this
   mechanism. When the option is disabled, only warnings are
   emitted. When the option is enabled, any unsafe header or library
   path will make the compilation fail.

Of course, this series is not meant for 2014.08, but for 2014.11.

Feedback welcome,

Thanks!

Thomas

Thomas Petazzoni (12):
  toolchain-external: instrument wrapper to warn about unsafe paths
  binutils/2.24: add patch to warn about unsafe library paths
  binutils/2.23: add patch to warn about unsafe library paths
  binutils/2.22: add patch to warn about unsafe library paths
  binutils/arc-4.8-R3: add patch to warn about unsafe library paths
  gcc/4.9: add patch to warn about unsafe header paths
  gcc/4.8: add patch to warn about unsafe header paths
  gcc/arc-4.8-R3: add patch to warn about unsafe header paths
  gcc/4.7: add patch to warn about unsafe header paths
  gcc: enable poison system directories option
  binutils: enable poison system directories option
  Add option for paranoid unsafe path checking

 Config.in                                          |  20 ++
 package/Makefile.in                                |   4 +
 .../2.22/600-poison-system-directories.patch       | 274 ++++++++++++++++++++
 .../2.23.2/600-poison-system-directories.patch     | 279 +++++++++++++++++++++
 .../2.24/600-poison-system-directories.patch       | 279 +++++++++++++++++++++
 .../arc-4.8-R3/600-poison-system-directories.patch | 279 +++++++++++++++++++++
 package/binutils/binutils.mk                       |   1 +
 .../4.7.4/910-gcc-poison-system-directories.patch  | 207 +++++++++++++++
 .../4.8.3/910-gcc-poison-system-directories.patch  | 207 +++++++++++++++
 .../4.9.1/910-gcc-poison-system-directories.patch  | 207 +++++++++++++++
 .../910-gcc-poison-system-directories.patch        | 221 ++++++++++++++++
 package/gcc/gcc-final/gcc-final.mk                 |   1 +
 .../toolchain-external/ext-toolchain-wrapper.c     |  49 ++++
 13 files changed, 2028 insertions(+)
 create mode 100644 package/binutils/2.22/600-poison-system-directories.patch
 create mode 100644 package/binutils/2.23.2/600-poison-system-directories.patch
 create mode 100644 package/binutils/2.24/600-poison-system-directories.patch
 create mode 100644 package/binutils/arc-4.8-R3/600-poison-system-directories.patch
 create mode 100644 package/gcc/4.7.4/910-gcc-poison-system-directories.patch
 create mode 100644 package/gcc/4.8.3/910-gcc-poison-system-directories.patch
 create mode 100644 package/gcc/4.9.1/910-gcc-poison-system-directories.patch
 create mode 100644 package/gcc/arc-4.8-R3/910-gcc-poison-system-directories.patch

-- 
2.0.0
