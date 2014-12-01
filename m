From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  2 Dec 2014 00:24:06 +0100
Subject: [Buildroot] [PATCH 1/4] pkg-download: check for already downloaded
	file in the download wrapper
In-Reply-To: <cover.1417475935.git.yann.morin.1998@free.fr>
References: <cover.1417475935.git.yann.morin.1998@free.fr>
Message-ID: <936ed487d76e1dd36230de9a26d57da908680d79.1417475935.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of repeating the same test again and again in all our download
rules, just delegate the check for an already downloaded file to the
download wrapper.

This clears up the path for doing the hash checks on a cached file
before the download.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pkg-download.mk  | 8 --------
 support/download/wrapper | 5 +++++
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index f3409bd..f6ceadb 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -94,7 +94,6 @@ endef
 # Messages for the type of clone used are provided to ease debugging in case of
 # problems
 define DOWNLOAD_GIT
-	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	$(EXTRA_ENV) support/download/wrapper git \
 		$(DL_DIR)/$($(PKG)_SOURCE) \
 		$($(PKG)_SITE) \
@@ -114,7 +113,6 @@ endef
 
 
 define DOWNLOAD_BZR
-	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	$(EXTRA_ENV) support/download/wrapper bzr \
 		$(DL_DIR)/$($(PKG)_SOURCE) \
 		$($(PKG)_SITE) \
@@ -131,7 +129,6 @@ define SHOW_EXTERNAL_DEPS_BZR
 endef
 
 define DOWNLOAD_CVS
-	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	$(EXTRA_ENV) support/download/wrapper cvs \
 		$(DL_DIR)/$($(PKG)_SOURCE) \
 		$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
@@ -150,7 +147,6 @@ define SHOW_EXTERNAL_DEPS_CVS
 endef
 
 define DOWNLOAD_SVN
-	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	$(EXTRA_ENV) support/download/wrapper svn \
 		$(DL_DIR)/$($(PKG)_SOURCE) \
 		$($(PKG)_SITE) \
@@ -170,7 +166,6 @@ endef
 # Note that filepath is relative to the user's home directory, so you may want
 # to prepend the path with a slash: scp://[user@]host:/absolutepath
 define DOWNLOAD_SCP
-	test -e $(DL_DIR)/$(2) || \
 	$(EXTRA_ENV) support/download/wrapper scp \
 		$(DL_DIR)/$(2) \
 		'$(call stripurischeme,$(call qstrip,$(1)))' && \
@@ -187,7 +182,6 @@ endef
 
 
 define DOWNLOAD_HG
-	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	$(EXTRA_ENV) support/download/wrapper hg \
 		$(DL_DIR)/$($(PKG)_SOURCE) \
 		$($(PKG)_SITE) \
@@ -207,7 +201,6 @@ endef
 
 
 define DOWNLOAD_WGET
-	test -e $(DL_DIR)/$(2) || \
 	$(EXTRA_ENV) support/download/wrapper wget \
 		$(DL_DIR)/$(2) \
 		'$(call qstrip,$(1))' && \
@@ -223,7 +216,6 @@ define SHOW_EXTERNAL_DEPS_WGET
 endef
 
 define DOWNLOAD_LOCALFILES
-	test -e $(DL_DIR)/$(2) || \
 	$(EXTRA_ENV) support/download/wrapper cp \
 		$(DL_DIR)/$(2) \
 		$(call stripurischeme,$(call qstrip,$(1))) && \
diff --git a/support/download/wrapper b/support/download/wrapper
index 320a37e..e3ab3a1 100755
--- a/support/download/wrapper
+++ b/support/download/wrapper
@@ -28,6 +28,11 @@ helper="${1}"
 output="${2}"
 shift 2
 
+# If the output file already exists, do not download it again
+if [ -e "${output}" ]; then
+    exit 0
+fi
+
 # tmpd is a temporary directory in which helpers may store intermediate
 # by-products of the download.
 # tmpf is the file in which the helpers should put the downloaded content.
-- 
1.9.1
