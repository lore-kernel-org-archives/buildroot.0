From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 May 2013 00:08:13 +0200
Subject: [Buildroot] [PATCH 03/20] elf2flt: fix build when zlib is not
	installed on the host
In-Reply-To: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1369606110-8088-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For a reason that's fairly unclear to me, Peter added a '-lz' link
flag to the elf2flt.mk build in d5664ee99 ("elf2flt: fix link").

However, the zlib library may not necessarily be installed on the host
machine, so we should depend on host-zlib, and pass the appropriate
LDFLAGS. This is what this patch does.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Note: I already have a patch that converts elf2flt to the package
infrastructure, but I am waiting to have the patches to make the
entire internal toolchain logic use the package infrastructure to send
them.
---
 toolchain/elf2flt/elf2flt.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/elf2flt/elf2flt.mk b/toolchain/elf2flt/elf2flt.mk
index 134034b..52e199c 100644
--- a/toolchain/elf2flt/elf2flt.mk
+++ b/toolchain/elf2flt/elf2flt.mk
@@ -19,7 +19,7 @@ $(ELF2FLT_DIR)/.patched: $(ELF2FLT_DIR)/.unpacked
 
 $(ELF2FLT_DIR)/.configured: $(ELF2FLT_DIR)/.patched
 	(cd $(ELF2FLT_DIR); rm -rf config.cache; \
-		LDFLAGS=-lz \
+		LDFLAGS="$(HOST_LDFLAGS) -lz" \
 		$(ELF2FLT_DIR)/configure $(QUIET) \
 		--with-bfd-include-dir=$(HOST_BINUTILS_DIR)/bfd/ \
 		--with-binutils-include-dir=$(HOST_BINUTILS_DIR)/include/ \
@@ -33,7 +33,7 @@ $(ELF2FLT_DIR)/$(ELF2FLT_BINARY): $(ELF2FLT_DIR)/.configured
 	$(MAKE) -C $(ELF2FLT_DIR) all
 	$(MAKE) -C $(ELF2FLT_DIR) install
 
-elf2flt: uclibc_target uclibc-configured binutils gcc $(ELF2FLT_DIR)/$(ELF2FLT_BINARY)
+elf2flt: uclibc_target uclibc-configured binutils gcc host-zlib $(ELF2FLT_DIR)/$(ELF2FLT_BINARY)
 
 elf2flt-clean:
 	rm -rf $(ELF2FLT_SOURCE)
-- 
1.7.9.5
