From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Nov 2013 09:37:22 -0300
Subject: [Buildroot] [PATCH] iptables: patch another static linking issue
Message-ID: <1385555842-28111-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/e4a/e4a0f93e2abdad0222063b3f71970ee1c5940f3a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...ables-Makefile.am-fix-more-static-linking.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/iptables/iptables-02-iptables-Makefile.am-fix-more-static-linking.patch

diff --git a/package/iptables/iptables-02-iptables-Makefile.am-fix-more-static-linking.patch b/package/iptables/iptables-02-iptables-Makefile.am-fix-more-static-linking.patch
new file mode 100644
index 0000000..8f59547
--- /dev/null
+++ b/package/iptables/iptables-02-iptables-Makefile.am-fix-more-static-linking.patch
@@ -0,0 +1,31 @@
+From 4221a62685512c461b774fb66e808fcb0b52e0a9 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 27 Nov 2013 09:22:32 -0300
+Subject: [PATCH iptables] iptables/Makefile.am: fix more static linking issues
+
+On uClibc-based targets dlfcn.h isn't available when built for
+static-only targets.
+Add up -DNO_SHARED_LIBS when building static so as to guard off the
+include.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ iptables/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/iptables/Makefile.am b/iptables/Makefile.am
+index a4246eb..1122d72 100644
+--- a/iptables/Makefile.am
++++ b/iptables/Makefile.am
+@@ -7,7 +7,7 @@ xtables_multi_SOURCES  = xtables-multi.c iptables-xml.c
+ xtables_multi_CFLAGS   = ${AM_CFLAGS}
+ xtables_multi_LDADD    = ../extensions/libext.a
+ if ENABLE_STATIC
+-xtables_multi_CFLAGS  += -DALL_INCLUSIVE
++xtables_multi_CFLAGS  += -DALL_INCLUSIVE -DNO_SHARED_LIBS
+ endif
+ if ENABLE_IPV4
+ xtables_multi_SOURCES += iptables-save.c iptables-restore.c \
+-- 
+1.8.3.2
+
-- 
1.8.3.2
