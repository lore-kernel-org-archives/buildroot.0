From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 May 2017 23:40:55 +0200
Subject: [Buildroot] [PATCH 3/3] mpir: fix build on mips32r6/mips64r6
In-Reply-To: <1494193255-15762-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1494193255-15762-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1494193255-15762-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The optimized mips32 and mips64 assembly code is not compatible with
mips32r6/mips64r6, so use the generic code of MPIR on such platforms.

Fixes:

 - http://autobuild.buildroot.net/results/db2542a2ec3029eda81738a7ae5faeb9ea4aedee/
   mips32r6 toolchain

 - http://autobuild.buildroot.net/results/50b94e6d0dbc33664c6bfe06f83b211083aa07f7/
   mips64r6 toolchain

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/mpir/mpir.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
index cf17502..14d8968 100644
--- a/package/mpir/mpir.mk
+++ b/package/mpir/mpir.mk
@@ -26,4 +26,9 @@ ifeq ($(BR2_arm)$(BR2_armeb):$(BR2_ARM_CPU_HAS_ARM),y:)
 MPIR_CONF_ENV += MPN_PATH="generic"
 endif
 
+# Optimized mips32/mips64 code not suitable for mips32r6/mips64r6
+ifeq ($(BR2_mips32r6)$(BR2_mips64r6),y)
+MPIR_CONF_ENV += MPN_PATH="generic"
+endif
+
 $(eval $(autotools-package))
-- 
2.7.4
