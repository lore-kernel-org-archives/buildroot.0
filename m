From: Trent Piepho <tpiepho@impinj.com>
Date: Fri, 17 Aug 2018 16:15:48 -0700
Subject: [Buildroot] [PATCH] Fix issue with printvars executing giant shell
 command
Message-ID: <20180817231548.29867-1-tpiepho@impinj.com>
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

The solution here is to use $(strip $(foreach ...)), so the command
expands to "@:", which make is smart enough to not even execute and
wouldn't exceed any limits if it did.

In some cases, make will not invoke a command via "sh -c" and will exec
it directly.  In this case make does command line argument parsing and
will swallow all the whitespace without overflowing a /bin/sh limit.  It
proved difficult to write a command that ensured make would do this.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 0115c4dfcc..b396c56042 100644
--- a/Makefile
+++ b/Makefile
@@ -988,13 +988,13 @@ $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
 # displayed.
 .PHONY: printvars
 printvars:
-	@:$(foreach V, \
+	@:$(strip $(foreach V, \
 		$(sort $(if $(VARS),$(filter $(VARS),$(.VARIABLES)),$(.VARIABLES))), \
 		$(if $(filter-out environment% default automatic, \
 				$(origin $V)), \
 		$(if $(QUOTED_VARS),\
 			$(info $V='$(subst ','\'',$(if $(RAW_VARS),$(value $V),$($V)))'), \
-			$(info $V=$(if $(RAW_VARS),$(value $V),$($V))))))
+			$(info $V=$(if $(RAW_VARS),$(value $V),$($V)))))))
 # ' Syntax colouring...
 
 .PHONY: clean
-- 
2.14.4
