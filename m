Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAD1C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 13:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E6C540CDE;
	Sun, 20 Sep 2026 13:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3Wb514tuf0j; Sun, 20 Sep 2026 13:43:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4904E40B2C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789911809;
	b=jVO0tZIJ3s3lCiHAl+ggvRFh/Jju90b5JKalrpfb7BXTw8k5QpqNqrh4M6PpZqHxmTnn
	 beHWV5mL1TsH5EpCwVt0dqSKzfrB8EbyTNMcvmo7R9w3rLnF5I2wa4Q/XE7+E9Csz5Aym
	 60IOXDtXWluQOHV8lAR4uIdWAyo5sSts1Y2t4Mi5LL7I4W8pAoo/95/skrCH0itlmKzYb
	 xwLFBtlyeoGY8W4KKUAscJTzf6L27JLUBluPs5v4zKEd2EK5pQh76ZcVEDSoeXMYJb1oM
	 mt4OzhsNB3qFoBiQokDlAFmxXbZXBV17JSAOUYHR//PqpTOclQatw64OXZbN6lXetrQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789911809;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=V53gsCX58cJDwiDMun23Xxf3MmX7P9LK5muhfNN2ylE=;
	b=X565uzclsusAA1J6QX/77gk5sedXDla7d30kMJzGTM8PQIVuOTQ1C+bw/q+Yy72lD/yp
	 u4O7ZSGqsdIUmQN7ED/irbZ0xb6ifHOWFFMi+o2IJ5UZpIkIw1BmIgfPSKHx6zsvBQ+5F
	 AnhVslGYhX3nmWqKIpP52idXJFK/LIV22/EliRyRxj647LJiU/hpGoaH63z9MfKELQTqe
	 lI2/LDjAM83DCUtUGtrdECOlmeAoDoK4K+fLEQ3ERX52cwrmc7GW9jO0Ytb1e52DyiqSd
	 BjXuIma0jTdatQKGuXIzQKLWR8KpQJ3+6zs4HzV2i8hMFxrA40i42532lPGoMpeHQ7Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789911809;
	bh=V53gsCX58cJDwiDMun23Xxf3MmX7P9LK5muhfNN2ylE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qVMRQZic+q/8LQZEaqTk1V7ZtkswM6b9Fd0+z5Ig2UrUZmErwgAMIoK0O+MiqJEmH
	 LArnK3+CMFhxTilsX71mWrwyz9cRVKzqsK8E0WF+Ob/XhCcy/iKVWFuj3uscEmRfzA
	 WHsBLBQ5hWhkEhNYURcuwta382Lhn6MRdQvdt3pcCZcZ4lDbEaq5/kwjj1RkAdJ6J8
	 My2Iq+JunVzXAHtyrFBnXnmNBHlvkKfGUjhaXKwGCObBd1EMm869r0jmCAT3UVdV9W
	 4JlCRWa5xKgAc5uh9iGSDKxWHgatPlJLUWoxGiDw65R1wei+co4cW9b85W/kY4EUyA
	 dJaIiFgXcKGpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4904E40B2C;
	Sun, 20 Sep 2026 13:43:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C15873FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2D9360629
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdxHQ2XFCk_5 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 13:43:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 25BB4606C4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789911806;
 b=f+aCBtuE/rVJHt2x+7E1RmDR6bCsd0deQGtuVW+subbeaST+Oy6BXClhgxDMAmDOjIQi
 SqukwHFDjiqs8Atkm0DeSTP7yo6YX/7Pn9aWp2xm8TVQ968bp1NskgRE3XknU3FRKszS/
 cXydkzqbahOq0YfjXQgEMxkvX1Z1fb2gBlPjJT05X84FFKwXiak4YCUpR3t8kbPaor9uz
 JSNmhrF82fNFIMkmrMc7jJz53ECnJ8FeuxtKyAJBbaigni++G1pIJ4n5t26AmueW/HkzP
 WEz8uaVHwnZUdqD+yarSl7x6d0YFDAqQRouwnoNilBFaFgA2EVPXTzSw0PPhSCkZu+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789911806;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8bnYV8gF6txOqtLNQCgGuN3bIp75HX60XSQi6+oWySQ=;
 b=oKCj0d+dXdlOFACfyk+ULBEGdh04nAKOHUkMkiInJeox+ceGJmhezTbLFSU8HNMrwu+1
 NB0zfJJB/gumXp7JhLndFYmZX3KkWU1V+22/feEkqzFdhLT75SH0+Cp14vJTzPRkKRauR
 KJPs+xNvRkvgbI7WLzhHcfVJKKZL0zLHGDNW9fPFcXaffQPbxNWSlKxfjc7GwsEVr+i+F
 oDtfGocW9r0/B4u2iqnf+w8X1a7lR+H9RKJNBnglQxRKeytqgy7o+vO/AzuK7VgNzNFSj
 DPUhNc+YY7gHsxm8j3jr5QLjvAPgN2cD4w8/ipVowKet139r1Micd4202gnNZajpmAA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25BB4606C4
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:43:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6E278BE96; Sun, 20 Sep 2026 13:42:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 15:43:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7253d50c82cb83a8a39bded6d4d9b1b93cd3505b
X-Git-Newrev: 4463009364fa27d2f4a7675677e44fde550b0ec1
X-Patchwork-Hint: ignore
Message-Id: <20260920134217.C6E278BE96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vboot-utils: fix build with
 OpenSSL >= 3.x
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8931937885713336775=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8931937885713336775==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4463009364fa27d2f4a7675677e44fde550b0ec1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Remove -Werror from CFLAGS to prevent build errors due to warnings of
deprecated functions:

futility/cmd_create.c: In function ‘vb1_make_keypair’:
futility/cmd_create.c:96:9: error: ‘PEM_read_RSAPrivateKey’ is deprecated:
 Since OpenSSL 3.0 [-Werror=deprecated-declarations]
   96 |         rsa_key = PEM_read_RSAPrivateKey(fp, NULL, NULL, NULL);

futility/cmd_create.c:155:9: error: ‘RSA_free’ is deprecated:
 Since OpenSSL 3.0 [-Werror=deprecated-declarations]
  155 |         RSA_free(rsa_key);

futility/cmd_create.c:191:17: error: ‘PEM_read_RSA_PUBKEY’ is deprecated:
 Since OpenSSL 3.0 [-Werror=deprecated-declarations]
  191 |                 rsa_key = PEM_read_RSA_PUBKEY(fp, NULL, NULL, NULL);

futility/cmd_create.c:199:9: error: ‘RSA_get0_key’ is deprecated:
 Since OpenSSL 3.0 [-Werror=deprecated-declarations]
  199 |         RSA_get0_key(rsa_key, NULL, NULL, &rsa_d);

cc1: all warnings being treated as errors

The oldest build error dates back to 2024 so a backport to LTS branches
should be considered.

Fixes:
https://autobuild.buildroot.net/results/375/37554c5ce784835a36f0068d9a0c1cd931212b44/
https://autobuild.buildroot.net/results/1fa/1fabca11c7839d2d7ed809f30482595719a29c92/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vboot-utils/vboot-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/vboot-utils/vboot-utils.mk b/package/vboot-utils/vboot-utils.mk
index dc0b1365b7..14def4c708 100644
--- a/package/vboot-utils/vboot-utils.mk
+++ b/package/vboot-utils/vboot-utils.mk
@@ -33,6 +33,7 @@ define HOST_VBOOT_UTILS_BUILD_CMDS
 		CC="$(HOSTCC)" \
 		CPPFLAGS="$(HOST_CFLAGS) -D_LARGEFILE64_SOURCE -D_GNU_SOURCE" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
+		WERROR="" \
 		ARCH=arm \
 		futil cgpt
 endef

--===============8931937885713336775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8931937885713336775==--
