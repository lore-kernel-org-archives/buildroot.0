From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 25 Sep 2017 18:34:31 +0200
Subject: [Buildroot] [PATCH 1/1] ejabberd: Replace $(HOST_DIR) to /usr in
	ERL path
Message-ID: <20170925163431.24409-1-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previously, it was working by luck. Buildroot has fixed its definition
of HOST_DIR and pkg-autotools.mk uses the classical /usr prefix. So,
fix this sed expression to correctly replace $(HOST_DIR) by /usr in ERL
path.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/ejabberd/ejabberd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 9baa1124a3..35a1027efb 100644
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
-- 
2.11.0
