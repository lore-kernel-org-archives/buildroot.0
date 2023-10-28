Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D869FC4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 21:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9336F42F4F;
	Sat, 28 Oct 2023 21:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9336F42F4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id an_0iAA6gnrt; Sat, 28 Oct 2023 21:05:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 982C24175D;
	Sat, 28 Oct 2023 21:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 982C24175D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 124C21BF32C
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCF136139E
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCF136139E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PTGZ8tS2BvXO for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 21:03:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5B1E613B2
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 21:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5B1E613B2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0A6286077; Sat, 28 Oct 2023 21:03:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 22:49:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: afe32537d13ebbc869825779db95d36a8a713417
X-Git-Newrev: c3fcaeaaa7fc0a6023d44ac16c9197b847504706
X-Patchwork-Hint: ignore
Message-Id: <20231028210321.C0A6286077@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rabbitmq-c: fix CVE-2023-35789
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3fcaeaaa7fc0a6023d44ac16c9197b847504706
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

An issue was discovered in the C AMQP client library (aka rabbitmq-c)
through 0.13.0 for RabbitMQ. Credentials can only be entered on the
command line (e.g., for amqp-publish or amqp-consume) and are thus
visible to local attackers by listing a process and its arguments.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ption-to-read-username-password-from-file.patch | 130 +++++++++++++++++++++
 package/rabbitmq-c/rabbitmq-c.mk                   |   3 +
 2 files changed, 133 insertions(+)

diff --git a/package/rabbitmq-c/0001-Add-option-to-read-username-password-from-file.patch b/package/rabbitmq-c/0001-Add-option-to-read-username-password-from-file.patch
new file mode 100644
index 0000000000..347063cfb3
--- /dev/null
+++ b/package/rabbitmq-c/0001-Add-option-to-read-username-password-from-file.patch
@@ -0,0 +1,130 @@
+From 463054383fbeef889b409a7f843df5365288e2a0 Mon Sep 17 00:00:00 2001
+From: Christian Kastner <ckk@kvr.at>
+Date: Tue, 13 Jun 2023 14:21:52 +0200
+Subject: [PATCH] Add option to read username/password from file (#781)
+
+* Add option to read username/password from file
+
+Upstream: https://github.com/alanxz/rabbitmq-c/commit/463054383fbeef889b409a7f843df5365288e2a0
+Signed-off-by: Fabrice Fontaine <fontaine.fabrce@gmail.com>
+---
+ tools/common.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 66 insertions(+)
+
+diff --git a/tools/common.c b/tools/common.c
+index 73b47e25..7efe557b 100644
+--- a/tools/common.c
++++ b/tools/common.c
+@@ -18,6 +18,11 @@
+ #include "compat.h"
+ #endif
+ 
++/* For when reading auth data from a file */
++#define MAXAUTHTOKENLEN 128
++#define USERNAMEPREFIX "username:"
++#define PASSWORDPREFIX "password:"
++
+ void die(const char *fmt, ...) {
+   va_list ap;
+   va_start(ap, fmt);
+@@ -125,6 +130,7 @@ static char *amqp_vhost;
+ static char *amqp_username;
+ static char *amqp_password;
+ static int amqp_heartbeat = 0;
++static char *amqp_authfile;
+ #ifdef WITH_SSL
+ static int amqp_ssl = 0;
+ static char *amqp_cacert = "/etc/ssl/certs/cacert.pem";
+@@ -147,6 +153,8 @@ struct poptOption connect_options[] = {
+      "the password to login with", "password"},
+     {"heartbeat", 0, POPT_ARG_INT, &amqp_heartbeat, 0,
+      "heartbeat interval, set to 0 to disable", "heartbeat"},
++    {"authfile", 0, POPT_ARG_STRING, &amqp_authfile, 0,
++     "path to file containing username/password for authentication", "file"},
+ #ifdef WITH_SSL
+     {"ssl", 0, POPT_ARG_NONE, &amqp_ssl, 0, "connect over SSL/TLS", NULL},
+     {"cacert", 0, POPT_ARG_STRING, &amqp_cacert, 0,
+@@ -158,6 +166,50 @@ struct poptOption connect_options[] = {
+ #endif /* WITH_SSL */
+     {NULL, '\0', 0, NULL, 0, NULL, NULL}};
+ 
++void read_authfile(const char *path) {
++  size_t n;
++  FILE *fp = NULL;
++  char token[MAXAUTHTOKENLEN];
++
++  if ((amqp_username = malloc(MAXAUTHTOKENLEN)) == NULL ||
++      (amqp_password = malloc(MAXAUTHTOKENLEN)) == NULL) {
++    die("Out of memory");
++  } else if ((fp = fopen(path, "r")) == NULL) {
++    die("Could not read auth data file %s", path);
++  }
++
++  if (fgets(token, MAXAUTHTOKENLEN, fp) == NULL ||
++      strncmp(token, USERNAMEPREFIX, strlen(USERNAMEPREFIX))) {
++    die("Malformed auth file (missing username)");
++  }
++  strncpy(amqp_username, &token[strlen(USERNAMEPREFIX)], MAXAUTHTOKENLEN);
++  /* Missing newline means token was cut off */
++  n = strlen(amqp_username);
++  if (amqp_username[n - 1] != '\n') {
++    die("Username too long");
++  } else {
++    amqp_username[n - 1] = '\0';
++  }
++
++  if (fgets(token, MAXAUTHTOKENLEN, fp) == NULL ||
++      strncmp(token, PASSWORDPREFIX, strlen(PASSWORDPREFIX))) {
++    die("Malformed auth file (missing password)");
++  }
++  strncpy(amqp_password, &token[strlen(PASSWORDPREFIX)], MAXAUTHTOKENLEN);
++  /* Missing newline means token was cut off */
++  n = strlen(amqp_password);
++  if (amqp_password[n - 1] != '\n') {
++    die("Password too long");
++  } else {
++    amqp_password[n - 1] = '\0';
++  }
++
++  (void)fgetc(fp);
++  if (!feof(fp)) {
++    die("Malformed auth file (trailing data)");
++  }
++}
++
+ static void init_connection_info(struct amqp_connection_info *ci) {
+   ci->user = NULL;
+   ci->password = NULL;
+@@ -237,6 +289,8 @@ static void init_connection_info(struct amqp_connection_info *ci) {
+   if (amqp_username) {
+     if (amqp_url) {
+       die("--username and --url options cannot be used at the same time");
++    } else if (amqp_authfile) {
++      die("--username and --authfile options cannot be used at the same time");
+     }
+ 
+     ci->user = amqp_username;
+@@ -245,11 +299,23 @@ static void init_connection_info(struct amqp_connection_info *ci) {
+   if (amqp_password) {
+     if (amqp_url) {
+       die("--password and --url options cannot be used at the same time");
++    } else if (amqp_authfile) {
++      die("--password and --authfile options cannot be used at the same time");
+     }
+ 
+     ci->password = amqp_password;
+   }
+ 
++  if (amqp_authfile) {
++    if (amqp_url) {
++      die("--authfile and --url options cannot be used at the same time");
++    }
++
++    read_authfile(amqp_authfile);
++    ci->user = amqp_username;
++    ci->password = amqp_password;
++  }
++
+   if (amqp_vhost) {
+     if (amqp_url) {
+       die("--vhost and --url options cannot be used at the same time");
diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
index 18ecaa3098..fad6655e4e 100644
--- a/package/rabbitmq-c/rabbitmq-c.mk
+++ b/package/rabbitmq-c/rabbitmq-c.mk
@@ -14,6 +14,9 @@ RABBITMQ_C_CONF_OPTS = \
 	-DBUILD_API_DOCS=OFF \
 	-DBUILD_TOOLS_DOCS=OFF
 
+# 0001-Add-option-to-read-username-password-from-file.patch
+RABBITMQ_C_IGNORE_CVES += CVE-2023-35789
+
 # BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
 ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 RABBITMQ_C_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
