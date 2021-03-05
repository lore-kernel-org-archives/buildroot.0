From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 5 Mar 2021 11:18:40 +0100
Subject: [Buildroot] [git commit] package/dhcpcd: disable privsep on older
 kernels
Message-ID: <20210305095558.D01B287307@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d412539dbca22265a940e45b6ae22fb58e004a3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit e5594f7239547672c08058b77f8098d2c080bebc fixed privsep for sh,
or1k, microblaze, xtensa, arc, nds32 and nios2, but failed to take into
account that the audit functionality is only available in recent kernels
on those architectures.

Pass the --disable-privsep configure option if the kernel is too old in
those architectures.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dhcpcd/dhcpcd.mk | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index cb269f1138..f040610de4 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -16,8 +16,23 @@ DHCPCD_CONFIG_OPTS = \
 	--os=linux \
 	--privsepuser=dhcpcd
 
-# AUDIT_ARCH_NDS32 is only available since kernel >= 5.2
-ifeq ($(BR2_nds32):$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2),y:)
+# AUDIT_ARCH_{OPENRISC,SH,SHEL,SH64,SHEL64} are only available with kernel >= 3.7
+ifeq ($(BR2_or1k)$(BR2_sh):$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7),y:)
+DHCPCD_CONFIG_OPTS += --disable-privsep
+endif
+
+# AUDIT_ARCH_MICROBLAZE is only available with kernel >= 3.18
+ifeq ($(BR2_microblazeel)$(BR2_microblazebe):$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18),y:)
+DHCPCD_CONFIG_OPTS += --disable-privsep
+endif
+
+# AUDIT_ARCH_XTENSA is only available with kernel >= 5.0
+ifeq ($(BR2_xtensa):$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0),y:)
+DHCPCD_CONFIG_OPTS += --disable-privsep
+endif
+
+# AUDIT_ARCH_{ARCOMPACT,ARCV2,NDS32,NIOS2} are only available with kernel >= 5.2
+ifeq ($(BR2_arceb)$(BR2_arcle)$(BR2_nds32)$(BR2_nios2):$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2),y:)
 DHCPCD_CONFIG_OPTS += --disable-privsep
 endif
 
