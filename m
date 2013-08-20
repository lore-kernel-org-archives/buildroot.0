From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Aug 2013 13:05:40 +0200
Subject: [Buildroot] [PATCH 1/3] kmod: allow to build a host variant
In-Reply-To: <1376996742-4638-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1376996742-4638-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1376996742-4638-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since module-init-tools is deprecated, we now want to use kmod instead
for the installation of modules during the kernel build process. In
order to do this, we need to be able to build a host variant of kmod,
which is want this patch allows to do.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kmod/kmod.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 72a24af..8951a56 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -53,4 +53,13 @@ else
 KMOD_CONF_OPT += --disable-tools
 endif
 
+define HOST_KMOD_INSTALL_TOOLS
+	mkdir -p $(HOST_DIR)/sbin/
+	for i in depmod insmod lsmod modinfo modprobe rmmod; \
+	do ln -sf ../usr/bin/kmod $(HOST_DIR)/sbin/$$i; done
+endef
+
+HOST_KMOD_POST_INSTALL_HOOKS += HOST_KMOD_INSTALL_TOOLS
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.8.1.2
