From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 00:04:30 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] acl: add host variant
Message-ID: <20170331071605.639F5826C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6ba4399324396d690d95a2b1a11d87a4ffe173f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

We need host-acl to fix issues with fakeroot.

Unfortunately, all the hacks (except the .la fixup) have to be repeated.

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Andreas Naumann <dev@andin.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit c83446fccace19694e20b1d0a730680244d724fe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acl/acl.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index 9fd5de1..e1462b6 100644
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
