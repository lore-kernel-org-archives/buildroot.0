Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC62C3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 08:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 970D280B97;
	Sun, 21 Jul 2024 08:25:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VdjCwS8Z-D14; Sun, 21 Jul 2024 08:25:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 548CC80B9B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 548CC80B9B;
	Sun, 21 Jul 2024 08:25:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27EA91BF2BC
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 08:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2139D402AC
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 08:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5pr7AxeM27Lu for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 08:25:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A309402A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A309402A1
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A309402A1
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 08:25:47 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4272738eb9eso24157175e9.3
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 01:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721550345; x=1722155145;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lCm7/rUjj8xv88AxoTWCs00f2E94MA8MHrpDaGKpeSo=;
 b=PqjERG946n9nGrdsAggpmnJ1niYi9X7GWFd3qUTSsX60zOvIVukD4D8SUd49X6vzTG
 WBzEBItlxETrZA48OC41Y5BZ3UN+zSkZs21/JUZ/Yr21S/ozcddV3wm34/KSjhJktftU
 uShLZz1d/UjgmcTTZ0z58cJeN8QtVUQQaUyseTYm94QaY6T2REsnt7PqPimgkwX5yAVW
 DbKm4GyO9yRbwp/gYHGXyBZGBMRNuwSjsRN07AK9s4yzc4b/NKJ6gxJfC5PEkyfgPvAX
 zRqoFKWGP08fMaqSO9/iSbIDCbEONHIdM0QqAvs8usOAgJass3SgxSxhbIsy4xd6JyGP
 WqmA==
X-Gm-Message-State: AOJu0Yya0Y4LB2iMINYTKi1gkHyFPh/FyceSGwYPG8bCGwGSCTIknp/k
 ZNDFspRqaYPeC1u8NBILpXEigRysjwtGFcJefLlybFy/6CErEwAjnDTGvQ==
X-Google-Smtp-Source: AGHT+IEanbi8DDFdrilJ45j034XVUWopzndjhHPoS3OxDUU4oO7arpgCifykXLlDQs5nzc4ETh8Ucw==
X-Received: by 2002:a05:600c:5129:b0:426:5e91:391e with SMTP id
 5b1f17b1804b1-427dc558d2dmr21835575e9.26.1721550344912; 
 Sun, 21 Jul 2024 01:25:44 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36878684904sm5468657f8f.20.2024.07.21.01.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 01:25:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 10:25:42 +0200
Message-ID: <20240721082543.150026-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721550345; x=1722155145; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lCm7/rUjj8xv88AxoTWCs00f2E94MA8MHrpDaGKpeSo=;
 b=d3zKzM3NAeaMZI7NaxHzmJkuhhxzji3O6Vf7O0DTqaCoQm/eWA+LuZr61+J7wHCUXz
 WZs/SyaZlYhcOkf6dhMJWG8r0pC3M8RTeCb6sHJLe4OhP903cLWTB7m/Op2mGtXShL25
 eZksOZGY2y9M4I057UEMxBDUB2NePZ2s8nKTSul2etjYm4a2h8qS7xpZWR4f+5fZByfp
 uqUaR6G0j8/Bb9rNRWqdPWLeKZtVuMlVupIn6gV2JDEILpQAnWXEWD83baAZcDnKN/F1
 ovri2f44kQ5TEAjaSiPbbiLHd7OvQJKeYUk61Cy0kIMVzzbhkRRP8tl+ik9uNgKg2DsI
 NA5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=d3zKzM3N
Subject: [Buildroot] [PATCH 1/1] package/rabbitmq-c: bump to version 0.14.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version)
- Update hash of README.md (updates unrelated to license:
  https://github.com/alanxz/rabbitmq-c/commit/ea9acb88814a9240327bd27a30cdc06e5b69735c
  https://github.com/alanxz/rabbitmq-c/commit/7dab48f03419661133abdf12d53733a4d4369b76
  https://github.com/alanxz/rabbitmq-c/commit/8f8a320c5a9a58647f2f39d66107e7f116f4bc4a)
- This bump will fix the following build failure without the deprecated
  libopenssl engines raised since commit
  623d3bbe43e9193aa8e3395367d01af59071b859:

  /home/autobuild/autobuild/instance-1/output-1/build/rabbitmq-c-0.13.0/librabbitmq/amqp_openssl.c:602:42: error: 'ENGINE_METHOD_ALL' undeclared (first use in this function)
    602 |   if (ENGINE_set_default(openssl_engine, ENGINE_METHOD_ALL) == 0) {
        |                                          ^~~~~~~~~~~~~~~~~

https://github.com/alanxz/rabbitmq-c/releases/tag/v0.14.0

Fixes: 623d3bbe43e9193aa8e3395367d01af59071b859
 - http://autobuild.buildroot.org/results/b95d080a0de635baaea2f08a888746cddcd1f26e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-to-read-username-password-from-file.patch | 130 ------------------
 package/rabbitmq-c/rabbitmq-c.hash            |   4 +-
 package/rabbitmq-c/rabbitmq-c.mk              |   5 +-
 3 files changed, 3 insertions(+), 136 deletions(-)
 delete mode 100644 package/rabbitmq-c/0001-Add-option-to-read-username-password-from-file.patch

diff --git a/package/rabbitmq-c/0001-Add-option-to-read-username-password-from-file.patch b/package/rabbitmq-c/0001-Add-option-to-read-username-password-from-file.patch
deleted file mode 100644
index 347063cfb3..0000000000
--- a/package/rabbitmq-c/0001-Add-option-to-read-username-password-from-file.patch
+++ /dev/null
@@ -1,130 +0,0 @@
-From 463054383fbeef889b409a7f843df5365288e2a0 Mon Sep 17 00:00:00 2001
-From: Christian Kastner <ckk@kvr.at>
-Date: Tue, 13 Jun 2023 14:21:52 +0200
-Subject: [PATCH] Add option to read username/password from file (#781)
-
-* Add option to read username/password from file
-
-Upstream: https://github.com/alanxz/rabbitmq-c/commit/463054383fbeef889b409a7f843df5365288e2a0
-Signed-off-by: Fabrice Fontaine <fontaine.fabrce@gmail.com>
----
- tools/common.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 66 insertions(+)
-
-diff --git a/tools/common.c b/tools/common.c
-index 73b47e25..7efe557b 100644
---- a/tools/common.c
-+++ b/tools/common.c
-@@ -18,6 +18,11 @@
- #include "compat.h"
- #endif
- 
-+/* For when reading auth data from a file */
-+#define MAXAUTHTOKENLEN 128
-+#define USERNAMEPREFIX "username:"
-+#define PASSWORDPREFIX "password:"
-+
- void die(const char *fmt, ...) {
-   va_list ap;
-   va_start(ap, fmt);
-@@ -125,6 +130,7 @@ static char *amqp_vhost;
- static char *amqp_username;
- static char *amqp_password;
- static int amqp_heartbeat = 0;
-+static char *amqp_authfile;
- #ifdef WITH_SSL
- static int amqp_ssl = 0;
- static char *amqp_cacert = "/etc/ssl/certs/cacert.pem";
-@@ -147,6 +153,8 @@ struct poptOption connect_options[] = {
-      "the password to login with", "password"},
-     {"heartbeat", 0, POPT_ARG_INT, &amqp_heartbeat, 0,
-      "heartbeat interval, set to 0 to disable", "heartbeat"},
-+    {"authfile", 0, POPT_ARG_STRING, &amqp_authfile, 0,
-+     "path to file containing username/password for authentication", "file"},
- #ifdef WITH_SSL
-     {"ssl", 0, POPT_ARG_NONE, &amqp_ssl, 0, "connect over SSL/TLS", NULL},
-     {"cacert", 0, POPT_ARG_STRING, &amqp_cacert, 0,
-@@ -158,6 +166,50 @@ struct poptOption connect_options[] = {
- #endif /* WITH_SSL */
-     {NULL, '\0', 0, NULL, 0, NULL, NULL}};
- 
-+void read_authfile(const char *path) {
-+  size_t n;
-+  FILE *fp = NULL;
-+  char token[MAXAUTHTOKENLEN];
-+
-+  if ((amqp_username = malloc(MAXAUTHTOKENLEN)) == NULL ||
-+      (amqp_password = malloc(MAXAUTHTOKENLEN)) == NULL) {
-+    die("Out of memory");
-+  } else if ((fp = fopen(path, "r")) == NULL) {
-+    die("Could not read auth data file %s", path);
-+  }
-+
-+  if (fgets(token, MAXAUTHTOKENLEN, fp) == NULL ||
-+      strncmp(token, USERNAMEPREFIX, strlen(USERNAMEPREFIX))) {
-+    die("Malformed auth file (missing username)");
-+  }
-+  strncpy(amqp_username, &token[strlen(USERNAMEPREFIX)], MAXAUTHTOKENLEN);
-+  /* Missing newline means token was cut off */
-+  n = strlen(amqp_username);
-+  if (amqp_username[n - 1] != '\n') {
-+    die("Username too long");
-+  } else {
-+    amqp_username[n - 1] = '\0';
-+  }
-+
-+  if (fgets(token, MAXAUTHTOKENLEN, fp) == NULL ||
-+      strncmp(token, PASSWORDPREFIX, strlen(PASSWORDPREFIX))) {
-+    die("Malformed auth file (missing password)");
-+  }
-+  strncpy(amqp_password, &token[strlen(PASSWORDPREFIX)], MAXAUTHTOKENLEN);
-+  /* Missing newline means token was cut off */
-+  n = strlen(amqp_password);
-+  if (amqp_password[n - 1] != '\n') {
-+    die("Password too long");
-+  } else {
-+    amqp_password[n - 1] = '\0';
-+  }
-+
-+  (void)fgetc(fp);
-+  if (!feof(fp)) {
-+    die("Malformed auth file (trailing data)");
-+  }
-+}
-+
- static void init_connection_info(struct amqp_connection_info *ci) {
-   ci->user = NULL;
-   ci->password = NULL;
-@@ -237,6 +289,8 @@ static void init_connection_info(struct amqp_connection_info *ci) {
-   if (amqp_username) {
-     if (amqp_url) {
-       die("--username and --url options cannot be used at the same time");
-+    } else if (amqp_authfile) {
-+      die("--username and --authfile options cannot be used at the same time");
-     }
- 
-     ci->user = amqp_username;
-@@ -245,11 +299,23 @@ static void init_connection_info(struct amqp_connection_info *ci) {
-   if (amqp_password) {
-     if (amqp_url) {
-       die("--password and --url options cannot be used at the same time");
-+    } else if (amqp_authfile) {
-+      die("--password and --authfile options cannot be used at the same time");
-     }
- 
-     ci->password = amqp_password;
-   }
- 
-+  if (amqp_authfile) {
-+    if (amqp_url) {
-+      die("--authfile and --url options cannot be used at the same time");
-+    }
-+
-+    read_authfile(amqp_authfile);
-+    ci->user = amqp_username;
-+    ci->password = amqp_password;
-+  }
-+
-   if (amqp_vhost) {
-     if (amqp_url) {
-       die("--vhost and --url options cannot be used at the same time");
diff --git a/package/rabbitmq-c/rabbitmq-c.hash b/package/rabbitmq-c/rabbitmq-c.hash
index 66768ef34f..3eed467826 100644
--- a/package/rabbitmq-c/rabbitmq-c.hash
+++ b/package/rabbitmq-c/rabbitmq-c.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  8b224e41bba504fc52b02f918d8df7e4bf5359d493cbbff36c06078655c676e6  rabbitmq-c-0.13.0.tar.gz
+sha256  839b28eae20075ac58f45925fe991d16a3138cbde015db0ee11df1acb1c493df  rabbitmq-c-0.14.0.tar.gz
 sha256  3111fdaa26e86dd844d7c6cbb2723d0ed31702a840978ef116c86963c2429b0f  LICENSE
-sha256  defee723621ff1c556539af42780f449f258e47e3dcc8254bcbc095863f02b7c  README.md
+sha256  8d661859c72634a4f9315f134ba00d193e1b7308940bc44e82be9a376a490a06  README.md
diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
index 5a0775f353..4545a43a13 100644
--- a/package/rabbitmq-c/rabbitmq-c.mk
+++ b/package/rabbitmq-c/rabbitmq-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RABBITMQ_C_VERSION = 0.13.0
+RABBITMQ_C_VERSION = 0.14.0
 RABBITMQ_C_SITE = $(call github,alanxz,rabbitmq-c,v$(RABBITMQ_C_VERSION))
 RABBITMQ_C_LICENSE = MIT
 RABBITMQ_C_LICENSE_FILES = LICENSE README.md
@@ -14,9 +14,6 @@ RABBITMQ_C_CONF_OPTS = \
 	-DBUILD_API_DOCS=OFF \
 	-DBUILD_TOOLS_DOCS=OFF
 
-# 0001-Add-option-to-read-username-password-from-file.patch
-RABBITMQ_C_IGNORE_CVES += CVE-2023-35789
-
 # BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
 ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 RABBITMQ_C_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
