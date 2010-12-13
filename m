From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 13 Dec 2010 22:26:52 +0100
Subject: [Buildroot] [git commit master 1/1] strip path when untaring kernel
	for headers
Message-ID: <20101213214843.2F2028E2C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cc1cff42804563cb12ebcc265ac004a4b5517ff5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is needed when custom/snapshot kernel headers are selected.
Buildroot expects to find dl/linux-2.6.tar.bz2 and also expects
it to extract to output/toolchain/linux-2.6, but if you tar
custom kernel sources directory can be anything, etc. linux-git.
In that case buildroot would extract it to output/toolchain/linux-git.
So fix this behaviour, by using tar strip-directory/component.

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
-- 
1.7.2.2
