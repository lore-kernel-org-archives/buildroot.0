Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41248C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 14:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12442813FD;
	Wed, 28 Feb 2024 14:56:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kgdFkpJYC1_q; Wed, 28 Feb 2024 14:56:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DA618233A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DA618233A;
	Wed, 28 Feb 2024 14:56:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C19D1BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 14:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66CDF60E67
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 14:56:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pmn01l1aXwb9 for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 14:56:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.243.197.30;
 helo=mail.hostpark.net; envelope-from=christian@klarinett.li;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7DE9860E62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DE9860E62
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DE9860E62
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 14:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id DE309164B3;
 Wed, 28 Feb 2024 15:56:50 +0100 (CET)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail1.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
 with ESMTP id 5O1XEWASIae9; Wed, 28 Feb 2024 15:56:50 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id 2364016255;
 Wed, 28 Feb 2024 15:56:48 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 15:56:40 +0100
Message-ID: <20240228145642.436509-1-christian@klarinett.li>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:from:from; s=sel2011a; t=1709132210; bh=sf
 cjhmq6j1HqMJceyLcNNL2w1MVAlqOSdxcpoe0exqc=; b=lXz++CTp1EPTI7fyv8
 96dLUHuQ3kOqdURzC2JFkpZXZ7GWA9/sXxWFAfKvjf95nyyVx/uUCShr7fqYoqBU
 Nwxc4Hk1mdaIUZZvGr9T6sCBZhDdMZk6a5oduvW9I7KmRN7Xfdu/wfBYAOGmGIC2
 GK7f0rZ03Lpjh7iGLFZMr787w=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=klarinett.li
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li
 header.a=rsa-sha256 header.s=sel2011a header.b=lXz++CTp
Subject: [Buildroot] [PATCH 1/2] package/zic: add hash for existing patch
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
From: Christian Hitz via buildroot <buildroot@buildroot.org>
Reply-To: Christian Hitz <christian@klarinett.li>
Cc: Christian Hitz <christian.hitz@bbv.ch>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Hitz <christian.hitz@bbv.ch>

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
---
 package/zic/zic.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index a2720a27ba..f2a48b1d2e 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -2,3 +2,4 @@
 sha512  fa18bae9c0e7c061bc9d5f5f2eb9967f0e4ddb2baafdee9887fa30cd0c60f4aa6f21eacffb17df0d59d26ff54d08c5dcefa98159309eba497e86443624913a82  tzcode2023c.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
+sha256  9e3c665b2cf8ad1eeb3458ec736e644e3d0c86a5e2fa8bcc4f34d72317511958  0001-remove-dependency-check-on-version-file.patch
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
