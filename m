From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Jun 2019 22:25:47 +0200
Subject: [Buildroot] [PATCH 0/4] libglib: fix build with NLS or in Thumb
 mode (branch yem/meson-per-pkg-flags)
Message-ID: <cover.1561407936.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

With meson, it is impossible to pass extra CFLAGS or override them
entirely from the command line (i.e. neither in the environment nor as
command line arguments). Worse, if we were to do so, they would be
passed to the host compiler, not the target compiler.

This series adds two changes to the meson infrastructure:
  - a fix for when the *FLAGS variables are empty ut with spaces,
  - the ability for packages to pass their own *FLAGS if they need to.

Finally, two changes are done in libglib2, that take advantage of this
new feature:
  - fix the build when the external gettext provides the i18n functions,
  - fix the build on ARM in Thumb mode.

Thanks to Peter S. for the initial infra patch, thanks to Thomas for a
previous review, and thanks to Adam for investigting a bug that led to
the first patch and parts of the second patch, as well as proof-reading
my crappy commit logs; any leftover typo is entirely his fault, now!
Muahaha! ;-]


Regards,
Yann E. MORIN.


The following changes since commit cd1b1773dd6cf585c18ea836192787b1f20727ad

  package/libglib2: security bump to version 2.60.4 (2019-06-24 06:36:21 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to cc3b7eda26b3838277ec43a1c956dbb8c55cf602

  package/libglib2: fix build on ARM in Thumb mode (2019-06-24 21:58:51 +0200)


----------------------------------------------------------------
Peter Seiderer (1):
      infra/pkg-meson: allow packages to pass custom compiler/linker flags

Yann E. MORIN (3):
      package/meson: fix empty arguments in cross-compilation.conf
      package/libglib2: fix NLS build on musl and uclibc
      package/libglib2: fix build on ARM in Thumb mode

 docs/manual/adding-packages-meson.txt | 12 ++++++++++++
 package/libglib2/libglib2.mk          |  5 ++++-
 package/meson/meson.mk                | 20 +++++++++++++-------
 package/pkg-meson.mk                  | 14 +++++++++++---
 4 files changed, 40 insertions(+), 11 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
