From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Dec 2014 19:24:40 +0100
Subject: [Buildroot] [PATCH 0/4 v4] pkg-download: check hashes before the
	download (branch yem/download-hash)
Message-ID: <cover.1418322200.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces a way to check hashes prior to doing a download.

This is required for when upstream silently update their release tarballs
without renaming them, and the user is left with a stray locally cached
tarball that no longer match the hashes with have for that package.

In so doing, this series:
  - moves the check for a cached file into the wrapper;
  - moves the post-download check for hashes into the wrapper;
  - adds a pre-download check for hashes in the wrapper.

Doing the pre-download checks in the Makefile, like the post-download
checks were done, made the Makefile a bit harder to read. On the other
hand, we have a download wrapper shell script, so it is easier to do
trickey stuff in there (shell syntax) than in the Makefile (make syntax
can become unreadable pretty fast).

This has a side effect of cleaning up the pkg-download.mk Makefile, too,
but that was not the goal.


Changes v3 -> v4:
  - remove patch about checking hashes for host-packages (already applied
    differently by Peter)
  - rebased on top of current master

Changes v2 -> v3:
  - fix checking hashes for host packages
  - fix left-over line continuations

Changes v1 -> v2:
  - add options parsing to the wrapper  (Thomas)
  - typoes  (Thomas)
  - rename the wrapper to dl-wrapper so it looks better in the traces,
    and it is not confused with another wrapper


Regards,
Yann E. MORIN.


The following changes since commit 5afa3b55e8f7cf27fc4335183fd477871836ca68:

  ipset: bump to version 6.24 (2014-12-11 09:59:16 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/download-hash

for you to fetch changes up to 0301f2d3c762f8815c7c6dc25ed5ea8307275305:

  pkg-download: check hashes for locally cached files (2014-12-11 18:30:15 +0100)

----------------------------------------------------------------
Yann E. MORIN (4):
      suppot/download: add option parsing to the download wrapper
      pkg-download: check for already downloaded file in the download wrapper
      pkg-download: verify the hashes from the download wrapper
      pkg-download: check hashes for locally cached files

 package/pkg-download.mk     |  78 +++++++++---------
 support/download/check-hash |  14 ++--
 support/download/dl-wrapper | 191 ++++++++++++++++++++++++++++++++++++++++++++
 support/download/wrapper    |  99 -----------------------
 4 files changed, 236 insertions(+), 146 deletions(-)
 create mode 100755 support/download/dl-wrapper
 delete mode 100755 support/download/wrapper

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
