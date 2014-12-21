From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 22:05:41 +0100
Subject: [Buildroot] [git commit] package/gdb: fix shared-only build
Message-ID: <20141221210546.6A6C87FD1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=485ae682c41fca8bb2c9c0d2dd1f2ebcfe41287f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The shared build only of gdb is actually not supported.

When --disable-static is given to the gdb's main configure script,
it also disable the static build of bundled libraries like bfd, readline
and opcodes, which must be build statically.

Force the static build of bundled libraries by adding --enable-static in
GDB_CONF_OPTS.

Fixes:
http://autobuild.buildroot.net/results/219/21979e730dca1fce5bdda9a4c7fad4485e788866/
http://autobuild.buildroot.net/results/c10/c1096d0bd22de5c6feba848f743601ad0416a944/
http://autobuild.buildroot.net/results/d8a/d8a5bcc7fa374fb0c916a9d0f33ef283109cb404/
http://autobuild.buildroot.net/results/22a/22a86d0f1df0fc4698c0f734f3d659e6317404a4/
http://autobuild.buildroot.net/results/404/404e61e5c30040ee5756f4b5839149dca38660d4/

And many more.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index dbec760..aa22193 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -74,6 +74,8 @@ GDB_CONF_ENV = \
 	bash_cv_have_mbstate_t=yes \
 	gdb_cv_func_sigsetjmp=yes
 
+# The shared only build is not supported by gdb, so enable static build for
+# build-in libraries with --enable-static.
 GDB_CONF_OPTS = \
 	--without-uiout \
 	--disable-gdbtk \
@@ -83,7 +85,8 @@ GDB_CONF_OPTS = \
 	$(if $(BR2_PACKAGE_GDB_SERVER),--enable-gdbserver) \
 	--with-curses \
 	--without-included-gettext \
-	--disable-werror
+	--disable-werror \
+	--enable-static
 
 ifeq ($(BR2_PACKAGE_GDB_TUI),y)
 	GDB_CONF_OPTS += --enable-tui
