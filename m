From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Apr 2012 10:52:39 +0200
Subject: [Buildroot] [git commit] lsof: add busybox tweaks
Message-ID: <20120429090502.40D0996C0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d7616cc9be8b1c7d91df9133dac24a59bb2e19c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since busybox 1.20+ includes a lsof applet make sure lsof gets built
after busybox so that we get the full-blown version if both are enabled.
Also hide the lsof package unless BUSYBOX_SHOW_OTHERS is true.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in    |    2 ++
 package/lsof/lsof.mk |    3 +++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a310146..34570be 100644
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
