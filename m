Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D034AE9A03B
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 10:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A5158227E;
	Thu, 19 Feb 2026 10:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxweYJ5TLFat; Thu, 19 Feb 2026 10:43:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21E538228F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771497831;
	bh=97k+Ki4pQ9+LxiMw0F1bpZk7XSztpgszUqP/BecMBwQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BNorduEtdI5ZPXaTuaEjFFuJu4j3T8N3I/T9hXwTSRtdApdI3bxCvEtL/G5pYeO0q
	 dD+MEqYw+H1hukLYXMs0f8jbJgluUg4+12VxNKA6Wzu6RIKe5Z5720gCXBkkGmfuvf
	 aDm5gOzfsQM47w1hiFEtGDA9VLl0x3EyIZN6oy0bOhzwcBOcVBjFfzdoCeVdb2LrKa
	 0rCXnldusvOGooK17fN1ROMB5M5mcSgYjEcbQRl7+V9mHFAsBex0WtxlxeBKFiRygw
	 0fuK2bR1iDdekmktnPx8h8gkyt5M9px1hdbf8HOLMuT2npz18QJnBCuy+RHNEHTxLm
	 jR8c+r93mxTQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21E538228F;
	Thu, 19 Feb 2026 10:43:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B92A2183
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 10:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F25060842
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 10:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b8wRrbv-KQYU for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 10:43:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.102;
 helo=smtpcmd10102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 822CD60782
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 822CD60782
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 822CD60782
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 10:43:44 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id t1VWv92YWIfDkt1VWv35OM; Thu, 19 Feb 2026 11:43:43 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 19 Feb 2026 11:43:41 +0100
Message-ID: <20260219104341.2640089-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260219104341.2640089-1-giulio.benetti@benettiengineering.com>
References: <20260219104341.2640089-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDjxhk/WVJROigSSCi8U1wB1jonarHuRCl2UMPi7YyCNDkURdy67PRReEpjXBJ69Nd3mBTlFjdXeYfTg65SReufNL+F08jjLeckZZYDu5KTun5S+96Ay
 wRLZgO3ILjM2JC5eLQzjIf5Om+7GkHY86F+JofyXlj1cl8yJteXjxWWwHnYuRl0q/NUOZbtWvP7xxwZj7/pzUwbpHQoWPS9hlf0IMFzpEWCVEGHkV+8emqZP
 UaHtPoNA7yzV0IoiNn+313HWCG8cWyJkdCR2gWZGqDRMQrqARlS+zOroIlubfxUFc27W5Ob/bXchR6PBj8DuejlgDePFK3KU0i3c/jN0h8joB/s4FdrobmP+
 yf1lrLEo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1771497823; bh=kSnWu9Iprtof6nnevjHlAd68VrmkyOYzdugnn1bV7Xs=;
 h=From:To:Subject:Date:MIME-Version;
 b=bUBI5QEWV7FdXq/fIuZpyhlA9Sc5Uy1zf8/BjvZykwPNMjl+hHcNhlJLZqRzxwBXn
 km+Z8B1tLqb11PjWeysxJDvhbAR9BmvHXkGplaF7S8vJRrm0fotHEUIq0DIxfxFBMF
 vLmVZ8Rb4dYb92/G5h3tNxUZx8I9K1CFiXzOqOA4aNytNK+kKDzxfdsRzJQdkc/ma0
 K8DQvhMc0l/NOHyc2XsCf5Ebay5EnRO6dBblJT2/j2PMZixGnes1HfiAKy/WdGUJAR
 VDoPH7/eAhyon+o6k1j/+Px9RTqrW348IBy3oqIZ5u+d6t2DmXdmS8swQqV4KybnFQ
 ZBvhcEG3xvoOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=bUBI5QEW
Subject: [Buildroot] [PATCH 3/3]
 board/olimex/a20_olinuxino/patches/linux/linux.hash: drop unused Linux
 6.18.3 hash
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/olimex/a20_olinuxino/patches/linux/linux.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/olimex/a20_olinuxino/patches/linux/linux.hash b/board/olimex/a20_olinuxino/patches/linux/linux.hash
index 8d8499b329..f83883b936 100644
--- a/board/olimex/a20_olinuxino/patches/linux/linux.hash
+++ b/board/olimex/a20_olinuxino/patches/linux/linux.hash
@@ -1,3 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  7a8879167b89c4bae077d6f39c4f2130769f05dbdad2aad914adab9afb7d7f9a  linux-6.18.3.tar.xz
 sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
