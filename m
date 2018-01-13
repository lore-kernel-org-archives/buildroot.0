From: tolvupostur at gmail.com <tolvupostur@gmail.com>
Date: Sat, 13 Jan 2018 21:19:42 +0100
Subject: [Buildroot] [PATCH] iputils: fix ping and traceroute6 executable
 permissions
Message-ID: <1515874782-14986-1-git-send-email-tolvupostur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Einar Jon Gunnarsson <tolvupostur@gmail.com>

The iputils executables are installed without the setuid bit set,
which prevents some programs from working.

This patch adds a post-install hook to fix the permissions of the
ping and traceroute6 executables.

Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
---
 package/iputils/iputils.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index b20cd12..13e3389 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -69,4 +69,9 @@ define IPUTILS_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/traceroute6 $(TARGET_DIR)/bin/traceroute6
 endef
 
+define IPUTILS_PERMISSIONS
+	/bin/ping        f 4755 0 0 - - - - -
+	/bin/traceroute6 f 4755 0 0 - - - - -
+endef
+
 $(eval $(generic-package))
-- 
1.9.1
