From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 00:15:48 +0200
Subject: [Buildroot] [git commit] uclibc: disable DOPIC on ARM FLAT
Message-ID: <20160329222011.B7B14807EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c2170c76a27297868b36868bbcf190862a2e817
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As explained by Waldemar, enabling DOPIC in uClibc will lead to the
creation of a Position Independent library. In turn, this will cause
elf2flt to generate a "Has-PIC-GOT" flat binary, which doesn't work on
ARM. In fact, elf2flt on ARM really expect to have non-PIC code as
input, so we must disable DOPIC in the uClibc configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index ad94494..e3e45f7 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -82,6 +82,12 @@ ifeq ($(BR2_GCC_VERSION_4_7_X)$(BR2_GCC_VERSION_4_8_X):$(BR2_ARM_INSTRUCTIONS_TH
 UCLIBC_EXTRA_CFLAGS += -marm
 endif
 
+ifeq ($(BR2_BINFMT_FLAT),y)
+define UCLIBC_ARM_BINFMT_FLAT
+	$(call KCONFIG_DISABLE_OPT,DOPIC,$(@D)/.config)
+endef
+endif
+
 endif # arm
 
 #
@@ -354,6 +360,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_ARC_TYPE_CONFIG)
 	$(UCLIBC_ARC_PAGE_SIZE_CONFIG)
 	$(UCLIBC_ARM_ABI_CONFIG)
+	$(UCLIBC_ARM_BINFMT_FLAT)
 	$(UCLIBC_MIPS_ABI_CONFIG)
 	$(UCLIBC_MIPS_ISA_CONFIG)
 	$(UCLIBC_SH_TYPE_CONFIG)
