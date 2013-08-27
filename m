From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Aug 2013 19:28:32 +0200
Subject: [Buildroot] [PATCHv2 2/4] kmod: allow to build a host variant
In-Reply-To: <1377624514-10510-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1377624514-10510-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1377624514-10510-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since module-init-tools is deprecated, we now want to use kmod instead
for the installation of modules during the kernel build process. In
order to do this, we need to be able to build a host variant of kmod,
which is want this patch allows to do.

Note that only the depmod tool is installed on the host, since that's
the only one likely to be used on the host in a cross-compilation
context.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kmod/kmod.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 71a2632..4445fa8 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -54,4 +54,14 @@ else
 KMOD_CONF_OPT += --disable-tools
 endif
 
+# We only install depmod, since that's the only tool used for the
+# host.
+define HOST_KMOD_INSTALL_TOOLS
+	mkdir -p $(HOST_DIR)/sbin/
+	ln -sf ../usr/bin/kmod $(HOST_DIR)/sbin/depmod
+endef
+
+HOST_KMOD_POST_INSTALL_HOOKS += HOST_KMOD_INSTALL_TOOLS
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.8.1.2
