From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 May 2017 22:38:32 +0200
Subject: [Buildroot] [PATCH] protobuf: link with libatomic when needed
Message-ID: <1494880712-28989-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The protobuf library uses atomic intrinsics, so we need to link
against libatomic.

Fixes the build of protobuf on Sparc:

  http://autobuild.buildroot.net/results/f3d76eaebd529a61bce849e355182c60f233ed06/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
2.7.4
