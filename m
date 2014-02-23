From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Feb 2014 00:40:55 +0100
Subject: [Buildroot] [PATCH 08/13] toolchain/internal: check kernel headers
	version for manually-specified version
In-Reply-To: <cover.1393198603.git.yann.morin.1998@free.fr>
References: <cover.1393198603.git.yann.morin.1998@free.fr>
Message-ID: <784e2d38241f26dd5be5f05e9c4abc36a83189fb.1393198603.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Ensure the kernel headers version matches exactly the one manually
specified by the user.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 package/linux-headers/linux-headers.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 086e5d5..694651e 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -34,4 +34,13 @@ define LINUX_HEADERS_INSTALL_STAGING_CMDS
 			headers_install)
 endef
 
+ifeq ($(BR2_KERNEL_HEADERS_VERSION),y)
+define LINUX_HEADERS_CHECK_VERSION
+	$(call check_kernel_headers_version,\
+		"$(TARGET_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)",\
+		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)))
+endef
+LINUX_HEADERS_POST_INSTALL_STAGING_HOOKS += LINUX_HEADERS_CHECK_VERSION
+endif
+
 $(eval $(generic-package))
-- 
1.8.3.2
