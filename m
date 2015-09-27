From: Vicente Bergas <vicencb@gmail.com>
Date: Sun, 27 Sep 2015 14:48:22 +0100
Subject: [Buildroot] [PATCH] Fix musl-based builds on ARMhf platforms.
Message-ID: <1443361702-27612-1-git-send-email-vicencb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When ARCH is arm and the hard-floating-point option is on executables
expect to find the dynamic linker at /lib/ld-musl-armhf.so.1 and not
/lib/ld-musl-arm.so.1
There are two ways of fixing this:
 1) Changing the actual location of the dynamic linker.
 2) Changing the expected location of the dynamic linker.
This patch uses option 1.
I don't know how to do option 2 and also don't know which option is better.

Signed-off-by: Vicente Bergas <vicencb@gmail.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 61a5dba..79afdaa 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -524,6 +524,8 @@ endef
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
 ifeq ($(BR2_i386),y)
 MUSL_ARCH = i386
+else ifeq ($(BR2_ARM_EABIHF),y)
+MUSL_ARCH = armhf
 else
 MUSL_ARCH = $(ARCH)
 endif
-- 
2.5.3
