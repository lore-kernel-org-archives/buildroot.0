From: Damien Le Moal <damien.lemoal@wdc.com>
Date: Tue,  8 Sep 2020 20:33:22 +0900
Subject: [Buildroot] [PATCH v2 4/6] package make: build RISC-V nommu builds
 as linux
In-Reply-To: <20200908113324.1022230-1-damien.lemoal@wdc.com>
References: <20200908113324.1022230-1-damien.lemoal@wdc.com>
Message-ID: <20200908113324.1022230-5-damien.lemoal@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Christoph Hellwig <hch@lst.de>

Using *-uclinux-* seems like an only partially followed convention.
And at least for RISC-V gcc doesn't know about uclinux tuples, so
switch back to the normal Linux one for now.

Signed-off-by: Christoph Hellwig <hch@lst.de>

[Damien]
* Make the change conditional on BR2_riscv arch being "y".

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 package/Makefile.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 51f5cbce4f..28c470aea6 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -39,9 +39,14 @@ endif
 # Compute GNU_TARGET_NAME
 GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
 
-# FLAT binary format needs uclinux
+# FLAT binary format needs uclinux, except RISC-V which needs
+# the regular linux name.
 ifeq ($(BR2_BINFMT_FLAT),y)
+ifeq ($(BR2_riscv),y)
+TARGET_OS = linux
+else
 TARGET_OS = uclinux
+endif
 else
 TARGET_OS = linux
 endif
-- 
2.26.2
