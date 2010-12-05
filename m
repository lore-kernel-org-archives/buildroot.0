From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Sun, 05 Dec 2010 23:30:21 +0200
Subject: [Buildroot] [PATCH] strip path when untaring kernel for headers
Message-ID: <20101205213021.10524.40028.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is needed when custom/snapshot kernel headers are selected.
Buildroot expects to find dl/linux-2.6.tar.bz2 and also expects
it to extract to output/toolchain/linux-2.6, but if you tar
custom kernel sources directory can be anything, etc. linux-git.
In that case buildroot would extract it to output/toolchain/linux-git.
So fix this behaviour, by using tar strip-directory/component.

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---

 .../kernel-headers/kernel-headers-new.makefile     |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/toolchain/kernel-headers/kernel-headers-new.makefile b/toolchain/kernel-headers/kernel-headers-new.makefile
index 2237a0a..5682869 100644
--- a/toolchain/kernel-headers/kernel-headers-new.makefile
+++ b/toolchain/kernel-headers/kernel-headers-new.makefile
@@ -28,8 +28,9 @@ LINUX_HEADERS_DEPENDS:=
 $(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
 	@echo "*** Using kernel-headers generated from kernel source"
 	rm -rf $(LINUX_HEADERS_DIR)
-	[ -d $(TOOLCHAIN_DIR) ] || $(INSTALL) -d $(TOOLCHAIN_DIR)
-	$(LINUX_HEADERS_CAT) $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
+	$(INSTALL) -d $(@D)
+	$(LINUX_HEADERS_CAT) $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | \
+	tar $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
 	touch $@
 
 $(LINUX_HEADERS_UNPACK_DIR)/.patched: $(LINUX_HEADERS_UNPACK_DIR)/.unpacked $(LINUX_HEADERS_DEPENDS)
