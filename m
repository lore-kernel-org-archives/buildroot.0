From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 18:49:25 +0100
Subject: [Buildroot] [PATCH 00/16 v5] legal-info improvements and
	completeness (branch yem/legal-3)
Message-ID: <cover.1457718289.git.yann.morin.1998@free.fr>
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

  - patches 1 adds hashes to all actual sources for pre-built toolchains

  - patches 2-5 make sure legal-info will work in off-line mode;

  - pathces 6-8 reorganise the legal-info directory structure to
    accomodate for the fact that more than one source archive/file may
    be saved for each package;

  - patches 9-12 actually save the patches and extra downloads in the
    legal-info output;

  - patch 13 adds a list of hashes for all files in the legal-info
    output;

  - patches 14-15 add the possibility to ignore packages from the
    legal-info output; this is then used to ignore virtual packages;

  - patch 16 (from Luca) explicits patches licensing.


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


Note about saving patches
-------------------------

Buildroot can apply patches from at least three different locations:
  - patches bundled in Buildroot itself,
  - patches download either with FOO_PATCH of FOO_EXTRA_DOWNLOAD
  - patches from one or more BR2_GLOBAL_PATCH_DIR

Since those patches are stored in three different locations, it is
perfectly legit that two patches in two different locations have the
same basename.

However, when saving the patches, the second to be saved would overwrite
the previous one, and would thus cause troubles down the road:

  - the second patch would be applied earlier due to it being referenced
    by the series file, and thus may not apply; even if it applies
    cleanly, it would still be listed a second time in the series, and
    thus would fail to apply that second time,

  - the compliance distribution would not longer be compliant

Hence we have two options at our disposal:

  - rename the patch files so no two patches have the same name; this is
    easily achieved by prefixing them with a monotonically-incremented
    counter, or

  - detect that not two patches have the same basename and fail at
    apply-patch time if that is the case.

This series implements the first solution. The immediate drawback is
that most patches will have two indexes, while the immediate advantage
is that it accepts input patches with the same basename.

The alternative second solution, although tested and implemented (but
not submitted) has an immediate drawback of breaking existing working
setups with patches with the same basename, while there is no real
advantage, except not double-numbering the patches for legal-info.


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



Changes v4 -> v5:
  - fix the macro by making it  ashell script  (Luca)
  - typoes

Changes v3 -> v4:
  - add hashes for sources to more CodeSourcery pre-built toolchains
    (Arnout)
  - fix hardlink-or-copy when the destination may already exist
    (Arnout, Luca)
  - handle downloading actual sources with a stamp file  (Luca)
  - rephrase manual about ignoring packages  (Luca)
  - typoes  (Luca)
  - add first patch, to fix fetching sources for Linaro pre-built
    toolchains

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


The following changes since commit 0b7b84310c3781c346eea4c114c8cb4e97bbd8ea:

  olimex_imx233_olinuxino_defconfig: genimage support (2016-03-11 13:14:54 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/legal-3

for you to fetch changes up to d6c5a79915775eaa9d1a6d1711a4955cafe221cd:

  legal-info: explicitly state how patches are licensed (2016-03-11 18:11:54 +0100)

----------------------------------------------------------------
Luca Ceresoli (1):
      legal-info: explicitly state how patches are licensed

Yann E. MORIN (15):
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
 docs/manual/adding-packages-virtual.txt            |  5 ++
 package/pkg-generic.mk                             | 94 +++++++++++++++++-----
 package/pkg-utils.mk                               | 22 +++++
 package/pkg-virtual.mk                             |  2 +
 support/legal-info/README.header                   |  9 ++-
 support/scripts/apply-patches.sh                   | 11 ++-
 support/scripts/hardlink-copy                      | 34 ++++++++
 .../toolchain-external/toolchain-external.hash     | 13 +++
 10 files changed, 177 insertions(+), 30 deletions(-)
 create mode 100755 support/scripts/hardlink-copy

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
