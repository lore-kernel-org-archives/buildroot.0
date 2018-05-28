From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Mon, 28 May 2018 10:31:38 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/nss-myhostname: Add package
In-Reply-To: <1527496298-29730-1-git-send-email-vincent.prince.fr@gmail.com>
References: <1527496298-29730-1-git-send-email-vincent.prince.fr@gmail.com>
Message-ID: <1527496298-29730-2-git-send-email-vincent.prince.fr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Note sed command comes from Yocto recipe here:
https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
---
 DEVELOPERS                                 |  3 +++
 package/Config.in                          |  1 +
 package/nss-myhostname/Config.in           | 11 +++++++++++
 package/nss-myhostname/nss-myhostname.hash |  3 +++
 package/nss-myhostname/nss-myhostname.mk   | 20 ++++++++++++++++++++
 5 files changed, 38 insertions(+)
 create mode 100644 package/nss-myhostname/Config.in
 create mode 100644 package/nss-myhostname/nss-myhostname.hash
 create mode 100644 package/nss-myhostname/nss-myhostname.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 41e1b54..88c9a71 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1813,6 +1813,9 @@ F:	package/openmpi/
 F:	package/pinentry/
 F:	package/trinity/
 
+N:	Vincent Prince <vincent.prince.fr@gmail.com>
+F:	package/nss-myhostname/
+
 N:	Vincent Stehl?? <vincent.stehle@laposte.net>
 F:	package/i7z/
 F:	package/msr-tools/
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
diff --git a/package/nss-myhostname/Config.in b/package/nss-myhostname/Config.in
new file mode 100644
index 0000000..549e167
--- /dev/null
+++ b/package/nss-myhostname/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_NSS_MYHOSTNAME
+	bool "nss-myhostname"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_PACKAGE_SYSTEMD_MYHOSTNAME
+	help
+	  Name Service Switch module for resolving the local hostname
+
+	  http://0pointer.de/lennart/projects/nss-myhostname
+
+comment "nss-myhostname needs a glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/nss-myhostname/nss-myhostname.hash b/package/nss-myhostname/nss-myhostname.hash
new file mode 100644
index 0000000..dfa531c
--- /dev/null
+++ b/package/nss-myhostname/nss-myhostname.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67e7caf2 nss-myhostname-0.3.tar.gz
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861 LICENSE
diff --git a/package/nss-myhostname/nss-myhostname.mk b/package/nss-myhostname/nss-myhostname.mk
new file mode 100644
index 0000000..435c380
--- /dev/null
+++ b/package/nss-myhostname/nss-myhostname.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+## nss-myhostname
+#
+################################################################################
+
+NSS_MYHOSTNAME_VERSION = 0.3
+NSS_MYHOSTNAME_SITE = http://0pointer.de/lennart/projects/nss-myhostname
+NSS_MYHOSTNAME_LICENSE = LGPL-2.1+
+NSS_MYHOSTNAME_LICENSE_FILES = LICENSE
+
+define MYHOSTNAME_SET_NSSWITCH
+	$(SED) '/^hosts:/s/\s*\<myhostname\>//' \
+		-E -e 's,(^hosts:.*)(\<files\>)(.*)(\<dns\>)(.*),\1\2 myhostname \3\4\5,' \
+		$(TARGET_DIR)/etc/nsswitch.conf
+endef
+
+NSS_MYHOSTNAME_TARGET_FINALIZE_HOOKS += MYHOSTNAME_SET_NSSWITCH
+
+$(eval $(autotools-package))
-- 
2.7.4
