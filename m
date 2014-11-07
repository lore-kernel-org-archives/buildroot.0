From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Fri,  7 Nov 2014 00:50:34 -0300
Subject: [Buildroot] [PATCH v2 1/5] Makefile: don't depend on the umask
In-Reply-To: <1415332238-31677-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1415018556-28336-1-git-send-email-guido@vanguardiasur.com.ar>
 <1415332238-31677-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1415332238-31677-2-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages and BR itself create files and directories on the target
with cp/mkdir/etc which depend on the umask at the time of building.

To fix this, change the Makefile's $(SHELL) to always call a wrapper
script first that sets the umask to a sane fixed value (022) and then
calls the real shell.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 Makefile                         | 3 ++-
 support/scripts/shell-wrapper.sh | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)
 create mode 100755 support/scripts/shell-wrapper.sh

diff --git a/Makefile b/Makefile
index 907a0fc..d9f1fb0 100644
--- a/Makefile
+++ b/Makefile
@@ -203,7 +203,8 @@ else
 endif
 
 # we want bash as shell
-SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
+SHELL := $(TOPDIR)/support/scripts/shell-wrapper.sh \
+	 $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
 	 else if [ -x /bin/bash ]; then echo /bin/bash; \
 	 else echo sh; fi; fi)
 
diff --git a/support/scripts/shell-wrapper.sh b/support/scripts/shell-wrapper.sh
new file mode 100755
index 0000000..513b927
--- /dev/null
+++ b/support/scripts/shell-wrapper.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+umask 022
+
+exec "$@"
-- 
2.1.1
