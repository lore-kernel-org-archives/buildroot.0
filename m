Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4B4C28B30
	for <buildroot@archiver.kernel.org>; Sun, 23 Mar 2025 07:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06C696077B;
	Sun, 23 Mar 2025 07:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C2KnGeGxJQ66; Sun, 23 Mar 2025 07:25:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2566660A57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2566660A57;
	Sun, 23 Mar 2025 07:25:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD2201C9
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 07:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF296404F5
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 07:25:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ldYbNLA0eobj for <buildroot@buildroot.org>;
 Sun, 23 Mar 2025 07:25:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8756840018
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8756840018
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8756840018
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 07:25:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6caeb.dip0.t-ipconnect.de [79.214.202.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CBA15A4C2E12
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 08:25:20 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36062)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1twFhv-000000002Mk-2QaF
 for buildroot@buildroot.org; Sun, 23 Mar 2025 07:25:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 23 Mar 2025 08:25:19 +0100
Message-Id: <20250323072519.3477-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1742714720;
 bh=vkz3Ebq1mn3gAY0Rw/ngO/xQIHFgksqcxUODjKAg1Fg=;
 h=From:To:Subject:Date:From;
 b=X/LO8d53W8mgUWOBnrHpNKyNWisP8xt1QObm2J2UQ8sByH/+Zyf+CkOIf+Ikh1/w1
 Dtd5JmS5vqrkAbvE39ViiIZzOhDnwf6YPk2aFyM0HKSR27Q43pnnatUPLYgitXrEMh
 KzCxvbVX6JWm8Qv1Nv7xEXhs8sqhxRGXPb9kFn/8207xd9dQg7wwWO0jBHvd10912g
 +Y3/Qbb2/9bnJ9Kh2YEnw5Krq1piAtQjSKr0ZrmtBul9PtyzzKEUGSSl5WDotjVbZe
 di8KS8GJgdt354xiQYAeU14a7ODg81IWzdtwQRH96OBnENVmPSfRcxzoXLUOCT1k3p
 JwWiDot4bO3Og==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=X/LO8d53
Subject: [Buildroot] [PATCH] package/freeswitch: fix build with GCC 14.x
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://autobuild.buildroot.org/results/33c/33c41d8da8190933d863ed6f75e5d586d1c22a2f/

Build error is also present on the 2024.11.x branch:
https://autobuild.buildroot.org/results/7eef69e6587783307cd9231abdc4a2fee60c075f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...nt-mod_xml_rpc-const-compiler-errors.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/freeswitch/0003-xml_int-mod_xml_rpc-const-compiler-errors.patch

diff --git a/package/freeswitch/0003-xml_int-mod_xml_rpc-const-compiler-errors.patch b/package/freeswitch/0003-xml_int-mod_xml_rpc-const-compiler-errors.patch
new file mode 100644
index 0000000000..0cd5283a14
--- /dev/null
+++ b/package/freeswitch/0003-xml_int-mod_xml_rpc-const-compiler-errors.patch
@@ -0,0 +1,35 @@
+From 475b64d1c5707e1302cf9f7cfe3c385b7339c6c4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=D0=94=D0=B8=D0=BB=D1=8F=D0=BD=20=D0=9F=D0=B0=D0=BB=D0=B0?=
+ =?UTF-8?q?=D1=83=D0=B7=D0=BE=D0=B2?= <git-dpa@aegee.org>
+Date: Sat, 22 Jun 2024 14:58:52 +0200
+Subject: [PATCH] xml_int/mod_xml_rpc: const compiler errors
+
+Upstream: https://github.com/signalwire/freeswitch/pull/2496
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/mod/xml_int/mod_xml_rpc/mod_xml_rpc.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/mod/xml_int/mod_xml_rpc/mod_xml_rpc.c b/src/mod/xml_int/mod_xml_rpc/mod_xml_rpc.c
+index 8e49462d2c2..0a4e5e1e449 100644
+--- a/src/mod/xml_int/mod_xml_rpc/mod_xml_rpc.c
++++ b/src/mod/xml_int/mod_xml_rpc/mod_xml_rpc.c
+@@ -321,7 +321,7 @@ static abyss_bool user_attributes(const char *user, const char *domain_name,
+ static abyss_bool is_authorized(const TSession * r, const char *command)
+ {
+ 	char *user = NULL, *domain_name = NULL;
+-	char *allowed_commands = NULL;
++	const char *allowed_commands = NULL;
+ 	char *dp;
+ 	char *dup = NULL;
+ 	char *argv[256] = { 0 };
+@@ -922,7 +922,7 @@ abyss_bool handler_hook(TSession * r)
+ 				if (len > 0) {
+ 					int succeeded = TRUE;
+ 					char *qp = qbuf;
+-					char *readError;
++					const char *readError;
+ 
+ 					do {
+ 						int blen = r->connP->buffersize - r->connP->bufferpos;
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
