From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 May 2015 01:42:11 +0200
Subject: [Buildroot] [PATCH 0/21 RFC] br2-external: support multiple trees
	at once (branch yem/multi-br2-external-2)
Message-ID: <cover.1432681414.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This rather complex series introduces support for using multiple
br2-external trees at once.

** This is an RFC !! ** Not ready to commit !! ** Technology preview !! **

Currently, Buildroot can use what we call a br2-external tree, that is a
location where one can store customisations outisde of the Buildroot
tree:
  - defconfig files
  - packages
  - company-, project- and board-related configurations files, like a
    kernel config file, an rootfs overlay...
  - or any other content that does not belong to the Buildroot tree.

This is very nice and very handy!

However, it is not possible to use more than one such br2-external tree
at a time; Buildroot only supports using at most one br2-external tree.

Having support for using more than one br2-external tree at the same
time would allow more flexibility organising those out-of-tree
customisations. One could use a br2-external tree to store FLOSS
packages not yet in Buildroot and a second br2-external tree for
proprietary packages; such a separation would make compliance with
FLOSS licenses easier (by allowing distributing only the br2-external
tree with FLOSS packages, keeping the proprietary bits private.

It could also be used to commonalise br2-external trees from different
internal projects, where each would provide a set of extensions (new
packages, new boards defconfigs...) that a project could cherry-pick.

And countless other possibilities.

This series is an attempt at making it possible to use such setups.


The series is organised as such:

  - patches 1-6 are generic enhancements and cleanups,

  - patches 7-12 introduce the possibility to generate a kconfig
    snippet, which includes all the Config.in files from all the
    br2-external trees, to eventually get rid of our dummy br2-external
    tree,

  - patches 13-17 are preparatory work to support multi br2-external
    trees, like abstracting the br2-external location into a variable
    specific to each br2-external tree (even if still only one is
    supported), and hiding BR2_EXTERNAL so it is not mis-used,

  - patch 18 is the core of the change, and thanks to all the
    preparatory work, is pretty light (51+, 30-).

  - patches 19-21 are the final touch to the manual, allowing to
    generate a manual with the list of packages in br2-external trees,
    and eventually documenting the multi br2-external support (that last
    part is by far incomplete, as the commit log suggests), but is still
    included so reviewers get at least a peek at it.


The pivotal change in this series is implemented sequentially in patches
13-17, and aims at providing br2-external trees with a way to find their
own files, given that their locations at runtime is completely unkown,
and can not even be deduced relative to Buildroot's own TOPDIR:

Kconfig does not allow us to redefine a variable at different
moment of the parsing, because the values are only valid and acted
upon when the complete Kconfig code has been parsed. So, we need a
way to provide Config.in files from each br2-external with their
actual location. For that, we need different variables, one for each
br2-external tree.

So, we need a way to uniquely identify each br2-external tree, so we
need a stable scheme. We can't use indexes, we can't use path-based
hashing (because paths are not stable accross users/machines/time),
we can't use content-based hashing (external.mk and/or Config.in may
all be empty, giving the same hash), we can't use hashes altogether
because they are not human-friendly.

The solution is to require br2-external trees to provide a unique ID
that is used as a kind of 'name-space' for that tree: we eventually
provide a single variable, BR2_EXTERNAL_$(ID) that points to the
location of that tree; because $(ID) is known by the external tree,
it also knows BR2_XTERNAL_$(ID) exists, so it can use it, and we
export it both in Config.in and external.mk .


Please have a look at the various commit logs, they are usually pretty
copious in details (sometimes even much bigger than the actual change
they are commenting!).


And that's about all for this time. ;-)

Again, this series is just an RFC, a kind of peek-in-the-possibilities,
for reference and early commenting. Do not expect this to land any time
soon, or in the current shape, or even at all.

Regards,
Yann E. MORIN.


The following changes since commit f2888955ed21c54a3a887d5757b35ef18ba5e669:

  janus-gateway: disable for static build (2015-05-26 23:58:42 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/multi-br2-external-2

for you to fetch changes up to 93cebd3df59e0168d04f2d3557909ad387684cc3:

  docs/manual: document multi br2-external (2015-05-27 00:57:37 +0200)

----------------------------------------------------------------
Yann E. MORIN (21):
      core: commonalise the bundled and br2-external %_defconfig rules
      pkg-infra/pkg-generic: define PKGDIR for all rules
      docs/manual: slightly re-organise br2-external sections
      core: remove .br-external on distclean
      docs/manual: do not override BR2_EXTERNAL
      doc/asciidoc: add possibility to define document dependencies
      core: introduce an intermediate rule before the configurators
      core: move rule to create basic directories
      core: introduce a generated kconfig snippet
      docs/manual: prepare-config can be used as a dependency of documents
      core: do not hard-code inclusion of br2-external in Kconfig
      core: get rid of our dummy br2-external tree
      core: require br2-external trees define a unique ID
      docs/manual: document the br2-external ID
      core: no longer export the raw BR2_EXTERNAL to users
      core: handle .br-external in a make rule
      core: move pkg-utils.mk to support/
      core: add support for multiple br2-external trees
      support/scripts: teach gen-manual-lists about BR2_EXTERNAL
      docs/manual: include packages from BR2_EXTERNAL if set
      docs/manual: document multi br2-external

 Config.in                                     |  11 +-
 Makefile                                      | 167 ++++++++++++++++----------
 docs/manual/adding-packages-asciidoc.txt      |   5 +
 docs/manual/appendix.txt                      |   5 +
 docs/manual/customize-outside-br.txt          |  98 +++++++++------
 docs/manual/manual.mk                         |  24 +++-
 package/Makefile.in                           |   3 +-
 package/doc-asciidoc.mk                       |   2 +-
 package/pkg-generic.mk                        |   8 ++
 support/dummy-external/Config.in              |   0
 support/dummy-external/external.mk            |   0
 package/pkg-utils.mk => support/misc/utils.mk |  16 ++-
 support/scripts/gen-manual-lists.py           |  24 +++-
 13 files changed, 239 insertions(+), 124 deletions(-)
 delete mode 100644 support/dummy-external/Config.in
 delete mode 100644 support/dummy-external/external.mk
 rename package/pkg-utils.mk => support/misc/utils.mk (94%)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
