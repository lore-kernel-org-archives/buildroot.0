From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Wed, 15 Apr 2020 17:00:32 -0500
Subject: [Buildroot] [PATCH 2/2] toolchain/toolchain-wrapper: Omit absolute
 paths from debug symbols for reproducibility
In-Reply-To: <20200415220032.140083-1-brandon.maier@rockwellcollins.com>
References: <20200415220032.140083-1-brandon.maier@rockwellcollins.com>
Message-ID: <20200415220032.140083-2-brandon.maier@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In GCC6 the compiler was made smarter to omit the flag
-fdebug-prefix-map from the DWARF DW_AT_producer section[1]. That flag
contains the absolute path '$(BASE_DIR)' which breaks reproducibility.
Prior to GCC6 however, the only way to omit the flag is to use
-gno-record-gcc-switches which omits all flags.

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=266cc0c181549c2fb6b50f8f26213cdc89101026

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
---
 toolchain/toolchain-wrapper.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 7d55050135..291366b093 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -29,6 +29,9 @@ else
 TOOLCHAIN_WRAPPER_OPTS += -fdebug-prefix-map=$(BASE_DIR)=buildroot
 TOOLCHAIN_WRAPPER_OPTS += -D__FILE__=\"\" -D__BASE_FILE__=\"\" -Wno-builtin-macro-redefined
 endif
+ifneq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y)
+TOOLCHAIN_WRAPPER_OPTS += -gno-record-gcc-switches
+endif
 endif
 
 # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each flag is a
-- 
2.25.1
