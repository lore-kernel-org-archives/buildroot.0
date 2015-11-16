From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Nov 2015 23:47:12 +0100
Subject: [Buildroot] [PATCH 0/21 RFC] core/legal-info: fixes,
	completness and enhancements (branch yem/legal-patch)
Message-ID: <cover.1447713615.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces core changs in how we handle the legal-info for
various packages.

The underlying reason for this series is that our legal-info content is
far from being complete. Most notably, the patches applied to packages
are not part of the legal-info output.

We do highly suggest users do redistribute Buildroot as part of their
compliance delivery, so the patches we bundle would be part of that
compliance deilvery.

However, patches that are downloaded or (most importantly) patches that
come from a global patch directory would be missing from that compliance
delivery.

The series starts with minor fixes to libecore and the legal-info infra,
and with adding licensing information to the Linux headers.

Then we add a new keyword to the _REDISTRIBUTE variable, so a package
can be completely ignored from the legal-info ouput (no source saved,
not license file saved, not listed in the manifest). Virtual packages
are forcibly set to be ignored that way.

Along the process of adding patches to the legal-info output, there was
an opportunity to cleanup and enhance the gcc package wrt. legal-info.
It was discovered that our legal-info for gcc was (besides the patches)
incomplete, as the Xtensa overlay was not saved. So, we took the burden
of cleaning, fixing and enhancing the gcc package:

  - have the same source tree for initial and final steps,
  - only extract sources once,
  - make the gcc package pure host packages,
  - add licensing information,
  - save the Xtensa overlay to the legal-info output.

Still side-tracked with all those changes, we fix the perl package to
also save the perl-cross sources in the legal-info putput.

Then, back to the legal-info infra, further changes allow saving the
patches alongside the source archives:

  - archives are saved in a subdirectory named package-version rarther
    than all in the same directory,
  - the directory where the kicense files are stores are also named
    similarly, for consistency, rather than with ust the name of the
    package,
  - patches ar eeventually saved alongside the corrsponding archive,
  - eventually, legal-info is made to work in full-offline mode.


Notes:

  - we considered saving the full content of _ALL_DOWNLOADS or just the
    content of _EXTRA_DOWNLOADS, but that does not play well with
    pre-configued toolchains, which use _EXTRA_DOWNLOAD to doenload
    additional tarballs with more binary stuff in there (sysroots), so
    it does not make sense to include those in the legal-info output.
    Since_ALL_DOWNLOADS also contains _EXTRA_DOWNLOADS, we can't use it
    either. Those are to be handled manually in post-legal-info hooks;

  - there might be other packages for which we are not saving 'extra'
    stuff, but they can be fixed (with post-legal-info hooks) in
    followup patches.

Regards,
Yann E. MORIN.


The following changes since commit 5f2cd8f5ecd7d035f00664c604fd8bfd5f1afcb8:

  lua-periphery: fix build on Sparc/Sparc64 (2015-11-16 23:19:27 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/legal-patch

for you to fetch changes up to 0aa743543356cbe19450b672b435f016260ee7d6:

  core/pkg-infra: ensure legal-info works in off-line mode (2015-11-16 23:39:03 +0100)

----------------------------------------------------------------
Yann E. MORIN (21):
      package/libecore: do not build anything at patch time
      core/legal-info: fix missing double-$
      package/linux-headers: add licensing information
      core/legal-info: allow ignoring packages from the legal-info
      core/pkg-virtual: ignore from legal-info output
      package/gcc: add licensing information
      package/gcc: handle licensing information
      package/gcc: add a patch for arc rather than using sed
      package/gcc: properly extract and patch sources
      package/gcc: make host-gcc a pure host package
      package/gcc: make -initial and -final use sources from host-gcc
      package/gcc: include the extensa overlay in the legal-info output
      package/perl: include perl-cross in the legal-info output
      core: add a global variable with already-unquoted global patch dir
      core/pkg-generic: add macro to hardlink-or-copy
      core/legal-info: use the macro to install source archives
      core/legal-info: install source archives in their own sub-dir
      core/legal-info: add package version to license directory
      core/apply-patches: store full path of applied patches
      core/legal-info: also save patches
      core/pkg-infra: ensure legal-info works in off-line mode

 Makefile                                           |   2 +
 docs/manual/adding-packages-generic.txt            |   7 +-
 package/efl/libecore/libecore.mk                   |   2 +-
 .../900-no-libgmon.a-when-inhibit_libc.patch       |  43 +++++++
 package/gcc/gcc-final/gcc-final.mk                 |  40 +++---
 package/gcc/gcc-initial/gcc-initial.mk             |  43 ++-----
 package/gcc/gcc.mk                                 | 137 +++++++++++----------
 package/linux-headers/linux-headers.mk             |   2 +
 package/perl/perl.mk                               |   7 ++
 package/pkg-generic.mk                             |  74 ++++++++---
 package/pkg-virtual.mk                             |   2 +
 support/scripts/apply-patches.sh                   |   7 +-
 12 files changed, 228 insertions(+), 138 deletions(-)
 create mode 100644 package/gcc/arc-2015.06/900-no-libgmon.a-when-inhibit_libc.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
