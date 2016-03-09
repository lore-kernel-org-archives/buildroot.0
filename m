From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  9 Mar 2016 23:22:22 +0100
Subject: [Buildroot] [PATCH 0/8] core: allow for custom, local help;
	rearrange package-specific help (branch yem/help)
Message-ID: <cover.1457561521.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is an alternative proposal to support displaying custom,
local help, most probably from a br2-external tree (or from a lcal.mk,
but that'd be pretty insane).

The basic idea is to offer the user help entries for local
customisations, but without mixing them with our own help entries.

I believe we want to keep them separate, as inter-mixing the two could
lead users to believe those addtional help entries are "native" in
buildroot, when they are not.

The same way we expose all of br2-external config options under a
sub-menu labelled "User-provided options", we do similarly for the
custom help, albeit with a slight shorter moniker, 'help-local'.

After the first patch implements this (which is really all that is
needed to print custom help), we go further with providing a macro that
pretty-prints the help for rules, so that the layout is all handled in a
single location. This macro can also be used by the local help, too.

This macro is then used to implement per-package specific help (which is
currently only about kconfig-related changes, but can not easily be done
in the kconfig-package infra) into the packages themseves, to clean up
the main help code (the entris are still displayed there, they are just
definedin each concerned package).

All that, plus a bit of associated documentation, of course. ;-)

Thanks to J?r?me for his initial proposal, and Arnout for
before-inception suggestions:
    http://lists.busybox.net/pipermail/buildroot/2016-March/155415.html

Regards,
Yann E. MORIN.


The following changes since commit 07f46c2b6daec44a6176039c90be67e66c4c2e42:

  package/busybox: support automatic module loading with mdev (2016-03-09 23:07:44 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/help

for you to fetch changes up to b94d50a5f7717ad1ea2d9cab129155a0ab203f71:

  docs/manual: document the br2-external help-local (2016-03-09 23:10:37 +0100)

----------------------------------------------------------------
Yann E. MORIN (8):
      core: add the possibility to provide help for local, custom rules
      core/pkg-utils: add a macro to pretty-print a help entry
      core/pkg-generic: add help about package-specific rules
      package/busybox: use the generic help rules
      linux: add the generic help rules
      package/uclibc: use the generic help rules
      boot/barebox: use the generic help rules
      docs/manual: document the br2-external help-local

 Makefile                                | 23 +++++++----------------
 boot/barebox/barebox.mk                 |  4 ++++
 docs/manual/adding-packages-generic.txt |  6 ++++++
 docs/manual/customize-outside-br.txt    | 20 ++++++++++++++++++++
 linux/linux.mk                          |  6 ++++++
 package/busybox/busybox.mk              |  2 ++
 package/pkg-generic.mk                  |  2 ++
 package/pkg-utils.mk                    | 13 +++++++++++++
 package/uclibc/uclibc.mk                |  2 ++
 9 files changed, 62 insertions(+), 16 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
