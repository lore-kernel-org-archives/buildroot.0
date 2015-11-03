From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  3 Nov 2015 20:05:59 +0100
Subject: [Buildroot] [PATCH 0/2 v2] core: check for improper install paths
	(branch yem/pkg-no-double-build-dir)
Message-ID: <cover.1446577223.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

URGENT! Please review...

This series adds a new post-step hook, that applies to both
install-target and install-staging, and checks that packages do not
install files in paths like:
    $(TARGET_DIR)/$(O)
    $(STAGING_DIR)/$(O)

Having one (or both) of those directories means that a package is
confusing DESTDIR, PREFIX and SYSROOT_DIR.

Such a confusion is currently caused by our host-pkgconf, that happilly
(but wrongly) prepends the sysroot directory to all paths it may return,
whether they be queried via one of --cflags, --cflags-only-I, --libs or
--libs-only-L, or whether they be directly queried via --variable=XXX.

Another source of confusion may come from generic-packages, wihch badly
coded custom Makefiles (even though I haven't noticed any so far, it is
bound to happen sooner or later...).

We want to detect such broken packages *ASAP* so we can fix them before
the release (or at best come up with a fallback plan).

Kown to break are quite a few packages from the Xorg stack, with more
than 15 detected so far, but maybe more since I had a contingency plan
to fix them in bulk, see previous RFC:
    http://lists.busybox.net/pipermail/buildroot/2015-November/143562.html

Also, some packages that want to call moc (from Qt4 for sure, possibly
from Qt5 too) also have a similar issue, see:
    http://lists.busybox.net/pipermail/buildroot/2015-October/141429.html

Although the second case is already causing build failures (and will
require a fix of its own), the first case has so far gone unnoticed (I
just stumbled on it by chance while reviewing the EFL bump series, which
is now kind of blocked by this issue).


Changes RFC -> v2:
  - only keep those two patches, drop the Xorg fixups.


Regards,
Yann E. MORIN.


The following changes since commit b8527eb3c017c74c861db8b21f8a0def55988382:

  poco: add patches to fix pcre link issue and library installation (2015-11-03 17:18:33 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/pkg-no-double-build-dir

for you to fetch changes up to fe19a41362f17e9435b0da14097ce9fecda38780:

  core/pkg-generic: check proper package installation (2015-11-03 19:59:31 +0100)

----------------------------------------------------------------
Yann E. MORIN (2):
      core/pkg-generic: allow step hooks to fail a step
      core/pkg-generic: check proper package installation

 package/pkg-generic.mk | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
