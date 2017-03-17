From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 17 Mar 2017 17:06:15 +0100
Subject: [Buildroot] [PATCH v2 2/3] acl: add host variant
In-Reply-To: <20170317160616.20570-1-arnout@mind.be>
References: <20170317160616.20570-1-arnout@mind.be>
Message-ID: <20170317160616.20570-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need host-acl to fix issues with fakeroot.

Unfortunately, all the hacks (except the .la fixup) have to be repeated.

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Andreas Naumann <dev@andin.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: - propagate CFLAGS (Andreas Naumann)
    - mention that .la hack isn't needed for host.
---
 package/acl/acl.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index 9fd5de18a4..e1462b60aa 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -43,4 +43,15 @@ endef
 
 ACL_POST_INSTALL_STAGING_HOOKS += ACL_FIX_LIBTOOL_LA_LIBDIR
 
+HOST_ACL_DEPENDENCIES = host-attr
+HOST_ACL_CONF_OPTS = --enable-gettext=no
+HOST_ACL_MAKE_ENV = CFLAGS="$(HOST_CFLAGS)"
+HOST_ACL_INSTALL_OPTS = \
+	prefix=$(HOST_DIR)/usr \
+	exec_prefix=$(HOST_DIR)/usr \
+	PKG_DEVLIB_DIR=$(HOST_DIR)/usr/lib \
+	install-dev install-lib
+# For the host, libacl.la is correct, no fixup needed.
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.11.0
