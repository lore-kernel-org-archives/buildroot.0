From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Mar 2021 18:13:36 +0100
Subject: [Buildroot] [PATCH 2/2] package/samba4: bump version to 4.14.2
In-Reply-To: <20210327171336.95774-1-bernd.kuhls@t-online.de>
References: <20210327171336.95774-1-bernd.kuhls@t-online.de>
Message-ID: <20210327171336.95774-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added patch to fix build error.
Removed patch which was applied upstream.

Added two options to samba4-cache.txt to fix cross build.

host-perl is now mandatory, also host-perl-parse-yapp is needed.

Added option to fix build without dbus, this change needed a rework of
the shared-modules configure option, due to this upstream commit:
https://gitlab.com/samba-team/devel/samba/-/commit/b6805d5e0bcf1716f87e84bcbb2fd8f93c38a8a3

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../samba4/0005-dcesrv_core-fix-build.patch   |  49 +++++++++
 ...-function-conflicts-with-glibc-nss-h.patch | 104 ------------------
 package/samba4/samba4-cache.txt               |   2 +
 package/samba4/samba4.hash                    |   4 +-
 package/samba4/samba4.mk                      |  13 ++-
 5 files changed, 63 insertions(+), 109 deletions(-)
 create mode 100644 package/samba4/0005-dcesrv_core-fix-build.patch
 delete mode 100644 package/samba4/0005-nsswitch-nsstest-c-Avoid-nss-function-conflicts-with-glibc-nss-h.patch

diff --git a/package/samba4/0005-dcesrv_core-fix-build.patch b/package/samba4/0005-dcesrv_core-fix-build.patch
new file mode 100644
index 0000000000..775a4a12d8
--- /dev/null
+++ b/package/samba4/0005-dcesrv_core-fix-build.patch
@@ -0,0 +1,49 @@
+From b8b5c4d7ebe6edac76313bea5817296dba198a6d Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 27 Mar 2021 17:17:34 +0100
+Subject: [PATCH] dcesrv_core: fix build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Move include of system/network.h above dcesrv_init_context to avoid
+build error:
+
+In file included from ../../lib/replace/system/network.h:35,
+                 from ../../librpc/rpc/dcesrv_core.c:2658:
+usr/include/unistd.h: At top level:
+usr/include/unistd.h:675:16: error: conflicting types for ?geteuid?
+  675 | extern __uid_t geteuid (void) __THROW;
+
+Patch sent upstream:
+https://gitlab.com/samba-team/samba/-/merge_requests/1871
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ librpc/rpc/dcesrv_core.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/librpc/rpc/dcesrv_core.c b/librpc/rpc/dcesrv_core.c
+index 06f6c4b2382..a282b496169 100644
+--- a/librpc/rpc/dcesrv_core.c
++++ b/librpc/rpc/dcesrv_core.c
+@@ -2320,6 +2320,8 @@ static NTSTATUS dcesrv_process_ncacn_packet(struct dcesrv_connection *dce_conn,
+ 	return status;
+ }
+ 
++#include "system/network.h"
++
+ _PUBLIC_ NTSTATUS dcesrv_init_context(TALLOC_CTX *mem_ctx,
+ 				      struct loadparm_context *lp_ctx,
+ 				      struct dcesrv_context_callbacks *cb,
+@@ -2655,7 +2657,6 @@ _PUBLIC_ void dcesrv_cleanup_broken_connections(struct dcesrv_context *dce_ctx)
+  * This is mostly due to socket_wrapper defining #define bind swrap_bind
+  * which conflict with the bind used before.
+  */
+-#include "system/network.h"
+ 
+ struct dcesrv_sock_reply_state {
+ 	struct dcesrv_connection *dce_conn;
+-- 
+2.29.2
+
diff --git a/package/samba4/0005-nsswitch-nsstest-c-Avoid-nss-function-conflicts-with-glibc-nss-h.patch b/package/samba4/0005-nsswitch-nsstest-c-Avoid-nss-function-conflicts-with-glibc-nss-h.patch
deleted file mode 100644
index c5e0b55dea..0000000000
--- a/package/samba4/0005-nsswitch-nsstest-c-Avoid-nss-function-conflicts-with-glibc-nss-h.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From 6e496aa3635557b59792e469f7c7f8eccd822322 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 22 Jul 2020 22:42:09 -0700
-Subject: [PATCH] nsswitch/nsstest.c: Avoid nss function conflicts with glibc
- nss.h
-
-glibc 2.32 will define these varibles [1] which results in conflicts
-with these static function names, therefore prefix these function names
-with samba_ to avoid it
-
-[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=499a92df8b9fc64a054cf3b7f728f8967fc1da7d
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Reviewed-by: Volker Lendecke <vl@samba.org>
-Reviewed-by: Noel Power <npower@samba.org>
-
-Autobuild-User(master): Noel Power <npower@samba.org>
-Autobuild-Date(master): Tue Jul 28 10:52:00 UTC 2020 on sn-devel-184
-
-[Retrieved from:
-https://gitlab.com/samba-team/samba/-/commit/6e496aa3635557b59792e469f7c7f8eccd822322]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- nsswitch/nsstest.c | 16 ++++++++--------
- 1 file changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/nsswitch/nsstest.c b/nsswitch/nsstest.c
-index e8c4306441d..e2ee9fbf3af 100644
---- a/nsswitch/nsstest.c
-+++ b/nsswitch/nsstest.c
-@@ -137,7 +137,7 @@ static struct passwd *nss_getpwuid(uid_t uid)
- 	return &pwd;
- }
- 
--static void nss_setpwent(void)
-+static void samba_nss_setpwent(void)
- {
- 	NSS_STATUS (*_nss_setpwent)(void) =
- 		(NSS_STATUS(*)(void))find_fn("setpwent");
-@@ -152,7 +152,7 @@ static void nss_setpwent(void)
- 	}
- }
- 
--static void nss_endpwent(void)
-+static void samba_nss_endpwent(void)
- {
- 	NSS_STATUS (*_nss_endpwent)(void) =
- 		(NSS_STATUS (*)(void))find_fn("endpwent");
-@@ -290,7 +290,7 @@ again:
- 	return &grp;
- }
- 
--static void nss_setgrent(void)
-+static void samba_nss_setgrent(void)
- {
- 	NSS_STATUS (*_nss_setgrent)(void) =
- 		(NSS_STATUS (*)(void))find_fn("setgrent");
-@@ -305,7 +305,7 @@ static void nss_setgrent(void)
- 	}
- }
- 
--static void nss_endgrent(void)
-+static void samba_nss_endgrent(void)
- {
- 	NSS_STATUS (*_nss_endgrent)(void) =
- 		(NSS_STATUS (*)(void))find_fn("endgrent");
-@@ -402,7 +402,7 @@ static void nss_test_users(void)
- {
- 	struct passwd *pwd;
- 
--	nss_setpwent();
-+	samba_nss_setpwent();
- 	/* loop over all users */
- 	while ((pwd = nss_getpwent())) {
- 		printf("Testing user %s\n", pwd->pw_name);
-@@ -424,14 +424,14 @@ static void nss_test_users(void)
- 		printf("initgroups: "); nss_test_initgroups(pwd->pw_name, pwd->pw_gid);
- 		printf("\n");
- 	}
--	nss_endpwent();
-+	samba_nss_endpwent();
- }
- 
- static void nss_test_groups(void)
- {
- 	struct group *grp;
- 
--	nss_setgrent();
-+	samba_nss_setgrent();
- 	/* loop over all groups */
- 	while ((grp = nss_getgrent())) {
- 		printf("Testing group %s\n", grp->gr_name);
-@@ -452,7 +452,7 @@ static void nss_test_groups(void)
- 		printf("getgrgid: "); print_group(grp);
- 		printf("\n");
- 	}
--	nss_endgrent();
-+	samba_nss_endgrent();
- }
- 
- static void nss_test_errors(void)
--- 
-GitLab
-
diff --git a/package/samba4/samba4-cache.txt b/package/samba4/samba4-cache.txt
index e3a3720fc8..bd7c3654b4 100644
--- a/package/samba4/samba4-cache.txt
+++ b/package/samba4/samba4-cache.txt
@@ -40,3 +40,5 @@ Checking value of SIGRTMIN: "34"
 Checking errno of iconv for illegal multibyte sequence: "0"
 checking for clnt_create(): OK
 Checking for a 64-bit host to support lmdb: NO
+Checking value of GNUTLS_CIPHER_AES_128_CFB8: 29
+Checking value of GNUTLS_MAC_AES_CMAC_128: 203
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 44fbc495c5..4d808c5fe3 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.11.17.tar.asc
-sha256  15167da19922c7be210ecf8149b73abcb7c2be051de05b756f7f24e7ec9e5b04  samba-4.11.17.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.14.2.tar.asc
+sha256  95651da478743f7cb407aec81287536c096e3e18bb4981dbe47ca70bf6181f96  samba-4.14.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 61d8190127..ef4ffce47c 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.11.17
+SAMBA4_VERSION = 4.14.2
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
@@ -13,7 +13,8 @@ SAMBA4_LICENSE_FILES = COPYING
 SAMBA4_CPE_ID_VENDOR = samba
 SAMBA4_CPE_ID_PRODUCT = samba
 SAMBA4_DEPENDENCIES = \
-	host-e2fsprogs host-heimdal host-nfs-utils host-python3 \
+	host-e2fsprogs host-heimdal host-nfs-utils \
+	host-perl host-perl-parse-yapp host-python3 \
 	cmocka e2fsprogs gnutls popt zlib \
 	$(if $(BR2_PACKAGE_LIBAIO),libaio) \
 	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
@@ -58,6 +59,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 SAMBA4_DEPENDENCIES += dbus
+SAMBA4_SHARED_MODULES += vfs_snapper
+else
+SAMBA4_SHARED_MODULES += !vfs_snapper
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_AVAHI_DAEMON),yy)
@@ -104,6 +108,7 @@ define SAMBA4_CONFIGURE_CMDS
 		$(SAMBA4_PYTHON) \
 		python_LDFLAGS="" \
 		python_LIBDIR="" \
+		PERL="$(HOST_DIR)/bin/perl" \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(SAMBA4_CONF_ENV) \
 		./buildtools/bin/waf configure \
@@ -125,6 +130,7 @@ define SAMBA4_CONFIGURE_CMDS
 			--disable-glusterfs \
 			--with-cluster-support \
 			--bundled-libraries='!asn1_compile,!compile_et' \
+			 --with-shared-modules=$(SAMBA4_SHARED_MODULES) \
 			$(SAMBA4_CONF_OPTS) \
 	)
 endef
@@ -148,8 +154,9 @@ SAMBA4_CONF_OPTS += --without-ad-dc --without-json
 endif
 
 ifeq ($(BR2_PACKAGE_SAMBA4_ADS),y)
-SAMBA4_CONF_OPTS += --with-ads --with-ldap --with-shared-modules=idmap_ad
+SAMBA4_CONF_OPTS += --with-ads --with-ldap
 SAMBA4_DEPENDENCIES += openldap
+SAMBA4_SHARED_MODULES += idmap_ad
 else
 SAMBA4_CONF_OPTS += --without-ads --without-ldap
 endif
-- 
2.29.2
