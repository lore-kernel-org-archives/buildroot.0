From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Mar 2020 10:30:36 +0100
Subject: [Buildroot] [PATCH] package/pkg-generic.mk: create folder before
 cd'ing in step_pkg_size_before
Message-ID: <20200310093037.79028-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 0e2be4db8ab01d479177a3a187c22525752195ae ("package/pkg-generic:
make file list logic parallel build compatible"), the logic to create
the list of files installed by a particular package was significantly
reworked to be compatible with top-level parallel build.

Before this commit, there was only a after-install step of listing the
files in HOST_DIR/TARGET_DIR/STAGING_DIR. But after this commit, we
now have a before-install logic and an after-install logic.

It turns out that when the before-install logic is called for the very
first host package, $(HOST_DIR) doesn't exist yet, and therefore the
cd $(2) fails, with an error message:

/bin/sh: line 0: cd: /home/thomas/buildroot/output/host: No such file or directory

In addition, due to the code using ";" instead of "&&" to separate the
'cd' from the 'find', we go ahead and continue listing all files in
the current directory, which is obviously very wrong.

We fix this by simply creating the directory we are going to cd into
in step_pkg_size_before. It is simpler than testing if the directory
exists, and if it doesn't, create an empty .files-list$(3).before
file.

While at it, we also turn the 'cd $(2); find' into 'cd $(2) && find'.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index c1b9fe2e59..26bcabe3d9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -61,7 +61,8 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 # $(2): base directory to search in
 # $(3): suffix of file (optional)
 define step_pkg_size_before
-	cd $(2); \
+	mkdir -p $(2)
+	cd $(2) && \
 	LC_ALL=C find . \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
 		| LC_ALL=C sort > $($(PKG)_BUILDDIR)/.files-list$(3).before
 endef
@@ -70,7 +71,7 @@ endef
 # $(2): base directory to search in
 # $(3): suffix of file (optional)
 define step_pkg_size_after
-	cd $(2); \
+	cd $(2) && \
 	LC_ALL=C find . \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
 		| LC_ALL=C sort > $($(PKG)_BUILDDIR)/.files-list$(3).after
 	LC_ALL=C comm -13 \
-- 
2.24.1
