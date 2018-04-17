From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Apr 2018 18:48:19 +0200
Subject: [Buildroot] [PATCH 0/4] support/download: make the git backend more
 robust
Message-ID: <cover.1523983687.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is an attempt at making our git backend more robust in case
the git cache for a package got corrupted for whatever reason. For
example, a git action may got killed, there could have been a
power-loss, or anything that could leave the git tree in an inconsistent
state.

This has been praticualarly observed in autobuilders, where random
files got removed without taking into account that we now had git trees
in there.

First and foremost, we ensure that all the git comand we run will only
ever act on the git tree we're interested in, to avoid git going up
until it finds a valid directory.

Then, we always initialise the git tree, just in case. git-init is safe
to run on already initialised trees, and it restores broken ones in
working conditions.

Third, we properly handle the case where a git tree had a sub-dir
converted to/from a submodule, and the checkout crosses the boundary of
the conversion.

Finally, we drop support for shallow clones because they are not
reliable, and only ever worked by chance so far.

Thanks a lot to Ricardo, Arnout and Tomas for their inputs during the
discussions that led to this series. :-)


Regards,
Yann E. MORIN.


The following changes since commit 3f37dd7c3b5eb25a41edc6f72ba73e5a21b07e9b

  mariadb: bump version to 10.1.32 (2018-04-17 08:56:57 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 62d815cfe104e4d172ca4d51e1d56e577f737b87

  download/git: always do full-clone (2018-04-17 18:39:59 +0200)


----------------------------------------------------------------
Yann E. MORIN (4):
      download/git: ensure we always work in the expected repository
      download/git: ensure we have a sane repository
      download/git: ensure we can checkout repos with submodule conversions
      download/git: always do full-clone

 support/download/git | 66 +++++++++++++++++++++++++++-------------------------
 1 file changed, 34 insertions(+), 32 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
