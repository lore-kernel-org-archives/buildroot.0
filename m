From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Sep 2011 21:57:41 +0200
Subject: [Buildroot] [PATCH 05/15] package: add helper functions to get
	package name and directory magically
In-Reply-To: <cover.1317325743.git.thomas.petazzoni@free-electrons.com>
References: <cover.1317325743.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8d3f0fb45858fde60d1118e35aa91944fe7ab368.1317325743.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.package.in |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 5987d38..46765c1 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -55,6 +55,24 @@ define KCONFIG_DISABLE_OPT
        echo "# $(1) is not set" >> $(2)
 endef
 
+# Helper functions to determine the name of a package and its
+# directory from its makefile path, using the $(MAKEFILE_LIST)
+# variable provided by make. This is used by the *TARGETS macros to
+# automagically find where the package is located. Note that the
+# pkgdir macro is carefully written to handle the case of the Linux
+# package, for which the package directory is an empty string.
+define pkgmakefile
+$(dir $(lastword $(MAKEFILE_LIST)))
+endef
+
+define pkgname
+$(lastword $(subst /, ,$(call pkgmakefile)))
+endef
+
+define pkgdir
+$(patsubst %$(call pkgname)/,%,$(call pkgmakefile))
+endef
+
 # Define extractors for different archive suffixes
 INFLATE.bz2  = $(BZCAT)
 INFLATE.gz   = $(ZCAT)
-- 
1.7.4.1
