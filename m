From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  9 Mar 2016 23:58:42 +0100
Subject: [Buildroot] [PATCH v7 01/18] package/linux-headers: cleanup
	installation
In-Reply-To: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1457564339-27294-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch removes unnecessary files generated during installation, that
also are causing build machine paths leaking into the Buildroot's SDK.

Note that similar cleanup commands can be found in other distributions
(e.g. gentoo [1]); thought this is not a valid reason.

[1] https://gitweb.gentoo.org/repo/gentoo.git/tree/sys-kernel/linux-headers/linux-headers-4.4.ebuild#n36

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v6->v7:
- improve commit log

changes v5->v6:
- new patch
---
 package/linux-headers/linux-headers.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 0900778..7633257 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -123,6 +123,7 @@ define LINUX_HEADERS_INSTALL_STAGING_CMDS
 			HOSTCXX="$(HOSTCXX)" \
 			INSTALL_HDR_PATH=$(STAGING_DIR)/usr \
 			headers_install)
+	find $(STAGING_DIR)/usr \( -name .install -o -name ..install.cmd \) -delete
 endef
 
 ifeq ($(BR2_KERNEL_HEADERS_VERSION)$(BR2_KERNEL_HEADERS_AS_KERNEL),y)
-- 
2.7.2
