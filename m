Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D7FC4332F
	for <buildroot@archiver.kernel.org>; Fri,  2 Dec 2022 18:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D69EF821BB;
	Fri,  2 Dec 2022 18:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D69EF821BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hss9GrA0fvSk; Fri,  2 Dec 2022 18:36:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5236821C6;
	Fri,  2 Dec 2022 18:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5236821C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B06B1BF348
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 18:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3600260BC4
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 18:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3600260BC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Md9hhkeGwTeE for <buildroot@lists.busybox.net>;
 Fri,  2 Dec 2022 18:36:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74EEB60B91
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74EEB60B91
 for <buildroot@buildroot.org>; Fri,  2 Dec 2022 18:36:40 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 86F54FF804;
 Fri,  2 Dec 2022 18:36:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1p1Atk-008fYn-PF; Fri, 02 Dec 2022 19:36:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri,  2 Dec 2022 19:36:30 +0100
Message-Id: <20221202183631.2066307-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/exim: add upstream security fixes
 for CVE-2022-3559
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2022-3559: A vulnerability was found in Exim and classified as
problematic.  This issue affects some unknown processing of the component
Regex Handler.  The manipulation leads to use after free.  The name of the
patch is 4e9ed49f8f12eb331b29bd5b6dc3693c520fddc2.  It is recommended to
apply a patch to fix this issue.  The identifier VDB-211073 was assigned to
this vulnerability.

The upstream patch does not apply to 4.96, so use the backported patches
from Debian.  Amazingly, the patch needs 3 additional patches to unbreak
builds without "WITH_CONTENT_SCAN" (default in Buildroot), so add those as
well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Fix-regex-n-use-after-free.-Bug-2915.patch | 173 ++++++++++++++++++
 ...0007-Fix-non-WITH_CONTENT_SCAN-build.patch |  61 ++++++
 ...08-Fix-non-WITH_CONTENT_SCAN-build-2.patch | 139 ++++++++++++++
 ...09-Fix-non-WITH_CONTENT_SCAN-build-3.patch |  49 +++++
 package/exim/exim.mk                          |   3 +
 5 files changed, 425 insertions(+)
 create mode 100644 package/exim/0006-Fix-regex-n-use-after-free.-Bug-2915.patch
 create mode 100644 package/exim/0007-Fix-non-WITH_CONTENT_SCAN-build.patch
 create mode 100644 package/exim/0008-Fix-non-WITH_CONTENT_SCAN-build-2.patch
 create mode 100644 package/exim/0009-Fix-non-WITH_CONTENT_SCAN-build-3.patch

diff --git a/package/exim/0006-Fix-regex-n-use-after-free.-Bug-2915.patch b/package/exim/0006-Fix-regex-n-use-after-free.-Bug-2915.patch
new file mode 100644
index 0000000000..57fa189b04
--- /dev/null
+++ b/package/exim/0006-Fix-regex-n-use-after-free.-Bug-2915.patch
@@ -0,0 +1,173 @@
+From 4e9ed49f8f12eb331b29bd5b6dc3693c520fddc2 Mon Sep 17 00:00:00 2001
+From: Jeremy Harris <jgh146exb@wizmail.org>
+Date: Wed, 31 Aug 2022 15:37:40 +0100
+Subject: [PATCH] Fix $regex<n> use-after-free.  Bug 2915
+
+[Upstream: https://sources.debian.org/data/main/e/exim4/4.96-9/debian/patches/75_08-Fix-regex-n-use-after-free.-Bug-2915.patch]
+[Peter: drop Changelog hunk]
+Signed-off-by: Peter Korsgaard <peter@korsgard.com>
+---
+ src/exim.c                  |  4 +---
+ src/expand.c                |  2 +-
+ src/functions.h             |  1 +
+ src/globals.c               |  2 +-
+ src/regex.c                 | 29 ++++++++++++++++++-----------
+ src/smtp_in.c               |  2 ++
+ test/confs/4002                 | 10 ++++++++++
+ test/mail/4002.userx            |  7 +++++++
+ test/scripts/4000-scanning/4002 |  7 +++++++
+ 9 files changed, 53 insertions(+), 17 deletions(-)
+
+--- a/src/exim.c
++++ b/src/exim.c
+@@ -1999,12 +1999,10 @@
+ 
+ regex_whitelisted_macro =
+   regex_must_compile(US"^[A-Za-z0-9_/.-]*$", FALSE, TRUE);
+ #endif
+ 
+-for (i = 0; i < REGEX_VARS; i++) regex_vars[i] = NULL;
+-
+ /* If the program is called as "mailq" treat it as equivalent to "exim -bp";
+ this seems to be a generally accepted convention, since one finds symbolic
+ links called "mailq" in standard OS configurations. */
+ 
+ if ((namelen == 5 && Ustrcmp(argv[0], "mailq") == 0) ||
+@@ -6082,11 +6080,11 @@
+   callout_address = NULL;
+   sending_ip_address = NULL;
+   deliver_localpart_data = deliver_domain_data =
+   recipient_data = sender_data = NULL;
+   acl_var_m = NULL;
+-  for(int i = 0; i < REGEX_VARS; i++) regex_vars[i] = NULL;
++  regex_vars_clear();
+ 
+   store_reset(reset_point);
+   }
+ 
+ exim_exit(EXIT_SUCCESS);   /* Never returns */
+--- a/src/expand.c
++++ b/src/expand.c
+@@ -1871,11 +1871,11 @@
+   {
+   tree_node * node = tree_search(router_var, name + 2);
+   return node ? node->data.ptr : strict_acl_vars ? NULL : US"";
+   }
+ 
+-/* Handle $auth<n> variables. */
++/* Handle $auth<n>, $regex<n> variables. */
+ 
+ if (Ustrncmp(name, "auth", 4) == 0)
+   {
+   uschar *endptr;
+   int n = Ustrtoul(name + 4, &endptr, 10);
+--- a/src/functions.h
++++ b/src/functions.h
+@@ -436,10 +436,11 @@
+ extern int     regex(const uschar **);
+ #endif
+ extern BOOL    regex_match(const pcre2_code *, const uschar *, int, uschar **);
+ extern BOOL    regex_match_and_setup(const pcre2_code *, const uschar *, int, int);
+ extern const pcre2_code *regex_must_compile(const uschar *, BOOL, BOOL);
++extern void    regex_vars_clear(void);
+ extern void    retry_add_item(address_item *, uschar *, int);
+ extern BOOL    retry_check_address(const uschar *, host_item *, uschar *, BOOL,
+                  uschar **, uschar **);
+ extern retry_config *retry_find_config(const uschar *, const uschar *, int, int);
+ extern BOOL    retry_ultimate_address_timeout(uschar *, const uschar *,
+--- a/src/globals.c
++++ b/src/globals.c
+@@ -1313,11 +1313,11 @@
+ #ifndef DISABLE_PIPE_CONNECT
+ const pcre2_code *regex_EARLY_PIPE   = NULL;
+ #endif
+ const pcre2_code *regex_ismsgid      = NULL;
+ const pcre2_code *regex_smtp_code    = NULL;
+-const uschar *regex_vars[REGEX_VARS];
++const uschar *regex_vars[REGEX_VARS] = { 0 };;
+ #ifdef WHITELIST_D_MACROS
+ const pcre2_code *regex_whitelisted_macro = NULL;
+ #endif
+ #ifdef WITH_CONTENT_SCAN
+ uschar *regex_match_string     = NULL;
+--- a/src/regex.c
++++ b/src/regex.c
+@@ -94,22 +94,32 @@
+   }
+ pcre2_match_data_free(md);
+ return FAIL;
+ }
+ 
++
++/* reset expansion variables */
++void
++regex_vars_clear(void)
++{
++regex_match_string = NULL;
++for (int i = 0; i < REGEX_VARS; i++) regex_vars[i] = NULL;
++}
++
++
++
+ int
+-regex(const uschar **listptr)
++regex(const uschar ** listptr)
+ {
+ unsigned long mbox_size;
+-FILE *mbox_file;
+-pcre_list *re_list_head;
+-uschar *linebuffer;
++FILE * mbox_file;
++pcre_list * re_list_head;
++uschar * linebuffer;
+ long f_pos = 0;
+ int ret = FAIL;
+ 
+-/* reset expansion variable */
+-regex_match_string = NULL;
++regex_vars_clear();
+ 
+ if (!mime_stream)				/* We are in the DATA ACL */
+   {
+   if (!(mbox_file = spool_mbox(&mbox_size, NULL, NULL)))
+     {						/* error while spooling */
+@@ -167,18 +177,17 @@
+ 
+ 
+ int
+ mime_regex(const uschar **listptr)
+ {
+-pcre_list *re_list_head = NULL;
+-FILE *f;
+-uschar *mime_subject = NULL;
++pcre_list * re_list_head = NULL;
++FILE * f;
++uschar * mime_subject = NULL;
+ int mime_subject_len = 0;
+ int ret;
+ 
+-/* reset expansion variable */
+-regex_match_string = NULL;
++regex_vars_clear();
+ 
+ /* precompile our regexes */
+ if (!(re_list_head = compile(*listptr)))
+   return FAIL;			/* no regexes -> nothing to do */
+ 
+--- a/src/smtp_in.c
++++ b/src/smtp_in.c
+@@ -2155,12 +2155,14 @@
+ prdr_requested = FALSE;
+ #endif
+ #ifdef SUPPORT_I18N
+ message_smtputf8 = FALSE;
+ #endif
++regex_vars_clear();
+ body_linecount = body_zerocount = 0;
+ 
++lookup_value = NULL;				/* Can be set by ACL */
+ sender_rate = sender_rate_limit = sender_rate_period = NULL;
+ ratelimiters_mail = NULL;           /* Updated by ratelimit ACL condition */
+                    /* Note that ratelimiters_conn persists across resets. */
+ 
+ /* Reset message ACL variables */
diff --git a/package/exim/0007-Fix-non-WITH_CONTENT_SCAN-build.patch b/package/exim/0007-Fix-non-WITH_CONTENT_SCAN-build.patch
new file mode 100644
index 0000000000..7a0279cc8c
--- /dev/null
+++ b/package/exim/0007-Fix-non-WITH_CONTENT_SCAN-build.patch
@@ -0,0 +1,61 @@
+From d8ecc7bf97934a1e2244788c610c958cacd740bd Mon Sep 17 00:00:00 2001
+From: Jeremy Harris <jgh146exb@wizmail.org>
+Date: Wed, 31 Aug 2022 17:03:37 +0100
+Subject: [PATCH 1/3] Fix non-WITH_CONTENT_SCAN build.
+
+Broken-by: 4e9ed49f8f
+
+[Upstream: https://sources.debian.org/data/main/e/exim4/4.96-9/debian/patches/75_09-Fix-non-WITH_CONTENT_SCAN-build.patch]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/exim.c  | 11 +++++++++++
+ src/regex.c | 10 ----------
+ 2 files changed, 11 insertions(+), 10 deletions(-)
+
+--- a/src/exim.c
++++ b/src/exim.c
+@@ -1677,10 +1677,21 @@
+   if ((s = expand_string(big_buffer))) printf("%s\n", CS s);
+   else printf("Failed: %s\n", expand_string_message);
+ }
+ 
+ 
++/* reset regex expansion variables */
++void
++regex_vars_clear(void)
++{
++regex_match_string = NULL;
++for (int i = 0; i < REGEX_VARS; i++) regex_vars[i] = NULL;
++}
++
++
++
++
+ 
+ /*************************************************
+ *          Entry point and high-level code       *
+ *************************************************/
+ 
+--- a/src/regex.c
++++ b/src/regex.c
+@@ -95,20 +95,10 @@
+ pcre2_match_data_free(md);
+ return FAIL;
+ }
+ 
+ 
+-/* reset expansion variables */
+-void
+-regex_vars_clear(void)
+-{
+-regex_match_string = NULL;
+-for (int i = 0; i < REGEX_VARS; i++) regex_vars[i] = NULL;
+-}
+-
+-
+-
+ int
+ regex(const uschar ** listptr)
+ {
+ unsigned long mbox_size;
+ FILE * mbox_file;
diff --git a/package/exim/0008-Fix-non-WITH_CONTENT_SCAN-build-2.patch b/package/exim/0008-Fix-non-WITH_CONTENT_SCAN-build-2.patch
new file mode 100644
index 0000000000..d771c9207a
--- /dev/null
+++ b/package/exim/0008-Fix-non-WITH_CONTENT_SCAN-build-2.patch
@@ -0,0 +1,139 @@
+From 158dff9936e36a2d31d037d3988b9353458d6471 Mon Sep 17 00:00:00 2001
+From: Jeremy Harris <jgh146exb@wizmail.org>
+Date: Wed, 31 Aug 2022 17:17:59 +0100
+Subject: [PATCH 2/3] Fix non-WITH_CONTENT_SCAN build (2)
+
+Broken-by: d8ecc7bf97
+
+[Upstream: https://sources.debian.org/data/main/e/exim4/4.96-9/debian/patches/75_10-Fix-non-WITH_CONTENT_SCAN-build-2.patch]
+[Peter: drop Changelog hunk]
+Signed-off-by: Peter Korsgaard <peter@korsgard.com>
+---
+ src/exim.c      | 13 +------------
+ src/functions.h |  2 +-
+ src/globals.h   |  2 +-
+ src/regex.c     | 10 ++++++++++
+ src/smtp_in.c   |  2 ++
+ 5 files changed, 15 insertions(+), 14 deletions(-)
+
+--- a/src/exim.c
++++ b/src/exim.c
+@@ -1677,21 +1677,10 @@
+   if ((s = expand_string(big_buffer))) printf("%s\n", CS s);
+   else printf("Failed: %s\n", expand_string_message);
+ }
+ 
+ 
+-/* reset regex expansion variables */
+-void
+-regex_vars_clear(void)
+-{
+-regex_match_string = NULL;
+-for (int i = 0; i < REGEX_VARS; i++) regex_vars[i] = NULL;
+-}
+-
+-
+-
+-
+ 
+ /*************************************************
+ *          Entry point and high-level code       *
+ *************************************************/
+ 
+@@ -6085,17 +6074,17 @@
+   deliver_domain_orig = NULL;
+   deliver_host = deliver_host_address = NULL;
+   dnslist_domain = dnslist_matched = NULL;
+ #ifdef WITH_CONTENT_SCAN
+   malware_name = NULL;
++  regex_vars_clear();
+ #endif
+   callout_address = NULL;
+   sending_ip_address = NULL;
+   deliver_localpart_data = deliver_domain_data =
+   recipient_data = sender_data = NULL;
+   acl_var_m = NULL;
+-  regex_vars_clear();
+ 
+   store_reset(reset_point);
+   }
+ 
+ exim_exit(EXIT_SUCCESS);   /* Never returns */
+--- a/src/functions.h
++++ b/src/functions.h
+@@ -432,15 +432,15 @@
+ extern BOOL    receive_msg(BOOL);
+ extern int_eximarith_t receive_statvfs(BOOL, int *);
+ extern void    receive_swallow_smtp(void);
+ #ifdef WITH_CONTENT_SCAN
+ extern int     regex(const uschar **);
++extern void    regex_vars_clear(void);
+ #endif
+ extern BOOL    regex_match(const pcre2_code *, const uschar *, int, uschar **);
+ extern BOOL    regex_match_and_setup(const pcre2_code *, const uschar *, int, int);
+ extern const pcre2_code *regex_must_compile(const uschar *, BOOL, BOOL);
+-extern void    regex_vars_clear(void);
+ extern void    retry_add_item(address_item *, uschar *, int);
+ extern BOOL    retry_check_address(const uschar *, host_item *, uschar *, BOOL,
+                  uschar **, uschar **);
+ extern retry_config *retry_find_config(const uschar *, const uschar *, int, int);
+ extern BOOL    retry_ultimate_address_timeout(uschar *, const uschar *,
+--- a/src/globals.h
++++ b/src/globals.h
+@@ -895,16 +895,16 @@
+ #ifndef DISABLE_PIPE_CONNECT
+ extern const pcre2_code  *regex_EARLY_PIPE;  /* For recognizing PIPE_CONNCT */
+ #endif
+ extern const pcre2_code  *regex_ismsgid;     /* Compiled r.e. for message ID */
+ extern const pcre2_code  *regex_smtp_code;   /* For recognizing SMTP codes */
+-extern const uschar *regex_vars[];           /* $regexN variables */
+ #ifdef WHITELIST_D_MACROS
+ extern const pcre2_code  *regex_whitelisted_macro; /* For -D macro values */
+ #endif
+ #ifdef WITH_CONTENT_SCAN
+ extern uschar *regex_match_string;     /* regex that matched a line (regex ACL condition) */
++extern const uschar *regex_vars[];
+ #endif
+ extern int     remote_delivery_count;  /* Number of remote addresses */
+ extern int     remote_max_parallel;    /* Maximum parallel delivery */
+ extern uschar *remote_sort_domains;    /* Remote domain sorting order */
+ extern retry_config *retries;          /* Chain of retry config information */
+--- a/src/regex.c
++++ b/src/regex.c
+@@ -95,10 +95,20 @@
+ pcre2_match_data_free(md);
+ return FAIL;
+ }
+ 
+ 
++/* reset expansion variables */
++void
++regex_vars_clear(void)
++{
++regex_match_string = NULL;
++for (int i = 0; i < REGEX_VARS; i++) regex_vars[i] = NULL;
++}
++
++
++
+ int
+ regex(const uschar ** listptr)
+ {
+ unsigned long mbox_size;
+ FILE * mbox_file;
+--- a/src/smtp_in.c
++++ b/src/smtp_in.c
+@@ -2155,11 +2155,13 @@
+ prdr_requested = FALSE;
+ #endif
+ #ifdef SUPPORT_I18N
+ message_smtputf8 = FALSE;
+ #endif
++#ifdef WITH_CONTENT_SCAN
+ regex_vars_clear();
++#endif
+ body_linecount = body_zerocount = 0;
+ 
+ lookup_value = NULL;				/* Can be set by ACL */
+ sender_rate = sender_rate_limit = sender_rate_period = NULL;
+ ratelimiters_mail = NULL;           /* Updated by ratelimit ACL condition */
diff --git a/package/exim/0009-Fix-non-WITH_CONTENT_SCAN-build-3.patch b/package/exim/0009-Fix-non-WITH_CONTENT_SCAN-build-3.patch
new file mode 100644
index 0000000000..83184468c7
--- /dev/null
+++ b/package/exim/0009-Fix-non-WITH_CONTENT_SCAN-build-3.patch
@@ -0,0 +1,49 @@
+From 32da6327e434e986a18b75a84f2d8c687ba14619 Mon Sep 17 00:00:00 2001
+From: Jeremy Harris <jgh146exb@wizmail.org>
+Date: Thu, 1 Sep 2022 15:54:35 +0100
+Subject: [PATCH 3/3] Fix non-WITH_CONTENT_SCAN build (3)
+
+Broken-by: d8ecc7bf97
+
+[Upstream: https://sources.debian.org/data/main/e/exim4/4.96-9/debian/patches/75_11-Fix-non-WITH_CONTENT_SCAN-build-3.patch]
+[Peter: drop Changelog hunk]
+Signed-off-by: Peter Korsgaard <peter@korsgard.com>
+---
+ src/expand.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/expand.c b/src/expand.c
+index 89de56255..831ca2b75 100644
+--- a/src/expand.c
++++ b/src/expand.c
+@@ -1869,6 +1869,7 @@ if (Ustrncmp(name, "auth", 4) == 0)
+   if (!*endptr && n != 0 && n <= AUTH_VARS)
+     return auth_vars[n-1] ? auth_vars[n-1] : US"";
+   }
++#ifdef WITH_CONTENT_SCAN
+ else if (Ustrncmp(name, "regex", 5) == 0)
+   {
+   uschar *endptr;
+@@ -1876,6 +1877,7 @@ else if (Ustrncmp(name, "regex", 5) == 0)
+   if (!*endptr && n != 0 && n <= REGEX_VARS)
+     return regex_vars[n-1] ? regex_vars[n-1] : US"";
+   }
++#endif
+ 
+ /* For all other variables, search the table */
+ 
+@@ -8715,9 +8717,11 @@ assert_variable_notin() treats as const, so deconst is safe. */
+ for (int i = 0; i < AUTH_VARS; i++) if (auth_vars[i])
+   assert_variable_notin(US"auth<n>", US auth_vars[i], &e);
+ 
++#ifdef WITH_CONTENT_SCAN
+ /* check regex<n> variables. assert_variable_notin() treats as const. */
+ for (int i = 0; i < REGEX_VARS; i++) if (regex_vars[i])
+   assert_variable_notin(US"regex<n>", US regex_vars[i], &e);
++#endif
+ 
+ /* check known-name variables */
+ for (var_entry * v = var_table; v < var_table + var_table_size; v++)
+-- 
+2.35.1
+
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 9c54eeec44..cd2fabeab1 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -13,6 +13,9 @@ EXIM_CPE_ID_VENDOR = exim
 EXIM_SELINUX_MODULES = exim mta
 EXIM_DEPENDENCIES = host-berkeleydb host-pcre2 pcre2 berkeleydb host-pkgconf
 
+# 0006-Fix-regex-n-use-after-free.-Bug-2915.patch
+EXIM_IGNORE_CVES += CVE-2022-3559
+
 # Modify a variable value. It must already exist in the file, either
 # commented or not.
 define exim-config-change # variable-name, variable-value
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
