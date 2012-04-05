From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Apr 2012 11:17:07 -0300
Subject: [Buildroot] [PATCH 6/6] dropbear: fix nommu build breakage
In-Reply-To: <1333635427-24526-1-git-send-email-gustavo@zacarias.com.ar>
References: <1333635427-24526-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1333635427-24526-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dropbear/dropbear-nommu.patch |   19 +++++++++++++++++++
 package/dropbear/dropbear.mk          |    5 +++++
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/dropbear/dropbear-nommu.patch

diff --git a/package/dropbear/dropbear-nommu.patch b/package/dropbear/dropbear-nommu.patch
new file mode 100644
index 0000000..cf228e1
--- /dev/null
+++ b/package/dropbear/dropbear-nommu.patch
@@ -0,0 +1,19 @@
+Get rid of the last lingering fork() for nommu systems.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura dropbear-2012.55/svr-main.c dropbear-2012.55-nommu/svr-main.c
+--- dropbear-2012.55/svr-main.c	2012-02-23 10:47:06.000000000 -0300
++++ dropbear-2012.55-nommu/svr-main.c	2012-04-05 10:46:19.639718670 -0300
+@@ -262,7 +262,11 @@
+ #ifdef DEBUG_NOFORK
+ 			fork_ret = 0;
+ #else
++# ifdef __uClinux__
++			fork_ret = vfork();
++# else
+ 			fork_ret = fork();
++# endif
+ #endif
+ 			if (fork_ret < 0) {
+ 				dropbear_log(LOG_WARNING, "Error forking: %s", strerror(errno));
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index fea96d6..3ce5a0e 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -10,6 +10,11 @@ DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
 DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
 		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
 
+# bfin 2011R1-RC4 toolchain doesn't define __uClinux__
+ifneq ($(BR2_USE_MMU),y)
+DROPBEAR_MAKE += CPPFLAGS="-D__uClinux__"
+endif
+
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 DROPBEAR_MAKE += STATIC=1
 endif
-- 
1.7.3.4
