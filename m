From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 15 Jun 2017 00:11:34 +0200
Subject: [Buildroot] [PATCH 7/8] printvars: remove "Nothing to be done for
	'printvars'."
In-Reply-To: <20170614221135.17470-1-arnout@mind.be>
References: <20170614221135.17470-1-arnout@mind.be>
Message-ID: <20170614221135.17470-8-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When calling 'make printvars' without -s, it ends with
"Nothing to be done for 'printvars'." That's because the rule only
contains $(info ...) calls and no actual shell commands to execute.

To avoid this, make sure there is a shell command by adding :.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 320f74a30d..88d98e0405 100644
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
-- 
2.11.0
