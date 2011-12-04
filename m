From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Dec 2011 21:46:36 +0100
Subject: [Buildroot] [git commit] bison: fix m4 dependency
Message-ID: <20111204204658.64F968F73D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2077f955ef64b48c3832e0be31a18aaf04d786da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bison needs m4 (at runtime). In addition, the bison 2.5 configure script
checks for m4 4.1.6 or newer, and bails out otherwise, but ends up looking
at whatever the build host has rather than the cross version, which might
not be the correct version (or even available).

Fix it by short circuiting the check.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bison/Config.in |    1 +
 package/bison/bison.mk  |    5 +++++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/bison/Config.in b/package/bison/Config.in
index e8aa0b6..da0ac3f 100644
--- a/package/bison/Config.in
+++ b/package/bison/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_BISON
 	bool "bison"
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_M4
 	help
 	  General-purpose parser generator that converts a
 	  grammar description for an LALR context-free grammar into a C
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 759592e..c277e96 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -7,11 +7,16 @@
 BISON_VERSION = 2.5
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 
+BISON_CONF_ENV += ac_cv_path_M4=/usr/bin/m4
+BISON_DEPENDENCIES += m4
+
 define BISON_DISABLE_EXAMPLES
 	echo 'all install:' > $(@D)/examples/Makefile
 endef
 
 BISON_POST_CONFIGURE_HOOKS += BISON_DISABLE_EXAMPLES
 
+HOST_BISON_DEPENDENCIES += host-m4
+
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
