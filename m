From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 10:36:18 +0200
Subject: [Buildroot] [git commit branch/2017.08.x] ejabberd: Replace
	$(HOST_DIR) to /usr in ERL path
Message-ID: <20171017090325.EB23781190@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88a9a611d2d7bf600ad2788489026cbed23db132
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Previously, it was working by luck. Buildroot has fixed its definition
of HOST_DIR and pkg-autotools.mk uses the classical /usr prefix. So,
fix this sed expression to correctly replace $(HOST_DIR) by /usr in ERL
path.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e6156615ecfb59d71aa5875fc206e4f1da80aec5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ejabberd/ejabberd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 9baa112..35a1027 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -36,9 +36,9 @@ define EJABBERD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) install -C $(@D)
 endef
 
-# Delete HOST_DIR prefix from ERL path in ejabberctl script.
+# Replace HOST_DIR prefix to /usr in ERL path of ejabberctl script.
 define EJABBERD_FIX_EJABBERDCTL
-	$(SED) 's,ERL=$(HOST_DIR),ERL=,' '$(TARGET_DIR)/usr/sbin/ejabberdctl'
+	$(SED) 's,ERL=$(HOST_DIR),ERL=/usr,' '$(TARGET_DIR)/usr/sbin/ejabberdctl'
 endef
 
 EJABBERD_POST_INSTALL_TARGET_HOOKS += EJABBERD_FIX_EJABBERDCTL
