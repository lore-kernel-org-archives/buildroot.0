From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2015 19:35:18 +0100
Subject: [Buildroot] [PATCH 0/13 v2] legal-info improvements and
	completeness (branch yem/legal-2)
Message-ID: <cover.1450031251.git.yann.morin.1998@free.fr>
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


The first 9 patches in the series take care of saving patches we apply
to packages:

So far, we've shuffled the patches under the rag, assumong the user
would provide the Buildroot source tree with the compliance delivery, so
that our bundled patches would automatically be included.

However, that's not enough, as not all patches may be in the Buildroot
source tree. That's the case for at least two types of patches:
  - patches that are downloaded,
  - patches from a global patch directory.

In either case, those patches must be provided in the output of
legal-info, because they are not part of Buildroot, so distributing
Buidlroot would not be enough.

Patches that are referenced from Buidlroot woudl probably be OK-ish,
even if not to the letter of the compliance requirements.

That's not much so the case for patches from a global patch dir, since
those would be completely ignored and usually unreachable from a
recipient of the complaince delivery.

So we must save those two types of patches in the output of legal-info.
Because it would be a bit silly to only save those patches, we just save
all of them, whether bundled in buildroot, downloaded or from a global
patch dir alike.


Second, a single patch (#10) takes care of saving extra downloads:

Second, some packages are using extra-downloads to complement the
content of the main archive. That's the case for Perl, for which the
cross-compilation "enabler" is downloaded as a secondary archive via
extra downloads. The Blackfin external toolchains also use extra
downloads to download a secondary archive with the sysroot.

Even though the Blackfin sysroot archive is not really a source, we
still need to provide it along with the main archive, otherwise it's
completely impossible to compile code.

As for the Perl case, however, we're "only" downloading a buildsystem
infrastructure (AFAIU), but without it, it is completely impossible to
cross-compile Perl at all.

So, in both cases, we also need to save the extra downloads.


We then have a patch (#11) that generates a sha256 hash of all the fines
in the legal-info output. It's handy when delivering legal-info/
directly as-is so that the recipient can check the integrity of the
files  her received.


Finally, the last two patches add the possibility to indicate that a
package should be completely ignored from the legal-info output, not
even be mentionned in the manifest. This is useful when the content of
legal-info is used as-is to provide a compliance delivery.


Changes v1 -> v2:
  - keep only the core legal-info patches, drop the gcc/binutils/gdb
    changes (they'll be reworked later, let's focus on the important and
    easier parts first)
  - drop the tristate REDISTRIBUTE, introduce another boolean
    _LEGAL_IGNORE  (Thomas, Peter, Luca)
  - drop the post-legal-info Perl hook, it's no longer needed thanks to
    saving extra downloads  (Thomas, Luca)
  - compute the rwaname-version tuple only once, instead of five times
    (Luca)
  - reorder patches  (Luca)
  - slight commit log rephrasing and corrections  (Luca)


Regards,
Yann E. MORIN.


The following changes since commit 27d6deb449fdb3b7662059a83212787ae568c76e:

  python-pyudev: new package (2015-12-13 16:03:26 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/legal-2

for you to fetch changes up to 25dd1d1f85baf34f5b4d8cfda7a4c3bd17687ccc:

  core/pkg-virtual: ignore from legal-info output (2015-12-13 19:26:53 +0100)

----------------------------------------------------------------
Yann E. MORIN (13):
      core/legal-info: update the legal-info report header
      core/pkg-utils: add macro to hardlink-or-copy
      core/legal-info: use the macro to install source archives
      core/legal-info: ensure legal-info works in off-line mode
      core/pkg-generic: add variable to store the package rawname-version
      core/legal-info: install source archives in their own sub-dir
      core/legal-info: add package version to license directory
      core/apply-patches: store full path of applied patches
      core/legal-info: also save patches
      core/legal-info: also save extra downloads
      core/legal-info: generate a hash of all saved files
      core/legal-info: allow ignoring packages from the legal-info
      core/pkg-virtual: ignore from legal-info output

 Makefile                                |  8 +++-
 docs/manual/adding-packages-generic.txt |  9 ++++
 docs/manual/adding-packages-virtual.txt |  3 ++
 package/pkg-generic.mk                  | 74 +++++++++++++++++++++++----------
 package/pkg-utils.mk                    | 18 ++++++++
 package/pkg-virtual.mk                  |  2 +
 support/legal-info/README.header        |  9 ++--
 support/scripts/apply-patches.sh        | 11 +++--
 8 files changed, 104 insertions(+), 30 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
