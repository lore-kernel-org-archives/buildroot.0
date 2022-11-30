Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E71C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6966E49E7A;
	Mon, 20 Feb 2023 21:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6966E49E7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wUj7oWDJ0m1p; Mon, 20 Feb 2023 21:37:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F0944B7CF;
	Mon, 20 Feb 2023 21:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F0944B7CF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 091651BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B4CE610F4
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B4CE610F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5-ipig68F54Y for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00EED610EA
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00EED610EA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6255828C8; Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Nov 2022 16:36:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fb894b2e98e944e517cb74278df555fa4147d3b3
X-Git-Newrev: 43899226b25aeb85aeb699f0df0c7ecf8d48616c
X-Patchwork-Hint: ignore
Message-Id: <20230220205153.E6255828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dovecot: add upstream
 security fix for CVE-2022-30550
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=43899226b25aeb85aeb699f0df0c7ecf8d48616c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

An issue was discovered in the auth component in Dovecot 2.2 and 2.3 before
2.3.20.  When two passdb configuration entries exist with the same driver
and args settings, incorrect username_filter and mechanism settings can be
applied to passdb definitions.  These incorrectly applied settings can lead
to an unintended security configuration and can permit privilege escalation
in certain configurations.  The documentation does not advise against the
use of passdb definitions that have the same driver and args settings.  One
such configuration would be where an administrator wishes to use the same
PAM configuration or passwd file for both normal and master users but use
the username_filter setting to restrict which of the users is able to be a
master user.

https://dovecot.org/pipermail/dovecot-news/2022-July/000477.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ndling-passdbs-with-identical-driver-args.patch | 136 +++++++++++++++++++++
 package/dovecot/dovecot.mk                         |   3 +
 2 files changed, 139 insertions(+)

diff --git a/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch b/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
new file mode 100644
index 0000000000..04b8f5392a
--- /dev/null
+++ b/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
@@ -0,0 +1,136 @@
+From 7bad6a24160e34bce8f10e73dbbf9e5fbbcd1904 Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com>
+Date: Mon, 9 May 2022 15:23:33 +0300
+Subject: [PATCH] auth: Fix handling passdbs with identical driver/args but
+ different mechanisms/username_filter
+
+The passdb was wrongly deduplicated in this situation, causing wrong
+mechanisms or username_filter setting to be used. This would be a rather
+unlikely configuration though.
+
+Fixed by moving mechanisms and username_filter from struct passdb_module
+to struct auth_passdb, which is where they should have been in the first
+place.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/auth/auth-request.c |  6 +++---
+ src/auth/auth.c         | 18 ++++++++++++++++++
+ src/auth/auth.h         |  5 +++++
+ src/auth/passdb.c       | 15 ++-------------
+ src/auth/passdb.h       |  4 ----
+ 5 files changed, 28 insertions(+), 20 deletions(-)
+
+diff --git a/src/auth/auth-request.c b/src/auth/auth-request.c
+index cd08b1fa02..0ca29f3674 100644
+--- a/src/auth/auth-request.c
++++ b/src/auth/auth-request.c
+@@ -534,8 +534,8 @@ auth_request_want_skip_passdb(struct auth_request *request,
+ 			      struct auth_passdb *passdb)
+ {
+ 	/* if mechanism is not supported, skip */
+-	const char *const *mechs = passdb->passdb->mechanisms;
+-	const char *const *username_filter = passdb->passdb->username_filter;
++	const char *const *mechs = passdb->mechanisms;
++	const char *const *username_filter = passdb->username_filter;
+ 	const char *username;
+ 
+ 	username = request->fields.user;
+@@ -548,7 +548,7 @@ auth_request_want_skip_passdb(struct auth_request *request,
+ 		return TRUE;
+ 	}
+ 
+-	if (passdb->passdb->username_filter != NULL &&
++	if (passdb->username_filter != NULL &&
+ 	    !auth_request_username_accepted(username_filter, username)) {
+ 		auth_request_log_debug(request,
+ 				       request->mech != NULL ? AUTH_SUBSYS_MECH
+diff --git a/src/auth/auth.c b/src/auth/auth.c
+index f2f3fda20c..9f6c4ba60c 100644
+--- a/src/auth/auth.c
++++ b/src/auth/auth.c
+@@ -99,6 +99,24 @@ auth_passdb_preinit(struct auth *auth, const struct auth_passdb_settings *set,
+ 	auth_passdb->override_fields_tmpl =
+ 		passdb_template_build(auth->pool, set->override_fields);
+ 
++	if (*set->mechanisms == '\0') {
++		auth_passdb->mechanisms = NULL;
++	} else if (strcasecmp(set->mechanisms, "none") == 0) {
++		auth_passdb->mechanisms = (const char *const[]){ NULL };
++	} else {
++		auth_passdb->mechanisms =
++			(const char *const *)p_strsplit_spaces(auth->pool,
++				set->mechanisms, " ,");
++	}
++
++	if (*set->username_filter == '\0') {
++		auth_passdb->username_filter = NULL;
++	} else {
++		auth_passdb->username_filter =
++			(const char *const *)p_strsplit_spaces(auth->pool,
++				set->username_filter, " ,");
++	}
++
+ 	/* for backwards compatibility: */
+ 	if (set->pass)
+ 		auth_passdb->result_success = AUTH_DB_RULE_CONTINUE;
+diff --git a/src/auth/auth.h b/src/auth/auth.h
+index f700e29d5c..460a179765 100644
+--- a/src/auth/auth.h
++++ b/src/auth/auth.h
+@@ -41,6 +41,11 @@ struct auth_passdb {
+ 	struct passdb_template *default_fields_tmpl;
+ 	struct passdb_template *override_fields_tmpl;
+ 
++	/* Supported authentication mechanisms, NULL is all, {NULL} is none */
++	const char *const *mechanisms;
++	/* Username filter, NULL is no filter */
++	const char *const *username_filter;
++
+ 	enum auth_passdb_skip skip;
+ 	enum auth_db_rule result_success;
+ 	enum auth_db_rule result_failure;
+diff --git a/src/auth/passdb.c b/src/auth/passdb.c
+index eb4ac8ae82..f5eed1af4f 100644
+--- a/src/auth/passdb.c
++++ b/src/auth/passdb.c
+@@ -224,19 +224,8 @@ passdb_preinit(pool_t pool, const struct auth_passdb_settings *set)
+ 	passdb->id = ++auth_passdb_id;
+ 	passdb->iface = *iface;
+ 	passdb->args = p_strdup(pool, set->args);
+-	if (*set->mechanisms == '\0') {
+-		passdb->mechanisms = NULL;
+-	} else if (strcasecmp(set->mechanisms, "none") == 0) {
+-		passdb->mechanisms = (const char *const[]){NULL};
+-	} else {
+-		passdb->mechanisms = (const char* const*)p_strsplit_spaces(pool, set->mechanisms, " ,");
+-	}
+-
+-	if (*set->username_filter == '\0') {
+-		passdb->username_filter = NULL;
+-	} else {
+-		passdb->username_filter = (const char* const*)p_strsplit_spaces(pool, set->username_filter, " ,");
+-	}
++	/* NOTE: if anything else than driver & args are added here,
++	   passdb_find() also needs to be updated. */
+ 	array_push_back(&passdb_modules, &passdb);
+ 	return passdb;
+ }
+diff --git a/src/auth/passdb.h b/src/auth/passdb.h
+index 2e95328e5c..e466a9fdb6 100644
+--- a/src/auth/passdb.h
++++ b/src/auth/passdb.h
+@@ -63,10 +63,6 @@ struct passdb_module {
+ 	/* Default password scheme for this module.
+ 	   If default_cache_key is set, must not be NULL. */
+ 	const char *default_pass_scheme;
+-	/* Supported authentication mechanisms, NULL is all, [NULL] is none*/
+-	const char *const *mechanisms;
+-	/* Username filter, NULL is no filter */
+-	const char *const *username_filter;
+ 
+ 	/* If blocking is set to TRUE, use child processes to access
+ 	   this passdb. */
+-- 
+2.30.2
+
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 7619250985..e28f500b7b 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -21,6 +21,9 @@ DOVECOT_DEPENDENCIES = \
 # is part of the Red Hat packaging and not part of upstream dovecot
 DOVECOT_IGNORE_CVES += CVE-2016-4983
 
+# 0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
+DOVECOT_IGNORE_CVES += CVE-2022-30550
+
 DOVECOT_CONF_ENV = \
 	RPCGEN=__disable_RPCGEN_rquota \
 	i_cv_epoll_works=yes \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
