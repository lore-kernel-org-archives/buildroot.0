From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri,  6 May 2016 09:45:13 +0200
Subject: [Buildroot] [PATCH 2/2] macchanger: add patch to fix musl build
In-Reply-To: <1462520713-9222-1-git-send-email-joerg.krause@embedded.rocks>
References: <1462520713-9222-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1462520713-9222-2-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to fix a build error with the musl C library.

caddr_t is defined in <sys/types.h>. This header file must be included to fix
build with the musl C library:

netinfo.c: In function 'mc_net_info_get_permanent_mac':
netinfo.c:116:28: error: 'caddr_t' undeclared (first use in this function)
  req.ifr_data = (caddr_t)epa;

The project looks dead, the last commit dates Jan 1, 2014. So the fix is not
sent upstream.

Fixes:
http://autobuild.buildroot.net/results/796/7966ad4f994d893918368891107f660295164f07/
http://autobuild.buildroot.net/results/177/177db3c7cbb59e4388c6742e987f92df53a23fc3/
.. and many more

Replaces:
http://patchwork.ozlabs.org/patch/572195/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../0001-Fix-missing-include-for-caddr_t.patch     | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/macchanger/0001-Fix-missing-include-for-caddr_t.patch

diff --git a/package/macchanger/0001-Fix-missing-include-for-caddr_t.patch b/package/macchanger/0001-Fix-missing-include-for-caddr_t.patch
new file mode 100644
index 0000000..cf5ade8
--- /dev/null
+++ b/package/macchanger/0001-Fix-missing-include-for-caddr_t.patch
@@ -0,0 +1,35 @@
+From 4eeb901b7aadb167e44f476fd665f7fedf491e51 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Fri, 6 May 2016 09:28:36 +0200
+Subject: [PATCH] Fix missing include for caddr_t
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+caddr_t is defined in <sys/types.h>. This header file must be included to fix
+build with the musl C library:
+
+netinfo.c: In function 'mc_net_info_get_permanent_mac':
+netinfo.c:116:28: error: 'caddr_t' undeclared (first use in this function)
+  req.ifr_data = (caddr_t)epa;
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ src/netinfo.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/netinfo.c b/src/netinfo.c
+index 3525123..1aa3293 100644
+--- a/src/netinfo.c
++++ b/src/netinfo.c
+@@ -28,6 +28,7 @@
+ #include <string.h>
+ #include <unistd.h>
+ #include <sys/ioctl.h>
++#include <sys/types.h>
+ 
+ #include <linux/ethtool.h>
+ #include <linux/sockios.h>
+-- 
+2.8.2
+
-- 
2.8.2
