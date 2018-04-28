From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Apr 2018 21:34:44 +0200
Subject: [Buildroot] [PATCH 0/7 v4] support/download: make the git backend
 even more robust
Message-ID: <cover.1524944063.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series makes our git backend even more robust than what we
currently have. Especially, it will try to recover from a repository
that was so utterly butchered that even a git-init can't salvage it.

The most significant changes are:

  - ensure we can checkout from an unclean state;

  - ensure we can checkout across changes in submodules setup;

  - as a last-ditch recovery, trash the local cache and clone again
    from scratch.

Additionally, we also remove support for shallow clones, because they
were in fact fundamentally broken, and did only work by chance.

Finally, we add a warning file, that the user should not use our git
cache for development, neither directly in it nor as a remote or the
origin for worktrees.

Thanks a lot to Ricardo, Arnout and Thomas for their inputs during the
discussions that led to this series. :-)

---
Changes v3 -> v4:
  - git clean --ffdx  is needed in the same patch that fircs the
    checkout  (Ricardo)

Changes v2 -> v3:
  - do not trash the cache if the cset is missing  (Thomas)


Regards,
Yann E. MORIN.


The following changes since commit 371204253273ba2984104e2c7a59f6afb657cd81

  libcgicc: add hash of license files (2018-04-28 19:02:03 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to b047fa7d0f366bfe767231112121e22cfc88f0de

  download/git: always do full-clone (2018-04-28 21:17:34 +0200)


----------------------------------------------------------------
Yann E. MORIN (7):
      download/git: add warning not to use our git cache
      download/git: run all git commands in the current directory
      download/git: quickly exit when the cset does not exist
      download/git: try to recover from utterly-broken repositories
      download/git: ensure we checkout to a clean state
      download/git: ensure we can checkout repos with submodule conversions
      download/git: always do full-clone

 support/download/git | 121 ++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 95 insertions(+), 26 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
