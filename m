From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Feb 2021 23:14:11 +0100
Subject: [Buildroot] [git commit] package/protobuf: remove target version of
 'protoc'
Message-ID: <20210211215503.C698B7FD62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df6de52bd4eafb2aeedf8a7935601feff86dcf9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tool 'protoc' and its associated library libprotoc.so are only
needed during development, to convert a protocol buffer definition in the
associated code for a specific code language.

Buildroot does not officially support creating a development environment on
target, so remove these files to reduce disk usage by more than 1.5 MB
(stripped, uncompressed).

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/protobuf/protobuf.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 661b7a6b81..df708819cb 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -36,5 +36,12 @@ ifeq ($(BR2_PACKAGE_ZLIB),y)
 PROTOBUF_DEPENDENCIES += zlib
 endif
 
+define PROTOBUF_REMOVE_UNNECESSARY_TARGET_FILES
+	rm -rf $(TARGET_DIR)/usr/bin/protoc
+	rm -rf $(TARGET_DIR)/usr/lib/libprotoc.so*
+endef
+
+PROTOBUF_POST_INSTALL_TARGET_HOOKS += PROTOBUF_REMOVE_UNNECESSARY_TARGET_FILES
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
