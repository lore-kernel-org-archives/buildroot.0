From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:39:14 +0200
Subject: [Buildroot] [PATCH 40/53] genromfs: use $(HOST_DIR) instead of
	$(HOST_DIR)/usr as prefix
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-41-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

genromfs is special because it uses "PREFIX" in the meaning of DESTDIR
and "prefix" in the meaning of prefix. We were up to know using it
incorrectly for host: PREFIX shouldn't be set and only prefix should
be set.

Add an explanatory comment for this unusual behaviour.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/genromfs/genromfs.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/genromfs/genromfs.mk b/package/genromfs/genromfs.mk
index 3025550637..fd696b45b2 100644
--- a/package/genromfs/genromfs.mk
+++ b/package/genromfs/genromfs.mk
@@ -16,6 +16,8 @@ define GENROMFS_BUILD_CMDS
 		LDFLAGS="$(TARGET_LDFLAGS)"
 endef
 
+# "PREFIX" is the equivalent of DESTDIR in autotools, "prefix" is the
+# traditional prefix. "prefix" defaults to /usr so no need to set it.
 define GENROMFS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(TARGET_DIR) install
 endef
@@ -25,7 +27,7 @@ define HOST_GENROMFS_BUILD_CMDS
 endef
 
 define HOST_GENROMFS_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) prefix=$(HOST_DIR) install
 endef
 
 $(eval $(generic-package))
-- 
2.11.0
