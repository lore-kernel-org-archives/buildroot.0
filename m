From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Mon, 25 Nov 2019 12:42:21 +0000
Subject: [Buildroot] [PATCH v2] pkgconf: always keep system libs
Message-ID: <20191125124221.248655-1-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Normally pkgconf ignores the system include and system lib directories,
which is useful because it allows the correct ordering of -I, -isystem
and compiler default search paths. However, many packages use libtool,
which relies on pkgconf to print the system libs dirs in order to locate
the Libtool Archive (.la) files.

Instead of adding PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 to each of these
packages, just allow system libs globally in the pkg-config wrapper.
This allows libtool to find the .la files, and retains the correct
include ordering.

Fixes (at least):
- http://autobuild.buildroot.org/results/a79e0487135ad90530595d5c6ecc32f9c8cea7c4/
- http://autobuild.buildroot.net/results/089/08952dbf89bf3c49da7697943441cee411940420/

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
Tested-by: Peter Seiderer <ps.report@gmx.net>
---
 package/pkgconf/pkg-config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkgconf/pkg-config.in b/package/pkgconf/pkg-config.in
index f411eb0926..e5a23a10f7 100644
--- a/package/pkgconf/pkg-config.in
+++ b/package/pkgconf/pkg-config.in
@@ -9,4 +9,4 @@ PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-${DEFAULT_PKG_CONFIG_LIBDIR}} \
 	PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-${DEFAULT_PKG_CONFIG_SYSROOT_DIR}} \
 	PKG_CONFIG_SYSTEM_INCLUDE_PATH=${PKG_CONFIG_SYSTEM_INCLUDE_PATH:-${DEFAULT_PKG_CONFIG_SYSTEM_INCLUDE_PATH}} \
 	PKG_CONFIG_SYSTEM_LIBRARY_PATH=${PKG_CONFIG_SYSTEM_LIBRARY_PATH:-${DEFAULT_PKG_CONFIG_SYSTEM_LIBRARY_PATH}} \
-	exec ${PKGCONFDIR}/pkgconf @STATIC@ "$@"
+	exec ${PKGCONFDIR}/pkgconf --keep-system-libs @STATIC@ "$@"
-- 
2.23.0
