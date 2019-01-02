From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  2 Jan 2019 18:36:38 +0100
Subject: [Buildroot] [PATCH v2] package/pkgconf: fix behavior of pkg-config
 --version
Message-ID: <20190102173639.30553-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some odd reason, the new pkg-config 1.5.3 changed the behavior of
"pkg-config --version": as soon as another argument than "--version"
is passed, the code assumes the user wanted to run "--modversion"
instead.

Sadly, this breaks badly with our pkg-config wrapper that
unconditionally passes --static to pkg-config when
BR2_STATIC_LIBS=y. When ffmpeg calls "pkg-config --version" to test if
pkg-config is available and functional, it's actually "pkg-config
--static --version" that gets executed. pkg-config assumes that the
user wanted to use --modversion and bails out with an error.

This causes a build failure of ffmpeg in BR2_STATIC_LIBS=y
configuration.

This misbehavior of pkg-config has been reported upstream at
https://git.dereferenced.org/pkgconf/pkgconf/issues/19, but until it
gets fixed, we work around the issue by reverting the commit that does
the "hey let's assume you're using --modversion if --version is passed
with more than one argument".

Fixes:

  http://autobuild.buildroot.net/results/ed82a95e1866ea2caadbb3433b2a255b2cf621d2/
  (and plenty of other ffmpeg + BR2_STATIC_LIBS=y build failures)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes since v1:
- Revert the problematic upstream commit instead of doing a workaround
  specific to the -static option.
---
 ...me-modversion-insted-of-version-if-o.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/pkgconf/0002-Revert-main-assume-modversion-insted-of-version-if-o.patch

diff --git a/package/pkgconf/0002-Revert-main-assume-modversion-insted-of-version-if-o.patch b/package/pkgconf/0002-Revert-main-assume-modversion-insted-of-version-if-o.patch
new file mode 100644
index 0000000000..e79bea93a5
--- /dev/null
+++ b/package/pkgconf/0002-Revert-main-assume-modversion-insted-of-version-if-o.patch
@@ -0,0 +1,45 @@
+From 4ccef40918a539905a2951bfb81cf8dba4a245c6 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Wed, 2 Jan 2019 18:15:50 +0100
+Subject: [PATCH] Revert "main: assume --modversion insted of --version if
+ other flags or module names are provided"
+
+This reverts commit 12a0eb124cea85586e57f33c91a1e4c73459eef6, as it
+causes pkg-config to assume --modversion is used when something as
+simple as 'pkg-config --static --version' is used, leading to a
+failure instead of the expected behavior: the one of "pkg-config
+--version".
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ cli/main.c | 14 ++------------
+ 1 file changed, 2 insertions(+), 12 deletions(-)
+
+diff --git a/cli/main.c b/cli/main.c
+index b52cc85..c5acc10 100644
+--- a/cli/main.c
++++ b/cli/main.c
+@@ -955,18 +955,8 @@ main(int argc, char *argv[])
+ 
+ 	if ((want_flags & PKG_VERSION) == PKG_VERSION)
+ 	{
+-		if (argc > 2)
+-		{
+-			fprintf(stderr, "%s: --version specified with other options or module names, assuming --modversion.\n", argv[0]);
+-
+-			want_flags &= ~PKG_VERSION;
+-			want_flags |= PKG_MODVERSION;
+-		}
+-		else
+-		{
+-			version();
+-			return EXIT_SUCCESS;
+-		}
++		version();
++		return EXIT_SUCCESS;
+ 	}
+ 
+ 	if ((want_flags & PKG_HELP) == PKG_HELP)
+-- 
+2.20.1
+
-- 
2.20.1
