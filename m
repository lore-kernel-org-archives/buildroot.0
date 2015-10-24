From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Oct 2015 14:48:49 +0200
Subject: [Buildroot] [PATCH 0/9 v2] toolchain/external: use generic extract
	commands (branch yem/extract-cmds)
Message-ID: <cover.1445690712.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is an attempt at simplifying the way external toolchains are
extracted.

Currently, external toolchains use custom extract commands, because they
want to exclude a bunch of files during extraction, so as to save a bit
of space (locales in some toolchains can account for up to 80% of the
size of the toolchain as a whole).

And it turns out, gcc also wants to exclude a bunch of files (java and
go, testsuites).

Using custom extract commands means that those packages (and critical
ones, at that) can not benefit from the enhancements and fixes made to
the generic commands, like the automatic striping of components.

In this series:

  - we first introduce the support for the exclusion list;
  - we drop the hard-link dereference option to tar, it's useless when
    extracting;
  - we make gcc use the exclusion list;
  - we then make the external toolchains use it (in two passes: one for
    the non-Blackfin case, one for it, as it is 'seecial');
  - we allow users to specify an exlcusion list for custom toolchains;
  - finaly, we introduce the Codescape MTI and IMG toolchains from
    Vincent.


Changes RFC -> v2:
  - allow user to exclude files for custom toolchain (Romain)
  - don't force --hard-dereference, it's useless; instead, drop it
  - add the IMG toolchain
  - use appropriate toolchain on x86 and x86_64
  - rebase on top of master


Regards,
Yann E. MORIN.


The following changes since commit b4660601cdcf9b66b167a08ec2a19e8e4564c7d6:

  linux: bump default version to 4.2.4 (2015-10-23 09:27:04 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/extract-cmds

for you to fetch changes up to d81c191c32f761351ec9a907feedbd47968cd1ee:

  toolchain/external: Codescape toolchains also exist for x86_64 (2015-10-24 14:44:42 +0200)

----------------------------------------------------------------
Vicente Olivert Riera (2):
      toolchain/external: add MIPS Codescape MTI GNU Linux toolchain
      toolchain/external: add MIPS Codescape IMG GNU Linux toolchain

Yann E. MORIN (7):
      core/pkg-generic: allow packages to exclude files when extracting
      toolchain-external/blacfin: always force keeping hardlinks from archives
      package/gcc: use generic extract commands
      toolchain/external: use generic extract commands (!blackfin case)
      toolchain/external: use generic extract commands (blackfin case)
      toolchain/external: allow user to exclude files from custom toolchains
      toolchain/external: Codescape toolchains also exist for x86_64

 docs/manual/adding-packages-generic.txt            |   4 +
 package/gcc/gcc-final/gcc-final.mk                 |   3 +-
 package/gcc/gcc-initial/gcc-initial.mk             |   3 +-
 package/gcc/gcc.mk                                 |  15 +--
 package/pkg-generic.mk                             |   5 +-
 toolchain/helpers.mk                               |  12 ++-
 toolchain/toolchain-external/Config.in             | 102 +++++++++++++++++++++
 .../toolchain-external/toolchain-external.hash     |   7 ++
 toolchain/toolchain-external/toolchain-external.mk |  73 ++++++++++-----
 9 files changed, 186 insertions(+), 38 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
