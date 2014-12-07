From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Dec 2014 12:02:34 +0100
Subject: [Buildroot] [PATCH 0/5 v2] pkg-download: check hashes before the
	download (branch yem/download-hash)
Message-ID: <cover.1417949583.git.yann.morin.1998@free.fr>
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


Changes v1 -> v2:
  - add options parsing to the wrapper  (Thomas)
  - typoes  (Thomas)
  - rename the wrapper to dl-wrapper so it looks better in the traces,
    and it is not confused with another wrapper


Regards,
Yann E. MORIN.


The following changes since commit c5f0e93d2cc6107cce249e1f11158aeccb4a3449:

  rp-pppoe: install default conf file (2014-12-03 23:26:21 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/download-hash

for you to fetch changes up to 661d8a00260bcabd71bf7dad6ae4f1a7d3b919e9:

  pkg-download: check hashes for locally cached files (2014-12-07 11:48:06 +0100)

----------------------------------------------------------------
Yann E. MORIN (5):
      pkg-download: fix arguments to hash checking script
      suppot/download: add option parsing to the download wrapper
      pkg-download: check for already downloaded file in the download wrapper
      pkg-download: verify the hashes from the download wrapper
      pkg-download: check hashes for locally cached files

 package/pkg-download.mk     |  72 ++++++++---------
 support/download/check-hash |  18 +++--
 support/download/dl-wrapper | 191 ++++++++++++++++++++++++++++++++++++++++++++
 support/download/wrapper    |  99 -----------------------
 4 files changed, 235 insertions(+), 145 deletions(-)
 create mode 100755 support/download/dl-wrapper
 delete mode 100755 support/download/wrapper

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
