From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 23:31:37 +0100
Subject: [Buildroot] [PATCH 2/2 v2] package/parted: fix static link
In-Reply-To: <cover.1417386541.git.yann.morin.1998@free.fr>
References: <cover.1417386541.git.yann.morin.1998@free.fr>
Message-ID: <fa1b00debbe3293a7617c2c7829e9acead92dc19.1417386541.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libuuid needs to be linked with -lintl when gettext is needed (with
locales).

For a shared build, this is solved with the DT_NEEDED ELF tags, but for
a static link, it is not pulled in automatically.

Use pkg-config to find libuuid, instead of AC_CHECK_LIB().

Second part at fixing:
    http://autobuild.buildroot.net/results/c46/c467aeec258909bb82eda77123803944f97d8df8/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>

---
Changes v1 -> v2:
  - typoes  (Peter)
---
 .../parted/parted-003-fix-static-link-uuid.patch   | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/parted/parted-003-fix-static-link-uuid.patch

diff --git a/package/parted/parted-003-fix-static-link-uuid.patch b/package/parted/parted-003-fix-static-link-uuid.patch
new file mode 100644
index 0000000..d6ec2cf
--- /dev/null
+++ b/package/parted/parted-003-fix-static-link-uuid.patch
@@ -0,0 +1,48 @@
+configure: use pkg-config to find libuuid
+
+In some conditions, libuuid may be linked with -lintl. This can be the
+case on uClibc when locales are enabled.
+
+When doing a shared link, this dependency is automatically pulled in via
+a DT_NEEDED ELF tag
+
+For a static link, there is no such mechanism to pull in dependent
+libraries.
+
+Currently, the check for libuuid is done with AC_CHECK_LIB, but this
+does not handle dependencies, and thus a stattic build fails.
+
+Use pkg-config to find libuuid, that automatically pulls in the
+dependencies of libuuid, if any.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Note: of course, that relies on the fact that libuuid installs a proper
+.pc file; a patch will be submitted upstream shortly.
+
+But even considering the current situation, where libuuid does not
+provide a proper .pc file (yet), this patch does not change the
+behaviour we've had so far; it is a bet on the future! ;-)
+
+diff -durN parted-3.1.orig/configure.ac parted-3.1/configure.ac
+--- parted-3.1.orig/configure.ac	2014-11-29 16:27:49.520560137 +0100
++++ parted-3.1/configure.ac	2014-11-29 16:32:50.799702049 +0100
+@@ -313,16 +313,7 @@
+ AC_SUBST([DL_LIBS])
+ 
+ dnl Check for libuuid
+-UUID_LIBS=""
+-AC_CHECK_LIB([uuid], [uuid_generate], [UUID_LIBS="-luuid"],
+-	[AC_MSG_ERROR(dnl
+-[GNU Parted requires libuuid - a part of the util-linux-ng package (but
+-usually distributed separately in libuuid-devel, uuid-dev or similar)
+-This can probably be found on your distribution's CD or FTP site or at:
+-    http://userweb.kernel.org/~kzak/util-linux-ng/
+-Note: originally, libuuid was part of the e2fsprogs package.  Later, it
+-moved to util-linux-ng-2.16, and that package is now the preferred source.])])
+-AC_SUBST([UUID_LIBS])
++PKG_CHECK_MODULES([UUID],[uuid])
+ 
+ dnl Check for libdevmapper
+ DM_LIBS=
-- 
1.9.1
