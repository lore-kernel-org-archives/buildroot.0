From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  3 Jul 2014 21:36:19 +0200
Subject: [Buildroot] [PATCH 0/4 v11] Some download-related changes (branch
	yem/check-downloads)
Message-ID: <cover.1404416102.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series contains those download-related changes:

  - Patch   1   : don't use DL_DIR as scratchpad for temporary VCS
    checkouts, since DL_DIR is a precious location

  - Patches 2..3: check hashes of downloaded files, to ensure the
    files are genuine (with doc)

  - Patch   4   : add hashes for ca-certificates

Hashes for more packages (eg. openssh, openssh, dropbear...) can be
added at a later step.


Changes v10 -> v11:
  - rebase after slight changes in master  (Peter)

Changes v9 -> v10:
  - use /bin/bash instead of /bin/sh, since we use bashisms  (Peter)
  - drop patches already applied  (Peter)

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


The following changes since commit f56f4da887971f299ebea4f1e806a9b2eaf3ce38:

  zyre: remove spurious dependency on filemq (2014-07-03 16:30:36 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/check-downloads

for you to fetch changes up to 00582a8025a651a3aefbf46849f1dd36fd1cb940:

  package/ca-certificates: add tarball's hashes (2014-07-03 19:27:57 +0200)

----------------------------------------------------------------
Yann E. MORIN (4):
      pkg-infra: don't use DL_DIR as scratchpad for temporary downloads
      pkg-infra: add possiblity to check downloaded files against known hashes
      manual: add documentation about packages' hashes
      package/ca-certificates: add tarball's hashes

 docs/manual/adding-packages-directory.txt    | 66 ++++++++++++++++++++++++
 package/ca-certificates/ca-certificates.hash |  3 ++
 package/pkg-download.mk                      | 20 ++++++--
 support/download/bzr                         | 25 +++++++--
 support/download/check-hash                  | 77 ++++++++++++++++++++++++++++
 support/download/cp                          | 12 ++++-
 support/download/cvs                         | 34 +++++++++---
 support/download/git                         | 33 +++++++++---
 support/download/hg                          | 35 ++++++++++---
 support/download/scp                         | 14 ++++-
 support/download/svn                         | 33 +++++++++---
 support/download/wget                        | 26 +++++++---
 12 files changed, 336 insertions(+), 42 deletions(-)
 create mode 100644 package/ca-certificates/ca-certificates.hash
 create mode 100755 support/download/check-hash

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
