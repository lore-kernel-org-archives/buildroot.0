From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Jun 2017 11:54:31 +0200
Subject: [Buildroot] [git commit] printvars: remove "Nothing to be done for
	'printvars'."
Message-ID: <20170615100005.D14A98165E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd036c978a2e32ac84ae1060289fd2d352b9b940
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When calling 'make printvars' without -s, it ends with
"Nothing to be done for 'printvars'." That's because the rule only
contains $(info ...) calls and no actual shell commands to execute.

To avoid this, make sure there is a shell command by adding :.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 320f74a..88d98e0 100644
--- a/Makefile
+++ b/Makefile
@@ -955,7 +955,7 @@ $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
 # displayed.
 .PHONY: printvars
 printvars:
-	@$(foreach V, \
+	@:$(foreach V, \
 		$(sort $(if $(VARS),$(filter $(VARS),$(.VARIABLES)),$(.VARIABLES))), \
 		$(if $(filter-out environment% default automatic, \
 				$(origin $V)), \
