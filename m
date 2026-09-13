Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882D5C88E63
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 19:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4636280C66;
	Sun, 13 Sep 2026 19:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fp5B6bC9GKPL; Sun, 13 Sep 2026 19:47:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4BFC380C6A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789328876;
	b=nI4008H2Z/wzpAh2sD9YuhbWr57lS3kw0s2qTfhLpzHQ9IRMBxMg3kWzhydikKdc/XME
	 vbfrvwti0h4UzeF18vgFF+SdHefITJ2gn0CRL7rie0grmlkX/nxoPnkJayTsh9SijozCl
	 dNa9OMp4CBznIVR2Ilde/TQqiDSEi/M/hKvmXow1EHCq1hDhu/npWn+/1t4aDzaXfdgf0
	 SsV1ojz5GZ8pmDoeTuQLUWGSOC49qxJZK89WSEsfK872KGIDtVable+sMpbYpkD98Ij/E
	 PZ4Hw+V+Y3RHyAXOCNYLtYZPOIpixvI+jH3yRYajW4/XLtQmrCP08lzWwWKGXMlMOMw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789328876;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=JuDx4oroc3y0olAEQtt1NgvxqMmxZ+ybCKGIt1kyKz8=;
	b=irwTq+b21NbD2vWrSKjwSZs4+RQ6lLM7HoiSdziXs1Vf6J25RgO4PR6vzYCltOSovTws
	 1rsoBkQQ4Z3JXzNirYMPEd13+YQdoFDa/G6r1iXsYu6gIjwEyBx55hSwg+by201t/+rXA
	 FCXBtk1zCuMWhGO621Zc310YarMpkP7e4TicTK9OjDy8nOqY0jE4ogKMMcjllcdYNWZ8T
	 NbTTWIJmVoBysWD8eKxCRuJTvuHXpZ02aP1FcOVAp8Mo1Nb8SXZD8EmoVzHVUf5rKlGK+
	 mgWJtA9GrlybDpMkirg014N6+ozW+BZ5sNUGicVqDby7kS9u2zsTwHAI0WclOUvWxKg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789328876;
	bh=JuDx4oroc3y0olAEQtt1NgvxqMmxZ+ybCKGIt1kyKz8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=JNxpJ3ROK2+k77FtLMu5kEZAEpbyMZb9PYrlCk9fH5AgFKsFeihYPQ3mFT9K0Nyd7
	 tnVhmY4nSMo971e4LKaXQfUu4B8An0rI6iPohpixQmRBPypRS5iU34Fu2SR8KVRZpI
	 ds2gU4Uf3Z8tNTKixRe73TpIiXJ6mkDGVjLq4Fb0aGkaipp1T0u7vmZbpeoPkPOvw1
	 BNyKaXISvR06MqW6F/lwVw+lu3C5QpRGOgZyeY5IOtq3HmD/LXLpeRa8AY5yeHeQEx
	 29e41edb04uAoZqvIZbXNGaNjkffZnM51rYVcTfHFYR/MEBmCHKGEmQp/4Vf3F4h+C
	 8KlagmROqxWWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BFC380C6A;
	Sun, 13 Sep 2026 19:47:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BC64224
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CC9980C66
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SNG2N_zGnJzu for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 19:47:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 686D480C64
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789328874;
 b=NOnyBMD9nAhHJF5pTOqhPUvtisb+SDnPkxfenZLRgaicA//xEaVc7NYJ3/ReQ9GX8u/m
 NdW7sLGMTTd7mzPPyn9jNEYZCuAoG5xQ1kVca6WaffUHQtkW8DEjTdHo3X6xKu6P9SMUK
 lh8rzFClRRNQBVuQ1ywYrRFSafbNJxLUZq4+0XJzpqEpQ54hsZih4n0Pc32m15FgVhArF
 ttiIJd4WE8a6lg/wpAsJSpiFjShwn9JQr49zv6Q2Y+hK2fp4Mu4jOpXLLxihkIqr2chXq
 H1Wd8JqutPhIeu4fQ3NtEY0gHtgIZmMysHRDe7p9F2FiL/7vYUpsj2AqoOiuFoU5Qag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789328874;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=Sr0lFh4nQ7caErquoTW3kUkOsThOKLzZ2BR8jItjzKo=;
 b=lwSgXenUt514fzWFjTuT5c7B5yD4Nrpzw9sMtuvxGYlKyBQrdtX4sZwq83vOKplVUGlN
 oYN/HYHeE02EKAPmvyrYuQqHkWOXJOapc8kp4MQRa6UNwUNnOxmY0hbc5Ezk6mYAE6Smn
 niYT+yo83oI+WsDihV8+6aXtd4snkTkVYFNTsiPxC6hO/zy9sTc6V3PAbLwOlgxVv1XhV
 bfGUuQFFauYxWszsk45iIT5DCl3v+opNcmy9EukhBwn5g6+4s88LANua0++/0IJkDENPz
 63QyRwNpcxDurjWHlNhgfGQSMI6Mj6M52Lvkl6dJnIaFDd4lM/g7+uYg/EyDG1Li2bw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ADz5NRDM; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 686D480C64
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:47:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id CC5A8C62200;
 Sun, 13 Sep 2026 19:48:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 100B460435;
 Sun, 13 Sep 2026 19:47:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E9D8011C7AFD5; 
 Sun, 13 Sep 2026 21:47:46 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>
Date: Sun, 13 Sep 2026 21:47:44 +0200
Message-ID: <20260913194745.1726052-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/mosh: bump gcc version requirement due
 to protobuf
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

In commit
76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c ("package/libabseil-cpp: bump
to version 20260817.0"), libabseil-cpp was bumped, which required the
gcc >= 8.x dependency to be upgraded to a gcc >= 10.x dependency. This
was properly done in package/protobuf as part of this commit, as
protobuf is a reverse dependency of libabseil-cpp.

However, mosh, which is a reverse dependency of protobuf, was
forgotten, and it no longer carries the correct gcc dependency.

This commit fixes this issue.

Fixes: 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c ("package/libabseil-cpp: bump to version 20260817.0")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mosh/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mosh/Config.in b/package/mosh/Config.in
index 7ca5259ecb..8676f59cc4 100644
--- a/package/mosh/Config.in
+++ b/package/mosh/Config.in
@@ -1,7 +1,7 @@
-comment "mosh needs a toolchain w/ C++, threads, dynamic library, wchar, gcc >= 8"
+comment "mosh needs a toolchain w/ C++, threads, dynamic library, wchar, gcc >= 10"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 config BR2_PACKAGE_MOSH
@@ -9,7 +9,7 @@ config BR2_PACKAGE_MOSH
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # protobuf
 	depends on !BR2_STATIC_LIBS # protobuf
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_PROTOBUF
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
