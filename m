From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 13 Jul 2012 21:49:12 +0100
Subject: [Buildroot] [PATCH] protobuf: fix circular dependency warning
Message-ID: <1342212552-6567-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The protobuf package depends on host-protobuf, which leads to a
circular dependency of host-protobuf on host-protobuf. The following
warning is output.

  make: Circular host-protobuf-depends <- host-protobuf dependency dropped.

This patch breaks the circular dependency, by explictly asserting the
dependencies of host-protobuf (currently none).

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/protobuf/protobuf.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index f18261e..e0214ed 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -9,6 +9,7 @@ PROTOBUF_SITE = http://protobuf.googlecode.com/files/
 
 # N.B. Need to use host protoc during cross compilation.
 PROTOBUF_DEPENDENCIES = host-protobuf
+HOST_PROTOBUF_DEPENDENCIES =
 PROTOBUF_CONF_OPT = --with-protoc=$(HOST_DIR)/usr/bin/protoc
 
 PROTOBUF_INSTALL_STAGING = YES
-- 
1.7.9.5
