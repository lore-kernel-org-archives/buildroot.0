From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 Oct 2015 22:34:11 +0200
Subject: [Buildroot] [PATCH 0/21 v2] br2-external: support multiple trees at
	once (branch yem/multi-br2-external-5)
Message-ID: <cover.1445545973.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This rather complex series introduces support for using multiple
br2-external trees at once.


Currently, Buildroot can use what we call a br2-external tree, that is a
location where one can store customisations outisde of the Buildroot
tree:

  - defconfig files;
  - packages;
  - custom make rules and logic;
  - company-, project- and board-related configurations files, like a
    kernel config file, a rootfs overlay;
  - any other content that does not belong to the Buildroot tree...

This is very nice and very handy!

However, it is not possible to use more than one such br2-external tree
at a time; Buildroot only supports using at most one br2-external tree.


Having support for using more than one br2-external tree at the same
time would allow more flexibility organising those out-of-tree
customisations. One could use a br2-external tree to store FLOSS
packages not yet in Buildroot and a second br2-external tree for
proprietary packages; such a separation would make compliance with
FLOSS licenses easier (by allowing distributing only the br2-external
tree with FLOSS packages, keeping the proprietary bits private).

It could also be used to commonalise br2-external trees from different
internal projects, where each would provide a set of extensions (new
packages, new boards defconfigs...) that a project could cherry-pick.

And countless other possibilities.

This series is an attempt at making it possible to use such setups.


The series is organised as such:

  - patches 1-2 ensure no br2-external tree can redefine a package;
    they introduce a per-package variable that points to the directory
    with the package's .mk and Config.in files; that variable is added
    to the manual;

  - patch 3 is a little cleanup to commonalise utility functions that
    are used throughout the Makefiles;

  - patches 4-10 pave the way to introducing a generated kconfig
    snippet;

  - patches 11-13 and 15 remove hard-wired and conditional handling of
    br2-external, to always handle it in non-conditional Makefile code,
    with only the content of the generated kconfig snippet depending on
    the value of $(BR2_EXTERNAL);

  - patch 14 introduces a per-br2-external variable that holds the path
    to that tree; see below for an in-depth expanation for the reason
    for that ID;

  - patch 16 is the core of the series; it eventually introduces support
    for using multiple br2-external trees at once. Tanks to all the
    previous changes, it is pretty light (67+, 31-), even if a bit
    complex;

  - patch 17 adds some information about a missing ID when a
    br2-external tree is used alone. It is not necessary to keep that
    patch and it can be dropped if that informative message is not
    wanted;

  - patches 18-21 add the necessary documentation about all this new
    multi-br2-external support, and adds packages from br2-external
    trees in the manual.

(Note: patch 15 could/should have been before patch 14, but they were
made in that order and fipping them was a bit difficult; so here they
come as-is.)


The pivotal change in this series is implemented in patch 14, and aims
at providing br2-external trees with a way to find their own files,
given that their locations at runtime is completely unkown, and can
not even be deduced relative to Buildroot's own TOPDIR; this is
explained below.

Unlike Makefiles, Kconfig does not allow us to redefine a variable at
various moments of the parsing, because the values are only valid and
acted upon when the complete Kconfig code has been parsed. So, we need
a way to provide Config.in files from each br2-external with their
actual location. For that, we need different variables, one for each
br2-external tree.

So, we need a way to uniquely identify each br2-external tree, and we
need a stable scheme. We can't use indexes; we can't use path-based
hashing (because paths are not stable accross users/machines/time);
we can't use content-based hashing (external.mk and/or Config.in may
all be empty, giving the same hash); we can't use hashes altogether
because they are not human-friendly.

The solution is to require br2-external trees to provide a unique ID
that is used as a kind of 'name-space' for that tree: we eventually
provide a single variable, BR2_EXTERNAL_$(ID) that points to the
location of that tree; because $(ID) is known to the external tree,
it also knows BR2_EXTERNAL_$(ID) exists, so it can use it, and we
export it both in Config.in and external.mk .

Therefore, br2-external trees must now use $(BR2_EXTERNAL_$(MY_ID)) to
refer to their own files. It also prevent them from (accidentally)
including files from other br2-external trees.

Note: IDs are optional, so that existing br2-external trees continue to
work as before. However, if a br2-external tree does not provide an ID,
it will not be useable in conjunction with other br2-external trees.
Using multiple br2-external trees mandates that all of them provide an
ID.


Please have a look at the various commit logs, they are usually pretty
copious in details (sometimes even much bigger than the actual change
they are commenting!).


And that's about all for this time. ;-)


Changes RFC -> v2:
  - much. :-]


Regards,
Yann E. MORIN.


The following changes since commit 301e8ffbb252f7a6718f9a5610bb27976efe0ac7:

  gst1-plugins-bad: update configure options (2015-10-21 23:36:37 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/multi-br2-external-5

for you to fetch changes up to 4ae06b5c21e26de732cbd8f41870a31721227b74:

  docs/manual: document multi br2-external (2015-10-22 21:46:38 +0200)

----------------------------------------------------------------
Yann E. MORIN (21):
      core: do not accept multiple definitions of a package
      docs/manual: document $(FOO_PKGDIR)
      core: move pkg-utils.mk to support/
      core: commonalise the bundled and br2-external %_defconfig rules
      core: remove .br-external on distclean
      docs/manual: do not override BR2_EXTERNAL
      doc/asciidoc: add possibility to define document dependencies
      core: introduce an intermediate rule before the configurators
      core: move rule to create basic directories
      core: introduce a generated kconfig snippet
      docs/manual: prepare-config can be used as a dependency of documents
      core: do not hard-code inclusion of br2-external in Kconfig
      core: get rid of our dummy br2-external tree
      core: introduce per br2-external ID
      core: handle .br-external in a make rule
      core: add support for multiple br2-external trees
      core: br2-external trees without ID can't be used with other trees
      support/scripts: teach gen-manual-lists about BR2_EXTERNAL
      docs/manual: include packages from BR2_EXTERNAL if set
      docs/manual: document the br2-external ID
      docs/manual: document multi br2-external

 Config.in                                |  11 +-
 Makefile                                 | 185 ++++++++++++++++++++-----------
 docs/manual/adding-packages-asciidoc.txt |   5 +
 docs/manual/adding-packages-generic.txt  |   3 +
 docs/manual/appendix.txt                 |   5 +
 docs/manual/customize-outside-br.txt     | 110 ++++++++++++------
 docs/manual/manual.mk                    |  24 +++-
 package/Makefile.in                      |   2 +-
 package/doc-asciidoc.mk                  |   2 +-
 package/pkg-generic.mk                   |   9 ++
 package/pkg-utils.mk                     |  59 ----------
 support/dummy-external/Config.in         |   0
 support/dummy-external/external.mk       |   0
 support/misc/utils.mk                    |  74 +++++++++++++
 support/scripts/gen-manual-lists.py      |  24 +++-
 15 files changed, 340 insertions(+), 173 deletions(-)
 delete mode 100644 support/dummy-external/Config.in
 delete mode 100644 support/dummy-external/external.mk
 create mode 100644 support/misc/utils.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
