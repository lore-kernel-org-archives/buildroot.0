From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jul 2019 22:20:00 +0200
Subject: [Buildroot] [PATCH 00/13 v2] core: allow br2-external trees to
 provide resources usually in choices (branch yem/br2-ext-providers)
Message-ID: <cover.1564431589.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Some packages, like jpeg, openssl or the external toolchains, are
presented to the user in a kconfig choice, which precludes br2-external
trees to easily provide alternatives to those.

This series prepares Buildroot to accept br2-external trees to provide
such alternatives, that are seamlessly integrated into the existing
choices.

The naive solution would be to simply add a new entry in every such
coices, like "from a br2-external tree", and let the br2-external tree
provide standard packages. However, this solution suffers frm two flaws:
  - it is not very user-friendly,
  - it still allows to select two or more providers for such packages,
    a situation which the choice otherwise avoids.

We could have lived with that, like we do for providers of other virtual
packages that are not in a choice, but this is not so nice. And in the
end, the alternative solution, implemented in this series, see below,
will even allow us to move all virtual packages into a set of choices
(when that makes sense).

Before we can allow br2-external trees to provide them we must allow for
the kconfig variables that hold the paths to br2-external trees, to be
available through-out kconfig, not only at the end. It usually does not
matter in kconfig when a variable gets assigned a value, except when the
variable is used to source a file, at which point its value must be
known.

So, the few preparatory patches make it so that the paths are defined
early, so they are available everywhere, and makes the handling of the
internal .br-exterrnal.mk more logical and consistent.

Finally, the series introduces the possibility for br2-external trees to
provide alternatives to the three meaningful packages: external
toolchains, jpeg and openssl.

Eventually, this is documented in the manual.

In the future, we will be able to turn the GL providers into a choice.
With this new mechanism, br2-external tree will be able to expose their
GL providers, and they will appear in that choice.

Notes: we decided to go with a single do_kconfig() function in the
helper script, so the redirection is a bit disconcerting at first,
especially in the do_mk() function. The alternative would have been to
provide one funciton for each feature, and redirect the output of each
functions, like so:
    do_mk >$output_mk
    do_kconfig_paths >$output_paths_in
    do_kconfig_menus >$output_menus_in
    do_kconfig_jpeg >$output_jpeg_in

but that would have meant that each of those functions would have had to
repeat all the boilerplate:
    - the comment "this is a generated file; don't edit"
    - testing if there was no br2-external tree and returning if so
    - the loop over all the br2_names
    - the evaluation of br2_desc and br2_ext (the path)

In the end, at the expense of a bit more complexity in the redirections,
a single function was deemed nicer overall.

Changes v1 -> v2:
  - push back redirection of helpers to its own patch
  - expand manual changes
  - reorder patches to have fixes first


Regards,
Yann E. MORIN.


The following changes since commit b254cb25b2ab89ac482abd4da91d827abfe2344e

  package/zip: adjust the version to 3.0 (2019-07-29 09:26:26 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 7f27bb724debc80a274d44a169f1680e88509189

  docs/manual: document providers from br2-external (2019-07-29 22:19:03 +0200)


----------------------------------------------------------------
Yann E. MORIN (13):
      supports/scripts: declare missing local variables
      support/scripts: drop help for internal helper script
      core: move generated .br2-external kconfig file to $(BASE_DIR)
      core: rename generated .br-external.mk file
      core: simplify removal of generated br2-external files
      core: generate all br2-external files in one go
      core: drop now-useless prepare-kconfig rule
      core: prepare for generating multiple kconfig fragments
      core: split generated kconfig file
      core: allow br2-external trees to provide pre-configured toolchains
      core: allow br2-external trees to provide libjpeg
      core: allow br2-external trees to provide opensl
      docs/manual: document providers from br2-external

 Config.in                              |  10 +-
 Makefile                               |  41 +++----
 docs/manual/customize-outside-br.txt   |  91 ++++++++++++++-
 package/jpeg/Config.in                 |   3 +
 package/openssl/Config.in              |   3 +
 support/scripts/br2-external           | 196 +++++++++++++++++----------------
 toolchain/toolchain-external/Config.in |   5 +-
 7 files changed, 224 insertions(+), 125 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
