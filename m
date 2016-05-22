From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 22 May 2016 14:26:30 +0200
Subject: [Buildroot] [PATCH 2/3] package/tinc: optionally include
	linux/if_tun.h to fix musl build
In-Reply-To: <1463919991-28382-1-git-send-email-bernd.kuhls@t-online.de>
References: <1463919991-28382-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1463919991-28382-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/5b1/5b1d0c8c1bd75f7e228c313cb21b1638301568ae/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tinc/0001-musl.patch | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/tinc/0001-musl.patch

diff --git a/package/tinc/0001-musl.patch b/package/tinc/0001-musl.patch
new file mode 100644
index 0000000..654c705
--- /dev/null
+++ b/package/tinc/0001-musl.patch
@@ -0,0 +1,32 @@
+From: Jo-Philipp Wich <jow@openwrt.org>
+Date: Thu, 18 Jun 2015 21:58:31 +0000 (+0200)
+Subject: fix musl compatibility
+X-Git-Tag: release-1.0.26~9
+X-Git-Url: http://www.tinc-vpn.org/git/browse?p=tinc;a=commitdiff_plain;h=a04fd9d0c9babca461cee186677db8f607677c6a;hp=bb616245b7883ab30291cd8d46672ed2ae733166
+
+fix musl compatibility
+
+Let configure include sys/if_tun.h when testing for netinet/if_ether.h
+to detect the Kernel/libc header conflict on musl.
+
+After this patch, configure will correctly detect netinet/if_ether.h as
+unusable and the subsequent compilation will not attempt to use it.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(downloaded upstream commit included in tinc 1.0.25:
+ http://www.tinc-vpn.org/git/browse?p=tinc;a=commitdiff;h=a04fd9d0c9babca461cee186677db8f607677c6a)
+---
+
+diff --git a/src/have.h b/src/have.h
+index e83f98f..69d5100 100644
+--- a/src/have.h
++++ b/src/have.h
+@@ -207,4 +207,8 @@
+ #include <resolv.h>
+ #endif
+ 
++#ifdef HAVE_LINUX_IF_TUN_H
++#include <linux/if_tun.h>
++#endif
++
+ #endif /* __TINC_SYSTEM_H__ */
-- 
2.8.1
