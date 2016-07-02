From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 15:54:43 +0200
Subject: [Buildroot] [git commit] dmalloc: fix static build
Message-ID: <20160702140258.2C14D817F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b851be9bdcd85c22b380a66e5ffa19d02a360c4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For example coldfire uses FLAT binaries, which are statically
build. Fixes following autobuild failure:
http://autobuild.buildroot.net/results/cc4233a4c3f92275a4071c172330c920c35219ca/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Thomas: use an intermediate variable rather than duplicating code.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dmalloc/dmalloc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index f87ae17..ffa9a39 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -56,8 +56,14 @@ define DMALLOC_INSTALL_STAGING_CMDS
 		-C $(@D) install
 endef
 
-define DMALLOC_INSTALL_TARGET_CMDS
+ifeq ($(BR2_STATIC_LIBS),)
+define DMALLOC_INSTALL_SHARED_LIB
 	cp -dpf $(STAGING_DIR)/usr/lib/libdmalloc*.so $(TARGET_DIR)/usr/lib
+endef
+endif
+
+define DMALLOC_INSTALL_TARGET_CMDS
+	$(DMALLOC_INSTALL_SHARED_LIB)
 	cp -dpf $(STAGING_DIR)/usr/bin/dmalloc $(TARGET_DIR)/usr/bin/dmalloc
 endef
 
