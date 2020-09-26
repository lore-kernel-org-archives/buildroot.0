From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 26 Sep 2020 21:13:30 +0200
Subject: [Buildroot] [PATCH 2/2] linux: Disable
 -ftree-loop-distribute-patterns when building for microblaze with gcc >= 10
In-Reply-To: <20200926191330.96074-1-romain.naour@gmail.com>
References: <20200926191330.96074-1-romain.naour@gmail.com>
Message-ID: <20200926191330.96074-2-romain.naour@gmail.com>
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
 linux/linux.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index b9b223e3f3..9ee9054bed 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -158,6 +158,12 @@ ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
 LINUX_KCFLAGS += -Wno-attribute-alias
 endif
 
+# https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=5879ab5fafedc8f6f9bfe95a4cf8501b0df90edd
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=97208
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_10)$(BR2_microblaze),yy)
+LINUX_KCFLAGS += -fno-tree-loop-distribute-patterns
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT),y)
 LINUX_MAKE_ENV += DTC_FLAGS=-@
 endif
-- 
2.25.4
