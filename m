From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] cloop: new package
Message-ID: <20100409142124.77DBD20E4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ae4c8a81d3ef9736998d157e9e989acab17e9cb2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only the host variant is supported, which explains why there is no
Config.in file. Will be used by the filesystem generation code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cloop/cloop.mk |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 package/cloop/cloop.mk

diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
new file mode 100644
index 0000000..f1c1e1c
--- /dev/null
+++ b/package/cloop/cloop.mk
@@ -0,0 +1,18 @@
+CLOOP_VERSION=2.631-1
+CLOOP_SOURCE=cloop_$(CLOOP_VERSION).tar.gz
+CLOOP_SITE=http://debian-knoppix.alioth.debian.org/sources/
+
+HOST_CLOOP_DEPENDENCIES = host-zlib
+
+define HOST_CLOOP_BUILD_CMDS
+ $(HOST_MAKE_ENV) $(MAKE1) \
+   CFLAGS="$(HOST_CFLAGS) -Wall -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DUSE_ERROR_SILENT" -C $(@D) APPSONLY=yes
+endef
+
+define HOST_CLOOP_INSTALL_CMDS
+ install -m 755 $(@D)/create_compressed_fs $(HOST_DIR)/usr/bin
+ install -m 755 $(@D)/extract_compressed_fs $(HOST_DIR)/usr/bin
+endef
+
+$(eval $(call GENTARGETS,package,cloop))
+$(eval $(call GENTARGETS,package,cloop,host))
\ No newline at end of file
-- 
1.6.3.3
