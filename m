From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Mar 2016 15:37:35 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix getent installation
	with Codescape MIPS toolchains
Message-ID: <1459172255-24556-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a toolchain is glibc based, the getent package assumes that
$(STAGING_DIR)/usr/bin contains the getent program. Unfortunately, the
Codescape MIPS toolchains do not conform with this:
$(STAGING_DIR)/usr/{bin,sbin} are empty, and instead three directories
are provided: bin-o32, bin-n32 and bin-n64 (ditto for sbin), one for
each supported MIPS ABI.

Since this is a toolchain-specific oddity, we handle it by adding a
post-install fixup hook that creates $(STAGING_DIR)/usr/{bin,sbin} as
symbolic link to the appropriate directory.

Fixes:

   http://autobuild.buildroot.org/results/9c0ee836021553319f166f9de88750535aee0a58/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 37e1a2e..ff4ae5e 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -262,6 +262,26 @@ define TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
 	ln -snf . $(TARGET_DIR)/usr/lib/aarch64-linux-gnu
 endef
 
+# Special fixup for Codescape MIPS toolchains, that have bin-<abi> and
+# sbin-<abi> directories. We create symlinks bin -> bin-<abi> and sbin
+# -> sbin-<abi> so that the rest of Buildroot can find the toolchain
+# tools in the appropriate location.
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS)$(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS),y)
+ifeq ($(BR2_MIPS_OABI32),y)
+TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_BIN_DIR_SUFFIX = o32
+else ifeq ($(BR2_MIPS_NABI32),y)
+TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_BIN_DIR_SUFFIX = n32
+else ifeq ($(BR2_MIPS_NABI64),y)
+TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_BIN_DIR_SUFFIX = n64
+endif
+
+define TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_STAGING_FIXUPS
+	rmdir $(STAGING_DIR)/usr/bin $(STAGING_DIR)/usr/sbin
+	ln -sf bin-$(TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_BIN_DIR_SUFFIX) $(STAGING_DIR)/usr/bin
+	ln -sf sbin-$(TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_BIN_DIR_SUFFIX) $(STAGING_DIR)/usr/sbin
+endef
+endif
+
 # Special handling for Blackfin toolchain, because of the split in two
 # tarballs, and the organization of tarball contents. The tarballs
 # contain ./opt/uClinux/{bfin-uclinux,bfin-linux-uclibc} directories,
@@ -337,10 +357,12 @@ TOOLCHAIN_EXTERNAL_SOURCE = amd-2015.11-36-x86_64-amd-linux-gnu-i686-pc-linux-gn
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS),y)
 TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.10-04
 TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2015.10-04.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_STAGING_FIXUPS
 TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS),y)
 TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.10-04
 TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2015.10-04.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_STAGING_FIXUPS
 TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX),y)
 TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2014R1/2014R1-RC2/i386
-- 
2.6.4
