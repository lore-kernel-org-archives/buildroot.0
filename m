From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Apr 2018 11:07:52 +0200
Subject: [Buildroot] [PATCH 0/6 v2] support/download: make the git backend
 even more robust
Message-ID: <cover.1524388060.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series makes our git backend even more robust than wht we currently
have. Especially, it will try to recover from a repository that was so
utterly butchered that even a git-init can't salvage it.

The most significant changes are:

  - ensure we can checkout from an unclean state;

  - ensure we can checkout across changes in submodules setup;

  - as a last-ditch recovery, trah the loccal cache and clone again from
    scratch.

Additionally, we also remove support for shallow clones, because they
were in fact fundamentally broken, and did only work by chance.

Finally, we add a warning file, that the user should not use our git
cache for development, neither directly in it or as a remote or the
origin for worktrees.

Thanks a lot to Ricardo, Arnout and Thomas for their inputs during the
discussions that led to this series. :-)


Regards,
Yann E. MORIN.


The following changes since commit d4158df6c19c76ea3405975b87f13b1c092a40e0

  bluez5_utils: add patch to fix readline issue (2018-04-21 14:53:01 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to cb54e8b49b631790559e87749f106a1ab9352128

  download/git: add warning not to use or git cache (2018-04-22 10:59:30 +0200)


----------------------------------------------------------------
Yann E. MORIN (6):
      download/git: run all git commands in the current directory
      download/git: try to recover from utterly-broken repositories
      download/git: ensure we checkout to a clean state
      download/git: ensure we can checkout repos with submodule conversions
      download/git: always do full-clone
      download/git: add warning not to use or git cache

 support/download/git | 108 ++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 82 insertions(+), 26 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
