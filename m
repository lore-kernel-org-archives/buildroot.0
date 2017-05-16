From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 May 2017 23:00:26 +0200
Subject: [Buildroot] [git commit] protobuf: link with libatomic when needed
Message-ID: <20170516210515.35BA082675@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef9ffa3426edc895dc180d45b48bf305522b3450
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The protobuf library uses atomic intrinsics, so we need to link
against libatomic.

Fixes the build of protobuf on Sparc:

  http://autobuild.buildroot.net/results/f3d76eaebd529a61bce849e355182c60f233ed06/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/protobuf/protobuf.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 610da8c..2cd10eb 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -17,6 +17,10 @@ PROTOBUF_LICENSE_FILES = LICENSE
 PROTOBUF_DEPENDENCIES = host-protobuf
 PROTOBUF_CONF_OPTS = --with-protoc=$(HOST_DIR)/usr/bin/protoc
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+PROTOBUF_CONF_ENV += LIBS=-latomic
+endif
+
 PROTOBUF_INSTALL_STAGING = YES
 
 PROTOBUF_PATCH = https://github.com/google/protobuf/commit/416f90939d4de58fe1a4e2489120010313183291.patch
