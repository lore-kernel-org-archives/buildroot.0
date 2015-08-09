From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Aug 2015 00:38:17 +0200
Subject: [Buildroot] [PATCH 0/5] core/graphs: add (near) real-time build
	status to graph-depends (branch yem/graphs)
Message-ID: <cover.1439159331.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces a new type of graphs: a (near) real-time status
of the build is overlayed over the existing graph-depends.

It allows one to see at a glance what packages have been built, what
dependency chains are not yet finished (and thus are blocking a specific
package)...

The new graphs are available globally as well as for each package, like
graph-depends is.

The new graphs are best viewed with a viewer that auto-reloads the file
whenever it changes (e.g. evince for PDF or geeqie for images).

Here's a simple way to see the result:

    $ make defconfig
    $ make rt-graph-depends
    [wait for it to generate the initial data...]
    Realtime graph is at: [...]/output/graphs/rt-graph-depends.pdf
    Now rendering realtime status... (Ctrl-C to interrupt)

From another terminal, run:

    $ evince output/graphs/rt-graph-depends.pdf &
    $ make

And switch to the evince full-screen mode and enjoy the result! :-)

Thanks to Thomas for suggesting the feature! ;-)

Regards,
Yann E. MORIN.


The following changes since commit 4a5f878946c37deb8c1785fb8363cd1d322f7436:

  toolchain/external: better check for gcc-5 (2015-08-09 16:58:55 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/graphs

for you to fetch changes up to fbaad2935f74aebe3ab32466f404238afd1c0dc6:

  docs/manual: document rt-graph-depends and <pkg>-rt-graph-depends (2015-08-10 00:26:29 +0200)

----------------------------------------------------------------
Yann E. MORIN (5):
      instrumentation: explicitly pass the package name
      fs: add instrumentation steps
      instrumentation: add step-{start,end} to target-finalize
      support/graphs: real-time build status on graph-depends
      docs/manual: document rt-graph-depends and <pkg>-rt-graph-depends

 Makefile                            |  10 +++
 docs/manual/common-usage.txt        |  26 ++++++
 docs/manual/debugging-buildroot.txt |  19 ++--
 fs/common.mk                        |   2 +
 package/pkg-generic.mk              |  45 ++++++----
 support/scripts/rt-graph-depends    | 175 ++++++++++++++++++++++++++++++++++++
 6 files changed, 253 insertions(+), 24 deletions(-)
 create mode 100755 support/scripts/rt-graph-depends

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
