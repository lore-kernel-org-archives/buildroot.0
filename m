From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 14 Oct 2016 16:39:20 +0200
Subject: [Buildroot] [PATCH 00/12 v7] br2-external: support multiple trees
	at once
Message-ID: <cover.1476455955.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces support for using multiple br2-external trees.

Currently, Buildroot can use what we call a br2-external tree, that is a
location where one can store customisations outside of the Buildroot
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

Here's a brief overview of all the patches:

  - patch 1 moves the hard-coded sourcing of BR2_EXTERNAL/Config.in from
    the main Config.in into the generated Kconfig snippet.

  - patch 2 gets rid of our dummy br2-external tree, since we now can
    include the br2-external only if specified by the user.

  - patch 3 moves the handling of BR2_EXTERNAL out of the main Makefile
    into the generated $(BASE_DIR)/.br-external.mk Makefile fragment. So
    far, this fragment was already generated, but it only memorised the
    value of BR2_EXTERNAL so that it need not be specified at each call;
    it now also defines a new internal variable, BR2_EXTERNAL_MK, that
    contains the path to the BR2_EXTERNAL/external.mk makefile fragment.

    This allows us to offload all the logic about handling a
    br2-external tree to a helper script, whether it be about the
    Kconfig snippet or the Makefile fragment.

  - patch 4 adds more validation of a br2-external tree than we
    previously had.

  - patch 5 introduces a layout change in the br2-external tree: a
    br2-external tree must now declare its name. This name is used to
    construct a set of variables unique to that br2-external tree.

    This change is the foundation for using multiple br2-external trees
    at once, as their paths will now be in different variables; see
    below for more explanations.

    As we now generate the Kconfig snippet and Makefile fragment, we can
    easily (pre-)compute the variables from the helper script.

    This change renders existing br2-external trees incompatible with
    the new layout, as the BR2_EXTERNAL variable is now no longer to be
    used by br2-external trees, and is no longer available in Kconfig
    (although it still is available in Makefile, but we can't remove it
    as we need it for the infra).

  - patch 6 is the documentation for the br2-external name.

  - patch 7 adds a blurb in the manual about how to easily convert an
    old br2-external tree. This is referenced from the helper script and
    displayed in case of error.

  - patch 8 is the core of the change, that adds suport for using
    multiple br2-external trees at once.

    Again, because we generate the Kconfig snippet and Makefile fragment,
    it is very easy to (pre-)compute the per-br2-external tree variables.

    Each tree is now identified with its name, which is displayed both
    in the Kconfig menu for that tree, as well as in the comment listing
    the defconfig files from that tree.

  - patch 9 is the documentation for mutliple br2-external trees.

  - patch 10 makes it possible for a br2-external tree to override
    defcongis present in Buildroot, as well as override defconfigs
    in other br2-external trees (by the order they are listed in
    BR2_EXTERNAL).

  - patches 11..12 adds support for a short description in the desc
    file, and uses that, if present, to construct the user-visible
    labels (list-defconfigs, menuconfig) instead of the name.

The pivotal change in this series is implemented in patch 5, and aims
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

The solution is to require br2-external trees to provide a unique name
that is used as a kind of 'name-space' for that tree: we eventually
provide, for each br2-external tree, a variable, BR2_EXTERNAL_$(NAME)_PATH,
that points to the location of that tree; because $(NAME) is known to
the br2-external tree, it also knows BR2_EXTERNAL_$(NAME)_PATH exists,
so it can use it, and we export it both in Config.in and external.mk .

Therefore, br2-external trees must now use $(BR2_EXTERNAL_$(MY_NAME)_PATH)
to refer to their own files. It also prevents them from (accidentally)
including files from other br2-external trees.

Note: unlike old iterations, it is now mandatory that a br2-external
tree defines its name, the rationale being that it is relatively trivial
to upgrade an existing br2-external tree to the new layout.

And that's about all for this time. ;-)

Changes v6 -> v7:
  - use $(foo) instead of ${foo}  (Thomas)
  - add the "desc" field in the desc file; add corresponding doc

Changes v5 -> v6:
  - the helper script is first run in Makefile context, so change the
    error function to emit Makefile code

Changes v4 -> v5:
  - introduce br2-external conversion earlier in the series  (Julien)
  - fix intermediate-state br2-external helper script  (Julien)
  - misc typoes


Regards,
Yann E. MORIN.


The following changes since commit 64ace94d4ab30aad2d8dcae61abd2beebe00b226

  fwts: needs host-bison and host-flex (2016-10-14 09:32:29 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 62a03b2f27e3d3e9eb1f1bbd8cb127da8b52ce8e

  docs/manual: document the br2-external desc: field (2016-10-14 15:44:09 +0200)


----------------------------------------------------------------
Yann E. MORIN (12):
      core: do not hard-code inclusion of br2-external in Kconfig
      core: get rid of our dummy br2-external tree
      core: offload handling of BR2_EXTERNAL into the script
      core/br2-external: validate even more
      core: introduce per br2-external NAME
      docs/manual: document the br2-external NAME
      docs/manual: add appendix to convert old br2-external trees
      core: add support for multiple br2-external trees
      docs/manual: document multi br2-external
      core: allow a br2-external tree to override a defconfig
      core: support description for br2-external trees
      docs/manual: document the br2-external desc: field

 Config.in                                     |  11 -
 Makefile                                      |  85 ++++---
 boot/barebox/barebox-aux/Config.in            |   3 +-
 boot/barebox/barebox/Config.in                |   3 +-
 docs/manual/adding-packages-asciidoc.txt      |   6 +-
 docs/manual/adding-packages-perl.txt          |   2 +-
 docs/manual/adding-packages-python.txt        |   2 +-
 docs/manual/appendix.txt                      |   1 +
 docs/manual/br2-external-converting.txt       |  39 +++
 docs/manual/customize-directory-structure.txt |  13 +-
 docs/manual/customize-outside-br.txt          | 327 +++++++++++++++++++++-----
 docs/manual/customize-packages.txt            |  25 +-
 package/Makefile.in                           |   3 +-
 package/pkg-generic.mk                        |   4 +-
 support/dummy-external/Config.in              |   0
 support/dummy-external/external.mk            |   0
 support/misc/utils.mk                         |   4 +
 support/scripts/br2-external                  | 220 +++++++++++++++++
 18 files changed, 598 insertions(+), 150 deletions(-)
 create mode 100644 docs/manual/br2-external-converting.txt
 delete mode 100644 support/dummy-external/Config.in
 delete mode 100644 support/dummy-external/external.mk
 create mode 100755 support/scripts/br2-external

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
