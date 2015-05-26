From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 May 2015 01:42:07 +0200
Subject: [Buildroot] [PATCH 12/21 RFC] core: get rid of our dummy
	br2-external tree
In-Reply-To: <cover.1432681414.git.yann.morin.1998@free.fr>
References: <cover.1432681414.git.yann.morin.1998@free.fr>
Message-ID: <ee5650bb071dae081e37e9d15cc181e37f415e4b.1432681414.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we generate a kconfig snippet, we can conditionally include the
BR2_EXTERNAL's Config.in only when BR2_EXTERNAL is supplied by the user,
which means our empty/dummy Config.in is no longer usefull to us.

As for external.mk, we can also include it only when BR2_EXTERNAL is
supplied by the user, which means our empty/dummy external.mk is no
longer of any use to us.

Ditch both of those files, and:

  - only generate actual content in the Kconfig snippet when we actually
    do havea BR2_EXTERNAL provided by tje user (i.e. BR2_EXTERNAL is not
    empty);

  - add a variable that contains the path to the external.mk provided by
    the user, or empty if none, and include the path set in that variable
    (make can 'include' nothing without any problem! ;-) )

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile                           | 18 +++++++-----------
 support/dummy-external/Config.in   |  0
 support/dummy-external/external.mk |  0
 3 files changed, 7 insertions(+), 11 deletions(-)
 delete mode 100644 support/dummy-external/Config.in
 delete mode 100644 support/dummy-external/external.mk

diff --git a/Makefile b/Makefile
index ad43972..c7b719a 100644
--- a/Makefile
+++ b/Makefile
@@ -142,16 +142,11 @@ $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 # on the command line, therefore the file is re-created every time make is run.
 #
 # When BR2_EXTERNAL is set to an empty value (e.g. explicitly in command
-# line), the .br-external file is removed and we point to
-# support/dummy-external. This makes sure we can unconditionally include the
-# Config.in and external.mk from the BR2_EXTERNAL directory. In this case,
-# override is necessary so the user can clear BR2_EXTERNAL from the command
-# line, but the dummy path is still used internally.
+# line), the .br-external file is removed.
 
 BR2_EXTERNAL_FILE = $(BASE_DIR)/.br-external
 -include $(BR2_EXTERNAL_FILE)
 ifeq ($(BR2_EXTERNAL),)
-  override BR2_EXTERNAL = support/dummy-external
   $(shell rm -f $(BR2_EXTERNAL_FILE))
 else
   _BR2_EXTERNAL = $(shell cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd)
@@ -160,6 +155,7 @@ else
   endif
   override BR2_EXTERNAL := $(_BR2_EXTERNAL)
   $(shell echo BR2_EXTERNAL ?= $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
+  BR2_EXTERNAL_MK = $(BR2_EXTERNAL)/external.mk
 endif
 
 # To make sure that the environment variable overrides the .config option,
@@ -414,7 +410,8 @@ include linux/linux.mk
 include system/system.mk
 include fs/common.mk
 
-include $(BR2_EXTERNAL)/external.mk
+# Nothing to include if no BR2_EXTERNAL tree in use
+include $(BR2_EXTERNAL_MK)
 
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR)
@@ -798,13 +795,12 @@ endif
 
 .PHONY: $(BUILD_DIR)/.br2-external.in
 $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
-	$(Q)( \
+	$(Q)if [ -n '$(BR2_EXTERNAL)' ]; then \
 		printf "#\n# Automatically generated file; DO NOT EDIT.\n#\n\n"; \
-		printf 'menu "User-provided options"\n'; \
-		printf '\tdepends on BR2_EXTERNAL != "support/dummy-external"\n\n'; \
+		printf 'menu "User-provided options"\n\n'; \
 		printf 'source "%s/Config.in"\n\n' $$(cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd); \
 		printf 'endmenu\n'; \
-	) >$@
+	fi >$@
 
 # printvars prints all the variables currently defined in our Makefiles
 printvars:
diff --git a/support/dummy-external/Config.in b/support/dummy-external/Config.in
deleted file mode 100644
index e69de29..0000000
diff --git a/support/dummy-external/external.mk b/support/dummy-external/external.mk
deleted file mode 100644
index e69de29..0000000
-- 
1.9.1
