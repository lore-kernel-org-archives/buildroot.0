From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Apr 2019 21:24:04 +0200
Subject: [Buildroot] [PATCH 00/12] core: allow br2-external trees to provide
 resources usually in choices (branch yem/br2-ext-providers)
Message-ID: <cover.1555960978.git.yann.morin.1998@free.fr>
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
such alternatives, that are seamlessly integrated in the existing
choices.

Before we can allow br2-external trees to provide them we must allow for
the kconfig variables that hold the paths to br2-external trees, to be
available through-out kconfig, not only at the end. It usually does not
matter in kconfig when a variable gets assigned a value, except when the
variable is used to source a file, at which point its value must be
known.

So, the few preparatory patches make it so that the paths are defined
early, so they are available everywhere.

Finally, the series introduces the possibility for br2-external trees to
provide alternatives to the three meaningful packages: external
toolchains, jpeg and openssl.

Eventually, this is documented in the manual.

Notes: we decided to go with a single do_kconfig() function in the helper
script, so the redirection is a bit disconcerting at first, especially in
the do_mk() function. The alternative would have been to provide one
funciton for each feature, and redirect the output of each functions,
like so:
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

For reference, the alternative (unfinished) implementation can be seen
at:
    https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/br2-ext-toolchain


Regards,
Yann E. MORIN.


The following changes since commit f243f57abcdb415b57b8b887e9cc35bf69163224

  package/jemalloc: fix build on or1k with gcc < 6 (2019-04-21 22:32:21 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to d788f64db79f5ccefe552a7ff201005a3c045240

  docs/manual: document providers from br2-external (2019-04-22 21:18:05 +0200)


----------------------------------------------------------------
Yann E. MORIN (12):
      support/scripts: drop help for internal helper script
      core: move generated .br2-external kconfig file to $(BASE_DIR)
      core: rename generated .br2-external.mk file
      core: simplify removal of generated br2-external files
      supports/scripts: declare missing local variable
      core: generate all br2-external files in one go
      core: drop now-useless prepare-kconfig rule
      core: split generated kconfig file
      core: allow br2-external trees to provide pre-configured toolchains
      core: allow br2-external trees to provide libjpeg
      core: allow br2-external trees to provide opensl
      docs/manual: document providers from br2-external

 Config.in                              |  10 +-
 Makefile                               |  41 +++-----
 docs/manual/customize-outside-br.txt   |  81 +++++++++++++-
 package/jpeg/Config.in                 |   3 +
 package/openssl/Config.in              |   3 +
 support/scripts/br2-external           | 187 +++++++++++++++++----------------
 toolchain/toolchain-external/Config.in |   5 +-
 7 files changed, 206 insertions(+), 124 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
