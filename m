From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Sep 2011 23:06:28 +0200
Subject: [Buildroot] [git commit] package: add helper functions to get
	package name and directory magically
Message-ID: <20110930063209.8D03C8DC07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e055aea216cff4d12cf55eab2e35ca1459edaa91
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds the functions "pkgname" and "pkgdir", which can then
be used to automatically find the name of the package and the
directory of the package which does the call to
GENTARGETS/AUTOTARGETS/CMAKETARGETS. These functions use the
$(MAKEFILE_LIST) variable, which make automatically makes available,
and which contains the list of included Makefiles, with the current
Makefile being last. Thanks to this variable and a little bit of
string manipulation, we can easily find out automatically the package
name and the directory it is part of.

These functions are used in later commits to simplify the GENTARGETS,
AUTOTARGETS and CMAKETARGETS calls.

[Peter: Rename to pkgmakefile->pkgdir, pkgdir->pkgparentdir as that's what it is]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.package.in |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 5987d38..afa8d0e 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -55,6 +55,24 @@ define KCONFIG_DISABLE_OPT
        echo "# $(1) is not set" >> $(2)
 endef
 
+# Helper functions to determine the name of a package and its
+# directory from its makefile directory, using the $(MAKEFILE_LIST)
+# variable provided by make. This is used by the *TARGETS macros to
+# automagically find where the package is located. Note that the
+# pkgdir macro is carefully written to handle the case of the Linux
+# package, for which the package directory is an empty string.
+define pkgdir
+$(dir $(lastword $(MAKEFILE_LIST)))
+endef
+
+define pkgname
+$(lastword $(subst /, ,$(call pkgdir)))
+endef
+
+define pkgparentdir
+$(patsubst %$(call pkgname)/,%,$(call pkgdir))
+endef
+
 # Define extractors for different archive suffixes
 INFLATE.bz2  = $(BZCAT)
 INFLATE.gz   = $(ZCAT)
