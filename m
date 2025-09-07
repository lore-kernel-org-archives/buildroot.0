Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5FACAC583
	for <buildroot@archiver.kernel.org>; Sun,  7 Sep 2025 16:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FDD560E08;
	Sun,  7 Sep 2025 16:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJZk9Wwcx_fI; Sun,  7 Sep 2025 16:04:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14AC7613FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14AC7613FC;
	Sun,  7 Sep 2025 16:04:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F594CA
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 16:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05EF7613FC
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 16:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id niKojcFnpeck for <buildroot@buildroot.org>;
 Sun,  7 Sep 2025 16:04:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 80B2760E08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80B2760E08
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80B2760E08
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 16:04:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 795FEC8EC60
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 16:04:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DCE1C6061A
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 16:04:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 76F99102F1C62; 
 Sun,  7 Sep 2025 18:04:31 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  7 Sep 2025 18:04:22 +0200
Message-ID: <20250907160424.3546872-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757261078; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=y1EoGc7xcErMo+dyBYI4sPDzwPnbCBXv92Jtj2o2CFE=;
 b=wqyDKwgHko2UNRRkwso6Nh3bxEvBbq+Q4zvbKAAw2jKThFw/zs9sCKemAspimWeRsGkKJd
 KH5Z2tCtd6DZlnQPkreldnXo7NuuZAgTs/Pr4V5kfo6XwVCScXUHF6eyK81GlldisSPrLA
 IRYJMZGAGYg4/kIjgg8+CdDMjJD6c42KvJbEywIsrdJfZ8fI2q2NniTKvOtGsUTJmVwhCE
 0KdUG3rrC78j2jV9EdhbCN8gb5iCvR0SKcyXeW5SvaJtkuLBk1T36evGcSiVo4PxQ7vSxC
 SBsahJmUyLm41OtsliAxZzCz/8zykAZpJzuSPJhfY30Mn3ReL8wnwydMVC8l0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=wqyDKwgH
Subject: [Buildroot] [PATCH 1/2] package/c-icap: add patches to fix GCC 15.x
 build issues
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Patches 0003 and 0004 are upstream backport. Patch 0005 isn't because
the code has completely changed upstream in newer releases.

Fixes:

  https://autobuild.buildroot.net/results/e9b4d9033f0283b133b58049a03b5f0b595e30db/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...thod-release_authentication_header-m.patch |  47 ++++
 ...ith-GCC15-signal-handlers-require-an.patch |  31 +++
 ...tion-prototypes-to-fix-GCC-15.x-buil.patch | 233 ++++++++++++++++++
 3 files changed, 311 insertions(+)
 create mode 100644 package/c-icap/0003-Fix-http_auth_method-release_authentication_header-m.patch
 create mode 100644 package/c-icap/0004-Fix-to-compile-with-GCC15-signal-handlers-require-an.patch
 create mode 100644 package/c-icap/0005-Fix-module-operation-prototypes-to-fix-GCC-15.x-buil.patch

diff --git a/package/c-icap/0003-Fix-http_auth_method-release_authentication_header-m.patch b/package/c-icap/0003-Fix-http_auth_method-release_authentication_header-m.patch
new file mode 100644
index 0000000000..940a67b70d
--- /dev/null
+++ b/package/c-icap/0003-Fix-http_auth_method-release_authentication_header-m.patch
@@ -0,0 +1,47 @@
+From 9ca4e5e2bd5fdf1d15a862faf8d4d1ddc0664bd0 Mon Sep 17 00:00:00 2001
+From: Christos Tsantilas <christos@chtsanti.net>
+Date: Fri, 21 Feb 2025 13:34:06 +0200
+Subject: [PATCH] Fix http_auth_method::release_authentication_header method
+ declaration
+
+Requires a "char *" argument.
+
+Reported with PR#72 at github:
+ https://github.com/c-icap/c-icap-server/pull/72
+
+Upstream: 48a221b0197727b26f90c00544fa19c67d0f5d47
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ http_auth.c      | 2 +-
+ include/module.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/http_auth.c b/http_auth.c
+index 1883b55..b831bb1 100644
+--- a/http_auth.c
++++ b/http_auth.c
+@@ -62,7 +62,7 @@ int http_authenticate(ci_request_t * req, char *use_method)
+     authenticator_module_t **authenticators;
+     void *method_data;
+     const char *auth_str, *method_str, *username;
+-    char *auth_header = NULL;
++    const char *auth_header = NULL;
+     int len, res;
+ 
+     if (ALLOW_REMOTE_PROXY_USERS && !use_method) {
+diff --git a/include/module.h b/include/module.h
+index 286ef72..0e57586 100644
+--- a/include/module.h
++++ b/include/module.h
+@@ -96,7 +96,7 @@ typedef struct http_auth_method {
+     void *(*create_auth_data)(const char *authorization_header,const char **username);
+     void (*release_auth_data)(void *data);
+     char *(*authentication_header)();
+-    void (*release_authentication_header)();
++    void (*release_authentication_header)(char *);
+     struct ci_conf_entry *conf_table;
+ } http_auth_method_t;
+ 
+-- 
+2.51.0
+
diff --git a/package/c-icap/0004-Fix-to-compile-with-GCC15-signal-handlers-require-an.patch b/package/c-icap/0004-Fix-to-compile-with-GCC15-signal-handlers-require-an.patch
new file mode 100644
index 0000000000..97359ab4d6
--- /dev/null
+++ b/package/c-icap/0004-Fix-to-compile-with-GCC15-signal-handlers-require-an.patch
@@ -0,0 +1,31 @@
+From 8d21c9c18e3b03e28ef2831f3ecd287c4cc44694 Mon Sep 17 00:00:00 2001
+From: Christos Tsantilas <christos@chtsanti.net>
+Date: Fri, 21 Feb 2025 13:41:37 +0200
+Subject: [PATCH] Fix to compile with GCC15: signal handlers require an int
+ argument
+
+Reported with PR#72 at github:
+     https://github.com/c-icap/c-icap-server/pull/72
+
+Upstream: 0b3408ad0e9f5ccadcd4d77dffa651f9211e4cd2
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ mpmt_server.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mpmt_server.c b/mpmt_server.c
+index aab9db5..01bab65 100644
+--- a/mpmt_server.c
++++ b/mpmt_server.c
+@@ -140,7 +140,7 @@ static void sigchld_handler_main(int sig)
+     /*Do nothing the signal will be ignored..... */
+ }
+ 
+-static void sighup_handler_main()
++static void sighup_handler_main(int sig)
+ {
+     c_icap_reconfigure = 1;
+ }
+-- 
+2.51.0
+
diff --git a/package/c-icap/0005-Fix-module-operation-prototypes-to-fix-GCC-15.x-buil.patch b/package/c-icap/0005-Fix-module-operation-prototypes-to-fix-GCC-15.x-buil.patch
new file mode 100644
index 0000000000..d161a49ba6
--- /dev/null
+++ b/package/c-icap/0005-Fix-module-operation-prototypes-to-fix-GCC-15.x-buil.patch
@@ -0,0 +1,233 @@
+From 608392c023b00e9e512f012eab295995127c577a Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 7 Sep 2025 17:45:00 +0200
+Subject: [PATCH] Fix module operation prototypes to fix GCC 15.x build
+
+Upstream: N/A, code has completely changed upstream
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ default_acl.c          | 4 ++--
+ http_auth.c            | 8 ++++----
+ include/module.h       | 8 ++++----
+ modules/bdb_tables.c   | 4 ++--
+ modules/dnsbl_tables.c | 4 ++--
+ modules/ldap_module.c  | 4 ++--
+ modules/memcached.c    | 4 ++--
+ modules/shared_cache.c | 4 ++--
+ 8 files changed, 20 insertions(+), 20 deletions(-)
+
+diff --git a/default_acl.c b/default_acl.c
+index 135176a..cb84d9d 100644
+--- a/default_acl.c
++++ b/default_acl.c
+@@ -34,7 +34,7 @@
+ /* Default Authenticator  definitions                                                        */
+ int default_acl_init(struct ci_server_conf *server_conf);
+ int default_acl_post_init(struct ci_server_conf *server_conf);
+-void default_acl_release();
++void default_acl_release(struct ci_server_conf *server_conf);
+ int default_acl_client_match(ci_request_t *req);
+ int default_acl_request_match(ci_request_t *req);
+ 
+@@ -75,7 +75,7 @@ int default_acl_post_init(struct ci_server_conf *server_conf)
+     return 1;
+ }
+ 
+-void default_acl_release()
++void default_acl_release(struct ci_server_conf *server_conf)
+ {
+     ci_access_entry_release(acl_access_list);
+     ci_access_entry_release(acl_connection_access_list);
+diff --git a/http_auth.c b/http_auth.c
+index b831bb1..0000b12 100644
+--- a/http_auth.c
++++ b/http_auth.c
+@@ -378,7 +378,7 @@ static struct ci_conf_entry basic_conf_params[] = {
+ };
+ 
+ int basic_post_init(struct ci_server_conf *server_conf);
+-void basic_close();
++void basic_close(struct ci_server_conf *);
+ struct http_basic_auth_data *basic_create_auth_data(const char *auth_line,
+         const char **username);
+ void basic_release_auth_data(struct http_basic_auth_data *data);
+@@ -409,7 +409,7 @@ int basic_post_init(struct ci_server_conf *server_conf)
+     return 1;
+ }
+ 
+-void basic_close()
++void basic_close(struct ci_server_conf *)
+ {
+     if (basic_authentication) {
+         free(basic_authentication);
+@@ -468,7 +468,7 @@ static struct ci_conf_entry basic_simple_db_conf_variables[] = {
+ };
+ 
+ int basic_simple_db_post_init(struct ci_server_conf *server_conf);
+-void basic_simple_db_close();
++void basic_simple_db_close(struct ci_server_conf *server_conf);
+ int basic_simple_db_athenticate(struct http_basic_auth_data *data, const char *usedb);
+ 
+ 
+@@ -495,7 +495,7 @@ int basic_simple_db_post_init(struct ci_server_conf *server_conf)
+     return 1;
+ }
+ 
+-void basic_simple_db_close()
++void basic_simple_db_close(struct ci_server_conf *server_conf)
+ {
+     if (users_db) {
+         ci_lookup_table_destroy(users_db);
+diff --git a/include/module.h b/include/module.h
+index 0e57586..21124df 100644
+--- a/include/module.h
++++ b/include/module.h
+@@ -63,7 +63,7 @@ typedef struct common_module {
+     const char *name;
+     int (*init_module)(struct ci_server_conf *server_conf);
+     int (*post_init_module)(struct ci_server_conf *server_conf);
+-    void (*close_module)();
++    void (*close_module)(struct ci_server_conf *);
+     struct ci_conf_entry *conf_table;
+ } common_module_t;
+ 
+@@ -81,7 +81,7 @@ typedef struct  access_control_module {
+     const char *name;
+     int (*init_access_controller)(struct ci_server_conf *server_conf);
+     int (*post_init_access_controller)(struct ci_server_conf *server_conf);
+-    void (*release_access_controller)();
++    void (*release_access_controller)(struct ci_server_conf *);
+     int (*client_access)(ci_request_t *req);
+     int (*request_access)(ci_request_t *req);
+     struct ci_conf_entry *conf_table;
+@@ -92,7 +92,7 @@ typedef struct http_auth_method {
+     const char *name;
+     int (*init_auth_method)(struct ci_server_conf *server_conf);
+     int (*post_init_auth_method)(struct ci_server_conf *server_conf);
+-    void (*close_auth_method)();
++    void (*close_auth_method)(struct ci_server_conf *);
+     void *(*create_auth_data)(const char *authorization_header,const char **username);
+     void (*release_auth_data)(void *data);
+     char *(*authentication_header)();
+@@ -106,7 +106,7 @@ typedef struct authenticator_module {
+     const char *method;
+     int (*init_authenticator)(struct ci_server_conf *server_conf);
+     int (*post_init_authenticator)(struct ci_server_conf *server_conf);
+-    void (*close_authenticator)();
++    void (*close_authenticator)(struct ci_server_conf *);
+     int (*authenticate)(void *data, const char *usedb);
+     struct ci_conf_entry *conf_table;
+ } authenticator_module_t;
+diff --git a/modules/bdb_tables.c b/modules/bdb_tables.c
+index 1e908a9..c205278 100644
+--- a/modules/bdb_tables.c
++++ b/modules/bdb_tables.c
+@@ -9,7 +9,7 @@
+ 
+ 
+ int init_bdb_tables(struct ci_server_conf *server_conf);
+-void release_bdb_tables();
++void release_bdb_tables(struct ci_server_conf *server_conf);
+ 
+ CI_DECLARE_MOD_DATA common_module_t module = {
+     "bdb_tables",
+@@ -41,7 +41,7 @@ int init_bdb_tables(struct ci_server_conf *server_conf)
+     return (ci_lookup_table_type_register(&bdb_table_type) != NULL);
+ }
+ 
+-void release_bdb_tables()
++void release_bdb_tables(struct ci_server_conf *server_conf)
+ {
+     ci_lookup_table_type_unregister(&bdb_table_type);
+ }
+diff --git a/modules/dnsbl_tables.c b/modules/dnsbl_tables.c
+index 328c6fb..a90c715 100644
+--- a/modules/dnsbl_tables.c
++++ b/modules/dnsbl_tables.c
+@@ -10,7 +10,7 @@
+ 
+ 
+ int init_dnsbl_tables(struct ci_server_conf *server_conf);
+-void release_dnsbl_tables();
++void release_dnsbl_tables(struct ci_server_conf *server_conf);
+ 
+ CI_DECLARE_MOD_DATA common_module_t module = {
+     "dnsbl_tables",
+@@ -42,7 +42,7 @@ int init_dnsbl_tables(struct ci_server_conf *server_conf)
+     return (ci_lookup_table_type_register(&dnsbl_table_type) != NULL);
+ }
+ 
+-void release_dnsbl_tables()
++void release_dnsbl_tables(struct ci_server_conf *server_conf)
+ {
+     ci_lookup_table_type_unregister(&dnsbl_table_type);
+ }
+diff --git a/modules/ldap_module.c b/modules/ldap_module.c
+index 97e36d8..96668a9 100644
+--- a/modules/ldap_module.c
++++ b/modules/ldap_module.c
+@@ -19,7 +19,7 @@ static int init_ldap_pools();
+ static void release_ldap_pools();
+ 
+ int init_ldap_module(struct ci_server_conf *server_conf);
+-void release_ldap_module();
++void release_ldap_module(struct ci_server_conf *server_conf);
+ 
+ CI_DECLARE_MOD_DATA common_module_t module = {
+     "ldap_module",
+@@ -76,7 +76,7 @@ int init_ldap_module(struct ci_server_conf *server_conf)
+     return 1;
+ }
+ 
+-void release_ldap_module()
++void release_ldap_module(struct ci_server_conf *server_conf)
+ {
+     release_ldap_pools();
+     ci_lookup_table_type_unregister(&ldap_table_type);
+diff --git a/modules/memcached.c b/modules/memcached.c
+index 8f15fbd..b1bbe5a 100644
+--- a/modules/memcached.c
++++ b/modules/memcached.c
+@@ -61,7 +61,7 @@ static struct ci_conf_entry mc_conf_variables[] = {
+ 
+ static int mc_module_init(struct ci_server_conf *server_conf);
+ static int mc_module_post_init(struct ci_server_conf *server_conf);
+-static void mc_module_release();
++static void mc_module_release(struct ci_server_conf *server_conf);
+ CI_DECLARE_MOD_DATA common_module_t module = {
+     "memcached",
+     mc_module_init,
+@@ -209,7 +209,7 @@ int mc_module_post_init(struct ci_server_conf *server_conf)
+     return 1;
+ }
+ 
+-void mc_module_release()
++void mc_module_release(struct ci_server_conf *server_conf)
+ {
+     memcached_pool_destroy(MC_POOL);
+     memcached_free(MC);
+diff --git a/modules/shared_cache.c b/modules/shared_cache.c
+index a79d51a..49a3784 100644
+--- a/modules/shared_cache.c
++++ b/modules/shared_cache.c
+@@ -9,7 +9,7 @@
+ #include <assert.h>
+ 
+ static int init_shared_cache(struct ci_server_conf *server_conf);
+-static void release_shared_cache();
++static void release_shared_cache(struct ci_server_conf *server_conf);
+ 
+ CI_DECLARE_MOD_DATA common_module_t module = {
+     "shared_cache",
+@@ -26,7 +26,7 @@ static int init_shared_cache(struct ci_server_conf *server_conf)
+     return 1;
+ }
+ 
+-static void release_shared_cache()
++static void release_shared_cache(struct ci_server_conf *server_conf)
+ {
+ }
+ 
+-- 
+2.51.0
+
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
