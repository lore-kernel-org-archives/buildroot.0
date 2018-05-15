From: Anssi Hannula <anssi.hannula@bitwise.fi>
Date: Tue, 15 May 2018 16:34:42 +0300
Subject: [Buildroot] [PATCH] gdb: actually disable gdbserver if
 BR2_PACKAGE_GDB_SERVER is unset
Message-ID: <20180515133442.16607-1-anssi.hannula@bitwise.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/gdb/gdb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index b69193af51..b2e07602f3 100644
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
-- 
2.16.3
