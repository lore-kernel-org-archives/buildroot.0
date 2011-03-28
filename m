From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 28 Mar 2011 19:16:33 +0200
Subject: [Buildroot] [PATCH 0 of 2] ncurses: fix hanging installation due to
 old version of tic (series)
Message-ID: <patchbomb.1301332593@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During installation of ncurses, the 'tic' program from the host is used. In
some cases, this version of tic is too old for the data to be processed, and
the installation hangs indefinitely (already reported in July 2010, see [1])

With this patch, a static version of tic is built and used during the
installation step of target ncurses. This method is based on a similar fix
in Gentoo Linux (see [2] for the report and [3] for the solution).

Note that in order to build a host version of tic, I used the 'host'
infrastructure of GENTARGETS. To avoid the install step (as it is also using
the wrong tic and is really not needed) I added the recognition of
HOST_PKGFOO_INSTALL_HOST to GENTARGETS, as a separate patch.

[1] http://lists.busybox.net/pipermail/buildroot/2010-July/036100.html
[2] http://bugs.gentoo.org/show_bug.cgi?id=249363#c25
[3] http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-libs/ncurses/ncurses-5.7-r2.ebuild

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/Makefile.package.in |   6 +++++-
 package/ncurses/ncurses.mk  |  21 ++++++++++++++++++++-
 2 files changed, 25 insertions(+), 2 deletions(-)
