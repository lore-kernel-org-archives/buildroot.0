From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Mar 2012 20:47:46 +0100
Subject: [Buildroot] [git commit] elf2flt: fix after conversion of binutils
	to package infrastructure
Message-ID: <20120318215009.B4DAB90D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=277bd1ff42504f91fe15de163aa62152784665ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When binutils was converted to the package infrastructure (commit
009407e6b), the variable that elf2flt uses to find the binutils
libraries disappeared.  So use HOST_BINUTILS_DIR instead of
BINUTILS_DIR1.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
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
