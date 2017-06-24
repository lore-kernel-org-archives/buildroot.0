From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 23:14:35 +0200
Subject: [Buildroot] [PATCH v2] toolchain-external: adjust logic for musl
	dynamic linker symlink
Message-ID: <20170624211435.19786-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit changes the strategy to know what symlink should be
created for the musl dynamic linker. For now, we have in Buildroot the
logic to decide what the symlink name should be. However, despite
numerous fixes, there are still some cases that are missing, such as
mips64el-n32, where the symlink is ld-musl-mipsn32el.so.1.

So, instead of trying to make Buildroot aware of all the possible
names, simply get it from the external toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v1:
 - As suggested by Yann E. Morin, build a sample program, and get its
   program interpreter with readelf, in order to find the program
   interpreter.

Note: I have tried to refactor this with the check_musl function in
toolchain/helpers.mk, with the idea of introducing a function
get_program_interpreter that would, given CC/READELF would return the
program interpreter path. However, for the life of me, I couldn't get
a make function invoking multiple shell commands to return a string.
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 8269345..938f73d 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -476,21 +476,10 @@ endef
 # of the dynamic library loader. We just need to create a symbolic
 # link to libc.so with the appropriate name.
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
-ifeq ($(BR2_i386),y)
-MUSL_ARCH = i386
-else ifeq ($(BR2_ARM_EABIHF),y)
-MUSL_ARCH = armhf
-else ifeq ($(BR2_mips):$(BR2_SOFT_FLOAT),y:y)
-MUSL_ARCH = mips-sf
-else ifeq ($(BR2_mipsel):$(BR2_SOFT_FLOAT),y:y)
-MUSL_ARCH = mipsel-sf
-else ifeq ($(BR2_sh),y)
-MUSL_ARCH = sh
-else
-MUSL_ARCH = $(ARCH)
-endif
 define TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
-	ln -sf libc.so $(TARGET_DIR)/lib/ld-musl-$(MUSL_ARCH).so.1
+	$(Q)echo 'void main(void) {}' | $(TOOLCHAIN_EXTERNAL_CC) -x c -o $(BUILD_DIR)/.br-toolchain-test.tmp - >/dev/null 2>&1; \
+	PROGRAM_INTERPRETER=`$(TOOLCHAIN_EXTERNAL_READELF) -l $(BUILD_DIR)/.br-toolchain-test.tmp 2> /dev/null | sed -r -e '/.*Requesting program interpreter: (.+)\]$$/!d; s//\1/'` ; \
+	ln -sf libc.so $(TARGET_DIR)/$${PROGRAM_INTERPRETER}
 endef
 endif
 
-- 
2.9.4
