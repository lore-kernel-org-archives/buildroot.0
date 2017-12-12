From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Dec 2017 07:29:34 +0100
Subject: [Buildroot] [git commit] package/linux-tools: fixes build of iio
 with 4.14+ kernels
Message-ID: <20171212062227.698368110C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e47741d1a349653c68c37842865f870604fe0c47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Linux kernel commit [1], the build of the iio tool has been
changed to use the common Linux tools build system. The installation
directory is now given by DESTDIR, like for all other Linux tools.

We keep the INSTALL_DIR environment in the 'install' target to be
compatible with kernels older than 4.14.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=18956cf2d78a8d4a5959e20240f04ce8d5a6c121

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
