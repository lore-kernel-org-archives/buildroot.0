From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 01:18:10 +0100
Subject: [Buildroot] [PATCH 20/33] pkg-download.mk: add tarball check in the
	wget method
In-Reply-To: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1353543503-8952-21-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In case of wrong package source url, the retrieved file is a html page;
this lead to a build failure at the extraction time.

So, in case of tarballs, check the file type of the downloaded material
and remove the temporary file if it is wrong.

As a side effect of this, if the source location has changed since the
package integration in Buildroot, the download will fall back on the
Buildroot backup site.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/pkg-download.mk              | 13 +++++++++++--
 support/dependencies/dependencies.sh |  2 +-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 6c57244..5e99d7d 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -175,8 +175,17 @@ endef
 # the next time the download is tried.
 define DOWNLOAD_WGET
 	test -e $(DL_DIR)/$(2) || \
-	($(WGET) -O $(DL_DIR)/$(2).tmp '$(call qstrip,$(1))' && \
-	 mv $(DL_DIR)/$(2).tmp $(DL_DIR)/$(2)) || \
+	(($(WGET) -O $(DL_DIR)/$(2).tmp '$(call qstrip,$(1))' ; \
+	    case "$(2)" in \
+	      *.bz2|*.gz|*.tbz|*.tbz2|*.tgz|*.xz|*.tar) \
+	        file $(DL_DIR)/$(2).tmp | grep -q 'HTML\ document' && \
+	        (rm -f $(DL_DIR)/$(2).tmp ; \
+	          echo "error: Cannot retrieve $(2) from '$(call qstrip,$(1))'." ; \
+	          echo "error: Wrong package URL: $(call qstrip,$(1))") || \
+	        exit 0 ;; \
+	      *) exit 0 ;; \
+	    esac) && \
+	  mv $(DL_DIR)/$(2).tmp $(DL_DIR)/$(2)) || \
 	(rm -f $(DL_DIR)/$(2).tmp ; exit 1)
 endef
 
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 9f0f6a9..651fc51 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -131,7 +131,7 @@ if ! $SHELL --version 2>&1 | grep -q '^GNU bash'; then
 fi;
 
 # Check that a few mandatory programs are installed
-for prog in awk bison flex msgfmt makeinfo patch gzip bzip2 perl tar wget cpio python unzip rsync ${DL_TOOLS} ; do
+for prog in awk bison file flex msgfmt makeinfo patch gzip bzip2 perl tar wget cpio python unzip rsync ${DL_TOOLS} ; do
     if ! which $prog > /dev/null ; then
 	/bin/echo -e "\nYou must install '$prog' on your build machine";
 	if test $prog = "makeinfo" ; then
-- 
1.8.0
