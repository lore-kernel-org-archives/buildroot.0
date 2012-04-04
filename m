From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed,  4 Apr 2012 14:50:19 +0200
Subject: [Buildroot] [PATCH] package: set PKG_CONFIG_SYSROOT_DIR in
	HOST_MAKE_ENV
Message-ID: <1333543819-27718-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A host package that uses AUTORECONF (such as host-libglib2)
may end up running './config.status --recheck'. This will
call the configure script with the environment variables
set in HOST_MAKE_ENV. If PKG_CONFIG_SYSROOT_DIR is missing
this will cause the hardcoded sysroot dir take effect leading
to wrong paths.

See commit 22acade2ec311 which works around this problem by
fiddling with the generated .pc file. This commit becomes
obsolete with this fix.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Cc: Daniel Mack <zonque@gmail.com>
---
 package/Makefile.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index dc8d038..c344c6b 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -222,6 +222,7 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 HOST_MAKE_ENV=PATH=$(HOST_PATH) \
 		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+		PKG_CONFIG_SYSROOT_DIR="/" \
 		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig" \
 		PERLLIB="$(HOST_DIR)/usr/lib/perl"
 
-- 
1.7.9.1
