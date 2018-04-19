From: Stefan Becker <chemobejk@gmail.com>
Date: Thu, 19 Apr 2018 10:40:54 +0300
Subject: [Buildroot] [PATCH v2] core: enhance printvars for variables with
 newlines
In-Reply-To: <CAOJ2eMc+3Bx40nWF=VALh6JzeaNVWPekyCGXAL2=a_YX4yJWug@mail.gmail.com>
References: <CAOJ2eMc+3Bx40nWF=VALh6JzeaNVWPekyCGXAL2=a_YX4yJWug@mail.gmail.com>
Message-ID: <20180419074054.4075-1-chemobejk@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current output formats of printvars do not preserve newlines. Add
the option MULTILINE_VARS which causes the variable content to be dumped
in a format that preserves newlines:

   MULTILINE_VAR_START VAR
   ... line 1 ...
   ... line 2 ...
   ...
   MULTILINE_VAR_END VAR

Updated the manual accordingly.

Signed-off-by: Stefan Becker <chemobejk@gmail.com>
---
 Makefile                  | 10 +++++++---
 docs/manual/make-tips.txt | 20 ++++++++++++++++++++
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 54f940659c..bd78da8362 100644
--- a/Makefile
+++ b/Makefile
@@ -979,9 +979,13 @@ printvars:
 		$(sort $(if $(VARS),$(filter $(VARS),$(.VARIABLES)),$(.VARIABLES))), \
 		$(if $(filter-out environment% default automatic, \
 				$(origin $V)), \
-		$(if $(QUOTED_VARS),\
-			$(info $V='$(subst ','\'',$(if $(RAW_VARS),$(value $V),$($V)))'), \
-			$(info $V=$(if $(RAW_VARS),$(value $V),$($V))))))
+		$(if $(MULTILINE_VARS), \
+			$(info MULTILINE_VAR_START $V) \
+			$(info $(if $(RAW_VARS),$(value $V),$($V))) \
+			$(info MULTILINE_VAR_END $V), \
+			$(if $(QUOTED_VARS),\
+				$(info $V='$(subst ','\'',$(if $(RAW_VARS),$(value $V),$($V)))'), \
+				$(info $V=$(if $(RAW_VARS),$(value $V),$($V)))))))
 # ' Syntax colouring...
 
 .PHONY: clean
diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index ea1d825bef..c796bd73e2 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -92,6 +92,8 @@ It is possible to tweak the output using some variables:
 
 - +VARS+ will limit the listing to variables which names match the
   specified make-pattern
+- +MULTILINE_VARS+, if set to +YES+, will use a start and end marker around
+  the variable content to preserve newlines in the value
 - +QUOTED_VARS+, if set to +YES+, will single-quote the value
 - +RAW_VARS+, if set to +YES+, will print the unexpanded value
 
@@ -106,6 +108,24 @@ For example:
  BUSYBOX_RDEPENDENCIES=ncurses util-linux
 ----
 
+----
+ $ make -s printvars VARS=BUSYBOX_%DEPENDENCIES MULTILINE_VARS=YES
+ MULTILINE_VAR_START BUSYBOX_DEPENDENCIES
+ skeleton toolchain
+ MULTILINE_VAR_END BUSYBOX_DEPENDENCIES
+ MULTILINE_VAR_START BUSYBOX_FINAL_ALL_DEPENDENCIES
+ skeleton toolchain
+ MULTILINE_VAR_END BUSYBOX_FINAL_ALL_DEPENDENCIES
+ MULTILINE_VAR_START BUSYBOX_FINAL_DEPENDENCIES
+ skeleton toolchain
+ MULTILINE_VAR_END BUSYBOX_FINAL_DEPENDENCIES
+ MULTILINE_VAR_START BUSYBOX_FINAL_PATCH_DEPENDENCIES
+ MULTILINE_VAR_END BUSYBOX_FINAL_PATCH_DEPENDENCIES
+ MULTILINE_VAR_START BUSYBOX_RDEPENDENCIES
+ ncurses util-linux'linux-pam skeleton toolchain host-skeleton host-ccache
+ MULTILINE_VAR_END BUSYBOX_RDEPENDENCIES
+----
+
 ----
  $ make -s printvars VARS=BUSYBOX_%DEPENDENCIES QUOTED_VARS=YES
  BUSYBOX_DEPENDENCIES='skeleton toolchain'
-- 
2.14.3
