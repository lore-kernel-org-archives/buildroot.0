From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 15 Mar 2011 08:27:06 +0100
Subject: [Buildroot] [PATCH 1 of 3] Add file:// helpers to package download
	infrastructure
In-Reply-To: <patchbomb.1300174025@localhost6.localdomain6>
References: <patchbomb.1300174025@localhost6.localdomain6>
Message-ID: <f1abcd0d10cd8c81891e.1300174026@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/Makefile.package.in |  22 +++++++++++++++++++---
 1 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -89,14 +89,15 @@
 # working copy of the source repository for their corresponding SCM,
 # checking out the requested version / commit / tag, and create an
 # archive out of it. DOWNLOAD_WGET is the normal wget-based download
-# mechanism.
+# mechanism. DOWNLOAD_FILE is for packages residing on standard
+# filesystem paths (local, nfs, ...).
 #
-# The SOURCE_CHECK_{GIT,SVN,BZR,WGET} helpers are in charge of simply
+# The SOURCE_CHECK_{GIT,SVN,BZR,WGET,FILE} helpers are in charge of simply
 # checking that the source is available for download. This can be used
 # to make sure one will be able to get all the sources needed for
 # one's build configuration.
 #
-# The SHOW_EXTERNAL_DEPS_{GIT,SVN,BZR,WGET} helpers simply output to
+# The SHOW_EXTERNAL_DEPS_{GIT,SVN,BZR,WGET,FILE} helpers simply output to
 # the console the names of the files that will be downloaded, or path
 # and revision of the source repositories, producing a list of all the
 # "external dependencies" of a given build configuration.
@@ -170,6 +171,20 @@
   echo $(2)
 endef
 
+
+define DOWNLOAD_FILE
+	test -e $(DL_DIR)/$(2) || \
+	cp `echo "$(call qstrip,$(1))/$(2)" | sed 's_^.*://__'` $(DL_DIR)
+endef
+
+define SOURCE_CHECK_FILE
+  test -e `echo "$(call qstrip,$(1))/$(2)" | sed 's_^.*://__'`
+endef
+
+define SHOW_EXTERNAL_DEPS_FILE
+  echo $(2)
+endef
+
 ################################################################################
 # DOWNLOAD -- Download helper. Will try to download source from:
 # 1) BR2_PRIMARY_SITE if enabled
@@ -192,6 +207,7 @@
 			git) $($(DL_MODE)_GIT) && exit ;; \
 			svn) $($(DL_MODE)_SVN) && exit ;; \
 			bzr) $($(DL_MODE)_BZR) && exit ;; \
+			file) $($(DL_MODE)_FILE) && exit ;; \
 			*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
 		esac ; \
 	fi ; \
