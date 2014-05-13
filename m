From: Karoly Kasza <kaszak@gmail.com>
Date: Tue, 13 May 2014 15:58:14 +0200
Subject: [Buildroot] [PATCH 1/1] Fix redundant usage of -mcpu and
	-march/-mtune
In-Reply-To: <1399989494-21343-1-git-send-email-kaszak@gmail.com>
References: <1399989494-21343-1-git-send-email-kaszak@gmail.com>
Message-ID: <1399989494-21343-2-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable adding -mtune or -march to the external toolchain parameters
if -mcpu is present.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 toolchain/toolchain-external/toolchain-external.mk |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 3f88188..9ce4a2f 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -181,6 +181,10 @@ ifeq ($(BR2_x86_64),y)
 TOOLCHAIN_EXTERNAL_CFLAGS += -m64
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_64
 endif
+ifneq ($(CC_TARGET_CPU_),)
+TOOLCHAIN_EXTERNAL_CFLAGS += -mcpu=$(CC_TARGET_CPU_)
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_CPU='"$(CC_TARGET_CPU_)"'
+else
 ifneq ($(CC_TARGET_TUNE_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mtune=$(CC_TARGET_TUNE_)
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_TUNE='"$(CC_TARGET_TUNE_)"'
@@ -189,9 +193,6 @@ ifneq ($(CC_TARGET_ARCH_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -march=$(CC_TARGET_ARCH_)
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ARCH='"$(CC_TARGET_ARCH_)"'
 endif
-ifneq ($(CC_TARGET_CPU_),)
-TOOLCHAIN_EXTERNAL_CFLAGS += -mcpu=$(CC_TARGET_CPU_)
-TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_CPU='"$(CC_TARGET_CPU_)"'
 endif
 ifneq ($(CC_TARGET_ABI_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mabi=$(CC_TARGET_ABI_)
-- 
1.7.10.4
