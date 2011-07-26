From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 26 Jul 2011 21:11:39 +0200
Subject: [Buildroot] [PATCH v2] Add support for packages stored in Mercurial
 (hg) repositories
Message-ID: <12410fb95240eff2b5ad.1311707499@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for packages stored in Mercurial (hg) repositories.
Along with the documentation update, a few typos were fixed as well.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: update documentation.

 Config.in                   |    4 ++++
 docs/buildroot.html         |   20 ++++++++++----------
 package/Makefile.package.in |   31 ++++++++++++++++++++++++++++---
 3 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/Config.in b/Config.in
--- a/Config.in
+++ b/Config.in
@@ -32,6 +32,10 @@
 	string "Git command"
 	default "git"
 
+config BR2_HG
+	string "Mercurial (hg) command"
+	default "hg"
+
 config BR2_ZCAT
 	string "zcat command"
 	default "gzip -d -c"
diff --git a/docs/buildroot.html b/docs/buildroot.html
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -1060,17 +1060,17 @@
       <li><code>LIBFOO_SITE_METHOD</code> may contain the method to
       fetch the package source code. It can either
       be <code>wget</code> (for normal FTP/HTTP downloads of
-      tarballs), <code>svn</code>, <code>git</code> or <code>bzr</code>.
-      When not specified, it is guessed from the URL given
+      tarballs), <code>svn</code>, <code>git</code>, <code>bzr</code> or
+      <code>hg</code>. When not specified, it is guessed from the URL given
       in <code>LIBFOO_SITE</code>: <code>svn://</code>, <code>git://</code>
       and <code>bzr://</code> URLs will use the <code>svn</code>,
       <code>git</code> and <code>bzr</code> methods respectively. All other
       URL-types will use the <code>wget</code> method. So for example, in the
       case of a package whose source code is available through
       Subversion repository on HTTP, one <i>must</i>
-      specifiy <code>LIBFOO_SITE_METHOD=svn</code>. For <code>svn</code>
-      and <code>git</code> methods, what Buildroot does is a
-      checkout/clone of the repository which is then tarballed and
+      specify <code>LIBFOO_SITE_METHOD=svn</code>. For <code>svn</code>,
+      <code>git</code>, <code>bzr</code> and <code>hg</code> methods, what
+      Buildroot does is a checkout/clone of the repository which is then tarballed and
       stored into the download cache. Next builds will not
       checkout/clone again, but will use the tarball
       directly. When <code>HOST_LIBFOO_SITE_METHOD</code> is not
@@ -1184,7 +1184,7 @@
     However, since they are provided by the generic infrastructure, they are
     documented here. The exception is <code>LIBFOO_POST_PATCH_HOOKS</code>.
     Patching the package is not user definable, so
-    <code>LIBFOO_POST_PATCH_HOOKS</code> will be userful for generic packages.
+    <code>LIBFOO_POST_PATCH_HOOKS</code> will be useful for generic packages.
     </p>
 
     <p>The following hook points are available:</p>
@@ -1776,7 +1776,7 @@
     network...</code></h3>
 
     <p>If the boot process seems to hang after the following messages
-    (messages not necessarly exactly similar, depending on the list of
+    (messages not necessarily exactly similar, depending on the list of
     packages selected):</p>
 
     <pre>Freeing init memory: 3972K
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -74,6 +74,7 @@
 SVN:=$(call qstrip,$(BR2_SVN)) $(QUIET)
 BZR:=$(call qstrip,$(BR2_BZR)) $(QUIET)
 GIT:=$(call qstrip,$(BR2_GIT)) $(QUIET)
+HG:=$(call qstrip,$(BR2_HG)) $(QUIET)
 
 # Default spider mode is 'DOWNLOAD'. Other possible values are 'SOURCE_CHECK'
 # used by the _source-check target and 'SHOW_EXTERNAL_DEPS', used by the
@@ -86,18 +87,18 @@
 endif
 
 ################################################################################
-# The DOWNLOAD_{GIT,SVN,BZR} helpers are in charge of getting a
+# The DOWNLOAD_{GIT,SVN,BZR,HG} helpers are in charge of getting a
 # working copy of the source repository for their corresponding SCM,
 # checking out the requested version / commit / tag, and create an
 # archive out of it. DOWNLOAD_WGET is the normal wget-based download
 # mechanism.
 #
-# The SOURCE_CHECK_{GIT,SVN,BZR,WGET} helpers are in charge of simply
+# The SOURCE_CHECK_{GIT,SVN,BZR,HG,WGET} helpers are in charge of simply
 # checking that the source is available for download. This can be used
 # to make sure one will be able to get all the sources needed for
 # one's build configuration.
 #
-# The SHOW_EXTERNAL_DEPS_{GIT,SVN,BZR,WGET} helpers simply output to
+# The SHOW_EXTERNAL_DEPS_{GIT,SVN,BZR,HG,WGET} helpers simply output to
 # the console the names of the files that will be downloaded, or path
 # and revision of the source repositories, producing a list of all the
 # "external dependencies" of a given build configuration.
@@ -158,6 +159,27 @@
 endef
 
 
+define DOWNLOAD_HG
+	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
+	(pushd $(DL_DIR) > /dev/null && \
+	$(HG) clone --noupdate --rev $($(PKG)_DL_VERSION) $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
+	$(HG) archive --repository $($(PKG)_BASE_NAME) --type tgz --prefix $($(PKG)_BASE_NAME)/ \
+	              --rev $($(PKG)_DL_VERSION) $(DL_DIR)/$($(PKG)_SOURCE) && \
+	rm -rf $($(PKG)_DL_DIR) && \
+	popd > /dev/null)
+endef
+
+# TODO: improve to check that the given PKG_DL_VERSION exists on the remote
+# repository
+define SOURCE_CHECK_HG
+  $(HG) incoming --force -l1 $($(PKG)_SITE) > /dev/null
+endef
+
+define SHOW_EXTERNAL_DEPS_HG
+  echo "$($(PKG)_SITE) [hg: $($(PKG)_DL_VERSION)]"
+endef
+
+
 define DOWNLOAD_WGET
 	test -e $(DL_DIR)/$(2) || \
 	$(WGET) -P $(DL_DIR) $(call qstrip,$(1))/$(2)
@@ -193,6 +215,7 @@
 			git) $($(DL_MODE)_GIT) && exit ;; \
 			svn) $($(DL_MODE)_SVN) && exit ;; \
 			bzr) $($(DL_MODE)_BZR) && exit ;; \
+			hg) $($(DL_MODE)_HG) && exit ;; \
 			*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
 		esac ; \
 	fi ; \
@@ -546,6 +569,8 @@
 DL_TOOLS_DEPENDENCIES += git
 else ifeq ($$($(2)_SITE_METHOD),bzr)
 DL_TOOLS_DEPENDENCIES += bzr
+else ifeq ($$($(2)_SITE_METHOD),hg)
+DL_TOOLS_DEPENDENCIES += hg
 endif # SITE_METHOD
 
 endif # $(2)_KCONFIG_VAR
