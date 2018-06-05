From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 22:09:36 +0200
Subject: [Buildroot] [git commit] oprofile: fix musl build
Message-ID: <20180605200809.8969183C1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f84d52bb402d60ab53bc9ba185a540d61a2a4ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch to replace undeclared basename call by op_basename

Fixes:
 - http://autobuild.buildroot.net/results/39ba30f4ec94e176e3d5d5b5ced37a0aa030cc5a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...archive-replace-basename-with-op_basename.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/oprofile/0002-oparchive-replace-basename-with-op_basename.patch b/package/oprofile/0002-oparchive-replace-basename-with-op_basename.patch
new file mode 100644
index 0000000000..a2b580dad7
--- /dev/null
+++ b/package/oprofile/0002-oparchive-replace-basename-with-op_basename.patch
@@ -0,0 +1,34 @@
+From 5da92e18a538c630cb06a3dbb2affd9bfc128901 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 5 Jun 2018 13:31:34 +0200
+Subject: [PATCH] oparchive: replace basename with op_basename
+
+Use op_basename instead of basename in oparchive function.
+This seems to be the intended use as there is no include on libgen.h for
+the standard basename and the argument is a const char* instead of a
+char*.
+
+Fixes:
+ - http://autobuild.buildroot.net/results/06fbff267063e09f7bc06adb08c896f861ecdb1d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ pp/oparchive.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pp/oparchive.cpp b/pp/oparchive.cpp
+index 6221e148..274152ba 100644
+--- a/pp/oparchive.cpp
++++ b/pp/oparchive.cpp
+@@ -261,7 +261,7 @@ int oparchive(options::spec const & spec)
+ 		/* determine the session name of sample file */
+ 		int offset = sample_name.find('{');
+ 		string base_samples_dir = sample_name.substr(0, offset-1);
+-		string session = basename(base_samples_dir.c_str());
++		string session = op_basename(base_samples_dir.c_str());
+ 		/* Get rid of the the archive_path from the name */
+ 		string sample_base = sample_name.substr(offset);
+ 		string sample_archive_file = dest_samples_dir + "/" + session + "/" + sample_base;
+-- 
+2.14.1
+
