From: =?UTF-8?q?Daniel=20Nystr=C3=B6m?= <daniel.nystrom@timeterminal.se>
Date: Mon, 27 Dec 2010 21:33:46 +0100
Subject: [Buildroot] [git commit master 1/1] package/Makefile.package.in:
	Added BZR download support
Message-ID: <20101227203413.D5B1B8EB73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ac294cf557f0d6053373d9af3471300a12f28d1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.package.in |   39 ++++++++++++++++++++++++++++-----------
 1 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 816a013..428dbcb 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -85,19 +85,21 @@ DL_DIR:=$(TOPDIR)/dl
 endif
 
 ################################################################################
-# The DOWNLOAD_{GIT,SVN} helpers are in charge of getting a working copy of
-# the source repository for their corresponding SCM, checking out the requested
-# version / commit / tag, and create an archive out of it. DOWNLOAD_WGET is the
-# normal wget-based download mechanism.
+# The DOWNLOAD_{GIT,SVN,BZR} helpers are in charge of getting a
+# working copy of the source repository for their corresponding SCM,
+# checking out the requested version / commit / tag, and create an
+# archive out of it. DOWNLOAD_WGET is the normal wget-based download
+# mechanism.
 #
-# The SOURCE_CHECK_{GIT,SVN,WGET} helpers are in charge of simply checking that
-# the source is available for download. This can be used to make sure one will
-# be able to get all the sources needed for one's build configuration.
+# The SOURCE_CHECK_{GIT,SVN,BZR,WGET} helpers are in charge of simply
+# checking that the source is available for download. This can be used
+# to make sure one will be able to get all the sources needed for
+# one's build configuration.
 #
-# The SHOW_EXTERNAL_DEPS_{GIT,SVN,WGET} helpers simply output to the console
-# the names of the files that will be downloaded, or path and revision of the
-# source repositories, producing a list of all the "external dependencies" of
-# a given build configuration.
+# The SHOW_EXTERNAL_DEPS_{GIT,SVN,BZR,WGET} helpers simply output to
+# the console the names of the files that will be downloaded, or path
+# and revision of the source repositories, producing a list of all the
+# "external dependencies" of a given build configuration.
 ################################################################################
 
 define DOWNLOAD_GIT
@@ -123,6 +125,20 @@ define SHOW_EXTERNAL_DEPS_GIT
 endef
 
 
+define DOWNLOAD_BZR
+	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
+	$(BZR) export $(DL_DIR)/$($(PKG)_SOURCE) $($(PKG)_SITE) -r $($(PKG)_DL_VERSION)
+endef
+
+define SOURCE_CHECK_BZR
+	$(BZR) ls --quiet $($(PKG)_SITE) > /dev/null
+endef
+
+define SHOW_EXTERNAL_DEPS_BZR
+	echo "$($(PKG)_SITE) [bzr: $($(PKG)_DL_VERSION)]"
+endef
+
+
 define DOWNLOAD_SVN
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	(pushd $(DL_DIR) > /dev/null && \
@@ -175,6 +191,7 @@ define DOWNLOAD
 		case "$($(PKG)_SITE_METHOD)" in \
 			git) $($(DL_MODE)_GIT) && exit ;; \
 			svn) $($(DL_MODE)_SVN) && exit ;; \
+			bzr) $($(DL_MODE)_BZR) && exit ;; \
 			*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
 		esac ; \
 	fi ; \
-- 
1.7.2.2
