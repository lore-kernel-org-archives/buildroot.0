From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Mar 2019 11:16:31 +0100
Subject: [Buildroot] [PATCH 0/8 v2] support/graphs: fixup and speedup graph
 dependencies (branch yem/graphs-from-make-2)
Message-ID: <cover.1551608168.git.yann.morin.1998@free.fr>
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

This series was started with the realisation that 'make' already knows
about the dependency tree (that's its job, damned!).

So, this series starts with some commits which actually fix graph-depends
to not forget any dependency, then cut down on madatory dependencies.

Building upon that, we introduce the necesary infrastructure in our
Makefiles, to return the dependency tree, and use that from
graph-depends.

Incidentally, we also notice that recursive, direct and reverse,
dependencies can also be had from make in a much less costly manner than
with graph-depends.

Changes v1 -> v2:
  - use memoisation to further speed-up recursive reverse dependencies
  - update timings accordingly


Regards,
Yann E. MORIN.


The following changes since commit bdfea8428f1d89ec79e0253b61fe86eb5437532d

  Update for 2019.02-rc3 (2019-03-01 12:57:30 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to ae655a96d9f6c640f9cf16c273c732fe2009ce57

  support/graph-depends: use the new make-based dependency tree (2019-03-03 11:06:38 +0100)


----------------------------------------------------------------
Thomas Petazzoni (1):
      support/graph-depends: make sure mandatory deps are displayed

Yann E. MORIN (7):
      support/graph-depends: add option to exclude mandatory deps
      support/graph-depends: also cut on host-skeleton
      support/graph-depends: also cut on host-tar
      support/graph-depends: also cut on host-gzip
      infra/pkg-generic: use pure Makefile-based recursive dependencies
      core: add make-based full-dependency list
      support/graph-depends: use the new make-based dependency tree

 Makefile                      |   4 ++
 fs/common.mk                  |   8 +++
 package/pkg-generic.mk        |  22 +++++--
 support/scripts/brpkgutil.py  | 107 ++++++++++++++++-----------------
 support/scripts/graph-depends | 133 +++++++++---------------------------------
 5 files changed, 109 insertions(+), 165 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
