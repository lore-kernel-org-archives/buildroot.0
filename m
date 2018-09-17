From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 17 Sep 2018 11:10:54 -0700
Subject: [Buildroot] [PATCH v2] Fix issue with printvars executing giant
 shell command
Message-ID: <20180917181054.14616-1-tpiepho@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The underlying problem is that $(foreach V,1 2 3,) does not evaluate to
an empty string.  It evaluates to "? ", three empty strings separated by
whitespace.

A construct of this format, with a giant list in the foreach, is part of
the printvars command.  This means that "@:$(foreach ....)", which is
intended to expand to a null command, in fact expands to "@:       "
with a great deal of whitespace.  Make chooses to execute this command
with:
    execve("/bin/sh", ["/bin/sh", "-c", ":       "]

But with far more whitespace.  So much that it can exceed shell command
line length limits.

This solution is to move the foreach to another step in the recipe.  The
"@:" is retained as the first line so the recipe is not Empty, which
would cause a change in make behavior when make builds the target.  The
2nd line, all whitespace, will be skipped by make.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 2c6af12989..57e776056c 100644
--- a/Makefile
+++ b/Makefile
@@ -988,7 +988,8 @@ $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
 # displayed.
 .PHONY: printvars
 printvars:
-	@:$(foreach V, \
+	@:
+	$(foreach V, \
 		$(sort $(if $(VARS),$(filter $(VARS),$(.VARIABLES)),$(.VARIABLES))), \
 		$(if $(filter-out environment% default automatic, \
 				$(origin $V)), \
-- 
2.14.4
