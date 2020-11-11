From: John Keeping <john@metanate.com>
Date: Wed, 11 Nov 2020 19:48:40 +0000
Subject: [Buildroot] [RFC PATCH] toolchain/toolchain-wrapper: remove
 --build-id=none option
Message-ID: <20201111194840.2949984-1-john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The only build-id style that is not reproducible is "uuid", but the
default is "sha1" so packages would have to go out of their way to
choose a non-reproducible build-id.  Having build IDs in general is
useful as it can be used to match split debuginfo.

I haven't seen any packages that do this, and if there are any that use
non-reproducible build-ids then that should be treated as a bug in that
package like any other reproducibility issue; there is no reason to
globally disable build IDs when BR2_REPRODUCIBLE is set.

Signed-off-by: John Keeping <john@metanate.com>
---
 toolchain/toolchain-wrapper.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 8b551e3a18..56d86fa1ea 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -22,7 +22,6 @@ TOOLCHAIN_WRAPPER_OPTS = \
 	$(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 
 ifeq ($(BR2_REPRODUCIBLE),y)
-TOOLCHAIN_WRAPPER_OPTS += -Wl,--build-id=none
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
 TOOLCHAIN_WRAPPER_OPTS += -ffile-prefix-map=$(BASE_DIR)=buildroot
 else
-- 
2.29.2
