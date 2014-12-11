From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 23:58:44 +0100
Subject: [Buildroot] [git commit] pkg-download: check for already downloaded
	file in the download wrapper
Message-ID: <20141211225952.440AE7FA1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2685937e06d6ede44b88b223e02b38b3ff66a53c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of repeating the same test again and again in all our download
rules, just delegate the check for an already downloaded file to the
download wrapper.

This clears up the path for doing the hash checks on a cached file
before the download.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk     |    8 --------
 support/download/dl-wrapper |    5 +++++
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 8424eca..c021e92 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -96,7 +96,6 @@ endef
 # Messages for the type of clone used are provided to ease debugging in case of
 # problems
 define DOWNLOAD_GIT
-	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	$(EXTRA_ENV) $(DL_WRAPPER) -b git \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
 		-- \
@@ -117,7 +116,6 @@ endef
 
 
 define DOWNLOAD_BZR
-	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	$(EXTRA_ENV) $(DL_WRAPPER) -b bzr \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
 		-- \
@@ -135,7 +133,6 @@ define SHOW_EXTERNAL_DEPS_BZR
 endef
 
 define DOWNLOAD_CVS
-	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	$(EXTRA_ENV) $(DL_WRAPPER) -b cvs \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
 		-- \
@@ -155,7 +152,6 @@ define SHOW_EXTERNAL_DEPS_CVS
 endef
 
 define DOWNLOAD_SVN
-	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	$(EXTRA_ENV) $(DL_WRAPPER) -b svn \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
 		-- \
@@ -176,7 +172,6 @@ endef
 # Note that filepath is relative to the user's home directory, so you may want
 # to prepend the path with a slash: scp://[user@]host:/absolutepath
 define DOWNLOAD_SCP
-	test -e $(DL_DIR)/$(2) || \
 	$(EXTRA_ENV) $(DL_WRAPPER) -b scp \
 		-o $(DL_DIR)/$(2) \
 		-- \
@@ -194,7 +189,6 @@ endef
 
 
 define DOWNLOAD_HG
-	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	$(EXTRA_ENV) $(DL_WRAPPER) -b hg \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
 		-- \
@@ -215,7 +209,6 @@ endef
 
 
 define DOWNLOAD_WGET
-	test -e $(DL_DIR)/$(2) || \
 	$(EXTRA_ENV) $(DL_WRAPPER) -b wget \
 		-o $(DL_DIR)/$(2) \
 		-- \
@@ -232,7 +225,6 @@ define SHOW_EXTERNAL_DEPS_WGET
 endef
 
 define DOWNLOAD_LOCALFILES
-	test -e $(DL_DIR)/$(2) || \
 	$(EXTRA_ENV) $(DL_WRAPPER) -b cp \
 		-o $(DL_DIR)/$(2) \
 		-- \
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index f1bb73a..dc5b4b0 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -43,6 +43,11 @@ main() {
         error "no output specified, use -o\n"
     fi
 
+    # If the output file already exists, do not download it again
+    if [ -e "${output}" ]; then
+        exit 0
+    fi
+
     # tmpd is a temporary directory in which backends may store intermediate
     # by-products of the download.
     # tmpf is the file in which the backends should put the downloaded content.
