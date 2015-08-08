From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:38 -0000
Subject: [Buildroot] [git commit branch/next] Makefile: don't depend on the
	umask
Message-ID: <20150808105630.0EED47FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bee5745ccc20be6dbba243b1f8af0d5c522923e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Some packages and BR itself create files and directories on the target
with cp/mkdir/etc which depend on the umask at the time of building.

To fix this, use a trick inside the Makefile which wraps all rules when
the umask is not 0022. This sets the umask at the top level, and then
the building process continues as usual.

[Thomas: add --no-print-directory, as suggested by Arnout.]

Signed-off-by: Guido Mart??nez <guido@vanguardiasur.com.ar>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index daf692e..55b1d45 100644
--- a/Makefile
+++ b/Makefile
@@ -24,6 +24,19 @@
 # You shouldn't need to mess with anything beyond this point...
 #--------------------------------------------------------------
 
+# Trick for always running with a fixed umask
+UMASK=0022
+ifneq ($(shell umask),$(UMASK))
+.PHONY: all $(MAKECMDGOALS)
+
+all:
+	@umask $(UMASK) && $(MAKE) --no-print-directory
+
+$(MAKECMDGOALS):
+	@umask $(UMASK) && $(MAKE) --no-print-directory $@
+
+else # umask
+
 # This is our default rule, so must come first
 all:
 
@@ -937,3 +950,5 @@ include docs/manual/manual.mk
 -include $(BR2_EXTERNAL)/docs/*/*.mk
 
 .PHONY: $(noconfig_targets)
+
+endif #umask
