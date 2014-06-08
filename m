From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jun 2014 16:03:49 +0200
Subject: [Buildroot] [PATCH 0/9 v4] graph-depends improvements (branch
	yem/graphs)
Message-ID: <cover.1402236171.git.yann.morin.1998@free.fr>
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

So I went for adding a new variable to pass options to dot.


Changes v3 -> v4:
  - include Fran?ois' host-package colours  (Fran?ois)
  - fix commit log  (Thomas)
  - add option for colours, add to manual

Changes v2 -> v3:
  - pythonise even further the handling of --depth  (Samuel)
  - rename BR2_GRAPH_DEPTH to BR2_GRAPH_DEPS_OPTS
  - introduce BR2_GRAPH_DOT_OPTS
  - update manual accordingly

Changes v1 -> v2:
  - complete rewrite, split into a series


Regards,
Yann E. MORIN.


The following changes since commit ed1182641812986f529b2150635f1e93c799a419:

  xserver_xorg-server: add support for xtensa architecture (2014-06-08 15:51:00 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/graphs

for you to fetch changes up to fa5477ea2ced52b952961623097578564a7247b6:

  manual: document the new graph-depends options (2014-06-08 15:58:27 +0200)

----------------------------------------------------------------
Francois Perrad (1):
      graph-depends: refactor with more colors

Yann E. MORIN (8):
      graphs: add option to remove transitive dependencies in dependency graph
      graphs-depends: merge redundant-dependencies elimination
      graph-depends: handle the depth argument in a more pythonic way
      graph-depends: add option to set the colours
      graph-depends: document the 'transitive' variable
      graph-depends: rename the mode constants
      graph-depends: add option to pass arbitrary dot options
      manual: document the new graph-depends options

 Makefile                      |   2 +-
 docs/manual/common-usage.txt  |  11 ++-
 package/pkg-generic.mk        |   2 +-
 support/scripts/graph-depends | 161 +++++++++++++++++++++++++++---------------
 4 files changed, 115 insertions(+), 61 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
