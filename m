From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Apr 2016 15:41:40 +0200
Subject: [Buildroot] [git commit] toolchain-external: fix installation for
	CodeSourcery AArch64 toolchain
Message-ID: <20160430164629.A99CF818F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d39ca1c2ab19766abf0430abe9b65ba0e16602b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The extracted toolchain sources contains a single symlink in the
aarch64-linux-gnu/libc/lib directory wich is lost during Buildroot's
staging install.

aarch64-linux-gnu/libc/lib/ld-linux-aarch64.so.1 -> ../lib64/ld-2.18.so

Add a custom post install staging and target hooks to create it
manually.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[Thomas: also make the same tweak in the target.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 2422b6d..3efe182 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -383,6 +383,14 @@ endif
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/aarch64-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = aarch64-2014.05-30-aarch64-linux-gnu-i686-pc-linux-gnu.tar.bz2
+define TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_STAGING_FIXUP
+	ln -sf ld-2.18.so $(STAGING_DIR)/lib/ld-linux-aarch64.so.1
+endef
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_STAGING_FIXUP
+define TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_TARGET_FIXUP
+	ln -sf ld-2.18.so $(TARGET_DIR)/lib/ld-linux-aarch64.so.1
+endef
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_TARGET_FIXUP
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
 TOOLCHAIN_EXTERNAL_VERSION = 1.1.12
 TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-$(TOOLCHAIN_EXTERNAL_VERSION)
