From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 05 Aug 2014 12:36:51 +0200
Subject: [Buildroot] [PATCH 0 of 2 v3] Fix pkg-kconfig infra
Message-ID: <patchbomb.1407235011@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series fixes a nasty regression introduced with the pkg-kconfig
infrastructure recently applied, whereby kconfig packages are always
rebuilt on each 'make', as detected by Yann.

This series incorporates an alternative solution than v2 sent out by Yann.
Instead of re-touching the stamp file, make sure that such timing problems
cannot occur by calling 'make oldconfig' from within pkg-kconfig itself,
instead of from the package. Looking at the to-be-converted linux package,
oldconfig is also run there, so it makes sense to add this to pkg-kconfig.

Contrary to Yann's solution, if a package makes another change to .config
from the configure script, a rebuild will happen still. I consider that an
error in the package. Any 'fixup' of the config is supposed to be in the
KCONFIG_FIXUP_CMDS.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Yann E. Morin (1)
  infra/pkg-kconfig: join comments to the related code-block

Thomas De Schampheleire (1)
  infra/pkg-kconfig: incorporate oldconfig call to avoid endless rebuilds

 package/busybox/busybox.mk |  2 --
 package/pkg-kconfig.mk     |  9 ++-------
 package/uclibc/uclibc.mk   |  6 ------
 3 files changed, 2 insertions(+), 15 deletions(-)
