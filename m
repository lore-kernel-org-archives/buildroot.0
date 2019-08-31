From: Atharva Lele <itsatharva@gmail.com>
Date: Sat, 31 Aug 2019 23:31:13 +0530
Subject: [Buildroot] [PATCH v2 2/2] toolchain/toolchain-wrapper: handle
 __FILE__ macro for reproducibility
In-Reply-To: <20190831180113.16025-1-itsatharva@gmail.com>
References: <20190831180113.16025-1-itsatharva@gmail.com>
Message-ID: <20190831180113.16025-2-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many tools use __FILE__ for debugging and __FILE__ captures the build path.
This results in non-reproducible images when building in different directories.

If the config uses GCC 8 or above, we use -ffile-prefix-map=old=new and let gcc
take care of the path remapping in __FILE__. Since GCC versions before v8 did
not have this feature, we use a dummy string in that case.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
Changes v2:
  - New patch
---
 toolchain/toolchain-wrapper.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 88695a5b2d..6d0ae2c85b 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -23,6 +23,11 @@ TOOLCHAIN_WRAPPER_OPTS = \
 
 ifeq ($(BR2_REPRODUCIBLE),y)
 TOOLCHAIN_WRAPPER_OPTS += -Wl,--build-id=none
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
+TOOLCHAIN_WRAPPER_OPTS += -ffile-prefix-map=$(BASE_DIR)=buildroot
+else
+TOOLCHAIN_WRAPPER_OPTS += -D__FILE__=\"file-path-replaced-by-buildroot-for-reproducibility\"
+endif
 endif
 
 # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each flag is a
-- 
2.22.0
