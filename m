Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37146C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 21:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6A89404A3;
	Fri, 10 May 2024 21:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wGtaHUtEoO_n; Fri, 10 May 2024 21:18:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1AB440643
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1AB440643;
	Fri, 10 May 2024 21:18:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C59961BF36A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B27FF81551
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r8f8MZDsU9L5 for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 21:18:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AECC28133C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AECC28133C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AECC28133C
 for <buildroot@buildroot.org>; Fri, 10 May 2024 21:18:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id DB1091C0002;
 Fri, 10 May 2024 21:18:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 23:18:40 +0200
Message-ID: <20240510211841.1980465-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715375923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=X0LIan8Ew9SCzteqAkeHeAEau/aEA6ybQFjBbzXJs2c=;
 b=m22aamQgXiUk/wpVrfnlks7oe2MqsOpcNLGL9I7C4d9v7+wAo4Dl3QgBg774y2t6NPyVEq
 qp53Hi5berpjjK547vMHHaQA3FWnATA5NB5Oi/IpKC6zPmjRh/ayZqUkzdbbal+ecqF14/
 JGfMAv2ve9cnpY3jMmhEo6hzqL6vJx1Bfaw9uP8avlwKKtW/xaecPXR9R2VprZz/9yOq/5
 hN3fdY6rJAGFZE4Y82EJwmjGDjrTrCoHzoGatGD80Yj0rjU5Gw5FC1p31Xc2glxps2WwJh
 dzYiBwQ3g3zGnwUVJA5JMKIdzowSkQu+YbSRedNZh6QJXaGC97pNPJvtihxvuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m22aamQg
Subject: [Buildroot] [PATCH] Config.in: drop --passive-ftp from BR2_WGET
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Starting from version 40, Fedora uses
wget2 (https://gitlab.com/gnuwget/wget2) instead of the classic
wget. wget2 does not support --passive-ftp, so all downloads fail
with:

  Unknown option 'passive-ftp'

Since we're pretty much no longer using FTP to download things, let's
get rid of this option in our default BR2_WGET value, which makes
downloads work on Fedora 40.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index b5a94325c4..bdf5fa8647 100644
--- a/Config.in
+++ b/Config.in
@@ -105,7 +105,7 @@ menu "Commands"
 
 config BR2_WGET
 	string "Wget command"
-	default "wget --passive-ftp -nd -t 3"
+	default "wget -nd -t 3"
 
 config BR2_SVN
 	string "Subversion (svn) command"
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
