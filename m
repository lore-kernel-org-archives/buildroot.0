From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Mar 2014 15:53:02 +0100
Subject: [Buildroot] [PATCH 07/13] toolchain/internal: check kernel headers
	version for manually-specified version
In-Reply-To: <cover.1393685422.git.yann.morin.1998@free.fr>
References: <cover.1393685422.git.yann.morin.1998@free.fr>
Message-ID: <c2568837d90d08bd51f3b02a4a43ba6d0545431f.1393685422.git.yann.morin.1998@free.fr>
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
index 49fd9ca..2361e40 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -37,4 +37,13 @@ define LINUX_HEADERS_INSTALL_STAGING_CMDS
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
