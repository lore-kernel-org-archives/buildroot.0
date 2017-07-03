From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 00:24:38 +0200
Subject: [Buildroot] [git commit] easy-rsa: new package
Message-ID: <20170703222214.AA39681F66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a02c64f1902472f606494dc1a0dbb782190a2e01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Mention that openssl is a runtime dependency,
	Add license info as noted by Romain, add gpl-2.0.txt,
	Add comment explaining the missing build step,
	Use install -t for x509-types files]
Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/easy-rsa/Config.in     | 15 +++++++++++++++
 package/easy-rsa/easy-rsa.hash |  2 ++
 package/easy-rsa/easy-rsa.mk   | 23 +++++++++++++++++++++++
 5 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d121bd8..22016a5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -969,6 +969,7 @@ F:	package/lldpd/
 
 N:	Julien Viard de Galbert <julien@vdg.name>
 F:	package/dieharder/
+F:	package/easy-rsa/
 
 N:	Justin Maggard <jmaggard@netgear.com>
 F:	package/dtach/
diff --git a/package/Config.in b/package/Config.in
index 355aa52..4c7852d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1803,6 +1803,7 @@ comment "Utilities"
 	source "package/dialog/Config.in"
 	source "package/dtach/Config.in"
 	source "package/file/Config.in"
+	source "package/easy-rsa/Config.in"
 	source "package/gnupg/Config.in"
 	source "package/gnupg2/Config.in"
 	source "package/inotify-tools/Config.in"
diff --git a/package/easy-rsa/Config.in b/package/easy-rsa/Config.in
new file mode 100644
index 0000000..883d679
--- /dev/null
+++ b/package/easy-rsa/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_EASY_RSA
+	bool "easy-rsa"
+	select BR2_PACKAGE_OPENSSL # runtime
+	select BR2_PACKAGE_OPENSSL_BIN
+	help
+	  Simple shell based CA utility
+
+	  This package eases the creation of certificates, for example
+	  for openvpn clients.
+
+	  This was formerly part of the openvpn package.
+
+	  easy-rsa is a wrapper script around OpenSSL binaries.
+
+	  https://github.com/OpenVPN/easy-rsa
diff --git a/package/easy-rsa/easy-rsa.hash b/package/easy-rsa/easy-rsa.hash
new file mode 100644
index 0000000..e2d658a
--- /dev/null
+++ b/package/easy-rsa/easy-rsa.hash
@@ -0,0 +1,2 @@
+# Locally computed: (after verifying gpg sig)
+sha512 d20f646e33ec803444dfcd446553f1d6001227fedec93280c212b34cccee11b184599f1b2ae6a3ce9cf6c9ac52f2b840ebb645536df6ddf55382fa25c22df81f EasyRSA-3.0.1.tgz
diff --git a/package/easy-rsa/easy-rsa.mk b/package/easy-rsa/easy-rsa.mk
new file mode 100644
index 0000000..8ed5741
--- /dev/null
+++ b/package/easy-rsa/easy-rsa.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# easy-rsa
+#
+################################################################################
+
+EASY_RSA_VERSION = 3.0.1
+EASY_RSA_SOURCE = EasyRSA-$(EASY_RSA_VERSION).tgz
+EASY_RSA_SITE = https://github.com/OpenVPN/easy-rsa/releases/download/$(EASY_RSA_VERSION)
+EASY_RSA_LICENSE = GPL-2.0
+EASY_RSA_LICENSE_FILES = COPYING gpl-2.0.txt
+
+# shell script, so no build step
+
+define EASY_RSA_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/easyrsa $(TARGET_DIR)/usr/bin/easyrsa
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/easy-rsa/x509-types
+	$(INSTALL) -m 0644 -t $(TARGET_DIR)/etc/easy-rsa/x509-types $(@D)/x509-types/*
+	$(INSTALL) -D -m 0644 $(@D)/openssl-1.0.cnf $(TARGET_DIR)/etc/easy-rsa/openssl-1.0.cnf
+	$(INSTALL) -D -m 0644 $(@D)/vars.example $(TARGET_DIR)/etc/easy-rsa/vars
+endef
+
+$(eval $(generic-package))
