From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  5 Mar 2014 22:47:12 +0100
Subject: [Buildroot] [PATCH 0/12 v3] some download-related changes
Message-ID: <cover.1394055621.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series contains those download-related changes:

  - Patches 1..2  : some cleanups and preparatory works in the
    download infra,

  - Patches 3..7  : move download helpers to shell scripts, one
    such script for each download helper

  - Patches 8..9  : don't use DL_DIR as scratchpad for temporary VCS
    checkouts, since DL_DIR is a precious location

  - Patches 10..12: check hashes of downloaded files, to ensure the
    files are genuine

Samuel, I removed your reviewed-by tag on the patches that have changed
quite a bit since last round: patches 8, 10 & 11.


Changes v2 -> v3:
  - avoid partial downloads  (Thomas DS)
  - store hash-type in .hash file  (Gustavo)
  - typoes  (Samuel, Gustavo)
  - add possibility to treat missing hashes as an error

Changes v1 -> v2:
  - don't do any behavioural change when switching to shell scripts,
    just reproduce exactly what was in the Makefile  (Luca, Arnout)
  - support more than one hash algorithm  (Arnout, Gustavo)
  - typoes  (Luca, Baruch)


Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (12):
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
 docs/manual/adding-packages-directory.txt    | 65 +++++++++++++++++++++++
 package/Makefile.in                          |  5 +-
 package/ca-certificates/ca-certificates.hash |  3 ++
 package/fis/fis.mk                           |  2 +-
 package/pkg-download.mk                      | 79 +++++++++++-----------------
 package/pkg-generic.mk                       |  3 +-
 support/download/check-hash                  | 77 +++++++++++++++++++++++++++
 support/download/cvs                         | 33 ++++++++++++
 support/download/git                         | 41 +++++++++++++++
 support/download/hg                          | 31 +++++++++++
 support/download/svn                         | 30 +++++++++++
 support/download/wget                        | 24 +++++++++
 13 files changed, 344 insertions(+), 53 deletions(-)
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
