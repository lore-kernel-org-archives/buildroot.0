From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Wed, 25 Dec 2013 17:18:58 +0100
Subject: [Buildroot] [PATCH 1/2] infra: introduce gitorious helper function
In-Reply-To: <1387988339-17460-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1387988339-17460-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <1387988339-17460-2-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce a gitorious helper function to make it easy to retrieve
gitorious packages without using git whose port is often blocked on
enterprise networks.

usage: $(eval $(call gitorious,project,repository))

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 docs/manual/adding-packages-generic.txt | 10 +++++-----
 docs/manual/adding-packages-tips.txt    | 18 ++++++++++++++++++
 package/pkg-download.mk                 |  8 ++++++++
 3 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 14971b502ba9..d92e49bdcdc3 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -231,11 +231,11 @@ information is (assuming the package name is +libfoo+) :
   types for retrieving package tarballs. Git, Subversion, Mercurial,
   and Bazaar are supported URL types for retrieving packages directly
   from source code management systems. There is a helper function to make
-  it easier to download source tarballs from github (refer to
-  xref:github-download-url[] for details). A filesystem path may be used
-  to specify either a tarball or a directory containing the package
-  source code. See +LIBFOO_SITE_METHOD+ below for more details on how
-  retrieval works. +
+  it easier to download source tarballs from github or gitorious (refer
+  to xref:github-download-url[] and xref:gitorious-download-url[] for
+  details). A filesystem path may be used to specify either a tarball or
+  a directory containing the package source code. See
+  +LIBFOO_SITE_METHOD+ below for more details on how retrieval works. +
   Note that SCP URLs should be of the form
   +scp://[user@]host:filepath+, and that filepath is relative to the
   user's home directory, so you may want to prepend the path with a
diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 73c25be015ab..b51105eae9f2 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -55,3 +55,21 @@ FOO_SITE = $(call github,<user>,<package>,$(FOO_VERSION))
   Buildroot (e.g.: +foo-f6fb6654af62045239caed5950bc6c7971965e60.tar.gz+),
   so it is not necessary to specify it in the +.mk+ file.
 - When using a commit ID as version, you should use the full 40 hex characters.
+
+
+[[gitorious-download-url]]
+How to add a package from gitorious
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+As with github, you can use the 'gitorious' helper function to download
+tarballs from gitorious:
+
+------------------------
+FOO_VERSION = v1.0 # tag or full commit ID
+$(eval $(call gitorious,<project>,<repo>))
+------------------------
+
+.Notes
+- For host packages, use host-gitorious
+- The FOO_VERSION can either be a tag or a commit ID.
+- When using a commit ID as version, you should use the full 40 hex characters.
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 758b211097e8..531df49b60f2 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -58,6 +58,14 @@ domainseparator=$(if $(1),$(1),/)
 # github(user,package,version): returns site of github repository
 github = https://github.com/$(1)/$(2)/tarball/$(3)
 
+# gitorious(project,repo): sets <foo>_SITE and <foo>_SOURCE for a gitorious repository 
+define inner-gitorious
+$(1)_SITE = https://gitorious.org/$(2)/$(3)/archive
+$(1)_SOURCE = $($(1)_VERSION).tar.gz
+endef
+gitorious = $(call inner-gitorious,$(call UPPERCASE,$(call pkgname)),$(1),$(2))
+host-gitorious = $(call inner-gitorious,$(call UPPERCASE,host-$(call pkgname)),$(1),$(2))
+
 ################################################################################
 # The DOWNLOAD_* helpers are in charge of getting a working copy
 # of the source repository for their corresponding SCM,
-- 
1.8.3.2
