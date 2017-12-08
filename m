From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Fri,  8 Dec 2017 12:52:18 +0100
Subject: [Buildroot] [PATCH] package/linux-tools: fixes build of iio with
 4.14+ kernels
Message-ID: <1512733938-29854-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien BOIBESSOT <julien.boibessot@armadeus.com>

Since this commit [1], iio build has been moved to other linux-tools build
system. Installation dir is now given by DESTDIR, like for all other linux-tools.
I kept INSTALL_DIR env and 'install' target to be compatible with oldest
kernels.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/tools/iio/Makefile?h=v4.14.4&id=18956cf2d78a8d4a5959e20240f04ce8d5a6c121

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 package/linux-tools/linux-tool-iio.mk.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/linux-tools/linux-tool-iio.mk.in b/package/linux-tools/linux-tool-iio.mk.in
index 60d6249..a8cc89e 100644
--- a/package/linux-tools/linux-tool-iio.mk.in
+++ b/package/linux-tools/linux-tool-iio.mk.in
@@ -19,9 +19,11 @@ define IIO_BUILD_CMDS
 		$(IIO_MAKE_OPTS)
 endef
 
+# DESTDIR used since kernel version 4.14
 define IIO_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/iio \
 		$(IIO_MAKE_OPTS) \
 		INSTALL_ROOT=$(TARGET_DIR) \
+		DESTDIR=$(TARGET_DIR) \
 		install
 endef
-- 
2.1.4
