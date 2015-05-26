From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 May 2015 01:42:06 +0200
Subject: [Buildroot] [PATCH 11/21 RFC] core: do not hard-code inclusion of
	br2-external in Kconfig
In-Reply-To: <cover.1432681414.git.yann.morin.1998@free.fr>
References: <cover.1432681414.git.yann.morin.1998@free.fr>
Message-ID: <c15ef6c254880b821418e82b44a15d7b54716421.1432681414.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move the inclusion of br2-external's Config.in to the generated kconfig
snippet.

This will ultimately allow us to use more than one br2-external tree.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 Config.in | 7 -------
 Makefile  | 8 +++++++-
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/Config.in b/Config.in
index 7c2575e..491051e 100644
--- a/Config.in
+++ b/Config.in
@@ -635,11 +635,4 @@ source "package/Config.in.host"
 
 source "Config.in.legacy"
 
-menu "User-provided options"
-	depends on BR2_EXTERNAL != "support/dummy-external"
-
-source "$BR2_EXTERNAL/Config.in"
-
-endmenu
-
 source "$BR2_BUILD_DIR/.br2-external.in"
diff --git a/Makefile b/Makefile
index 4ddef1b..ad43972 100644
--- a/Makefile
+++ b/Makefile
@@ -798,7 +798,13 @@ endif
 
 .PHONY: $(BUILD_DIR)/.br2-external.in
 $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
-	@touch $@
+	$(Q)( \
+		printf "#\n# Automatically generated file; DO NOT EDIT.\n#\n\n"; \
+		printf 'menu "User-provided options"\n'; \
+		printf '\tdepends on BR2_EXTERNAL != "support/dummy-external"\n\n'; \
+		printf 'source "%s/Config.in"\n\n' $$(cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd); \
+		printf 'endmenu\n'; \
+	) >$@
 
 # printvars prints all the variables currently defined in our Makefiles
 printvars:
-- 
1.9.1
