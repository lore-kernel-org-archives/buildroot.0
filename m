Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38C2C36008
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 20:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E30640C01;
	Sat, 29 Mar 2025 20:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7abuDOyTTWtN; Sat, 29 Mar 2025 20:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA6D840C3C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA6D840C3C;
	Sat, 29 Mar 2025 20:45:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DAC5012A
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C743040C4A
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PI6jNfgK-jAh for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 20:45:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D20D40C01
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D20D40C01
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:45:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 066398347B; Sat, 29 Mar 2025 20:45:46 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 29 Mar 2025 21:42:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a402952a7447e2125ef326752f412711fb425d5
X-Git-Newrev: 8c439db4a14bd67267505623c5b3e20fc96a878c
X-Patchwork-Hint: ignore
Message-Id: <20250329204546.066398347B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeswitch: fix build with GCC 14.x
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8c439db4a14bd67267505623c5b3e20fc96a878c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.org/results/33c/33c41d8da8190933d863ed6f75e5d586d1c22a2f/

Build error is also present on the 2024.11.x branch:
https://autobuild.buildroot.org/results/7eef69e6587783307cd9231abdc4a2fee60c075f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...xml_int-mod_xml_rpc-const-compiler-errors.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
