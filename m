From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:37:15 +0200
Subject: [Buildroot] [git commit] parted: remove libintl static linking
	handling
Message-ID: <20170704233520.560DC8013D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72b8cb61755b2813a2d572240840b8642664d345
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We no longer support building the full-blown libintl in static linking
scenarios, as it causes too many problems. Therefore, remove the patch
that was handling this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...musl.patch => 0003-fix-includes-for-musl.patch} |  0
 package/parted/0003-fix-static-link-uuid.patch     | 48 ----------------------
 2 files changed, 48 deletions(-)

diff --git a/package/parted/0004-fix-includes-for-musl.patch b/package/parted/0003-fix-includes-for-musl.patch
similarity index 100%
rename from package/parted/0004-fix-includes-for-musl.patch
rename to package/parted/0003-fix-includes-for-musl.patch
diff --git a/package/parted/0003-fix-static-link-uuid.patch b/package/parted/0003-fix-static-link-uuid.patch
deleted file mode 100644
index d6ec2cf..0000000
--- a/package/parted/0003-fix-static-link-uuid.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-configure: use pkg-config to find libuuid
-
-In some conditions, libuuid may be linked with -lintl. This can be the
-case on uClibc when locales are enabled.
-
-When doing a shared link, this dependency is automatically pulled in via
-a DT_NEEDED ELF tag
-
-For a static link, there is no such mechanism to pull in dependent
-libraries.
-
-Currently, the check for libuuid is done with AC_CHECK_LIB, but this
-does not handle dependencies, and thus a stattic build fails.
-
-Use pkg-config to find libuuid, that automatically pulls in the
-dependencies of libuuid, if any.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
-Note: of course, that relies on the fact that libuuid installs a proper
-.pc file; a patch will be submitted upstream shortly.
-
-But even considering the current situation, where libuuid does not
-provide a proper .pc file (yet), this patch does not change the
-behaviour we've had so far; it is a bet on the future! ;-)
-
-diff -durN parted-3.1.orig/configure.ac parted-3.1/configure.ac
---- parted-3.1.orig/configure.ac	2014-11-29 16:27:49.520560137 +0100
-+++ parted-3.1/configure.ac	2014-11-29 16:32:50.799702049 +0100
-@@ -313,16 +313,7 @@
- AC_SUBST([DL_LIBS])
- 
- dnl Check for libuuid
--UUID_LIBS=""
--AC_CHECK_LIB([uuid], [uuid_generate], [UUID_LIBS="-luuid"],
--	[AC_MSG_ERROR(dnl
--[GNU Parted requires libuuid - a part of the util-linux-ng package (but
--usually distributed separately in libuuid-devel, uuid-dev or similar)
--This can probably be found on your distribution's CD or FTP site or at:
--    http://userweb.kernel.org/~kzak/util-linux-ng/
--Note: originally, libuuid was part of the e2fsprogs package.  Later, it
--moved to util-linux-ng-2.16, and that package is now the preferred source.])])
--AC_SUBST([UUID_LIBS])
-+PKG_CHECK_MODULES([UUID],[uuid])
- 
- dnl Check for libdevmapper
- DM_LIBS=
