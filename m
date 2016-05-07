From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  7 May 2016 18:14:33 +0200
Subject: [Buildroot] [PATCH 00/13 v7] legal-info improvements and
	completeness (branch yem/legal-4)
Message-ID: <cover.1462637351.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series brings improvements to the legal-info infrastructure, so
that we provide the most complete and correct content in the output of
legal-info.

TL;DR:

Currently, our legal-info ouput is missing two types of files that might
be important to have included in the legal-info output:
  - patches
  - extra downloads


This series is split in 5 consecutive parts, each depending on the
previous ones:

  - patches 1-2 introduce a helper to hardlink-or-copy, i.e. first try
    to hardlink and fallback to plain copy. This is usefull to save copy
    time when source and destination are on the same filesystem, while
    still working when they are not.

  - patches 3-5 reorganise the legal-info output directory:
    - move sources into their own subdirectory, named after the package
      and its version
    - rename the license directory, by adding the package version after
      its name
    This is in preparation of also saving patches and extra downloads
    along the source archives of packages.

  - patches 6-9 add patches and extra downloads to the legal-info.

  - patch 10 (from Luca) explicitly states, in the legal-info header,
    the licensing of patches.

  - patch 11 simply generates a sha256 hash of all files in the
    legal-info output.

  - patches 12-13 make legal-info work for off-line builds. See the
    commit log of patch 13 for an example of why this is needed.


------------------------------------------------------------------------

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
  - patches download either with FOO_PATCH or FOO_EXTRA_DOWNLOADS
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

  - the compliance distribution would not be compliant.

Hence we have two options at our disposal:

  - when saving the legal-info, rename the patch files so no two patches
    have the same name; this is easily achieved by prefixing them with a
    monotonically-incrementing counter, or

  - detect that no two patches have the same basename and fail at
    apply-patch time if that is the case.

This series implements the second solution. The immediate drawback is
that in rare circumstances, existing setups (e.g. with patches in a
global patch directory) which has duplicatre basenames will cease to
work at the time patches are applied.

The alternative first solution, although tested and implemented (and
previously submitted) has the drawback that most patches will have two
indexes, whiit the the immediate advantage that it accepts input patches
with the same basename (and thus would not break existing setups).

After the previous reviews, it was deemed preferrable to have less ugly
patch filenames and break the build, rather than have uglier patch
filenames and not break the build, given how unlikely the situation with
duplicate basenames is.


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


Changlog of the series
----------------------

Changes v6 -> v7:
  - don't add a make variable that points to the hardlink-or-copy helper
    (Arnout)
  - misc eye-candy improvements in said helper  (Arnout)
  - fix calls to the helper (only the full series was working; an
    intermediate patch was incorrect)  (Arnout)
  - re-order patches so that off-line legal-info comes last  (Arnout)

Changes v5 -> v6:
  - drop the hardlink-or-copy macro, only keep the script  (Thomas,
    Arnout)
  - don;t renumber patches; instead, detect duplicate files basenames
    and abort  (Thomas, Arnout, Luca)
  - rename the raw basename variable  (Thomas)
  - tweak the phrasing about patches licenses  (Arnout)
  - completely ignoring packages from legal-info was deemd too
    controversial; drop it (at least for now! ;-) )
  - fix misc comments and typoes

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



-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
