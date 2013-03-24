From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 20:36:19 +0100
Subject: [Buildroot] [git commit] apr: various improvements
Message-ID: <20130324194037.1A4969B28F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a315d073d555a5141337c1860b1c425046a351b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit:
 * Adds licensing informations
 * Ensures the apr-1-config script gets fixed appropriately
 * Remove the usr/build-1/ directory from the target, since it is only
   used during the compilation of packages that rely on APR.
 * Fix up a few paths in usr/build-1/ so that the compilation of
   apr-util works properly on top of this apr package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/apr/apr.mk |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index e502490..a9dcb40 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -5,6 +5,8 @@
 #############################################################
 APR_VERSION = 1.4.6
 APR_SITE = http://archive.apache.org/dist/apr
+APR_LICENSE = Apache-2.0
+APR_LICENSE_FILES = LICENSE
 APR_INSTALL_STAGING = YES
 APR_CONF_ENV = \
 	ac_cv_file__dev_zero=yes \
@@ -14,5 +16,21 @@ APR_CONF_ENV = \
 	apr_cv_tcp_nodelay_with_cork=yes \
 	ac_cv_sizeof_struct_iovec=8 \
 	apr_cv_mutex_recursive=yes
+APR_CONFIG_SCRIPTS = apr-1-config
+
+define APR_CLEANUP_UNNEEDED_FILES
+	$(RM) -rf $(TARGET_DIR)/usr/build-1/
+endef
+
+APR_POST_INSTALL_TARGET_HOOKS += APR_CLEANUP_UNNEEDED_FILES
+
+define APR_FIXUP_RULES_MK
+	$(SED) 's%apr_builddir=%apr_builddir=$(STAGING_DIR)%' \
+		$(STAGING_DIR)/usr/build-1/apr_rules.mk
+	$(SED) 's%apr_builders=%apr_builders=$(STAGING_DIR)%' \
+		$(STAGING_DIR)/usr/build-1/apr_rules.mk
+endef
+
+APR_POST_INSTALL_STAGING_HOOKS += APR_FIXUP_RULES_MK
 
 $(eval $(autotools-package))
