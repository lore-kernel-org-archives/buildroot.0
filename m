From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 21:22:21 +0100
Subject: [Buildroot] [git commit] samba4: ensure that copied cache.txt is
 writable
Message-ID: <20171129201525.33EFC80468@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=832b2de3ba82d8b51c393f743ee86ad530829607
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the Buildroot tree is read-only, then cache.txt is copied read-only into
the build directory, and the configuration step fails.  Fix this in the
same way we do in other places, by opening permissions as we copy the file
using $(INSTALL).

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
