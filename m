From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2017 21:57:23 +1300
Subject: [Buildroot] [git commit] ccache: Patch to fix toolchain-wrapper's
	--sysroot
Message-ID: <20170127085836.B51CC81FCB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da8584d2ae46059a05d16dc91d616e12afb67044
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ccache doesn't rewrite the --sysroot base_dir from toolchain-wrapper
correctly. Resulting in a large number of cache misses when building
from different base directories.

A fix has already been accepted to the ccache upstream[1], but won't be
released until ccache 3.4. (Was noted as an improvement, so unsure
of the 3.4 release timing)

[1] https://github.com/ccache/ccache/pull/132

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...gument-to-sysroot-option-to-relative-path.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/ccache/0001-Convert-argument-to-sysroot-option-to-relative-path.patch b/package/ccache/0001-Convert-argument-to-sysroot-option-to-relative-path.patch
new file mode 100644
index 0000000..33db7d4
--- /dev/null
+++ b/package/ccache/0001-Convert-argument-to-sysroot-option-to-relative-path.patch
@@ -0,0 +1,43 @@
+From fe42d6f7b739e8d42811bf46bcccfafa728847a2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Mathias=20De=20Mar=C3=A9?= <mathias.de_mare@nokia.com>
+Date: Mon, 19 Sep 2016 10:38:13 +0200
+Subject: [PATCH] Convert argument to '--sysroot' option to relative path
+
+Previously, only the argument to '--sysroot=' was converted.
+This changeset adds support for '--sysroot'.
+
+Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
+Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
+---
+ ccache.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/ccache.c b/ccache.c
+index 8ffadcc..76139b9 100644
+--- a/ccache.c
++++ b/ccache.c
+@@ -2407,6 +2407,21 @@ cc_process_args(struct args *args, struct args **preprocessor_args,
+ 			free(option);
+ 			continue;
+ 		}
++		// Alternate form of specifying sysroot without =
++		if (str_eq(argv[i], "--sysroot")) {
++			if (i == argc-1) {
++				cc_log("Missing argument to %s", argv[i]);
++				stats_update(STATS_ARGS);
++				result = false;
++				goto out;
++			}
++			args_add(stripped_args, argv[i]);
++			char *relpath = make_relative_path(x_strdup(argv[i+1]));
++			args_add(stripped_args, relpath);
++			i++;
++			free(relpath);
++			continue;
++		}
+ 		if (str_startswith(argv[i], "-Wp,")) {
+ 			if (str_eq(argv[i], "-Wp,-P")
+ 			    || strstr(argv[i], ",-P,")
+-- 
+2.8.3
+
