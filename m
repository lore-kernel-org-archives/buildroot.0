From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  6 Oct 2020 22:29:20 +0200
Subject: [Buildroot] [PATCHv2] toolchain-wrapper: Disable
 -ftree-loop-distribute-patterns when building for microblaze with gcc >= 10
Message-ID: <20201006202920.592493-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GCC 10 now enable by default -ftree-loop-distribute-patterns at -O2 or -Os
optimization level instead of -O3, see commit [1].

Due to this change, the microblaze kernel doesn't boot (as reported by
toolchain-builder project).

The gcc docs between version 9 and 10 has been updated accordingly [2] [3]
but there no word about this change in the gcc 10 changelog [4].

Fixes microblazebe:
https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359536 (glibc)
https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359538 (musl)
https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359540 (uClubc-ng)

Fixes microblazeel:
https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359542 (glibc)
https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359544 (musl)
https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359546 (uClibc-ng)

This has been reported upsteam [5].

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=5879ab5fafedc8f6f9bfe95a4cf8501b0df90edd
[2] https://gcc.gnu.org/onlinedocs/gcc-9.3.0/gcc/Optimize-Options.html#Optimize-Options
[3] https://gcc.gnu.org/onlinedocs/gcc-10.2.0/gcc/Optimize-Options.html#Optimize-Options
[4] https://gcc.gnu.org/gcc-10/changes.html
[5] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=97208

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
It's not clear if building the kernel with gcc 9 and -O3 trigger this issue.
It has been noticed by the change from [1].

v2: move -fno-tree-loop-distribute-patterns to the toolchain-wrapper (Arnout).
---
 toolchain/toolchain-wrapper.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index f1312c5c7f..8b551e3a18 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -33,6 +33,14 @@ TOOLCHAIN_WRAPPER_OPTS += -DBR_NEED_SOURCE_DATE_EPOCH
 endif
 endif
 
+# Disable -ftree-loop-distribute-patterns on microblaze to
+# workaround a compiler bug with gcc 10 and -O2, -Os or -O3.
+# https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=5879ab5fafedc8f6f9bfe95a4cf8501b0df90edd
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=97208
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_10)$(BR2_microblaze),yy)
+TOOLCHAIN_WRAPPER_OPTS += -fno-tree-loop-distribute-patterns
+endif
+
 # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each flag is a
 # separate argument when used in execv() by the toolchain wrapper.
 TOOLCHAIN_WRAPPER_ARGS += \
-- 
2.25.4
