From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 13:31:17 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] Makefile: fix issue with
 printvars executing giant shell command
Message-ID: <20181005113022.AEE0B8D203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98cc263f1bcfa7fc811f08345ec1379a6aae92a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

The underlying problem is that $(foreach V,1 2 3,) does not evaluate to
an empty string.  It evaluates to "?? ", three empty strings separated by
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
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b8d0aadc6d52733cfc914ba3cd6f506238bd19f7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 32b848c189..401bc7e8bc 100644
--- a/Makefile
+++ b/Makefile
@@ -977,7 +977,8 @@ $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
 # displayed.
 .PHONY: printvars
 printvars:
-	@:$(foreach V, \
+	@:
+	$(foreach V, \
 		$(sort $(if $(VARS),$(filter $(VARS),$(.VARIABLES)),$(.VARIABLES))), \
 		$(if $(filter-out environment% default automatic, \
 				$(origin $V)), \
