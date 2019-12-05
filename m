From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu,  5 Dec 2019 17:14:48 +0000
Subject: [Buildroot] [PATCH v1 01/30] pkgconf: always keep system libs
In-Reply-To: <20191205171517.96639-1-michael.drake@codethink.co.uk>
References: <20191205171517.96639-1-michael.drake@codethink.co.uk>
Message-ID: <20191205171517.96639-2-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Preston <thomas.preston@codethink.co.uk>

The previous change to pkgconf 9cc8680fe5, which tells it about the
target sysroot system lib and include dirs so that they are not printed
by default, introduced a regression where packages relying on libtool
could no longer see Libtool Archive (.la) files in the system lib
directory.

Since we still rely on pkgconf not printing the system include directory
to allow the correct ordering of -I, -isystem and compiler default
search paths, and it is still correct behaviour to tell pkgconf about the
new system lib dir (in the target sysroot), we should not revert the
previous change.

Instead, we should explicitly request pkgconf to print the system libs
globally, so that all packages which rely on libtool can find the
Libtool Archive files. For system lib directories, this is the same
pkgconf behaviour as before the 9cc8680fe5 change.

Fixes:
- http://autobuild.buildroot.org/results/a79e0487135ad90530595d5c6ecc32f9c8cea7c4/
- http://autobuild.buildroot.net/results/089/08952dbf89bf3c49da7697943441cee411940420/

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
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
2.20.1
