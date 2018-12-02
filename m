From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Dec 2018 10:04:39 +0100
Subject: [Buildroot] [PATCH 00/11] support/graphs: fixup and speedup graph
 dependencies (branch yem/graphs-from-make-2)
Message-ID: <cover.1543741464.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is a joint effort with Thomas, to get a graph-depends that
is more reliable (does not forget some dependencies), and faster.

TL;DR: we fixed it, and it is faster. ;-)

Long story:

Currently, graph-depends is used in three ways: to graph the dependency
tree (which is its prime objective, hence the name), to check for
circular dependencies, and to compute the list of recursive direct or
reverse dependencies.

In so doing, graph-depends needs to build up the dependency tree, so it
calls to make to get an initial list of packages, and then iteratively
calls it again and again to get the dependencies, until none are
returned anymore. Running make is rather costly, because it scans the
entire collection of .mk; running it iteratively is thus in O(n), with n
the dependency depth.

This series was started with the realissation that 'make' already knows
about the dependency tree (that's its job, damned!).

So, this series stats with some commits which actually fix graph-depends
to not forget any dependency, then cut down on madatory dependencies.

Building upon that, we introduce the necesary infrastructure in our
Makefiles, to return the dependency tree, and use that from
graph-depends.

Incidentally, we also notice that recursive, direct and reverse,
dependencies can also be had from make in a much les costly manner than
with graph-depends.


Regards,
Yann E. MORIN.


The following changes since commit 13c43455a05b036002e79808ca1c8e0d91d7871b

  Merge branch 'next' (2018-12-02 08:16:10 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 176c21d13a1e9af82e4801e5b43ea86dead4f007

  supprt/graph-depends: use the new make-based dependency tree (2018-12-02 09:49:43 +0100)


----------------------------------------------------------------
Thomas Petazzoni (3):
      support/scripts/graph-depends: use proper rootpkg in remove_extra_deps()
      support/scripts/graph-depends: introduce MANDATORY_DEPS array
      support/scripts/graph-depends: make sure mandatory deps are displayed

Yann E. MORIN (8):
      support/graph-depends: drop legacy target-exceptions
      support/graph-depends: add option to exclude mandatory deps
      support/graph-depends: also cut on host-skeleton
      support/graph-depends: also cut on host-tar
      support/graph-depends: also cut on host-gzip
      infra/pkg-generic: use pure Makefile-based recursive dependencies
      core: add make-based full-dependency list
      supprt/graph-depends: use the new make-based dependency tree

 Makefile                      |   4 ++
 fs/common.mk                  |   8 +++
 package/pkg-generic.mk        |  10 +--
 package/pkg-utils.mk          |  13 ++++
 support/scripts/brpkgutil.py  | 106 ++++++++++++++---------------
 support/scripts/graph-depends | 155 +++++++++++-------------------------------
 6 files changed, 119 insertions(+), 177 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
