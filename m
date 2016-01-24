From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2016 17:02:36 +0100
Subject: [Buildroot] [pull request v2] Detect and fix circular dependencies
Message-ID: <cover.1453651102.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

We currently have two circular dependencies:
    cups <- avahi <- libglade <- libgtk2 -< cups
    cups <- avahi <- libgtk3 <- cups

This series fixes those two loops (by cutting the libgtk{2,3} <- cups
dependency).

It also adds support for detecting future such circular dependencies,
and makes the graph-depends script robust in such a situation.


Changes v1 -> v2:
  - optimise the loop detection  (Thomas, Arnout)
  - add timings for the new check  (Thomas)
  - actually fix the two loops
  - enhance graph-depends to only check dependencies


Regards,
Yann E. MORIN.


The following changes since commit 530c5a55959f161f49dc095641a24ede649725be:

  vboot-utils: fix RSA redefinition build error with old compilers (2016-01-23 13:09:29 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/fixes

for you to fetch changes up to 00edb6450d0b45ee3c0ae850f7d3a72d5aad711f:

  core: add a make target to check the dependencies (2016-01-24 16:42:28 +0100)

----------------------------------------------------------------
Yann E. MORIN (6):
      package/libgtk2: break a circular dependency
      package/libgtk3: break a circular dependency
      support/graph-depends: detect circular dependencies
      support/graph-depends: add option to specify output file
      support/graph-depends: teach it to only check dependencies
      core: add a make target to check the dependencies

 Makefile                      | 10 ++++++--
 package/libgtk2/libgtk2.mk    | 10 +++-----
 package/libgtk3/libgtk3.mk    | 11 ++-------
 package/pkg-generic.mk        |  8 ++++---
 support/scripts/graph-depends | 56 ++++++++++++++++++++++++++++++++++++++-----
 5 files changed, 68 insertions(+), 27 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
