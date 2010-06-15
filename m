From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Jun 2010 08:52:17 +0200
Subject: [Buildroot] [git commit master 1/1] at91dataflashboot: fix patch
	target
Message-ID: <20100615065457.C4EEE80E52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d2f6fcd1b4e0cffd621f2ceec347536e4322e8a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Touch destination file so the patch target isn't rerun for every
invocation.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/at91dataflashboot/at91dataflashboot.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/boot/at91dataflashboot/at91dataflashboot.mk b/boot/at91dataflashboot/at91dataflashboot.mk
index d11f842..32591f7 100644
--- a/boot/at91dataflashboot/at91dataflashboot.mk
+++ b/boot/at91dataflashboot/at91dataflashboot.mk
@@ -16,11 +16,12 @@ $(DL_DIR)/$(DATAFLASHBOOT_SOURCE):
 $(DATAFLASHBOOT_DIR)/.unpacked: $(DL_DIR)/$(DATAFLASHBOOT_SOURCE)
 	mkdir -p $(@D)
 	$(BZCAT) $(DL_DIR)/$(DATAFLASHBOOT_SOURCE) | tar $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
-	touch $(DATAFLASHBOOT_DIR)/.unpacked
+	touch $@
 
 $(DATAFLASHBOOT_DIR)/.patched: $(DATAFLASHBOOT_DIR)/.unpacked
 	toolchain/patch-kernel.sh $(@D) boot/at91dataflashboot \
 		at91dataflashboot-$(DATAFLASHBOOT_VERSION)-\*.patch
+	touch $@
 
 $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY): $(DATAFLASHBOOT_DIR)/.patched
 	ls $(DATAFLASHBOOT_DIR)/.unpacked
-- 
1.7.1
