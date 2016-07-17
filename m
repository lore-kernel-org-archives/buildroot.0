From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2016 12:34:32 +0200
Subject: [Buildroot] [PATCH 00/16 v3] br2-external: support multiple trees
	at once (branch yem/multi-br2-external-ID-7)
Message-ID: <cover.1468750623.git.yann.morin.1998@free.fr>
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

  - patch 1 is a little cleanup that moves common Makefiles definitions
    out of the package infra and out of the main Makefile, into a
    separate file. Those definitions are generic, not specific to
    packages, and may be used throughout the Makefile.

  - patches 2..5 are preparatory work aimed at allowing to generate a
    kconfig snippet in the menuconfig.

  - patches 6..9 introduce a generated kconfig snippet, that is used to
    include the br2-external tree, rather than have conditional code in
    our existing static kconfig. They also get rid of our bundled, dummy
    br2-external tree, as it is no longer needed.

  - patches 10..11 introduce support for br2-external trees to define an
    hopefully-globally-unique ID describing this br2-external tree. See
    below for an in-depth expanation for the reason for that ID.

  - patch 12 adds a Makefile rule to generate out .br-external file,
    rather than handling it with cutom Makefile code (arguably, this
    change could have come before 10..11, but since I wrote it in this
    order and they concflict pretty hard, I left it in this position).

  - patch 13 is is the core of the series; it eventually introduces
    support for using multiple br2-external trees at once. Tanks to all
    the previous changes, it is pretty light (70+, 31-), even if a bit
    complex;

  - patch 14..15 teaches gen-manual to generate lists for packages from
    the br2-external trees,if any and if requested (default: do not
    include those packages).

  - patch 16 eventually documents support for multi br2-external trees.


The pivotal change in this series is implemented in patch 10, and aims
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
need a stable scheme. We can't use indexes (because they would not be
stable across various runs or various ordering of the br2-external
trees); we can't use path-based hashing (because paths are not stable
accross users/machines/time); we can't use content-based hashing
(external.mk and/or Config.in may all be empty, giving the same hash);
we can't use hashes altogether because they are not human-friendly.

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


Please have a look at the various commit logs for more details about
each change, they are usually pretty copious in details (sometimes even
much bigger than the actual change they are commenting!).


And that's about all for this time. ;-)


Changes v2 -> v3:
  - not much. ;-)

Changes RFC -> v2:
  - much. :-]


Regards,
Yann E. MORIN.


The following changes since commit 97308d8e9ae0f096ec2df8275deb063266583b91

  package/ti-gfx: list supported SoCs in Config.in help text (2016-07-16 22:53:55 +0200)


are available in the git repository at:

  https://gitlab.com/ymorin/buildroot.git

for you to fetch changes up to 8eca23fffd802ef089aab2300b9041455076e771

  docs/manual: document multi br2-external (2016-07-17 12:06:42 +0200)


----------------------------------------------------------------
Yann E. MORIN (16):
      core: move pkg-utils.mk to support/
      core: commonalise the bundled and br2-external %_defconfig rules
      doc/asciidoc: add possibility to define document dependencies
      core: introduce an intermediate rule before the configurators
      core: move rule to create basic directories
      core: introduce a generated kconfig snippet
      docs/manual: prepare-config can be used as a dependency of documents
      core: do not hard-code inclusion of br2-external in Kconfig
      core: get rid of our dummy br2-external tree
      core: introduce per br2-external ID
      docs/manual: document the br2-external ID
      core: handle .br-external in a make rule
      core: add support for multiple br2-external trees
      support/scripts: teach gen-manual-lists about BR2_EXTERNAL
      docs/manual: include packages from BR2_EXTERNAL if set
      docs/manual: document multi br2-external

 Config.in                                     |  11 +-
 Makefile                                      | 184 +++++++++++++++++---------
 docs/manual/adding-packages-asciidoc.txt      |   5 +
 docs/manual/appendix.txt                      |   5 +
 docs/manual/customize-outside-br.txt          | 119 ++++++++++++-----
 docs/manual/manual.mk                         |  21 +++
 package/Makefile.in                           |   2 +-
 package/doc-asciidoc.mk                       |   2 +-
 package/pkg-utils.mk                          |  96 --------------
 support/dummy-external/Config.in              |   0
 support/dummy-external/external.mk            |   0
 package/pkg-utils.mk => support/misc/utils.mk | 106 ++-------------
 support/scripts/gen-manual-lists.py           |  24 +++-
 13 files changed, 276 insertions(+), 299 deletions(-)
 delete mode 100644 support/dummy-external/Config.in
 delete mode 100644 support/dummy-external/external.mk
 copy package/pkg-utils.mk => support/misc/utils.mk (57%)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
