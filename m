From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Sep 2017 23:28:14 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] gdb: force to use ncurses
	and not termcap for host-gdb
Message-ID: <20170904215238.66A38820E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64e480fd7ae7554a95b748448fc92cf369c9940e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Both our target and host gdb depend on ncurses (host-ncurses for
host-gdb, of course). However, while for the target we passs
--with-curses, we are not doing this for the host variant. Due to
this, host-gdb default to using the termcap library: if such a library
is available on the build system, it will be used instead of the
host-ncurses we have built. This causes the host gdb binary to depend
on a library that we do not provide in $(HOST_DIR), breaking the
principle of a standalone SDK (which should only depend on the C
library).

To solve this, we simply pass --with-curses in HOST_GDB_CONF_OPTS,
which forces host-gdb to use the host-ncurses library.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 8c36c65ab8d4ebbac76799fe956a218d9c382bc1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/gdb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index d829990..618111d 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -189,6 +189,7 @@ HOST_GDB_CONF_OPTS = \
 	--enable-threads \
 	--disable-werror \
 	--without-included-gettext \
+	--with-curses \
 	$(GDB_DISABLE_BINUTILS_CONF_OPTS)
 
 ifeq ($(BR2_PACKAGE_HOST_GDB_TUI),y)
