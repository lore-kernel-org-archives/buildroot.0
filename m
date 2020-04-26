From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sun, 26 Apr 2020 08:29:40 -0500
Subject: [Buildroot] [PATCH] package/ebtables: bump to version 2.0.11
Message-ID: <20200426132940.25969-1-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the version bump to 2.0.11, ebtables switch to autotools build
system. In addition, ebtables-{restore/save} moved to being installed
as ebtables-legacy-{restore/save}.

Changes to support this version bump include:

 * Utilize configure options for static library support
 * Remove ebtables-restore config option as configure scripts checks
   dependencies for ebtables-legacy-restore.
 * Remove ebtables-restore-save as it is a perl script and optionally
   replace it with a bash equivalent
  * Remove 0001-*-ethernetdb*.patch as it was merged with commit:
      http://git.netfilter.org/ebtables/commit/?id=f8079671326e9fd079391d24911a9a8a77f1d6fd
 * Remove 0002-*-musl-*.patch as support was added with commit:
     http://git.netfilter.org/ebtables/commit/?id=9fff3d5f9da00255463d28b38d688c25025b7fb1

Tested with test-pkg with BR2_PACKAGE_EBTABLES=y:

                             br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: SKIPPED
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
---
 Config.in.legacy                              |  7 +++
 ...ove-C-specific-compiler-hint-macro-_.patch | 50 -------------------
 ...ebtables-save-perl-script-with-bash.patch} |  0
 .../0002-Fix-musl-compatibility.patch         | 30 -----------
 package/ebtables/Config.in                    |  9 ----
 package/ebtables/ebtables.hash                |  5 +-
 package/ebtables/ebtables.mk                  | 40 ++++-----------
 7 files changed, 19 insertions(+), 122 deletions(-)
 delete mode 100644 package/ebtables/0001-ethernetdb.h-Remove-C-specific-compiler-hint-macro-_.patch
 rename package/ebtables/{0003-replace-ebtables-save-perl-script-with-bash.patch => 0001-replace-ebtables-save-perl-script-with-bash.patch} (100%)
 delete mode 100644 package/ebtables/0002-Fix-musl-compatibility.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index c92023310d..cd06f7c80b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2020.05"
 
+config BR2_PACKAGE_EBTABLES_UTILS_RESTORE
+	bool "ebtables restore option was removed"
+	select BR2_LEGACY
+	help
+	  ebtables-restore move to ebtables-legacy-restore and is installed
+	  by default in version 2.0.11
+
 config BR2_PACKAGE_COLLECTD_LVM
 	bool "lvm support in collectd was removed"
 	select BR2_LEGACY
diff --git a/package/ebtables/0001-ethernetdb.h-Remove-C-specific-compiler-hint-macro-_.patch b/package/ebtables/0001-ethernetdb.h-Remove-C-specific-compiler-hint-macro-_.patch
deleted file mode 100644
index bd7bead093..0000000000
--- a/package/ebtables/0001-ethernetdb.h-Remove-C-specific-compiler-hint-macro-_.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From f8079671326e9fd079391d24911a9a8a77f1d6fd Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Sat, 16 May 2015 12:31:58 +0200
-Subject: [PATCH] ethernetdb.h: Remove C++ specific compiler hint macro _THROW
-
-Fixes compilation with musl libc
-
-Signed-off-by: Felix Janda <felix.janda@posteo.de>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: upstream commit f8079671326e9fd0
-
- include/ethernetdb.h | 11 +++++------
- 1 file changed, 5 insertions(+), 6 deletions(-)
-
-diff --git a/include/ethernetdb.h b/include/ethernetdb.h
-index 46d8bfd1b7e5..1683abe01987 100644
---- a/include/ethernetdb.h
-+++ b/include/ethernetdb.h
-@@ -38,21 +38,20 @@ struct ethertypeent {
- 
- /* Open ethertype data base files and mark them as staying open even
-    after a later search if STAY_OPEN is non-zero.  */
--extern void setethertypeent(int __stay_open) __THROW;
-+extern void setethertypeent(int __stay_open);
- 
- /* Close ethertype data base files and clear `stay open' flag.  */
--extern void endethertypeent(void) __THROW;
-+extern void endethertypeent(void);
- 
- /* Get next entry from ethertype data base file.  Open data base if
-    necessary.  */
--extern struct ethertypeent *getethertypeent(void) __THROW;
-+extern struct ethertypeent *getethertypeent(void);
- 
- /* Return entry from ethertype data base for network with NAME.  */
--extern struct ethertypeent *getethertypebyname(__const char *__name)
--    __THROW;
-+extern struct ethertypeent *getethertypebyname(__const char *__name);
- 
- /* Return entry from ethertype data base which number is PROTO.  */
--extern struct ethertypeent *getethertypebynumber(int __ethertype) __THROW;
-+extern struct ethertypeent *getethertypebynumber(int __ethertype);
- 
- 
- #endif				/* ethernetdb.h */
--- 
-2.11.0
-
diff --git a/package/ebtables/0003-replace-ebtables-save-perl-script-with-bash.patch b/package/ebtables/0001-replace-ebtables-save-perl-script-with-bash.patch
similarity index 100%
rename from package/ebtables/0003-replace-ebtables-save-perl-script-with-bash.patch
rename to package/ebtables/0001-replace-ebtables-save-perl-script-with-bash.patch
diff --git a/package/ebtables/0002-Fix-musl-compatibility.patch b/package/ebtables/0002-Fix-musl-compatibility.patch
deleted file mode 100644
index 5e9f534b46..0000000000
--- a/package/ebtables/0002-Fix-musl-compatibility.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 138e7efdc8cad6453620c6366e6fa5e786593f7f Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 16 Feb 2017 14:41:48 +0200
-Subject: [PATCH] Fix musl compatibility
-
-Include netinet/ether.h before kernel headers to suppress the conflicting
-definition of struct ethhdr.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: not upstreamable; depends on Buildroot local musl patch
----
- include/ebtables_u.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/ebtables_u.h b/include/ebtables_u.h
-index 35a5bcc54c86..268b1fd599d2 100644
---- a/include/ebtables_u.h
-+++ b/include/ebtables_u.h
-@@ -24,6 +24,7 @@
- #ifndef EBTABLES_U_H
- #define EBTABLES_U_H
- #include <netinet/in.h>
-+#include <netinet/ether.h>
- #include <linux/netfilter_bridge/ebtables.h>
- #include <linux/netfilter/x_tables.h>
- 
--- 
-2.11.0
-
diff --git a/package/ebtables/Config.in b/package/ebtables/Config.in
index 4fc4b30dec..a525bd8a4e 100644
--- a/package/ebtables/Config.in
+++ b/package/ebtables/Config.in
@@ -14,13 +14,4 @@ config BR2_PACKAGE_EBTABLES_UTILS_SAVE
 	help
 	  Install the ebtables-save tool
 
-config BR2_PACKAGE_EBTABLES_UTILS_RESTORE
-	bool "ebtables restore"
-	depends on !BR2_STATIC_LIBS
-	help
-	  Install the ebtables-restore tool
-
-comment "ebtables-restore needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-
 endif
diff --git a/package/ebtables/ebtables.hash b/package/ebtables/ebtables.hash
index f9222b8896..98106b0d60 100644
--- a/package/ebtables/ebtables.hash
+++ b/package/ebtables/ebtables.hash
@@ -1,3 +1,4 @@
+# ftp://ftp.netfilter.org/pub/ebtables/ebtables-2.0.11.tar.gz.sha256sum
+sha256  b71f654784a726329f88b412ef7b96b4e5d786ed2bd28193ed7b4c0d677dfd2a  ebtables-2.0.11.tar.gz
 # Locally computed
-sha256	dc6f7b484f207dc712bfca81645f45120cb6aee3380e77a1771e9c34a9a4455d	ebtables-v2.0.10-4.tar.gz
-sha256	ebdb8ae564c952792017ec680e2edd30443642216eb9f8a3d8fa166c0cb628c1	COPYING
+sha256  ebdb8ae564c952792017ec680e2edd30443642216eb9f8a3d8fa166c0cb628c1  COPYING
diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 117cd5e99e..696aac8835 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -4,45 +4,23 @@
 #
 ################################################################################
 
-EBTABLES_VERSION = 2.0.10-4
-EBTABLES_SOURCE = ebtables-v$(EBTABLES_VERSION).tar.gz
+EBTABLES_VERSION = 2.0.11
+EBTABLES_SOURCE = ebtables-$(EBTABLES_VERSION).tar.gz
 EBTABLES_SITE = http://ftp.netfilter.org/pub/ebtables
 EBTABLES_LICENSE = GPL-2.0+
 EBTABLES_LICENSE_FILES = COPYING
-EBTABLES_STATIC = $(if $(BR2_STATIC_LIBS),static)
-EBTABLES_K64U32 = $(if $(BR2_KERNEL_64_USERLAND_32),-DKERNEL_64_USERSPACE_32)
-
-define EBTABLES_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) LIBDIR=/lib/ebtables $(EBTABLES_STATIC) \
-		CFLAGS="$(TARGET_CFLAGS) $(EBTABLES_K64U32)" -C $(@D)
-endef
 
 ifeq ($(BR2_PACKAGE_EBTABLES_UTILS_SAVE),y)
 define EBTABLES_INSTALL_TARGET_UTILS_SAVE
-	$(INSTALL) -m 0755 -D $(@D)/ebtables-save.sh $(TARGET_DIR)/sbin/ebtables-save
-endef
-endif
-ifeq ($(BR2_PACKAGE_EBTABLES_UTILS_RESTORE),y)
-define EBTABLES_INSTALL_TARGET_UTILS_RESTORE
-	$(INSTALL) -m 0755 -D $(@D)/ebtables-restore $(TARGET_DIR)/sbin/ebtables-restore
-endef
-endif
-
-ifeq ($(BR2_STATIC_LIBS),y)
-define EBTABLES_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/static $(TARGET_DIR)/sbin/ebtables
+	$(INSTALL) -m 0755 -D $(@D)/ebtables-save.sh $(TARGET_DIR)/usr/sbin/ebtables-legacy-save
 endef
+EBTABLES_POST_INSTALL_TARGET_HOOKS += EBTABLES_INSTALL_TARGET_UTILS_SAVE
 else
-define EBTABLES_INSTALL_TARGET_CMDS
-	$(foreach so,$(wildcard $(@D)/*.so $(@D)/extensions/*.so), \
-		$(INSTALL) -m 0755 -D $(so) \
-			$(TARGET_DIR)/lib/ebtables/$(notdir $(so))
-	)
-	$(INSTALL) -m 0755 -D $(@D)/ebtables $(TARGET_DIR)/sbin/ebtables
-	$(INSTALL) -m 0644 -D $(@D)/ethertypes $(TARGET_DIR)/etc/ethertypes
-	$(EBTABLES_INSTALL_TARGET_UTILS_RESTORE)
-	$(EBTABLES_INSTALL_TARGET_UTILS_SAVE)
+# ebtables-legacy-save is a perl script, thus remove it from target
+define EBTABLES_REMOVE_UTILS_SAVE
+	$(RM) -f $(TARGET_DIR)/usr/sbin/ebtables-legacy-save
 endef
+EBTABLES_POST_INSTALL_TARGET_HOOKS += EBTABLES_REMOVE_UTILS_SAVE
 endif
 
-$(eval $(generic-package))
+$(eval $(autotools-package))
-- 
2.17.1
