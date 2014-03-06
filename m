From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Mar 2014 22:59:48 +0100
Subject: [Buildroot] [git commit] toolchain-external: fix musl external
	support on x86
Message-ID: <20140306215954.A1A8E9BDB1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4644b611c18d92388758de01a10cc79d7054ad0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On x86, the symbolic link ld-musl-<ARCH>.so.1 to libc.so must be
ld-musl-i386.so.1 in all cases, but $(ARCH) in Buildroot might be
i386, i486, i586, i686, etc. depending on the specific x86 variants
being selected.

This commit fixes that by creating a MUSL_ARCH variable set to i386 on
x86, and to $(ARCH) on other architectures.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/toolchain-external/toolchain-external.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 378e7b2..1b1053d 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -447,8 +447,13 @@ endef
 # of the dynamic library loader. We just need to create a symbolic
 # link to libc.so with the appropriate name.
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
+ifeq ($(BR2_i386),y)
+MUSL_ARCH = i386
+else
+MUSL_ARCH = $(ARCH)
+endif
 define TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
-	ln -sf libc.so $(TARGET_DIR)/lib/ld-musl-$(ARCH).so.1
+	ln -sf libc.so $(TARGET_DIR)/lib/ld-musl-$(MUSL_ARCH).so.1
 endef
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
 endif
