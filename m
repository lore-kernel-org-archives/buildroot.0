From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  1 May 2018 10:44:11 +0200
Subject: [Buildroot] [PATCH 0/7 v5] support/download: make the git backend
 even more robust
Message-ID: <cover.1525164241.git.yann.morin.1998@free.fr>
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
Changes v4 -> v5:
  - fix trapping in the _git fuction  (Ricardo)
  - carry reviews and tests by Ricardo
  - typoes  (Ricardo)

Changes v3 -> v4:
  - git clean --ffdx  is needed in the same patch that fircs the
    checkout  (Ricardo)

Changes v2 -> v3:
  - do not trash the cache if the cset is missing  (Thomas)


Regards,
Yann E. MORIN.


The following changes since commit 5a8f887e7ab6c28b2d5a4c01266bc75943cea90c

  sdl2: update license file hash (2018-05-01 09:35:41 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 657e448ced76f18222d9987baf7bca48d550f13b

  download/git: always do full-clone (2018-05-01 10:41:02 +0200)


----------------------------------------------------------------
Yann E. MORIN (7):
      download/git: add warning not to use our git cache
      download/git: run all git commands in the current directory
      download/git: quickly exit when the cset does not exist
      download/git: try to recover from utterly-broken repositories
      download/git: ensure we checkout to a clean state
      download/git: ensure we can checkout repos with submodule conversions
      download/git: always do full-clone

 support/download/git | 123 ++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 96 insertions(+), 27 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
