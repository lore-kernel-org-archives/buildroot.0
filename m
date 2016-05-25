From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 May 2016 23:27:18 +0200
Subject: [Buildroot] [git commit] package/tinc: optionally include
	linux/if_tun.h to fix musl build
Message-ID: <20160525213243.720D0817EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8fa6ee99f171103271629efb2280ef8391bbc5af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/5b1/5b1d0c8c1bd75f7e228c313cb21b1638301568ae/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tinc/0001-musl.patch | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

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
