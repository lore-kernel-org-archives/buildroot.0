From: zooey at hirschkaefer.de <zooey@hirschkaefer.de>
Date: Sat, 27 Sep 2014 15:12:19 +0200
Subject: [Buildroot] [RFC 1/3] samba4: allow separate build of libsmbclient
In-Reply-To: <1411823541-4953-1-git-send-email-zooey@hirschkaefer.de>
References: <1411823541-4953-1-git-send-email-zooey@hirschkaefer.de>
Message-ID: <1411823541-4953-2-git-send-email-zooey@hirschkaefer.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Oliver Tappe <zooey@hirschkaefer.de>

Introduce new config option BR2_PACKAGE_SAMBA4_CLIENT_LIB and adjust
samba4.mk accordingly. Additionally, add patch that adds the required
Makefile targets smbclient and install_smbclient.
---
 package/samba4/Config.in                           | 10 +++++++
 ...d-smbclient-and-install_smbclient-targets.patch | 35 ++++++++++++++++++++++
 package/samba4/samba4.mk                           | 16 ++++++++--
 3 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 package/samba4/samba4-0010-build-add-smbclient-and-install_smbclient-targets.patch

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index 60e0f55..308debd 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -1,6 +1,16 @@
+config BR2_PACKAGE_SAMBA4_CLIENT_LIB
+	depends on !BR2_PACKAGE_SAMBA
+	bool "samba4 client library"
+	help
+	  libsmbclient is a library toolset that permits applications
+	  to manipulate CIFS/SMB network resources using many of the
+	  standards POSIX functions available for manipulating local
+	  files.
+
 config BR2_PACKAGE_SAMBA4
 	bool "samba4"
 	depends on !BR2_PACKAGE_SAMBA
+	depends on !BR2_PACKAGE_SAMBA4_CLIENT_LIB
 	depends on BR2_INET_IPV6
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR # e2fsprogs
diff --git a/package/samba4/samba4-0010-build-add-smbclient-and-install_smbclient-targets.patch b/package/samba4/samba4-0010-build-add-smbclient-and-install_smbclient-targets.patch
new file mode 100644
index 0000000..1f155c4
--- /dev/null
+++ b/package/samba4/samba4-0010-build-add-smbclient-and-install_smbclient-targets.patch
@@ -0,0 +1,35 @@
+From 255c0386275b64477801075b17edb3a647b01fd1 Mon Sep 17 00:00:00 2001
+From: Oliver Tappe <zooey@hirschkaefer.de>
+Date: Fri, 26 Sep 2014 18:37:17 +0200
+Subject: [PATCH] build: add smbclient and install_smbclient targets
+
+This (together with patches to buildroot's samba4.mk) makes it
+possible to build libsmbclient.so and all of its dependencies
+without needing to build all of samba.
+---
+ Makefile | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 5f220fa..bcc886c 100644
+--- a/Makefile
++++ b/Makefile
+@@ -7,9 +7,15 @@ WAF=WAF_MAKE=1 $(WAF_BINARY)
+ all:
+ 	$(WAF) build
+ 
++smbclient:
++	$(WAF) build --targets=smbclient
++
+ install:
+ 	$(WAF) install
+ 
++install_smbclient:
++	$(WAF) install --targets=smbclient
++
+ uninstall:
+ 	$(WAF) uninstall
+ 
+-- 
+1.8.4.5
+
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index e1ee33f..1826c01 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -69,6 +69,14 @@ else
 	SAMBA4_CONF_OPT += --without-regedit
 endif
 
+ifeq ($(BR2_PACKAGE_SAMBA4_CLIENT_LIB),y)
+	SAMBA4_WAF_BUILD_TARGET = smbclient
+	SAMBA4_WAF_INSTALL_TARGET = install_smbclient
+else
+	SAMBA4_WAF_BUILD_TARGET = all
+	SAMBA4_WAF_INSTALL_TARGET = install
+endif
+
 define SAMBA4_CONFIGURE_CMDS
 	cp package/samba4/samba4-cache.txt $(@D)/cache.txt;
 	echo 'Checking uname machine type: $(BR2_ARCH)' >>$(@D)/cache.txt;
@@ -102,13 +110,15 @@ define SAMBA4_CONFIGURE_CMDS
 endef
 
 define SAMBA4_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(SAMBA4_WAF_BUILD_TARGET)
 endef
 
 define SAMBA4_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) $(SAMBA4_WAF_INSTALL_TARGET)
 endef
 
+ifneq ($(BR2_PACKAGE_SAMBA4_CLIENT_LIB),y)
+
 # Samba just installs .py files so the purge causes problems with some tools
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
 define SAMBA4_BUILD_PYC_FILES
@@ -133,4 +143,6 @@ endef
 SAMBA4_POST_INSTALL_TARGET_HOOKS += SAMBA4_MOVE_LIBS
 endif
 
+endif	# BR2_PACKAGE_SAMBA4_CLIENT_LIB
+
 $(eval $(generic-package))
-- 
1.8.4.5
