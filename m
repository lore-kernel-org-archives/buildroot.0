From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 20 Jun 2014 21:11:06 +0200
Subject: [Buildroot] [PATCH 3 of 3 v2] pkgconf: don't double prefix
 lib/include paths with sysroot
In-Reply-To: <patchbomb.1403291463@localhost>
References: <patchbomb.1403291463@localhost>
Message-ID: <ff17031f15dae2d6214b.1403291466@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A .pc file could contain statements of the form:
    -L/usr/lib
but also:
    -L/path/to/sysroot/usr/lib

The latter form typically occurs when the dependency was configured with a
statement like --with-xxx=$(STAGING_DIR)/usr.

pkgconf only expects the first form, and prefixes it with the specified
sysroot. However, this strategy would result in a double sysroot in the
second case:
    -L/path/to/sysroot/path/to/sysroot/usr/lib

This patch checks for the presence of the sysroot in the specified -L or -I
directives, and only adds the sysroot when not already present.

Partially fixes bug #5750 (https://bugs.busybox.net/show_bug.cgi?id=5750)

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: no changes

 package/pkgconf/pkgconf-02-fix-double-sysroot.patch |  40 +++++++++++++++
 1 files changed, 40 insertions(+), 0 deletions(-)

diff -r 6e90b5d19205 -r ff17031f15da package/pkgconf/pkgconf-02-fix-double-sysroot.patch
--- /dev/null	Thu Jan 01 00:00:00 1970 +0000
+++ b/package/pkgconf/pkgconf-02-fix-double-sysroot.patch	Thu Jun 19 21:16:17 2014 +0200
@@ -0,0 +1,40 @@
+pkgconf: don't double prefix lib/include paths with sysroot
+
+A .pc file could contain statements of the form:
+    -L/usr/lib
+but also:
+    -L/path/to/sysroot/usr/lib
+
+The latter form typically occurs when the dependency was configured with a
+statement like --with-xxx=$(STAGING_DIR)/usr.
+
+pkgconf only expects the first form, and prefixes it with the specified
+sysroot. However, this strategy would result in a double sysroot in the
+second case:
+    -L/path/to/sysroot/path/to/sysroot/usr/lib
+
+This patch checks for the presence of the sysroot in the specified -L or -I
+directives, and only adds the sysroot when not already present.
+
+Upstream-status: will be submitted
+
+Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
+
+---
+ main.c |  3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+
+diff -r 16865d81819f -r 9d8e1737687f main.c
+--- a/main.c	Mon Jun 16 19:47:52 2014 +0200
++++ b/main.c	Mon Jun 16 19:48:15 2014 +0200
+@@ -82,7 +82,8 @@
+ 	{
+ 	case 'L':
+ 	case 'I':
+-		return sysroot_dir;
++		if (strncmp(sysroot_dir, frag->data, strlen(sysroot_dir)) != 0)
++			return sysroot_dir;
+ 	default:
+ 		break;
+ 	}
