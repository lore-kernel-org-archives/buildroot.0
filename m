From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  1 Jul 2014 00:26:28 +0200
Subject: [Buildroot] [PATCH 0/14 v9] Some download-related changes (branch
	yem/check-downloads)
Message-ID: <cover.1404167061.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series contains those download-related changes:

  - Patches 1..2  : preparatory patches for upcoming helper scripts and
    hash checks

  - Patches 3..10 : move download helpers to shell scripts, one
    such script for each download helper

  - Patch   11    : don't use DL_DIR as scratchpad for temporary VCS
    checkouts, since DL_DIR is a precious location

  - Patches 12..13: check hashes of downloaded files, to ensure the
    files are genuine (with doc)

  - Patch   14    : add hashes for ca-certificates

Hashes for more packages (eg. openssh, openssh, dropbear...) can be
added at a later step.


Changes v8 -> v9:
  - include change by Ryan about svn peg-revision
  - rebase on top of master after the crazy $$ springling ;-)

Changes v7 -> v8:
  - convert scp and localfiles  (Thomas DS, Peter)
  - typoes, expand MITM  (Thomas DS)
  - use a cleaner and saner code path to detect errors in helpers

Changes v6 -> v7:
  - use single-line title in manual  (Samuel)
  - use leftover cruft in bzr helper  (Thomas)

Changes v5 -> v6:
  - ensure we can run multiple parallel downloads from different build
    dirs with the same BR2_DL_DIR  (Thomas)
  - also convert bzr
  - fix for stray failed downloads

Changes v4 -> v5:
  - update ca-certificates hashes after version bump
  - fix detection of comments and empty lines in .hash file
  - rebase on top of master

Changes v3 -> v4:
  - enhance the manual, typoes  (Gustavo, Samuel, Thomas DS)
  - remove spurious test bump on package/fis  (Samuel)

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


The following changes since commit 56141c1232e39acbec619a432a9aff510cea2eaf:

  rpcbind : add startup script (2014-06-30 23:35:01 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git 

for you to fetch changes up to 1012e1870e03d242413f54e8f021e46a6b59393f:

  package/ca-certificates: add tarball's hashes (2014-06-30 23:56:58 +0200)

----------------------------------------------------------------
Yann E. MORIN (14):
      Makefile: add BR2_DL_DIR to EXTRA_ENV
      pkg-infra: also set PKGDIR for the download step
      pkg-infra: move the git download helper to a script
      pkg-infra: move the svn download helper to a script
      pkg-infra: move the cvs download helper to a script
      pkg-infra: move the hg download helper to a script
      pkg-infra: move the wget download helper to a script
      pkg-infra: move the bzr download helper to a script
      pkg-infra: move the scp download helper to a script
      pkg-infra: move the cp (aka localfiles) download helper to a script
      pkg-infra: don't use DL_DIR as scratchpad for temporary downloads
      pkg-infra: add possiblity to check downloaded files against known hashes
      manual: add documentation about packages' hashes
      package/ca-certificates: add tarball's hashes

 docs/manual/adding-packages-directory.txt    | 66 +++++++++++++++++++++
 package/Makefile.in                          |  1 +
 package/ca-certificates/ca-certificates.hash |  3 +
 package/pkg-download.mk                      | 89 ++++++++++++----------------
 package/pkg-generic.mk                       |  1 +
 support/download/bzr                         | 38 ++++++++++++
 support/download/check-hash                  | 77 ++++++++++++++++++++++++
 support/download/cp                          | 26 ++++++++
 support/download/cvs                         | 47 +++++++++++++++
 support/download/git                         | 56 +++++++++++++++++
 support/download/hg                          | 46 ++++++++++++++
 support/download/scp                         | 28 +++++++++
 support/download/svn                         | 44 ++++++++++++++
 support/download/wget                        | 35 +++++++++++
 14 files changed, 506 insertions(+), 51 deletions(-)
 create mode 100644 package/ca-certificates/ca-certificates.hash
 create mode 100755 support/download/bzr
 create mode 100755 support/download/check-hash
 create mode 100755 support/download/cp
 create mode 100755 support/download/cvs
 create mode 100755 support/download/git
 create mode 100755 support/download/hg
 create mode 100755 support/download/scp
 create mode 100755 support/download/svn
 create mode 100755 support/download/wget

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
