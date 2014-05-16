From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 16 May 2014 23:05:15 +0200
Subject: [Buildroot] [PATCH 0/8 v3] graph-depends improvements (branch
	yem/graphs)
Message-ID: <cover.1400273945.git.yann.morin.1998@free.fr>
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

So I went for:

  - renaming the existing DEPTH variable: we can do that since it's
    been in no release for now (quick! let's apply at least the first
    patch for this cycle! ;-) )

  - add a new variable to pass options to dot

Changes v2 -> v3:
  - pythonise even further the handling of --depth  (Samuel)
  - rename BR2_GRAPH_DEPTH to BR2_GRAPH_DEPS_OPTS
  - introduce BR2_GRAPH_DOT_OPTS
  - update manual accordingly

Changes v1 -> v2:
  - complete rewrite, split into a series

Regards,
Yann E. MORIN.


The following changes since commit ae1df831c0d56aaa88741595963e97aa39ed5961:

  package/avahi: does not build with static-only (2014-05-16 22:41:55 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git 

for you to fetch changes up to 62b0daddcbd6ba88226ca7cb658b9ad021168b56:

  manual: document the new graph-depends options (2014-05-16 22:57:56 +0200)

----------------------------------------------------------------
Yann E. MORIN (8):
      graph-depends: rename the variable to pass the max depth
      graphs: add option to remove transitive dependencies in dependency graph
      graphs-depends: merge redundant-dependencies elimination
      graph-depends: handle the depth argument in a more pythonic way
      graph-depends: document the max_depth variable
      graph-depends: rename the mode constants
      graph-depends: add option to pass arbitrary dot options
      manual: document the new graph-depends options

 Makefile                      |   5 +-
 docs/manual/common-usage.txt  |  19 ++++++-
 foo                           |   0
 package/pkg-generic.mk        |   4 +-
 support/scripts/graph-depends | 125 ++++++++++++++++++++++++------------------
 5 files changed, 94 insertions(+), 59 deletions(-)
 create mode 100644 foo

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
