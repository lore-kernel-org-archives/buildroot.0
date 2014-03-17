From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Mar 2014 23:09:23 +0100
Subject: [Buildroot] [git commit] package/crosstool-ng: remove
Message-ID: <20140317221235.0869A9BF87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de1e91644917bf295b541aa4a72fc9e1c9ea4dcf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No one is using this host-package, since we no longer have the
crosstool-NG toolchain backend.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../crosstool-ng-000-makefile-recursion.patch      |   38 --------------------
 package/crosstool-ng/crosstool-ng.mk               |   18 ---------
 2 files changed, 0 insertions(+), 56 deletions(-)

diff --git a/package/crosstool-ng/crosstool-ng-000-makefile-recursion.patch b/package/crosstool-ng/crosstool-ng-000-makefile-recursion.patch
deleted file mode 100644
index b875e3f..0000000
--- a/package/crosstool-ng/crosstool-ng-000-makefile-recursion.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Makefile: allow recursion
-
-When crosstool-NG is used standalone, we completely avoid recursion,
-because the Makefile calls itself only once.
-
-But when used as the buildroot toolchain backend, there is already
-one level of make recursion when we first call the crosstool-NG
-Makefile. And when buildroot is used out-of-tree, we are already
-at the second level of recursion when calling the crosstool-NG
-Makefile.
-
-So, to cope with the situation, just get rid of the recursion test.
-
-This probably won't go upstream.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
-
-diff -du crosstool-ng-1.12.0/Makefile.in host-crosstool-ng-1.12.0/Makefile.in
---- crosstool-ng-1.12.0/Makefile.in     2011-08-01 01:21:34.000000000 +0200
-+++ host-crosstool-ng-1.12.0/Makefile.in        2011-08-07 21:39:16.055958219 +0200
-@@ -101,9 +101,14 @@
- # level.
- # This has the side effect of only showing the real targets, and hiding our
- # internal ones. :-)
--ifneq ($(MAKELEVEL),0)
--$(error Recursion detected, bailing out...)
--endif
-+#
-+# NB: For buildroot, this has no importance:
-+# - crosstool-NG should never ever be called manually
-+# - thus auto-completion would never ever be attempted
-+# - so we shouldn't have to detect it
-+#ifneq ($(MAKELEVEL),0)
-+#$(error Recursion detected, bailing out...)
-+#endif
- 
- MAKEFLAGS += $(CT_MAKEFLAGS)
- build install clean distclean uninstall:
diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
deleted file mode 100644
index 8d98db4..0000000
--- a/package/crosstool-ng/crosstool-ng.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# crosstool-ng
-#
-################################################################################
-
-CROSSTOOL_NG_VERSION           = 1.18.0
-CROSSTOOL_NG_SOURCE            = crosstool-ng-$(CROSSTOOL_NG_VERSION).tar.bz2
-CROSSTOOL_NG_SITE              = http://crosstool-ng.org/download/crosstool-ng/
-CROSSTOOL_NG_INSTALL_TARGET    = NO
-CROSSTOOL_NG_MAKE              = $(MAKE1)
-
-HOST_CROSSTOOL_NG_DEPENDENCIES = \
-	host-gawk \
-	host-automake host-gperf host-bison host-flex \
-	host-texinfo
-
-$(eval $(host-autotools-package))
