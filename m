From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  3 Sep 2015 00:51:57 +0200
Subject: [Buildroot] [PATCH 0/6 RFC] toolchain/external: use generic extract
	commands (branch yem/extract-cmds)
Message-ID: <cover.1441233378.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is an attempt at simplifying the way external toolchains are
extracted.

Currently, external toolchains use custom extract commands, because they
want to exclude a bumch of files during extraction, so as to save a bit
of space (locales in some toolchains can account for up to 80% of the
size of the toolchain as a whole).

And it turns out, gcc also wants to exclude a bunch of files (java and
go, testsuites).

Using custom extract commands means that those packages (and critical
ones, at that) can not benefit from the enhancements and fixes made to
the generic commands, like the automatic triiping of components.

In this series:

  - we first introduce the support for the exclusion list
  - we always break/dereference hardlinks
  - we make gcc use the exclusion list
  - we then make the external toolchains use it (in two passes: one for
    the non-Blackfin case, one for it, as it is 'seecial')
  - finaly, we introduce the Codescape MTI toolchain from Vincent

Thomas, there is a question for you in the second commit: would you
care to explain what your goal was when you added --hard-dereference
when extracting the Blackfin toolchains?

Regards,
Yann E. MORIN.


The following changes since commit 91f12b7e7a013e3db639e0fa44ac395ac46442f2:

  tar: move package to 'system tools' (2015-09-01 22:28:49 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/extract-cmds

for you to fetch changes up to 8ea8baf0059c895f8df15fca5d3b9b70d41f7b53:

  Add support for MIPS Codescape MTI GNU Linux toolchain (2015-09-03 00:31:19 +0200)

----------------------------------------------------------------
Vicente Olivert Riera (1):
      Add support for MIPS Codescape MTI GNU Linux toolchain

Yann E. MORIN (5):
      core/pkg-generic: allow packages to exclude files when extracting
      core/pkg-generic: always dereference hardlinks from archives
      package/gcc: use generic extract commands
      toolchain/external: use generic extract commands (!blackfin case)
      toolchain/external: use generic extract commands (blackfin case)

 docs/manual/adding-packages-generic.txt            |  4 ++
 package/gcc/gcc-final/gcc-final.mk                 |  3 +-
 package/gcc/gcc-initial/gcc-initial.mk             |  3 +-
 package/gcc/gcc.mk                                 | 15 ++---
 package/pkg-generic.mk                             |  6 +-
 toolchain/helpers.mk                               | 12 +++-
 toolchain/toolchain-external/Config.in             | 52 +++++++++++++++++
 .../toolchain-external/toolchain-external.hash     |  4 ++
 toolchain/toolchain-external/toolchain-external.mk | 68 ++++++++++++++--------
 9 files changed, 129 insertions(+), 38 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
