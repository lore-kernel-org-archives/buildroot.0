From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  7 Jun 2017 22:50:04 +0300
Subject: [Buildroot] [PATCH] swupdate: fix build with older glibc
Message-ID: <32de33e7091437e01987beeacd9f0264f8d78f8d.1496865004.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add -lrt that is needed for clock_gettime() with glibc before 2.17.

Fixes:
http://autobuild.buildroot.net/results/034/0345814c0b0023e124992974c0600bdda0824dbf/

Cc: J?rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...ags-SURICATTA_HAWKBIT-needs-librt-under-o.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/swupdate/0002-Makefile.flags-SURICATTA_HAWKBIT-needs-librt-under-o.patch

diff --git a/package/swupdate/0002-Makefile.flags-SURICATTA_HAWKBIT-needs-librt-under-o.patch b/package/swupdate/0002-Makefile.flags-SURICATTA_HAWKBIT-needs-librt-under-o.patch
new file mode 100644
index 000000000000..1f8d8e72f268
--- /dev/null
+++ b/package/swupdate/0002-Makefile.flags-SURICATTA_HAWKBIT-needs-librt-under-o.patch
@@ -0,0 +1,34 @@
+From 66ccd99c6299ebe70a5549da78063fd7b1e02ea2 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Wed, 7 Jun 2017 22:28:03 +0300
+Subject: [PATCH] Makefile.flags: SURICATTA_HAWKBIT needs librt under older
+ glibc
+
+glibc before 2.17 requires linking against librt for clock_gettime(). Fixes
+the following build failure:
+
+ld: suricatta/lib.a(server_hawkbit.o): undefined reference to symbol 'clock_gettime@@GLIBC_2.2'
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status:
+https://groups.google.com/forum/?hl=en#!topic/swupdate/77QWIka27es
+
+ Makefile.flags | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.flags b/Makefile.flags
+index 391fc7f82682..8db5dfeacc2f 100644
+--- a/Makefile.flags
++++ b/Makefile.flags
+@@ -173,6 +173,7 @@ LDLIBS += crypto ssl
+ endif
+ endif
+ ifneq ($(CONFIG_SURICATTA_HAWKBIT),)
++LDLIBS += rt
+ ifeq ($(strip $(findstring json-c,$(LDLIBS))),)
+ LDLIBS += json-c
+ endif
+-- 
+2.11.0
+
-- 
2.11.0
