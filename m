From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 11:13:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/irda-utils: fix musl build
In-Reply-To: <1454148798-28228-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454148798-28228-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454148798-28228-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/9df/9dfa781a6ebbd8af6aad650067c30a4342b83f0d/
http://autobuild.buildroot.net/results/fee/feed5bc6393fb35be755790d53218fc0d228d850/
and others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/irda-utils/0004-musl.patch | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/irda-utils/0004-musl.patch

diff --git a/package/irda-utils/0004-musl.patch b/package/irda-utils/0004-musl.patch
new file mode 100644
index 0000000..e3e766f
--- /dev/null
+++ b/package/irda-utils/0004-musl.patch
@@ -0,0 +1,37 @@
+Fix musl build
+
+Downloaded from
+http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/musl.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+Replace use of <net/if_packet.h> with <linux/if_packet.h>.
+
+kernel headers <linux/if_packet.h> already provides the
+needed definitions, moreover not all libc implementations
+provide if_packet.h e.g. musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: irda-utils-0.9.18/irdaping/irdaping.c
+===================================================================
+--- irda-utils-0.9.18.orig/irdaping/irdaping.c
++++ irda-utils-0.9.18/irdaping/irdaping.c
+@@ -33,7 +33,6 @@
+ #include <sys/socket.h>
+ #include <sys/ioctl.h>
+ #include <net/if.h>		/* For struct ifreq */
+-#include <net/if_packet.h>	/* For struct sockaddr_pkt */
+ #include <net/if_arp.h>		/* For ARPHRD_IRDA */
+ #include <netinet/if_ether.h>	/* For ETH_P_ALL */
+ #include <netinet/in.h>		/* For htons */
+@@ -46,6 +45,7 @@
+ #include <asm/byteorder.h>	/* __cpu_to_le32 and co. */
+ 
+ #include <linux/types.h>	/* For __u8 and co. */
++#include <linux/if_packet.h>	/* For struct sockaddr_pkt */
+ #include <irda.h>
+ 
+ #ifndef AF_IRDA
-- 
2.7.0.rc3
