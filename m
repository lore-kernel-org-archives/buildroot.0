From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Aug 2017 23:37:06 +0200
Subject: [Buildroot] [git commit] gdb: force to use ncurses and not termcap
	for host-gdb
Message-ID: <20170801213301.789D8821E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c36c65ab8d4ebbac76799fe956a218d9c382bc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/gdb/gdb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 73b0ea0..1fef0d4 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -203,6 +203,7 @@ HOST_GDB_CONF_OPTS = \
 	--enable-threads \
 	--disable-werror \
 	--without-included-gettext \
+	--with-curses \
 	$(GDB_DISABLE_BINUTILS_CONF_OPTS)
 
 ifeq ($(BR2_PACKAGE_HOST_GDB_TUI),y)
