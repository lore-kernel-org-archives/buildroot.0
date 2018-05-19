From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 14:07:10 +0200
Subject: [Buildroot] [git commit] gdb: actually disable gdbserver if
 BR2_PACKAGE_GDB_SERVER is unset
Message-ID: <20180519121600.49E1C88459@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c7ce893a01b3f1fa81ce41580465a472431064c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gdb configure script is given --enable-gdbserver when
BR2_PACKAGE_GDB_SERVER is set, but it is not given --disable-gdbserver
when BR2_PACKAGE_GDB_SERVER is unset.

gdb gdb/configure.ac defaults to enabling gdbserver in "native"
(host=target) cases, which is always the case when buildroot builds a
gdb which runs on the target hardware. The gdbserver will overwrite
BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY gdbserver, if any.

Fix that by passing --disable-gdbserver when BR2_PACKAGE_GDB_SERVER is
unset.

Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/gdb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 215f473cc0..5661b4a465 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -109,7 +109,7 @@ GDB_CONF_OPTS = \
 	--without-x \
 	--disable-sim \
 	$(GDB_DISABLE_BINUTILS_CONF_OPTS) \
-	$(if $(BR2_PACKAGE_GDB_SERVER),--enable-gdbserver) \
+	$(if $(BR2_PACKAGE_GDB_SERVER),--enable-gdbserver,--disable-gdbserver) \
 	--with-curses \
 	--without-included-gettext \
 	--disable-werror \
