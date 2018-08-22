From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Aug 2018 23:10:55 +0200
Subject: [Buildroot] [PATCH 0/5] download: add a timeout and use a more
 fine-grained locking heuristic
Message-ID: <cover.1534972250.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Currently, the dl-wrapper locks the package download directory,
effectively serialising access to that directory.

This is done to protect the git cache directory from being accessed by
two concurrent Buildroot builds, because the access pattern to the git
cache is not atomic.

However, all the other download backends are atomic, as the download
wrapper ensures they only ever work on temporary files and directories,
with only the final rename being atomic by itself.

Thus, the current locking policy effectively prevents other downloads
for that package from another Buildroot run, to run in parallel when
they would perfectly be able to do so without issue.

Furthermore, if the remote site is really damn slow, or blocks for
whatever reason, or we can't acquire the lock for whatever other reason,
the whole download can be stuck for, like, forever.

This series moves the locking into the git backend and the download
wrapper, to protect just what needs to be protected. Finally, a timeout
is added, so that the next download method, if any, is attempted as a
fallback.


Regards,
Yann E. MORIN.


The following changes since commit b3c1f0869645b136b9399d7a93acca65957e0bfe

  DEVELOPERS: add mender to Mirza Krak (2018-08-22 13:14:26 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 17a71c0c569e1b66a46ef40f14f07db8adf847b9

  utils/genrandconfig: add a 30-minute timeout (2018-08-22 22:10:33 +0200)


----------------------------------------------------------------
Yann E. MORIN (5):
      download/git: fix code-style
      download/git: re-run the backend with a lock to the git tree
      download: move locking into download wrapper
      core/download: add per-download timeout
      utils/genrandconfig: add a 30-minute timeout

 Config.in                   | 14 ++++++++++++++
 package/pkg-download.mk     |  4 ++--
 support/download/dl-wrapper | 31 +++++++++++++++++++++----------
 support/download/git        | 32 ++++++++++++++++++++++++++++++--
 utils/genrandconfig         |  3 +++
 5 files changed, 70 insertions(+), 14 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
