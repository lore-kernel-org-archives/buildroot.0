From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 22:32:31 +0200
Subject: [Buildroot] [git commit branch/next] uclibc: enable debug build
	option
Message-ID: <20160517203237.90C86818F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e35c2c1ae1b6486bc928cbee430ad362ab3c5294
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Set uClibc DODEBUG in case BR2_ENABLE_DEBUG is set.

Setting DODEBUG was removed with commit 70b7079d3797304fe3c9ba2941d3f446af3cea79
in Dec. 2013 because of build failures with the old uClibc (now replaced
with uClibc-ng), no build failure with raspberrypi3_defconfig and
BR2_ENABLE_DEBUG enabled.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index b8ccee2..6782682 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -182,6 +182,15 @@ endef
 endif
 
 #
+# Debug
+#
+ifeq ($(BR2_ENABLE_DEBUG),y)
+define UCLIBC_DEBUG_CONFIG
+	$(call KCONFIG_ENABLE_OPT,DODEBUG,$(@D)/.config)
+endef
+endif
+
+#
 # Endianness
 #
 
@@ -394,6 +403,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_SPARC_TYPE_CONFIG)
 	$(UCLIBC_POWERPC_TYPE_CONFIG)
 	$(UCLIBC_X86_TYPE_CONFIG)
+	$(UCLIBC_DEBUG_CONFIG)
 	$(UCLIBC_ENDIAN_CONFIG)
 	$(UCLIBC_LARGEFILE_CONFIG)
 	$(UCLIBC_IPV6_CONFIG)
