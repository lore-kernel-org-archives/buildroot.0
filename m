From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 19:47:39 +0100
Subject: [Buildroot] [git commit] toolchain/internal: check kernel headers
	version for manually-specified version
Message-ID: <20140301193723.6568696DFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a5cf5e7237cd9b6e190f90bf680960b8c0f510f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ensure the kernel headers version matches exactly the one manually
specified by the user.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/linux-headers.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

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
