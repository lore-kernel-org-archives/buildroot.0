From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:48:16 +0100
Subject: [Buildroot] [PATCH 0/51] legal-info: unassorted improvements and
	fixes (branch yem/legal)
Message-ID: <cover.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series essentiually improves our legal-info output, particularly in
regard to what we save, and how we organise it, in $(O)/legal-info/ .

The series is not completely 'logically' organised, but rather tells a
story, that of how I got side-tracked from just wanting to save the
patches alongside the sources, up to when I eventually cleaned up the
handling of the Xtensa overlay, after reogarnising the gcc packages and
defining their licensing terms. It was prompted by a discussion we had
with Luca during the last DevDays in Dublin, when we talked about the
need to save the patches as well as the source archives.


The first three patches (already submitted for master, but not yet
applied), are an indentation cleanup of the ./configure commands for the
autotools infra, as well as an alignment of the custom one in gcc, to
match those in the infra, and also explain why we do need the custom
commands for gcc.

Patches 4-5 introduce a macro to copy by hardlink if possible, and
fallback to a simple copy otherwise, macro then used in the legal-info
infra in place of the hand-crafted construct therein.

Patch 6 also uses that macro to install the perl-cross legal-info.

Patch 7 introduces an already-qstripped global BR_GLOBAL_PATCH_DIR and
uses that instead of repeating the qstrip multiple times.

Patch 8-9 add the ability to ignore patckages from the legal-info
output, and set virtual packages to be so ignored.

Patches 10-17 actually implement saving the patches alongside the
sources. Even though we suggest users to provide their Buildroot tree to
be compliant, this is by far incpomplete, because not all patches may be
there (patches can be downloaded or can be in a global patch dir):
  - the source archives are stored in a sub-directory name PKG-VERSION,
  - the directories with licenses are similarly named,
  - the full-path to patches are stored in the list of applied patches,
  - patches are copied alongside the corresponding source archive,
  - legal-info is made to work in off-line mode,
  - the legal-info header is updated, a hash of saved files is
    generated,
  - as a bonus, the Arago actual-source archive gains a hash.

Patches 18-27 re-organise the gcc packages. The ultimate goal is to be
able to save the legal-info for both the host and target variants. For
that, we want to introduce a target gcc variant (which would not install
a native compiler) to define the licensing terms. That has not been done
in this series, for two reasons: first, the series is already very long;
second, that target package needs some mor ere-organising in the gcc
infra. Otherwise:
  - the gcc common definitions ar emoved to gcc-common,
  - gcc-initial remains as-is,
  - gcc-final is renamed to just 'gcc',
  - licensing information is added to gcc (the final one),
  - the custom patch command is dropped, to use the generic patch infra,
    so symlinks to patch directories are added to gcc-initial and
    gcc (-final).

Starting from there, the series diverges from its original intent, but
is a logical/historical followup because I noticed the Xtensa overlay
handling was really a mess.

Patch 28 enables architectures to define variables and helpers, that
[ackage can re-use if need be. This will be used by the Xtensa
architecture to provide helpers around the management of the Xtensa
overlay.

Patches 29-32 introduce Xtensa variables, with the name of the core and
the path to the overlay. The three users, binutils, gcc and gdb, are
updated to use those variable instead of all duplicating (and badly at
that) the same assignments.

Patches 33-36 introduce a macro to handle the extraction of the Xtensa
overlay, and the three users are updated to make use of it (instead,
again, of badly duplicating the same logic).

Patches 37-40 similarly introduce a macro to manage savinf the Xtensa
overlay for legal-info. Ditto the three users...

Patches 41-42 change binutils and gdb to extract the overlay as a
post-extract hook, rather than as a pre-patch hook, so they are aligned
with what is done in gcc. It seems more logical to have it a
post-extract hook, so gcc was not changed, and its behaviour has been
replicated in binutils and gdb, rather than the other way around.

Patches 43-46 introduce a package-like smal infra for the Xtensa
architecture, that automatically define the post-extract and
post-legal-info hooks, rather than all users having to replicate the
same logic again-and-again. The three users are converted to using that
little infra.

Patches 47-51 cleanup the way we manage the Xtensa overlay. The name of
the core was only used to construct the name of the tarball; the path to
that tarball was just concatenating the directory, a constant string,
the core name, and the .tar extension. This was not very flexible, and
was limiting the naming scheme for the overlay, when directly having the
path to the overlay is jsut as good and more flexible. With that done,
we can now use a compressed overlay, or fetch it from the net.


And that concludes this long series. Thanks for reading! :-) If you
haven't had enough reading so far, please give each commit message a
look, some of them are worth reading in their entirety as they bring mor
edetails that would have been redundant here (and would have made that
cover-letter een longer, if not too long.

All of that just because I wanted to save the patches alongside the
corresponding sources. :-)

Needless to say this is not for master (in case Arnout still wondered
about that!). But I doubt it will get enough reviews in time to even
make it to -next. Please make me lie! ;-]

Regards,
Yann E. MORIN.


The following changes since commit 917b6e72ea01c689a2376b24c87d7f6f1570a06f:

  fastd: add upstream patch to fix build with musl (2015-11-22 22:30:51 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/legal

for you to fetch changes up to fa19376b4ba69e333bf67f419ba1c3bbfd1f6345:

  configs/qemu-xtensa: use overlay from the github repository (2015-11-23 14:55:39 +0100)

----------------------------------------------------------------
Yann E. MORIN (51):
      core/pkg-autotools: align host configure commands to target one
      package/gcc: comment on why we override the generic configure commands
      package/gcc: align gcc-final configure-cmds to the generic ones
      core/pkg-generic: add macro to hardlink-or-copy
      core/legal-info: use the macro to install source archives
      package/perl: include perl-cross in the legal-info output
      core: add a global variable with already-unquoted global patch dir
      core/legal-info: allow ignoring packages from the legal-info
      core/pkg-virtual: ignore from legal-info output
      core/legal-info: install source archives in their own sub-dir
      core/legal-info: add package version to license directory
      core/apply-patches: store full path of applied patches
      core/legal-info: also save patches
      core/legal-info: update the legal-info report header
      core/legal-info: ensure legal-info works in off-line mode
      toolchain/external: add hash for Arago actual sources
      core/legal-info: generate a hash of all saved files
      package/gcc: add a patch for arc rather than using sed
      package/gcc: simplify setting GCC_SOURCE
      pacakge/gcc: rename all variables as it is a host-only package
      package/gcc: prefix all common variables with HOST_GCC_COMMON_
      package/gcc: rename the common files
      package/gcc: rename gcc-final into plain gcc
      package/gcc-initial: ignore from legal-info output
      package/gcc: add licensing info for host variant
      package/gcc: create the ./configure symlink as a post-patch hook
      pacakge/gcc: drop custom patch command
      core: include arch-specific definitions
      arch/xtensa: add definitions for the Xtensa overlay
      package/binutils: use the Xtensa variables
      package/gdb: use the Xtensa variables
      package/gcc: use the Xtensa variables
      arch/xtensa: add macro to extract the overlay
      package/binutils: use macro to extract Xtensa overlay
      package/gdb: use macro to extract Xtensa overlay
      package/gcc: use macro to extract Xtensa overlay
      arch/xtensa: add macro to install legal-info
      pacage/gcc: use macro to install Xtensa overlay legal-info
      package/binutils: use macro to install Xtensa overlay legal-info
      package/gdb: use macro to install Xtensa overlay legal-info
      package/binutils: extract Xtensa overlay as post-extract hook
      package/gdb: extract Xtensa overlay as post-extract hook
      arch/xtensa: add macros to generate hooks
      package/binutils: use the Xtensa macro generators
      package/gdb: use the Xtensa macro generators
      package/gcc: use the Xtensa macro generators
      arc/xtensa: get rid of an intermediate blind kconfig option
      arch/xtensa: allow specifying path to tarball file
      arch/xtensa: accept the overlay to be compressed
      arch/xtensa: accept the overlay to be an URL
      configs/qemu-xtensa: use overlay from the github repository

 Config.in.legacy                                   |  26 +++
 Makefile                                           |  13 +-
 arch/Config.in.xtensa                              |  27 +--
 arch/arch.mk.xtensa                                |  87 ++++++++
 board/qemu/xtensa-lx60/xtensa_dc232b.tar           | Bin 747520 -> 0 bytes
 configs/qemu_xtensa_lx60_defconfig                 |   4 +-
 docs/manual/adding-packages-generic.txt            |   7 +-
 docs/manual/adding-packages-virtual.txt            |   3 +
 package/binutils/binutils.mk                       |  13 +-
 package/gcc/4.9.3/860-cilk-wchar.patch             |   6 +-
 package/gcc/Config.in.host                         |   3 +
 .../900-no-libgmon.a-when-inhibit_libc.patch       |  43 ++++
 package/gcc/{gcc.hash => gcc-common.hash}          |   0
 package/gcc/{gcc.mk => gcc-common.mk}              |  91 ++++-----
 package/gcc/gcc-final/gcc-final.hash               |   1 -
 package/gcc/gcc-final/gcc-final.mk                 | 193 ------------------
 package/gcc/gcc-initial/4.5.4                      |   1 +
 package/gcc/gcc-initial/4.7.4                      |   1 +
 package/gcc/gcc-initial/4.8.5                      |   1 +
 package/gcc/gcc-initial/4.9.3                      |   1 +
 package/gcc/gcc-initial/5.2.0                      |   1 +
 package/gcc/gcc-initial/arc-2015.06                |   1 +
 package/gcc/gcc-initial/gcc-initial.hash           |   2 +-
 package/gcc/gcc-initial/gcc-initial.mk             |  36 ++--
 package/gcc/gcc/4.5.4                              |   1 +
 package/gcc/gcc/4.7.4                              |   1 +
 package/gcc/gcc/4.8.5                              |   1 +
 package/gcc/gcc/4.9.3                              |   1 +
 package/gcc/gcc/5.2.0                              |   1 +
 package/gcc/gcc/arc-2015.06                        |   1 +
 package/gcc/gcc/gcc.hash                           |   1 +
 package/gcc/gcc/gcc.mk                             | 226 +++++++++++++++++++++
 package/gdb/gdb.mk                                 |  14 +-
 package/perl/perl.mk                               |   7 +
 package/pkg-autotools.mk                           |  12 +-
 package/pkg-generic.mk                             |  69 +++++--
 package/pkg-utils.mk                               |  18 ++
 package/pkg-virtual.mk                             |   2 +
 support/legal-info/README.header                   |   7 +-
 support/scripts/apply-patches.sh                   |   7 +-
 .../toolchain-buildroot/toolchain-buildroot.mk     |   4 +-
 .../toolchain-external/toolchain-external.hash     |   1 +
 42 files changed, 587 insertions(+), 348 deletions(-)
 create mode 100644 arch/arch.mk.xtensa
 delete mode 100644 board/qemu/xtensa-lx60/xtensa_dc232b.tar
 create mode 100644 package/gcc/arc-2015.06/900-no-libgmon.a-when-inhibit_libc.patch
 rename package/gcc/{gcc.hash => gcc-common.hash} (100%)
 rename package/gcc/{gcc.mk => gcc-common.mk} (73%)
 delete mode 120000 package/gcc/gcc-final/gcc-final.hash
 delete mode 100644 package/gcc/gcc-final/gcc-final.mk
 create mode 120000 package/gcc/gcc-initial/4.5.4
 create mode 120000 package/gcc/gcc-initial/4.7.4
 create mode 120000 package/gcc/gcc-initial/4.8.5
 create mode 120000 package/gcc/gcc-initial/4.9.3
 create mode 120000 package/gcc/gcc-initial/5.2.0
 create mode 120000 package/gcc/gcc-initial/arc-2015.06
 create mode 120000 package/gcc/gcc/4.5.4
 create mode 120000 package/gcc/gcc/4.7.4
 create mode 120000 package/gcc/gcc/4.8.5
 create mode 120000 package/gcc/gcc/4.9.3
 create mode 120000 package/gcc/gcc/5.2.0
 create mode 120000 package/gcc/gcc/arc-2015.06
 create mode 120000 package/gcc/gcc/gcc.hash
 create mode 100644 package/gcc/gcc/gcc.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
