From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  9 May 2014 16:58:20 +0200
Subject: [Buildroot] [PATCH 0/7 v2] [RFC] graph-depends improvements (branch
	yem/graphs)
Message-ID: <cover.1399647182.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series brings a few improvements to the graph-depends utility:

  - add option to remove transitive dependencies
  - add option to pas arbitrary args to the dot utility
  - cleanup and re-arrange the code

This series is open for discusion, especially on how we pass options to
the graph generators:

  - support/scripts/graph-depends: needs to know whether to generate
    transitive dependencies or not, and how deep to limit the dependencies

  - the 'dot' utility: needs to know whether to graph top-down or
    left-right (or whatever), the type of graph (tree, circle...) and
    so on...

Currently, environment variables are used, but that is not in the tastes
of some (me including), but I can't see a better way.

Peter suggested using kconfig knobs, but it does not scale when you want
different settings for different graphs (e.g, different depth level for
different packages).

Samuel suggested using a config file, but it has the same issues as the
kconfig options. He also suggested pasing a single environment variable,
but that does not work since some options are for graph-depends shile
others are for dot.

Any other suggestion? ;-)

Regards,
Yann E. MORIN.


The following changes since commit ebb5692f358833e4fb6f3ed5f3075241d80c6667:

  zeromq: explicitly add -lstdc++ for static build (2014-05-09 16:31:42 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/graphs

for you to fetch changes up to ccbf2dd69529d62cc925cc891016988e2cb59bbb:

  manual: document the new graph-depends options (2014-05-09 16:51:14 +0200)

----------------------------------------------------------------
Yann E. MORIN (7):
      graphs: add option to remove transitive dependencies in dependency graph
      graphs-depends: merge redundant-dependencies elimination
      graph-depends: handle the depth argument in a more pythonic way
      graph-depends: document the max_depth variable
      graph-depends: rename the mode constants
      graph-depends: add option to pass arbitrary dot options
      manual: document the new graph-depends options

 Makefile                      |   7 ++-
 docs/manual/common-usage.txt  |   6 ++
 package/pkg-generic.mk        |   4 +-
 support/scripts/graph-depends | 126 +++++++++++++++++++++++++-----------------
 4 files changed, 86 insertions(+), 57 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
