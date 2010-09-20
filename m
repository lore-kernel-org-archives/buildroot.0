From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 20 Sep 2010 16:24:54 +0200
Subject: [Buildroot] [git commit master 1/1] Fix <PKG_NAME>_VERSION variable
	setup
Message-ID: <20100920145350.A55238B429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=763822e874fd8d39b591feaa9639f76183897fb7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 993e51bc22f508fbaf39c5c49fd0595fc5c56013 introduced a problem
to compute <PKG_NAME>_VERSION variable when PKG_NAME start with
'HOST_'.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.package.in |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 58a9a51..377df65 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -337,22 +337,22 @@ define GENTARGETS_INNER
 $(2)_TYPE                       =  $(5)
 $(2)_NAME			=  $(1)
 
+# Keep the package version that may contain forward slashes in the _DL_VERSION
+# variable, then replace all forward slashes ('/') by underscores ('_') to
+# sanitize the package version that is used in paths, directory and file names.
+# Forward slashes may appear in the package's version when pointing to a
+# version control system branch or tag, for example remotes/origin/1_10_stable.
+$(2)_DL_VERSION	= $($(2)_VERSION)
 ifndef $(2)_VERSION
  ifdef $(3)_VERSION
   $(2)_VERSION = $($(3)_VERSION)
  else
   $(2)_VERSION = undefined
  endif
+else
+ $(2)_VERSION = $(subst /,_,$($(2)_VERSION))
 endif
 
-# Keep the package version that may contain forward slashes in the _DL_VERSION
-# variable, then replace all forward slashes ('/') by underscores ('_') to
-# sanitize the package version that is used in paths, directory and file names.
-# Forward slashes may appear in the package's version when pointing to a
-# version control system branch or tag, for example remotes/origin/1_10_stable.
-$(2)_DL_VERSION	= $($(2)_VERSION)
-$(2)_VERSION = $(subst /,_,$($(2)_VERSION))
-
 $(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
 $(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
 $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
-- 
1.7.1
