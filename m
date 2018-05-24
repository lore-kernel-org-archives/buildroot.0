From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Thu, 24 May 2018 15:25:41 +0200
Subject: [Buildroot] [PATCH] package/nss-myhostname: Add package
Message-ID: <1527168341-29387-1-git-send-email-vincent.prince.fr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also fix nss-mdns hook to work with nss-myhostname

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
---
 package/Config.in                          |  1 +
 package/nss-mdns/nss-mdns.mk               |  2 +-
 package/nss-myhostname/Config.in           |  7 +++++++
 package/nss-myhostname/nss-myhostname.hash |  2 ++
 package/nss-myhostname/nss-myhostname.mk   | 20 ++++++++++++++++++++
 5 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 package/nss-myhostname/Config.in
 create mode 100644 package/nss-myhostname/nss-myhostname.hash
 create mode 100644 package/nss-myhostname/nss-myhostname.mk

diff --git a/package/Config.in b/package/Config.in
index 3cf53ed..3ac0d63 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1426,6 +1426,7 @@ menu "Networking"
 	source "package/neon/Config.in"
 	source "package/norm/Config.in"
 	source "package/nss-mdns/Config.in"
+	source "package/nss-myhostname/Config.in"
 	source "package/nss-pam-ldapd/Config.in"
 	source "package/omniorb/Config.in"
 	source "package/openldap/Config.in"
diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
index 407b942..ee666c7 100644
--- a/package/nss-mdns/nss-mdns.mk
+++ b/package/nss-mdns/nss-mdns.mk
@@ -17,6 +17,6 @@ define NSS_MDNS_INSTALL_CONFIG
 		$(TARGET_DIR)/etc/nsswitch.conf
 endef
 
-NSS_MDNS_POST_INSTALL_TARGET_HOOKS += NSS_MDNS_INSTALL_CONFIG
+NSS_MDNS_TARGET_FINALIZE_HOOKS += NSS_MDNS_INSTALL_CONFIG
 
 $(eval $(autotools-package))
diff --git a/package/nss-myhostname/Config.in b/package/nss-myhostname/Config.in
new file mode 100644
index 0000000..968b911
--- /dev/null
+++ b/package/nss-myhostname/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_NSS_MYHOSTNAME
+	bool "nss-myhostname"
+    depends on !BR2_PACKAGE_SYSTEMD_MYHOSTNAME
+	help
+		Name Service Switch module for resolving the local hostname
+
+		http://0pointer.de/lennart/projects/nss-myhostname
diff --git a/package/nss-myhostname/nss-myhostname.hash b/package/nss-myhostname/nss-myhostname.hash
new file mode 100644
index 0000000..9e33bec
--- /dev/null
+++ b/package/nss-myhostname/nss-myhostname.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256  2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67e7caf2 nss-myhostname-0.3.tar.gz
diff --git a/package/nss-myhostname/nss-myhostname.mk b/package/nss-myhostname/nss-myhostname.mk
new file mode 100644
index 0000000..153e1d0
--- /dev/null
+++ b/package/nss-myhostname/nss-myhostname.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+## nss-myhostname
+#
+#################################################################################
+
+NSS_MYHOSTNAME_VERSION = 0.3
+NSS_MYHOSTNAME_SITE = http://0pointer.de/lennart/projects/nss-myhostname
+NSS_MYHOSTNAME_LICENSE = LGPL-2.1
+NSS_MYHOSTNAME_LICENSE_FILES = LICENSE
+NSS_MYHOSTNAME_AUTORECONF = YES
+
+define MYHOSTNAME_SET_NSSWITCH
+    $(SED) '/^hosts:/s/\s*\<myhostname\>//' \
+		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname \3\4\5/' -r $(TARGET_DIR)/etc/nsswitch.conf
+endef
+
+NSS_MYHOSTNAME_TARGET_FINALIZE_HOOKS += MYHOSTNAME_SET_NSSWITCH
+
+$(eval $(autotools-package))
-- 
2.7.4
