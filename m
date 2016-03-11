From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 18:41:11 +0100
Subject: [Buildroot] [PATCH 0/9 v2] core: allow for custom, local help;
	rearrange package-specific help (branch yem/help)
Message-ID: <cover.1457717002.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is an alternative proposal to support displaying custom
help, most probably from a br2-external tree (or from a local.mk, but
that'd be pretty insane).

The basic idea is to offer the user help entries for local
customisations, but without mixing them with our own help entries.

I believe we want to keep them separate, as inter-mixing the two could
lead users to believe those addtional help entries are "native" in
buildroot, when they are not.

The same way we expose all of br2-external config options under a
sub-menu labelled "User-provided options" (although this is mostly a
technical limitation/artifact), we do similarly for the custom help,
albeit with a slight shorter moniker, 'help-custom'.

The first two patches implement this new make target, the first by
adding it as a purely separate and new target, the scond by making it
appended after out internal help.

Third patch adds a new helper make function, that can be used to
pretty-print the package-specific help. This macro is added to to the
manual, as an *example* of what the custom help could use.

The macro is then used to implement per-package specific help (which is
currently only about kconfig-related changes, but can not easily be done
in the kconfig-package infra) into the packages themselves, to clean up
the main help code (the entries are still displayed there, they are just
defined in each concerned package).

Thanks to J?r?me for his initial proposal, and Arnout for
before-inception suggestions:
    http://lists.busybox.net/pipermail/buildroot/2016-March/155415.html


Additional notes:

  - only the first two patches are what is required to get custom help.
    The followup patches only address the other part of J?r?me's patch,
    which is about moving patckage-specifi help to the concerned
    packages;

  - the new custom help is not intermixed with our internal help; rather
    it is appended to it;

  - indeed, this macro does not allow packages to expose arbitrary help.
    It does not however prevent packages from documenting arbitrary
    rules. If a package wants to provide arbitrary help, then it would
    probably do in its .mk file something like:
        LIBFOO_HELP = "libfoo-help : print help for libfoo"
        libfoo-help:
            @cat my-biggish-help-file



Changes v1 -> v2:
  - rename the custom help make target
  - make it explicit that it is *absolutely* free-form
  - better document it in the manual
  - print custom help after our internal help
  - properly pretty-print on multi lines

(Sorry, I haven't carried Arnout's reviews so far...)

Regards,
Yann E. MORIN.


The following changes since commit 0b7b84310c3781c346eea4c114c8cb4e97bbd8ea:

  olimex_imx233_olinuxino_defconfig: genimage support (2016-03-11 13:14:54 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/help

for you to fetch changes up to b508f49279beea5e3f1b823408aa12ad7d9a35f9:

  boot/barebox: use the generic help rules (2016-03-11 18:20:45 +0100)

----------------------------------------------------------------
Yann E. MORIN (9):
      core: add the possibility to provide help for custom rules
      core: also display the custom help with our main help
      core/pkg-utils: add a macro to pretty-print a help entry
      docs/manual: print-help can be used in help-custom
      core/pkg-generic: add help about package-specific rules
      package/busybox: use the generic help rules
      linux: add the generic help rules
      package/uclibc: use the generic help rules
      boot/barebox: use the generic help rules

 Makefile                                | 27 ++++++++++-----------------
 boot/barebox/barebox.mk                 |  4 ++++
 docs/manual/adding-packages-generic.txt |  6 ++++++
 docs/manual/customize-outside-br.txt    | 26 ++++++++++++++++++++++++++
 linux/linux.mk                          |  6 ++++++
 package/busybox/busybox.mk              |  2 ++
 package/pkg-generic.mk                  |  2 ++
 package/pkg-utils.mk                    | 22 ++++++++++++++++++++++
 package/uclibc/uclibc.mk                |  2 ++
 9 files changed, 80 insertions(+), 17 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
