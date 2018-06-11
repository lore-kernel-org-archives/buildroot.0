From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 22:46:18 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] gdb: actually disable
 gdbserver if BR2_PACKAGE_GDB_SERVER is unset
Message-ID: <20180611211536.CAAD28832D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61b59be74eb03e29d2136589565498eed0fb8057
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

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
(cherry picked from commit 9c7ce893a01b3f1fa81ce41580465a472431064c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/gdb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index ad81818a35..0981b6ef53 100644
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
