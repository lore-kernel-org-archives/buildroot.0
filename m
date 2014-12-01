From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  2 Dec 2014 00:24:05 +0100
Subject: [Buildroot] [PATCH 0/4] pkg-download: check hashes before the
	download (branch yem/download-hash)
Message-ID: <cover.1417475935.git.yann.morin.1998@free.fr>
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

Regards,
Yann E. MORIN.


The following changes since commit 1af2db0f77cc98d57012f238afbceb203b9b739b:

  qt5base: add error handling to for loop (2014-12-01 23:33:14 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/download-hash

for you to fetch changes up to e1cc728a60b6a250ea395ee429dba7f470b1f8a8:

  pkg-download: check hasahes for locally cached files (2014-12-02 00:11:05 +0100)

----------------------------------------------------------------
Yann E. MORIN (4):
      pkg-download: check for already downloaded file in the download wrapper
      pkg-download: fix arguments to hash checking script
      pkg-download: verify the hashes from the download wrapper
      pkg-download: check hasahes for locally cached files

 package/pkg-download.mk     | 36 +++++++++++-------------------------
 support/download/check-hash | 18 ++++++++++--------
 support/download/wrapper    | 22 +++++++++++++++++++++-
 3 files changed, 42 insertions(+), 34 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
