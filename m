From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Jan 2016 19:15:08 +0100
Subject: [Buildroot] [PATCH 0/16 v3] legal-info improvements and
	completeness (branch yem/legal-2)
Message-ID: <cover.1454004518.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series brings improvements to the legal-info infrastructure, so
that we provide the most complete and correct content in the output of
legal-info.

Currently, our legal-info ouput is missing two types of files that might
be important to have:
  - patches
  - extra downloads


This series is split in 6 consecutive parts, each depending on the
previous ones:

    - patches 1-2 fix the legal-info header to account for the fact that
      the sources for some external toolchains may get installed in the
      legal-info output; hashes for those are added to the .hash file;

    - patches 3-6 make sure legal-info will work in off-line mode;

    - pathces 7-9 reorganise the legal-info directory structure to
      accomodate for the fact that more than one source archive/file may
      be saved for each package;

    - patches 10-13 actually save the patches and extra downloads in the
      legal-info output;

    - patch 14 adds a list of hashes for all files in the legal-info
      output;

    - patches 15-16 add the possibility to ignore packages from the
      legal-info output; this is then used to ignore virtual packages.


Why save patches?
-----------------

So far, we've shuffled the patches under the rag, assuming the user
would provide the Buildroot source tree with the compliance delivery, so
that our bundled patches would automatically be included.

However, that's not enough, as not all patches may be in the Buildroot
source tree. That's the case for at least two types of patches:
  - patches that are downloaded,
  - patches from a global patch directory.

In either case, those patches must be provided in the output of
legal-info, because they are not part of Buildroot, so distributing
Buidlroot would not be enough.

Patches that are referenced from Buidlroot (like patches retrieved at
download time from a http://-or-such scheme to a publicly-reachable
location) would probably be OK-ish, even if not to the letter of the
compliance requirements.

That's not so much the case for patches from a global patch dir, since
those would be completely ignored and usually unreachable from a
recipient of the compliance delivery.

So we must save those two types of patches in the output of legal-info.
Because it would be a bit silly to only save the non-bundled patches, we
just save all of them, whether bundled in Buildroot, downloaded or from
a global patch dir alike.


Why save extra downloads?
-------------------------

Some packages are using extra-downloads to complement the content of the
main archive. That's the case for Perl, for which the cross-compilation
"enabler" is downloaded as a secondary archive via extra downloads. The
Blackfin external toolchains also use extra downloads to download a
secondary archive with the sysroot.

Even though the Blackfin sysroot archive is not really a source, we
still need to provide it along with the main archive, otherwise it's
completely impossible to compile with just the "main" toolchain.

As for the Perl case, however, we're "only" downloading a buildsystem
infrastructure (AFAIU), but without it, it is completely impossible to
cross-compile Perl at all.

So, in both cases, we also need to save the extra downloads.


Changes v2 -> v3:
  - re-order variables in their own patch  (Arnout)
  - update legal-info header about the patches  (Luca)
  - add hashes for external toolchains sources  (Luca, Arnout)
  - misc and typoes  (Arnout, Luca)
  - enhance the hardlink-or-copy macro

Changes v1 -> v2:
  - keep only the core legal-info patches, drop the gcc/binutils/gdb
    changes (they'll be reworked later, let's focus on the important and
    easier parts first)
  - drop the tristate REDISTRIBUTE, introduce another boolean
    _LEGAL_IGNORE  (Thomas, Peter, Luca)
  - drop the post-legal-info Perl hook, it's no longer needed thanks to
    saving extra downloads  (Thomas, Luca)
  - compute the rawname-version tuple only once, instead of five times
    (Luca)
  - reorder patches  (Luca)
  - slight commit log rephrasing and corrections  (Luca)


Regards,
Yann E. MORIN.


The following changes since commit 5929b1bdbaafa274d2183a28bea07bf53003065c:

  linux-headers: bump 3.12.x series (2016-01-28 17:47:44 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/legal-2

for you to fetch changes up to bee63e49a6e51196ca55bab2698c8e69d38e2512:

  core/pkg-virtual: ignore from legal-info output (2016-01-28 18:53:52 +0100)

----------------------------------------------------------------
Yann E. MORIN (16):
      core/legal-info: update the legal-info report header
      toolchain/external: add hashes for actual sources
      core/pkg-utils: add macro to hardlink-or-copy
      core/legal-info: use the macro to install source archives
      core/pkg-generic: reorder variables definitions for legal-info
      core/legal-info: ensure legal-info works in off-line mode
      core/pkg-generic: add variable to store the package rawname-version
      core/legal-info: install source archives in their own sub-dir
      core/legal-info: add package version to license directory
      core/apply-patches: store full path of applied patches
      core/legal-info: also save patches
      core/legal-info: renumber saved patches
      core/legal-info: also save extra downloads
      core/legal-info: generate a hash of all saved files
      core/legal-info: allow ignoring packages from the legal-info
      core/pkg-virtual: ignore from legal-info output

 Makefile                                           |  8 +-
 docs/manual/adding-packages-generic.txt            |  9 +++
 docs/manual/adding-packages-virtual.txt            |  3 +
 package/pkg-generic.mk                             | 89 +++++++++++++++++-----
 package/pkg-utils.mk                               | 25 ++++++
 package/pkg-virtual.mk                             |  2 +
 support/legal-info/README.header                   | 13 ++--
 support/scripts/apply-patches.sh                   | 11 ++-
 .../toolchain-external/toolchain-external.hash     |  5 ++
 9 files changed, 134 insertions(+), 31 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
