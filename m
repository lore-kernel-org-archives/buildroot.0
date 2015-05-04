From: Romain Naour <romain.naour@openwide.fr>
Date: Tue,  5 May 2015 00:01:48 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix staging install for
	CodeSourcery AArch64 toolchain
Message-ID: <1430776908-1030-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The extracted toolchain sources contains a single symlink in the
aarch64-linux-gnu/libc/lib directory wich is lost during Buildroot's
staging install.

aarch64-linux-gnu/libc/lib/ld-linux-aarch64.so.1 -> ../lib64/ld-2.18.so

Add a custom post install staging hook to create it manually.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index b293ba9..e66db77 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -355,6 +355,10 @@ TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/aarch64-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = aarch64-2014.05-30-aarch64-linux-gnu-i686-pc-linux-gnu.tar.bz2
+define TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_FIXUP
+	ln -sf ld-2.18.so $(STAGING_DIR)/lib/ld-linux-aarch64.so.1
+endef
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_FIXUP
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
 TOOLCHAIN_EXTERNAL_VERSION = 1.1.6
 TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-$(TOOLCHAIN_EXTERNAL_VERSION)
-- 
1.9.3
