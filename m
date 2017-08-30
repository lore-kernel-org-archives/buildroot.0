From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Date: Wed, 30 Aug 2017 09:54:12 +0200
Subject: [Buildroot] [PATCH v2] pkg-download: remove explicit PKG_VERSION
	from github helper
Message-ID: <1504079652-15286-1-git-send-email-marcin.nowakowski@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently it is always required to add package version as an argument to
the github helper. Since the version is always defined as PKG_VERSION,
drop this argument and generate it automatically inside the helper
routine.

The github helper function is extended to support both 2 and 3 argument
variants (ie. either use the provided package version argument or
automatically substitute with PKG_VERSION if not available), which can
make the transition of the package files easier as well allows using the
3-argument variant outside of package definitions.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
Changes:
  v2
    - update docs to include optional version argument
    - use $(or $foo,...) instead of $(if $foo,$foo,...)
---
 docs/manual/adding-packages-tips.txt | 4 +++-
 package/pkg-download.mk              | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 19577fa..8caf2b9 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -138,7 +138,7 @@ past, the 'github' helper function should be used as shown below.
 ------------------------
 # Use a tag or a full commit ID
 FOO_VERSION = v1.0
-FOO_SITE = $(call github,<user>,<package>,$(FOO_VERSION))
+FOO_SITE = $(call github,<user>,<package>[,<version>])
 ------------------------
 
 .Notes
@@ -147,6 +147,8 @@ FOO_SITE = $(call github,<user>,<package>,$(FOO_VERSION))
   Buildroot (e.g.: +foo-f6fb6654af62045239caed5950bc6c7971965e60.tar.gz+),
   so it is not necessary to specify it in the +.mk+ file.
 - When using a commit ID as version, you should use the full 40 hex characters.
+- +version+ parameter is optional and should only be specified if anything
+  other than FOO_VERSION needs to be used
 
 If the package you wish to add does have a release section on GitHub, the
 maintainer may have uploaded a release tarball, or the release may just point
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index fbbc2d7..7489fca 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -52,8 +52,8 @@ notdomain = $(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$
 # default domainseparator is /, specify alternative value as first argument
 domainseparator = $(if $(1),$(1),/)
 
-# github(user,package,version): returns site of GitHub repository
-github = https://github.com/$(1)/$(2)/archive/$(3)
+# github(user,package[,version]): returns site of GitHub repository
+github = https://github.com/$(1)/$(2)/archive/$(or $(3),$($(call UPPERCASE,$(pkgname))_VERSION)))
 
 # Expressly do not check hashes for those files
 # Exported variables default to immediately expanded in some versions of
-- 
2.7.4
