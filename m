From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Mar 2014 18:51:41 +0100
Subject: [Buildroot] [PATCH 0/13 v2] some download-related changes
Message-ID: <cover.1393781649.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series contains those download-related changes:

  - Patches 1..3  : some cleanups and preparatory works in the
    download infra,

  - Patches 4..8  : move download helpers to shell scripts, one
    such script for each download helper

  - Patches 9..10 : don't use DL_DIR as scratchpad for temporary VCS
    checkouts, since DL_DIR is a precious location

  - Patches 11..13: check hashes of downloaded files, to ensure the
    files are genuine


Changes v1 -> v2:
  - don't do any behavioural change when switching to shell scripts,
    just reproduce exactly what was in the Makefile  (Luca, Arnout)
  - support more than one hash algorithm  (Arnout, Gustavo)
  - typoes  (Luca, Baruch)


Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (13):
      pkg-infra: DOWNLOAD is never called with two arguments
      Makefile: rename USER_HOOKS_EXTRA_ENV to EXTRA_ENV
      Makefile: add BR2_DL_DIR to EXTRA_ENV
      pkg-infra: move the git download helper to a script
      pkg-infra: move the svn download helper to a script
      pkg-infra: move the cvs download helper to a script
      pkg-infra: move the hg download helper to a script
      pkg-infra: move the wget download helper to a script
      pkg-infra: don't use DL_DIR as scratchpad for temporary VCS checkouts
      pkg-infra: also set PKGDIR for the download step
      pkg-infra: add possiblity to check downloaded files against known hashes
      manual: add documentation about packages' hashes
      package/ca-certificates: add tarball's hashes

 Makefile                                     |  4 +-
 docs/manual/adding-packages-directory.txt    | 57 +++++++++++++++++++
 package/Makefile.in                          |  5 +-
 package/ca-certificates/ca-certificates.hash |  3 +
 package/pkg-download.mk                      | 84 +++++++++++-----------------
 package/pkg-generic.mk                       |  3 +-
 support/download/check-hash                  | 71 +++++++++++++++++++++++
 support/download/cvs                         | 31 ++++++++++
 support/download/git                         | 40 +++++++++++++
 support/download/hg                          | 29 ++++++++++
 support/download/svn                         | 27 +++++++++
 support/download/wget                        | 23 ++++++++
 12 files changed, 322 insertions(+), 55 deletions(-)
 create mode 100644 package/ca-certificates/ca-certificates.hash
 create mode 100755 support/download/check-hash
 create mode 100755 support/download/cvs
 create mode 100755 support/download/git
 create mode 100755 support/download/hg
 create mode 100755 support/download/svn
 create mode 100755 support/download/wget

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
