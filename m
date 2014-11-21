From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Fri, 21 Nov 2014 13:19:00 -0300
Subject: [Buildroot] [PATCH v4 1/9] Makefile: don't depend on the umask
In-Reply-To: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1416586748-12936-2-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages and BR itself create files and directories on the target
with cp/mkdir/etc which depend on the umask at the time of building.

To fix this, use a trick inside the Makefile which wraps all rules when
the umask is not 0022. This sets the umask at the top level, and then
the building process continues as usual.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 Makefile | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Makefile b/Makefile
index 3d8283b..eeb1412 100644
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
+	@umask $(UMASK) && $(MAKE)
+
+$(MAKECMDGOALS):
+	@umask $(UMASK) && $(MAKE) $@
+
+else # umask
+
 # This is our default rule, so must come first
 all:
 
@@ -932,3 +945,5 @@ include docs/manual/manual.mk
 -include $(BR2_EXTERNAL)/docs/*/*.mk
 
 .PHONY: $(noconfig_targets)
+
+endif #umask
-- 
2.1.3
