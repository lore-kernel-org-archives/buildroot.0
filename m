From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 18 Mar 2012 16:35:58 +0100
Subject: [Buildroot] [PATCH] elf2flt: fix after conversion of binutils to
	package infrastructure
In-Reply-To: <CAFm-AyppuS3y-oHUHj_Xz1u+JB2qLDKmHVF4MQV-8=8u9cwwEw@mail.gmail.com>
Message-ID: <1332084958-1085-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When binutils was converted to the package infrastructure (commit
009407e6b), the variable that elf2flt uses to find the binutils
libraries disappeared.  So use HOST_BINUTILS_DIR instead of
BINUTILS_DIR1.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Note that elf2flt has been broken for one and a half years now before
anybody has complained about it...

Probably it should be converted to autotargets as well.  However, I
don't know how to test if the resulting tool still works.

 toolchain/elf2flt/elf2flt.mk |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/toolchain/elf2flt/elf2flt.mk b/toolchain/elf2flt/elf2flt.mk
index e74a655..84a2c01 100644
--- a/toolchain/elf2flt/elf2flt.mk
+++ b/toolchain/elf2flt/elf2flt.mk
@@ -21,12 +21,12 @@ $(ELF2FLT_DIR)/.configured: $(ELF2FLT_DIR)/.patched
 	(cd $(ELF2FLT_DIR); rm -rf config.cache; \
 		LDFLAGS=-lz \
 		$(ELF2FLT_DIR)/configure $(QUIET) \
-		--with-bfd-include-dir=$(BINUTILS_DIR1)/bfd/ \
-		--with-binutils-include-dir=$(BINUTILS_DIR)/include/ \
+		--with-bfd-include-dir=$(HOST_BINUTILS_DIR)/bfd/ \
+		--with-binutils-include-dir=$(HOST_BINUTILS_DIR)/include/ \
 		--target=$(REAL_GNU_TARGET_NAME) \
-		--with-libbfd=$(BINUTILS_DIR1)/bfd/libbfd.a \
-		--with-libiberty=$(BINUTILS_DIR1)/libiberty/libiberty.a \
-		--prefix=$(STAGING_DIR)/usr)
+		--with-libbfd=$(HOST_BINUTILS_DIR)/bfd/libbfd.a \
+		--with-libiberty=$(HOST_BINUTILS_DIR)/libiberty/libiberty.a \
+		--prefix=$(HOST_DIR)/usr)
 	touch $@
 
 $(ELF2FLT_DIR)/$(ELF2FLT_BINARY): $(ELF2FLT_DIR)/.configured
-- 
tg: (ccb44fd..) t/elf2flt (depends on: master)
