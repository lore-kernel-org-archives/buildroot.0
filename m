From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jan 2013 00:52:21 +0100
Subject: [Buildroot] [RFC v1 12/14] autoconf: fix out-of-tree build
In-Reply-To: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358725943-31485-13-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though one might think that autoconf should have been the best
example of a clean and nice example of a correct out of tree build
implementation, this is not the case. The autoconf build process makes
modification to the source tree, for some obscure updating process of
manual pages.

For now, we workaround this problem by re-adding write permissions on
the man/ subdirectory of autoconf sources, but on the long term, a
proper, upstreamable solution would be better.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/autoconf/autoconf.mk |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 8807c10..e77bb54 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -20,6 +20,16 @@ HOST_AUTOCONF_CONF_ENV = ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 
 HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool
 
+# The autoconf build process writes to its source directory, which is
+# very stupid, but forces us to give write permissions to one
+# directory.
+define AUTOCONF_FIXUP_PERMISSIONS
+	chmod u+w -R $(AUTOCONF_SRCDIR)/man
+endef
+
+AUTOCONF_PRE_CONFIGURE_HOOKS += AUTOCONF_FIXUP_PERMISSIONS
+HOST_AUTOCONF_PRE_CONFIGURE_HOOKS += AUTOCONF_FIXUP_PERMISSIONS
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
-- 
1.7.9.5
