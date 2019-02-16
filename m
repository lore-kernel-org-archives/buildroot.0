From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Feb 2019 19:34:26 +0100
Subject: [Buildroot] [PATCH] linux: don't check hashes for user-supplied
 patches
Message-ID: <20190216183426.17548-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We have virtually no way to know the hashes for user-supplied patches,
so we should just ignore them.

Reported-by: Simon van der Veldt <simon.vanderveldt@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>

---
Peter: this is a candidate for backporting to 2018.11.x and 2018.02.x
---
 linux/linux.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 8c21bad067..2b5d096e14 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -55,6 +55,9 @@ endif
 
 LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
+# We have no way to know the hashes for user-supplied patches.
+BR_NO_CHECK_HASH_FOR += $(notdir $(LINUX_PATCHES))
+
 # We rely on the generic package infrastructure to download and apply
 # remote patches (downloaded from ftp, http or https). For local
 # patches, we can't rely on that infrastructure, because there might
-- 
2.14.1
