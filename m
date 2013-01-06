From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 16:22:40 +0100
Subject: [Buildroot] =?utf-8?q?=5Bpull_request=5D_Pull_request_for_branch_?=
	=?utf-8?q?perf-elfutils?=
Message-ID: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of patches that add the elfutils and perf packages in
Buildroot, based on previous efforts from Stefan Fr?berg and Kaiwan
Billimoria (thanks !).

These packages are not trivial because:
 1) perf is part of the kernel sources
 2) elfutils is a nightmare to build against uClibc

I've been working on this for about two days, trying different
solutions, the one proposed here appeared to be the most reasonable
one in terms of patch size, and maintenability.

Here is a short description of the patches, and the logic behind the
order of the patches:

 * Patches 1 and 2 make it possible to list several patches in the
   <pkg>_PATCH variable of a package .mk file. This is used by the
   elfutils package to apply two big patches that are provided along
   with elfutils tarball. Compared to the previous proposal from
   Stefan Fr?berg, it avoids the need from merging in Buildroot two
   fairly large patches (57K and 62K).

 * Patch 3 adds elfutils as a glibc-only package, to keep things
   simple.

 * Patch 4 allows to disable the installation of elfutils. Instead of
   doing it by removing executable after their installation, I've
   added a configuration option inside elfutils. This will be useful
   to support uClibc, as the elfutils tools are causing issues to
   build with uClibc, and we don't need them to just build the
   elfutils libraries.

 * Patch 5 adds a perf package, with no support for libelf.

 * Patch 6 improves the perf package to use libelf when available
   (thanks to the elfutils package).

 * Patch 7 adds error checking to the perf package to catch kernel
   version problems.

 * Patch 8 builds argp-standalone as position-independent code. This
   is needed as it will be used by the elfutils package in some shared
   library.

 * Patch 9 to 14 are here to progressively make elfutils buildable on
   uClibc. Notice that at this point, it is *NOT* possible to select
   elfutils with a uClibc toolchain. Only the final commit makes that
   possible. So this split of patches is here only to make things
   easier to review (but this split also doesn't break the build, as
   uClibc build of elfutils is not possible until we reach patch 15).

   Most of the patches are relatively simple. The most annoying one is
   the one regarding the fts_*() family of functions. I had basically
   three choices here:

     (1) Enable fts_*() functions in our default uClibc
         configuration. But elfutils is apparently the only package to
         make use of these functions, since even the uClibc help text
         for those functions mention elfutils as the primary reason
         for having support for those functions in uClibc. The help
         text also encourages migrating to the nftw() function
         instead. So, changing our default uClibc configuration didn't
         seem like the right choice.

     (2) Use gnulib to provide fts. This is what Stefan Fr?berg
         initially did. It required a very large (1.5 MB) patch. I
         improved that by creating a host-gnulib package, and then
         call gnulib-tool at build time in the elfutils package so
         that the needed functions are added. But it still required
         changes to the configure.ac file, Makefile.am and so on. So,
         a lot better than the 1.5 MB patch, but still not really
         nice, especially just to get the 'fts' feature.

     (3) Copy the fts_*() functions from uClibc. This is what I've
         decided to implement in this proposal.

 * Patch 15 finally makes elfutils available on uClibc (but only the
   libraries, not the utilities themselves).

The result has been tested on a x86 glibc toolchain, x86 uClibc
toolchain and ARM uClibc toolchain.

Best regards,

Thomas

The following changes since commit 66bfe1d4fe2de50aef6ac3fc836a710fa577cdef:

  xdriver_xf86-video-sunffb: remove package (2013-01-05 14:34:48 +0100)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git perf-elfutils

for you to fetch changes up to 3e9f9e1a1d4de1c948dcf64dffd1a9e6e653d7bd:

  elfutils: make available on uClibc toolchains (2013-01-06 16:08:29 +0100)

----------------------------------------------------------------
Stefan Fr?berg (1):
      elfutils: new package

Thomas Petazzoni (14):
      package: support multiple patches
      docs/manual: update to mention the multiple patches support
      elfutils: make it possible to only install the libraries
      perf: new package
      perf: allow build against libelf when available
      perf: add kernel version checks
      argp-standlone: build position independent code
      elfutils: towards uClibc support: argp-standalone usage
      elfutils: towards uClibc support: solve memcpy problem
      elfutils: towards uClibc support: requires largefile
      elfutils: towards uClibc support: gettext
      elfutils: towards uClibc support: FTS functions
      elfutils: towards uClibc support: disable po build
      elfutils: make available on uClibc toolchains

 docs/manual/adding-packages-generic.txt          |   17 +-
 package/Config.in                                |    2 +
 package/argp-standalone/argp-standalone.mk       |    3 +
 package/elfutils/Config.in                       |   29 +
 package/elfutils/elfutils-01-disable-progs.patch |   47 +
 package/elfutils/elfutils-02-argp-support.patch  |   92 ++
 package/elfutils/elfutils-03-memcpy-def.patch    |   24 +
 package/elfutils/elfutils-04-fts.patch           | 1307 ++++++++++++++++++++++
 package/elfutils/elfutils-05-disable-po.patch    |   22 +
 package/elfutils/elfutils.mk                     |   70 ++
 package/perf/Config.in                           |   22 +
 package/perf/perf.mk                             |   55 +
 package/pkg-generic.mk                           |   17 +-
 13 files changed, 1695 insertions(+), 12 deletions(-)
 create mode 100644 package/elfutils/Config.in
 create mode 100644 package/elfutils/elfutils-01-disable-progs.patch
 create mode 100644 package/elfutils/elfutils-02-argp-support.patch
 create mode 100644 package/elfutils/elfutils-03-memcpy-def.patch
 create mode 100644 package/elfutils/elfutils-04-fts.patch
 create mode 100644 package/elfutils/elfutils-05-disable-po.patch
 create mode 100644 package/elfutils/elfutils.mk
 create mode 100644 package/perf/Config.in
 create mode 100644 package/perf/perf.mk

Thanks,
-- 
Thomas Petazzoni
