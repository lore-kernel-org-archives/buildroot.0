From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Feb 2016 22:34:26 +0100
Subject: [Buildroot] [PATCH 0/6 v3] Detect and fix circular dependencies
	(branch yem/fixes)
Message-ID: <cover.1454880734.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

We currently have two circular dependencies:
    cups -> avahi -> libglade -> libgtk2 -> cups
    cups -> avahi -> libgtk3 -> cups

This series fixes those two loops (by cutting the avahi -> libgtk{2,3}
dependency).

It also adds support for detecting future such circular dependencies,
and makes the graph-depends script robust in such a situation.


Changes v2 -> v3:
  - break the loop on avahi -> libgtk{2,3}  (Thomas)
  - consistency in variables and options  (Thomas)

Changes v1 -> v2:
  - optimise the loop detection  (Thomas, Arnout)
  - add timings for the new check  (Thomas)
  - actually fix the two loops
  - enhance graph-depends to only check dependencies


Regards,
Yann E. MORIN.


The following changes since commit b5ad2ce5a35a7909307de806b9606c560b5cb85d:

  fio: depends on BR2_TOOLCHAIN_HAS_SYNC_4 (2016-02-07 22:23:52 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/fixes

for you to fetch changes up to f0509ca9d1287b071a0cb1d965ead2bccdac5bc1:

  core: add a make target to check the dependencies (2016-02-07 22:31:30 +0100)

----------------------------------------------------------------
Yann E. MORIN (6):
      package/avahi: break circular dependencies
      support/graph-depends: add option to specify output file
      core: catch failures in graph-depends
      support/graph-depends: detect circular dependencies
      support/graph-depends: teach it to only check dependencies
      core: add a make target to check the dependencies

 Makefile                      | 10 ++++++--
 package/avahi/avahi.mk        | 15 ++----------
 package/pkg-generic.mk        |  8 ++++---
 support/scripts/graph-depends | 56 ++++++++++++++++++++++++++++++++++++++-----
 4 files changed, 65 insertions(+), 24 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
