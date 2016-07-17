From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2016 12:34:28 +0200
Subject: [Buildroot] [PATCH 08/16 v3] core: do not hard-code inclusion of
	br2-external in Kconfig
In-Reply-To: <cover.1468750623.git.yann.morin.1998@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
Message-ID: <326c5c4a0a2b9cb4d4cb430791ce5aaf21185e95.1468750623.git.yann.morin.1998@free.fr>
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
index 7f533ce..7810bf8 100644
--- a/Config.in
+++ b/Config.in
@@ -761,11 +761,4 @@ source "package/Config.in.host"
 
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
index 39a1507..86c532e 100644
--- a/Makefile
+++ b/Makefile
@@ -882,7 +882,13 @@ endif
 
 .PHONY: $(BUILD_DIR)/.br2-external.in
 $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
-	@touch $@
+	$(Q)( \
+		printf "#\n# Automatically generated file; DO NOT EDIT.\n#\n\n"; \
+		printf 'menu "User-provided options"\n'; \
+		printf '\tdepends on BR2_EXTERNAL != "support/dummy-external"\n\n'; \
+		printf 'source "%s/Config.in"\n\n' $$(cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd); \
+		printf 'endmenu # User-provided options\n'; \
+	) >$@
 
 # printvars prints all the variables currently defined in our
 # Makefiles. Alternatively, if a non-empty VARS variable is passed,
-- 
2.7.4
