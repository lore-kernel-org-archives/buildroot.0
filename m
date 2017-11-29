From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 28 Nov 2017 21:55:24 -0500
Subject: [Buildroot] [PATCH 1/1] samba4: ensure that copied cache.txt is
 writable
Message-ID: <1511924124-3938-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the Buildroot tree is read-only, then cache.txt is copied read-only into
the build directory, and the configuration step fails.  Fix this in the
same way we do in other places, by opening permissions as we copy the file
using $(INSTALL).

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/samba4/samba4.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 7836df5..ade9add 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -86,7 +86,7 @@ endef
 SAMBA4_POST_INSTALL_TARGET_HOOKS += SAMBA4_REMOVE_CTDB_TESTS
 
 define SAMBA4_CONFIGURE_CMDS
-	cp package/samba4/samba4-cache.txt $(@D)/cache.txt;
+	$(INSTALL) -m 0644 package/samba4/samba4-cache.txt $(@D)/cache.txt;
 	echo 'Checking uname machine type: $(BR2_ARCH)' >>$(@D)/cache.txt;
 	(cd $(@D); \
 		PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python-config" \
-- 
2.7.4
