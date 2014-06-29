From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 12:41:00 +0200
Subject: [Buildroot] [git commit] pkgconf: don't double prefix lib/include
	paths with sysroot
Message-ID: <20140629104106.7CF7C99EB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=17eaa5d3ab1982a89c82e603484edbed8f712e16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../pkgconf/pkgconf-02-fix-double-sysroot.patch    |   40 ++++++++++++++++++++
 1 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/package/pkgconf/pkgconf-02-fix-double-sysroot.patch b/package/pkgconf/pkgconf-02-fix-double-sysroot.patch
new file mode 100644
index 0000000..14bc34a
--- /dev/null
+++ b/package/pkgconf/pkgconf-02-fix-double-sysroot.patch
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
