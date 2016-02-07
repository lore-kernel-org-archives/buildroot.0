From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 22:15:17 +0100
Subject: [Buildroot] [git commit] package/irda-utils: fix musl build
Message-ID: <20160207211554.801218016A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c3e982a7dfba9ee09a50f56401ca981424a847c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/9df/9dfa781a6ebbd8af6aad650067c30a4342b83f0d/
http://autobuild.buildroot.net/results/fee/feed5bc6393fb35be755790d53218fc0d228d850/
and others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/irda-utils/0004-musl.patch | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/irda-utils/0004-musl.patch b/package/irda-utils/0004-musl.patch
new file mode 100644
index 0000000..6cf975b
--- /dev/null
+++ b/package/irda-utils/0004-musl.patch
@@ -0,0 +1,31 @@
+Replace use of <net/if_packet.h> with <linux/if_packet.h>.
+
+kernel headers <linux/if_packet.h> already provides the
+needed definitions, moreover not all libc implementations
+provide if_packet.h e.g. musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+[From http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/musl.patch.]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
