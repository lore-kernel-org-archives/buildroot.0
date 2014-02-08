From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  8 Feb 2014 17:26:06 +0100
Subject: [Buildroot] [PATCH 3/3] linux: check the configuration file exists
In-Reply-To: <cover.1391876537.git.yann.morin.1998@free.fr>
References: <cover.1391876537.git.yann.morin.1998@free.fr>
Message-ID: <db8cf87fc5b536aae5ad7b10f3997c6b4140453a.1391876537.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

... and abort early, before we even use it.

Reported-by: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 linux/linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index e8c007d..f4a4bfd 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -166,6 +166,10 @@ else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 KERNEL_SOURCE_CONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
 endif
 
+ifeq ($(wildcard $(KERNEL_SOURCE_CONFIG)),)
+$(error Configuration file '$(KERNEL_SOURCE_CONFIG)' not found.)
+endif
+
 ifeq ($(call KCONFIG_GET_OPT,CONFIG_KERNEL_LZO,$(KERNEL_SOURCE_CONFIG)),y)
 LINUX_DEPENDENCIES += host-lzop
 endif
-- 
1.8.1.2
