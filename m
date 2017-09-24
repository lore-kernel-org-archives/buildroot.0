From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 13:11:55 +0200
Subject: [Buildroot] [git commit] pkg-download: remove explicit PKG_VERSION
	from github helper
Message-ID: <20170924111225.8AD5D7FB0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e5a8916b2ab4c9c99548fa6fbd4855eee323881
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/adding-packages-tips.txt | 5 ++++-
 package/pkg-download.mk              | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 19577fa..824f075 100644
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
@@ -147,6 +147,9 @@ FOO_SITE = $(call github,<user>,<package>,$(FOO_VERSION))
   Buildroot (e.g.: +foo-f6fb6654af62045239caed5950bc6c7971965e60.tar.gz+),
   so it is not necessary to specify it in the +.mk+ file.
 - When using a commit ID as version, you should use the full 40 hex characters.
+- The +version+ parameter is optional and should only be specified if anything
+  other than FOO_VERSION needs to be used, e.g. when this function is used to
+  specify a custom Linux or U-Boot tarball.
 
 If the package you wish to add does have a release section on GitHub, the
 maintainer may have uploaded a release tarball, or the release may just point
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index fbbc2d7..dc4ff1c 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -52,8 +52,8 @@ notdomain = $(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$
 # default domainseparator is /, specify alternative value as first argument
 domainseparator = $(if $(1),$(1),/)
 
-# github(user,package,version): returns site of GitHub repository
-github = https://github.com/$(1)/$(2)/archive/$(3)
+# github(user,package[,version]): returns site of GitHub repository
+github = https://github.com/$(1)/$(2)/archive/$(or $(3),$($(call UPPERCASE,$(pkgname))_VERSION))
 
 # Expressly do not check hashes for those files
 # Exported variables default to immediately expanded in some versions of
