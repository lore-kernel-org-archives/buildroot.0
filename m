From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Jul 2017 19:22:39 +0200
Subject: [Buildroot] [PATCH 2/2 v2] core/legal-info: use hash file from
	version sub-dir
In-Reply-To: <cover.1500225742.git.yann.morin.1998@free.fr>
References: <cover.1500225742.git.yann.morin.1998@free.fr>
Message-ID: <868f6cd4d02b61525edf78c8a11afd2655be3425.1500225742.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When we have multiple versions for a package, and the licensing terms
depend on the version actually selected (e.g. like Qt5), storing the
hashes for those license files in the .hash file is broken: the infra
will ensure that all hashes for a file do match, which would not be the
case here.

We fix that by first looking for a hash file in the version sub-dir
first, and if that does not exist, then we use the main hash file.

Drop the useless intermediate variable 'ret'.

Update the documentation accordingly.

Reported-by: Joshua Henderson <joshua.henderson@microchip.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Joshua Henderson <joshua.henderson@microchip.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>

---
Changes v1 -> v2:
  - fallback to the main hash file iof the version-specific one does
    not exist  (Thomas, Peter, Joshua, Luca)
---
 docs/manual/adding-packages-directory.txt | 4 +++-
 package/pkg-utils.mk                      | 9 ++++++---
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 804946c504..809cc97389 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -482,7 +482,9 @@ this in a comment line above the hashes.
 
 .Note
 The hashes for license files are used to detect a license change when a
-package version is bumped.
+package version is bumped. For a package with multiple versions (like Qt5),
+create the hash file in a subdirectory +<packageversion>+ of that package
+(see also xref:patch-apply-order[]).
 
 .Note
 The number of spaces does not matter, so one can use spaces (or tabs) to
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index accf48c464..c3acc22b17 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -86,9 +86,12 @@ endef
 define legal-license-file # pkgname, pkgname-pkgver, pkgdir, filename, file-fullpath, {HOST|TARGET}
 	mkdir -p $(LICENSE_FILES_DIR_$(6))/$(2)/$(dir $(4)) && \
 	{ \
-		support/download/check-hash $(3)/$(1).hash $(5) $(4); \
-		ret=$${?}; \
-		case $${ret} in (0|3) ;; (*) exit 1;; esac; \
+		if [ -f $(3)/$($(PKG)_VERSION)/$(1).hash ]; then \
+			support/download/check-hash $(3)/$($(PKG)_VERSION)/$(1).hash $(5) $(4); \
+		else \
+			support/download/check-hash $(3)/$(1).hash $(5) $(4); \
+		fi; \
+		case $${?} in (0|3) ;; (*) exit 1;; esac; \
 	} && \
 	cp $(5) $(LICENSE_FILES_DIR_$(6))/$(2)/$(4)
 endef
-- 
2.11.0
