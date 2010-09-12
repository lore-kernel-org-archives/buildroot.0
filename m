From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:13 +0200
Subject: [Buildroot] [PATCH 27/74] libxml2: convert old-style hook to
	new-style hook
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c648785b933fe86531906832b81e21e54ddd10ca.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxml2/libxml2.mk |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 8f25136..820f465 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -22,6 +22,13 @@ LIBXML2_CONF_OPT = --with-gnu-ld --enable-shared \
 		--without-debugging --without-python \
 		--without-threads
 
+define LIBXML2_STAGING_LIBXML2_CONFIG_FIXUP
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
+	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
+endef
+
+LIBXML2_POST_INSTALL_STAGING_HOOKS += LIBXML2_STAGING_LIBXML2_CONFIG_FIXUP
+
 HOST_LIBXML2_DEPENDENCIES = host-pkg-config
 
 HOST_LIBXML2_CONF_OPT = \
@@ -31,10 +38,5 @@ HOST_LIBXML2_CONF_OPT = \
 $(eval $(call AUTOTARGETS,package,libxml2))
 $(eval $(call AUTOTARGETS,package,libxml2,host))
 
-$(LIBXML2_HOOK_POST_INSTALL):
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
-	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
-	touch $@
-
 # libxml2 for the host
 LIBXML2_HOST_BINARY:=$(HOST_DIR)/usr/bin/xmllint
-- 
1.7.0.4
