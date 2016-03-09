From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  9 Mar 2016 23:58:44 +0100
Subject: [Buildroot] [PATCH v7 03/18] core: re-enter make if $(CURDIR) or
	$(O) are not absolute canonical path
In-Reply-To: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1457564339-27294-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When $(CURDIR) or $(O) contain symlinks (or mount-bind) in their path,
they can be resolved differently, depending on each package build-system
(whether it uses the given paths or get the absolute canonical ones).

Thus, to make easier tracking down host machine paths leaking into the
host, target or staging trees, the CURDIR and O variables are set to
their absolute canonical paths.

Note that this change takes care of the makefile wrapper installed in
$(O) to avoid unneeded make recursion.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v6->v7:
- none

changes v5->v6:
- new patch
---
 Makefile | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 98c8dc7..52a92f6 100644
--- a/Makefile
+++ b/Makefile
@@ -26,16 +26,30 @@
 
 # Trick for always running with a fixed umask
 UMASK = 0022
-ifneq ($(shell umask),$(UMASK))
+
+# Check if we need to re-enter make for one or several of the following reasons:
+# 1- Wrong (too restrictive) umask:
+#    This prevents Buildroot and packages from creating files and directories.
+# 2- CWD (i.e. $(CURDIR)) not being the absolute canonical path:
+#    This makes harder tracking and fixing host machine path leaks.
+# 3- Output location (i.e. $(O)) not being the absolute canonical path:
+#    This makes harder tracking and fixing host machine path leaks.
+#
+# Note:
+# - remove the trailing '/.' from $(O) as it can be added by the makefile
+#   wrapper installed in the $(O).
+ifneq ($(shell umask):$(CURDIR):$(patsubst %/.,%,$(O)),$(UMASK):$(realpath $(CURDIR)):$(realpath $(O)))
 .PHONY: _all $(MAKECMDGOALS)
 
 $(MAKECMDGOALS): _all
 	@:
 
 _all:
-	@umask $(UMASK) && $(MAKE) --no-print-directory $(MAKECMDGOALS)
+	umask $(UMASK) && \
+		$(MAKE) -C $(realpath $(CURDIR)) --no-print-directory \
+			$(MAKECMDGOALS) O=$(realpath $(O))
 
-else # umask
+else # umask / $(CURDIR) / $(O)
 
 # This is our default rule, so must come first
 all:
@@ -1007,4 +1021,4 @@ include docs/manual/manual.mk
 
 .PHONY: $(noconfig_targets)
 
-endif #umask
+endif #umask / $(CURDIR) / $(O)
-- 
2.7.2
