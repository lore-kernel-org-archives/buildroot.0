From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 22:22:26 +0200
Subject: [Buildroot] [git commit] package/ebtables: bump to version 2.0.11
Message-ID: <20201006201218.DB7F68EC64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3a6c7d3a3c19f19a45ef91b46357f1249f01d23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the version bump to 2.0.11, ebtables switch to autotools build
system. In addition, ebtables-{restore/save} moved to being installed
as ebtables-legacy-{restore/save}.

Changes to support this version bump include:

 * Remove dependency on !BR2_STATIC_LIBS for ebtables-restore as the
   switch to autotools supports compiling with static libraries.
 * Update ebtables-save script patch to use /usr/sbin/ebtables-legacy
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
Tested-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...h-Remove-C-specific-compiler-hint-macro-_.patch | 50 ----------------------
 ...lace-ebtables-save-perl-script-with-bash.patch} |  6 ++-
 package/ebtables/0002-Fix-musl-compatibility.patch | 30 -------------
 package/ebtables/Config.in                         |  8 +---
 package/ebtables/ebtables.hash                     |  5 ++-
 package/ebtables/ebtables.mk                       | 44 +++++++------------
 6 files changed, 25 insertions(+), 118 deletions(-)

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
similarity index 91%
rename from package/ebtables/0003-replace-ebtables-save-perl-script-with-bash.patch
rename to package/ebtables/0001-replace-ebtables-save-perl-script-with-bash.patch
index 687eb6a373..525e8a28b5 100644
--- a/package/ebtables/0003-replace-ebtables-save-perl-script-with-bash.patch
+++ b/package/ebtables/0001-replace-ebtables-save-perl-script-with-bash.patch
@@ -16,6 +16,10 @@ Upstream:
 https://github.com/openembedded/meta-openembedded/commit/7f723007364ba79de05447671e83d4eefb3097dc
 
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+[ryanbarnett3 at gmail.com:
+ - changed EBTABLES executable to /usr/sbin/ebtables-legacy
+]
+Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
 ---
  ebtables-save.sh | 43 +++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 43 insertions(+)
@@ -29,7 +33,7 @@ index 0000000..2d7fc4e
 @@ -0,0 +1,43 @@
 +#!/bin/bash
 +
-+EBTABLES="/sbin/ebtables"
++EBTABLES="/usr/sbin/ebtables-legacy"
 +
 +[ -x "$EBTABLES" ] || exit 1
 +
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
index 4fc4b30dec..b98d03b626 100644
--- a/package/ebtables/Config.in
+++ b/package/ebtables/Config.in
@@ -12,15 +12,11 @@ config BR2_PACKAGE_EBTABLES_UTILS_SAVE
 	bool "ebtables save"
 	depends on BR2_PACKAGE_BASH # runtime
 	help
-	  Install the ebtables-save tool
+	  Install the ebtables-legacy-save tool
 
 config BR2_PACKAGE_EBTABLES_UTILS_RESTORE
 	bool "ebtables restore"
-	depends on !BR2_STATIC_LIBS
 	help
-	  Install the ebtables-restore tool
-
-comment "ebtables-restore needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+	  Install the ebtables-legacy-restore tool
 
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
index 117cd5e99e..e8b982206c 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -4,45 +4,31 @@
 #
 ################################################################################
 
-EBTABLES_VERSION = 2.0.10-4
-EBTABLES_SOURCE = ebtables-v$(EBTABLES_VERSION).tar.gz
+EBTABLES_VERSION = 2.0.11
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
+	$(INSTALL) -m 0755 -D $(@D)/ebtables-save.sh $(TARGET_DIR)/usr/sbin/ebtables-legacy-save
 endef
-endif
-ifeq ($(BR2_PACKAGE_EBTABLES_UTILS_RESTORE),y)
-define EBTABLES_INSTALL_TARGET_UTILS_RESTORE
-	$(INSTALL) -m 0755 -D $(@D)/ebtables-restore $(TARGET_DIR)/sbin/ebtables-restore
+EBTABLES_POST_INSTALL_TARGET_HOOKS += EBTABLES_INSTALL_TARGET_UTILS_SAVE
+else
+# ebtables-legacy-save is installed by default, thus remove it from target
+define EBTABLES_REMOVE_UTILS_SAVE
+	$(RM) -f $(TARGET_DIR)/usr/sbin/ebtables-legacy-save
 endef
+EBTABLES_POST_INSTALL_TARGET_HOOKS += EBTABLES_REMOVE_UTILS_SAVE
 endif
 
-ifeq ($(BR2_STATIC_LIBS),y)
-define EBTABLES_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/static $(TARGET_DIR)/sbin/ebtables
-endef
-else
-define EBTABLES_INSTALL_TARGET_CMDS
-	$(foreach so,$(wildcard $(@D)/*.so $(@D)/extensions/*.so), \
-		$(INSTALL) -m 0755 -D $(so) \
-			$(TARGET_DIR)/lib/ebtables/$(notdir $(so))
-	)
-	$(INSTALL) -m 0755 -D $(@D)/ebtables $(TARGET_DIR)/sbin/ebtables
-	$(INSTALL) -m 0644 -D $(@D)/ethertypes $(TARGET_DIR)/etc/ethertypes
-	$(EBTABLES_INSTALL_TARGET_UTILS_RESTORE)
-	$(EBTABLES_INSTALL_TARGET_UTILS_SAVE)
+# ebtables-legacy-restore is installed by default, thus remove it if not
+# selected
+ifeq ($(BR2_PACKAGE_EBTABLES_UTILS_RESTORE),)
+define EBTABLES_REMOVE_UTILS_RESTORE
+	$(RM) -f $(TARGET_DIR)/usr/sbin/ebtables-legacy-restore
 endef
+EBTABLES_POST_INSTALL_TARGET_HOOKS += EBTABLES_REMOVE_UTILS_RESTORE
 endif
 
-$(eval $(generic-package))
+$(eval $(autotools-package))
