From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 27 Nov 2012 16:23:08 -0300
Subject: [Buildroot] [PATCH] ocf-linux: tweak kernel patch for newer kernels
Message-ID: <1354044188-23646-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Newer kernels had a slight change in the random number API so the OCF
patchset requires a slight tweak to build and run properly.

Affected kernels are, per series:
>=3.0.41, >=3.2.29, >=3.4.9, >=3.5.2 and any newer version.

The fix is applied by detecting the API change rather than guessing the
kernel version.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
 
-- 
1.7.8.6
