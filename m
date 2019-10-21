From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Mon, 21 Oct 2019 13:38:10 +0100
Subject: [Buildroot] [PATCH] pkgconf: Add HOST_MAKE_ENV sytem include and lib
Message-ID: <20191021123810.23135-1-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Recently, a change to the pkg-config wrapper made it more explicit about
where the system include and library directories are, so that pkgconf
does not print them. See upstream commit 9cc8680.

By default, we configure the pkg-config wrapper for the target sysroot,
however the default system include and library directories are not
reconfigured for the host build environment (they still point at the
target sysroot). Fix this by adding the host system include and library
directories to HOST_MAKE_ENV.

Note: this isn't likely to fix any bugs at present, but the incorrect
configuration may hide an include-order related error which the original
patch was supposed to fix!

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/Makefile.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index 0a7899c852..3ae4d4d4e9 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -309,6 +309,8 @@ HOST_MAKE_ENV = \
 	PATH=$(BR_PATH) \
 	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 	PKG_CONFIG_SYSROOT_DIR="/" \
+	PKG_CONFIG_SYSTEM_INCLUDE_PATH="/usr/include" \
+	PKG_CONFIG_SYSTEM_LIBRARY_PATH="/usr/lib" \
 	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
 	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig"
-- 
2.21.0
