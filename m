From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 May 2017 17:03:49 +0200
Subject: [Buildroot] [git commit] mpir: fix build on mips32r6/mips64r6
Message-ID: <20170509151441.383598163D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef9eebf65f554d9aacfd420600c8ba17787151a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The optimized mips32 and mips64 assembly code is not compatible with
mips32r6/mips64r6, so use the generic code of MPIR on such platforms.

Fixes:

 - http://autobuild.buildroot.net/results/db2542a2ec3029eda81738a7ae5faeb9ea4aedee/
   mips32r6 toolchain

 - http://autobuild.buildroot.net/results/50b94e6d0dbc33664c6bfe06f83b211083aa07f7/
   mips64r6 toolchain

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpir/mpir.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
index cf17502..03f21d8 100644
--- a/package/mpir/mpir.mk
+++ b/package/mpir/mpir.mk
@@ -26,4 +26,9 @@ ifeq ($(BR2_arm)$(BR2_armeb):$(BR2_ARM_CPU_HAS_ARM),y:)
 MPIR_CONF_ENV += MPN_PATH="generic"
 endif
 
+# Optimized mips32/mips64 code not suitable for mips32r6/mips64r6
+ifeq ($(BR2_mips_32r6)$(BR2_mips_64r6),y)
+MPIR_CONF_ENV += MPN_PATH="generic"
+endif
+
 $(eval $(autotools-package))
