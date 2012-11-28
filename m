From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Nov 2012 17:05:02 -0800
Subject: [Buildroot] [git commit] ocf-linux: tweak kernel patch for newer
	kernels
Message-ID: <20121128011237.BA60C97200@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=670d60dc919fe6d99224ad1056c426812b38d108
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Newer kernels had a slight change in the random number API so the OCF
patchset requires a slight tweak to build and run properly.

Affected kernels are, per series:
>=3.0.41, >=3.2.29, >=3.4.9, >=3.5.2 and any newer version.

The fix is applied by detecting the API change rather than guessing the
kernel version.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux-ext-ocf-linux.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/linux/linux-ext-ocf-linux.mk b/linux/linux-ext-ocf-linux.mk
index faf7360..1a601d5 100644
--- a/linux/linux-ext-ocf-linux.mk
+++ b/linux/linux-ext-ocf-linux.mk
@@ -15,6 +15,8 @@ LINUX_DEPENDENCIES += ocf-linux
 define OCF_LINUX_PREPARE_KERNEL
 	support/scripts/apply-patches.sh $(LINUX_DIR) \
 		$(OCF_LINUX_DIR)/patches/ linux-3.2.1-ocf.patch ; \
+	grep -q __mix_pool_bytes $(LINUX_DIR)/drivers/char/random.c && \
+	$(SED) 's:wordcount\*4:&, NULL:' $(LINUX_DIR)/drivers/char/random.c ; \
 	cp -rf $(OCF_LINUX_DIR)/ocf $(LINUX_DIR)/crypto/ocf ;
 endef
 
