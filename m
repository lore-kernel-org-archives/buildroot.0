Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CACC4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 19:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5541423EB;
	Sat, 28 Oct 2023 19:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5541423EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fq54BMN8qf5C; Sat, 28 Oct 2023 19:41:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC565423ED;
	Sat, 28 Oct 2023 19:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC565423ED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E23A1BF865
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D48D83C0B
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D48D83C0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rjjapl-JO3dP for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 19:41:25 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5FE283C05
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 19:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5FE283C05
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c54c8934abso45756681fa.0
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 12:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698522082; x=1699126882;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zjnw0UvdP0OUjK0JFZSW8uDiwP++bb/1Oq+ct8cGvDY=;
 b=NJCrHdt/JPr7OL1R6nJzEJDhjvmUQwD2pJYlLXIu7h1BVHWGcSxKLL4R40bNA1fvVH
 KswJmvyLNzKX2PjBl8MAarIc2wd6ZDZ3SX14C1Um0N1sjP/Ab0kcMjrLuMejkoed7YRG
 DF+ap4IXAuTkUoZ3Va80Frqx6KFuifs92qA5mffX1dz76On1q64BONByh0PIKOv4u0FI
 kIKwmvWI7BWG/v4rhEh0kjvXdezXk62QMF6r2Hwp3Q2Arp6kVAdCR0Vk4k2vESJdYE8l
 DeL756mFC23ntP/s4eB9th2tzJfmhAje5fxRZLlNpuP47wqb0GacAl7caaWI645LHICK
 /Dlg==
X-Gm-Message-State: AOJu0YzVIvvzWvcLcmzgAtT8/8xVTHVeWmzmYa60qyCRYQKXpFoXLQDK
 HrKlMotvXOBPeI+M249R1RWn5Aj0PRM=
X-Google-Smtp-Source: AGHT+IG8D9tyfl2kS2NzSqlyCa4QlAVLgaNjmAqnfqt3H09wUzK7IA/Qneu4FAoZscE4iZXi/TwRUg==
X-Received: by 2002:a2e:a3d7:0:b0:2c5:d10:248f with SMTP id
 w23-20020a2ea3d7000000b002c50d10248fmr4172707lje.49.1698522082040; 
 Sat, 28 Oct 2023 12:41:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j12-20020adfe50c000000b0032d893d8dc8sm4466499wrm.2.2023.10.28.12.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 12:41:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 21:41:19 +0200
Message-ID: <20231028194119.987835-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698522082; x=1699126882; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zjnw0UvdP0OUjK0JFZSW8uDiwP++bb/1Oq+ct8cGvDY=;
 b=lxRptAkxKdlAPi2fI/72QDb54Q0ZVUZB9dxyhYj/LI5fwXS9mKvkAbhXByUvOZ03K1
 uzw6R7VvfuxQvbRPaFaOoFkGzmRAxuJ9YXUQYRoPhFZ6AicP+kWeuVFEIQunANlsMcr+
 cy1nqb3kMT8wtaVPcJuAuerIOcyHen4NjM01IdSkPQWsXA2Nf+RXLFcnkW3cw21r6ram
 HPc8DGJAUrrmsKkzxQRMNEKYZ2e39uBV/uZEYD2SlIRrrUizD/gWW/1frsdKOC79kSCd
 rYAdqRjH086XwLsuTmtuhHZwvMt+6a6C9PXLE/xQaKzagylLljOJmmKDmjSk1YbEY8vu
 7OQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lxRptAkx
Subject: [Buildroot] [PATCH 1/1] package/rabbitmq-c: fix CVE-2023-35789
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

An issue was discovered in the C AMQP client library (aka rabbitmq-c)
through 0.13.0 for RabbitMQ. Credentials can only be entered on the
command line (e.g., for amqp-publish or amqp-consume) and are thus
visible to local attackers by listing a process and its arguments.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-to-read-username-password-from-file.patch | 130 ++++++++++++++++++
 package/rabbitmq-c/rabbitmq-c.mk              |   3 +
 2 files changed, 133 insertions(+)
 create mode 100644 package/rabbitmq-c/0001-Add-option-to-read-username-password-from-file.patch

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
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
