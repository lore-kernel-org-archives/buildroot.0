Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999A6C5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 13:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B14983F33;
	Wed,  4 Jun 2025 13:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jK-8_Oj0rXrd; Wed,  4 Jun 2025 13:34:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C82D83D4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C82D83D4F;
	Wed,  4 Jun 2025 13:34:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C57CB1A4
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 13:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B696C60F4A
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 13:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SbeK4zRnOvvq for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 13:34:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E10C60F40
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E10C60F40
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 13:34:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06088864CC; Wed,  4 Jun 2025 13:34:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jun 2025 15:23:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6567881e46a6cdf5dc8758992bd447e58821d4d
X-Git-Newrev: 77d69298044fdb781ef1627ccf84c4113130d00f
X-Patchwork-Hint: ignore
Message-Id: <20250604133402.06088864CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mongoose: fix openssl/mbedtls
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=77d69298044fdb781ef1627ccf84c4113130d00f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version bump to 7.12 (upstream commit [1]) the openssl/mbedtls support
defines changed from MG_ENABLE_OPENSSL/MG_ENABLE_MBEDTLS to
MG_TLS=MG_TLS_OPENSSL and MG_TLS=MG_TLS_MBED.

[1] https://github.com/cesanta/mongoose/commit/0613cc62f4dbec6beb76e9ddece60d52171585c0

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/mongoose.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index b41f6a054d..8316a8d59a 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -17,10 +17,12 @@ MONGOOSE_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MONGOOSE_DEPENDENCIES += openssl
-MONGOOSE_CFLAGS += -DMG_ENABLE_OPENSSL=1
+MONGOOSE_CFLAGS += -DMG_TLS=MG_TLS_OPENSSL
 else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 MONGOOSE_DEPENDENCIES += mbedtls
-MONGOOSE_CFLAGS += -DMG_ENABLE_MBEDTLS=1
+MONGOOSE_CFLAGS += -DMG_TLS=MG_TLS_MBED
+else
+MONGOOSE_CFLAGS += -DMG_TLS=MG_TLS_NONE
 endif
 
 define MONGOOSE_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
