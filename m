From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:38 +0200
Subject: [Buildroot] [git commit] genromfs: use $(HOST_DIR) instead of
	$(HOST_DIR)/usr as prefix
Message-ID: <20170705141336.BEA6881D3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40c560469f525bad7899694b729f60807a8165d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

genromfs is special because it uses "PREFIX" in the meaning of DESTDIR
and "prefix" in the meaning of prefix. We were up to know using it
incorrectly for host: PREFIX shouldn't be set and only prefix should
be set.

Add an explanatory comment for this unusual behaviour.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/genromfs/genromfs.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/genromfs/genromfs.mk b/package/genromfs/genromfs.mk
index 3025550..fd696b4 100644
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
