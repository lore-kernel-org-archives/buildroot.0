From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Apr 2012 07:15:24 -0300
Subject: [Buildroot] [PATCH 2/2] lsof: add busybox tweaks
In-Reply-To: <1335435324-18792-1-git-send-email-gustavo@zacarias.com.ar>
References: <1335435324-18792-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1335435324-18792-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since busybox 1.20+ includes a lsof applet make sure lsof gets built
after busybox so that we get the full-blown version if both are enabled.
Also hide the lsof package unless BUSYBOX_SHOW_OTHERS is true.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in    |    2 ++
 package/lsof/lsof.mk |    3 +++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 64fce62..7f9b234 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -24,7 +24,9 @@ source "package/dmalloc/Config.in"
 source "package/kexec/Config.in"
 source "package/latencytop/Config.in"
 source "package/lmbench/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/lsof/Config.in"
+endif
 source "package/ltp-testsuite/Config.in"
 source "package/lttng-babeltrace/Config.in"
 source "package/lttng-modules/Config.in"
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index c07fb2d..7bc22c0 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -8,6 +8,9 @@ LSOF_VERSION = 4.85
 LSOF_SOURCE = lsof_$(LSOF_VERSION).tar.bz2
 LSOF_SITE = ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
 
+# Make certain full-blown lsof gets built after the busybox version (1.20+)
+LSOF_DEPENDENCIES += $(if $(BR2_PACKAGE_BUSYBOX),busybox)
+
 BR2_LSOF_CFLAGS =
 ifeq ($(BR2_LARGEFILE),)
 BR2_LSOF_CFLAGS += -U_FILE_OFFSET_BITS
-- 
1.7.3.4
