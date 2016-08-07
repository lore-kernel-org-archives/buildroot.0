From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  8 Aug 2016 00:03:17 +0200
Subject: [Buildroot] [PATCH 1/2] package/rt-tests: remove
	sched_setattr/sched_getattr API for SuperH arch
Message-ID: <1470607398-8644-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit remove rt-sched.o from librttest and pi_stress test program
only for SuperH arch which doesn't have __NR_sched_setattr and
__NR_sched_getattr syscalls defined.

Patch [1] adding these syscalls has not been merged in upstream kernel
(4.7).

Fixes:
http://autobuild.buildroot.net/results/67fc16366717f34df492683a14ecd23376e23110

[1] http://www.spinics.net/lists/linux-sh/msg41990.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/rt-tests/rt-tests.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index 19f1021..1433106 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -14,6 +14,16 @@ ifeq ($(BR2_PACKAGE_PYTHON),y)
 RT_TESTS_DEPENDENCIES = python
 endif
 
+# Deadline scheduler syscalls are not defined on SuperH.
+# Remove pi_stress which depends on deadline scheduler syscalls.
+ifeq ($(BR2_sh),y)
+define RT_TESTS_REMOVE_RT_SCHED_API
+	$(SED) "s/rt-sched.o//" $(@D)/Makefile
+	$(SED) "s/pi_stress.c//" $(@D)/Makefile
+endef
+endif
+RT_TESTS_POST_PATCH_HOOKS += RT_TESTS_REMOVE_RT_SCHED_API
+
 define RT_TESTS_BUILD_CMDS
 	$(MAKE) -C $(@D) 			\
 		CC="$(TARGET_CC)" 		\
-- 
2.5.5
