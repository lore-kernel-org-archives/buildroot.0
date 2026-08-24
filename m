Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB403C5DF94
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 09:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6929440450;
	Mon, 24 Aug 2026 09:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j30S_Erz95pQ; Mon, 24 Aug 2026 09:35:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787564136;
	bh=5Sgymja7SK3hYmFWjvM0hkHzMTuO/+kakacmQg6TqBY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WxKQCLmJS99UThEzcLTt/JieZIbD4XxiGIn4wz2aGiNRARaTWtqnbEHIXPKps94R8
	 WsR4gCwHNgVLEhQGzp4m76R0jaWflc+tjbHBs9qkPtkOUFYhFAvnUZNb31f+Orq83y
	 /g6ci8XiMmK93JalIAlpj5DZI0YzTwID4q18EhwMshaVhlHVGGczslKWA3Pfr69qJt
	 ga1GPXII36SH6HjDMle+6gtd/owTtPsjdFbfUsliQYXNhqrsHPDbGsIrE8tt7acWgU
	 sSs4BKntFlrWcHdAOBKzvgjvglT6N1RPIliAzpnhTnK5fKI1JjTwLZWNHMhEwF2qjI
	 eOqNvfh1YqNQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70B85404E9;
	Mon, 24 Aug 2026 09:35:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 715D6386
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 09:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63F0A4005B
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 09:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrteKOzBc_6X for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 09:35:33 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=rhidian.dewit@openpixelsystems.org; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none)
 header.from=openpixelsystems.org
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=openpixelsystems.org
 header.i=@openpixelsystems.org header.a=rsa-sha256 header.s=google
 header.b=QlJe0Dme
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63FF940052
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 09:35:32 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-49556f97a9dso17566715e9.1
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 02:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems.org; s=google; t=1787564131; x=1788168931;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PWT4CP4vBFgBoaFv8GeHIF66/fPKCCnnGNh1gaXVKPw=;
 b=QlJe0DmeXEBECkaUiouMAN7G8Fn1SdfpOvzRJhh3EfENEn9B+QVhHcJWtmuK6RodzC
 r3FLr+F2JYq7zJ/KARV1EEiJzP/voNQgexcIVh98/WYVkAnOpzWjrW6BdrYr7hc+8Ss+
 v6vU6RYxz7cgHqfJ8zGnisWKtB6H+7kWpeFvbUKKZs8ifoBlSyutie4o+E+PVi000vFE
 TdpwFAvOW3vxx1SX3F9E/c9a/u9spSmz4CJqvyiNqT/KQXvIjAqKLzwn1cRnqBQojYSf
 bCXzR3Dfp7/TMYcH6S/IzfbOxQ4ICh1JG0mQZHfBIdzVFQSmcoetlqhMt+49fqErbbF5
 FIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787564131; x=1788168931;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PWT4CP4vBFgBoaFv8GeHIF66/fPKCCnnGNh1gaXVKPw=;
 b=swSzICMY2bHU2q1yCHqtJVuNX+X6FNdZrXz8tAAU06HiGkme7D/fzSD4MTqjltu2S7
 AKGcPCzF19AsaGIdA33yZigJx3I+6HtSHyD51HiKDH3Ik0dWAvN/FKEvrj9FHQ7VgyWJ
 Zn3pDQPUyM9kGgtKJ+og4Q6FFBnKFBj11wIbYhuEPrXKtauImjlsPDA6BOcykYVptzrf
 YWUqa7jnhi0SISC5Zj6M8Y2952ho2Uiy5VHLhIIPkmOvGC+Y/rCdueDMKUKPz3ekb7me
 MOh4c7j5BADwgig6/7PM+h7YSLwqf8eaub9RvCPevSblLV4aSmKcbEQdn/CxXlow8xLh
 tFwg==
X-Gm-Message-State: AFuF++mSyn2Mqzy3p5z+zKuA3L8jEmq9icU/+GjvMpXkrrWC6krKXfWf
 UuLHf79Ypwj4Y96XqB15HNWKJn0OmCoWAaGSKbqEAfxtY/Mo14ZCg0o/BuJ0Ba2cdG6aFuIurI4
 Ywsqe
X-Gm-Gg: AR+sD10YRG0ABMQ7jCrMZT7gf6Lqqu3p2WEORZYwQQcSDzl2hZ64+5gUY9Cwo4pZDFI
 MVqkq81JHwyiw4hF5OQyGHrq2y4vSVlmdmDxsYV2Muts8uP8/NrVucY8Iov+So504Oms8wMZL9r
 SNSSpd3yU1fCPQ9J3ou+yLu40Y3cCoZ4Rv1w5G/VniLe4pM8/xM8e0nHdp6qz7DVo7ZtURAoyeC
 4ZKhQ5BClB5/ULnw4x/HwTCf22fneN7BcedU4ZIJXCKRLTNi3j9Lh1ABc9fGApktDKOrewMuXOZ
 IFt5/Uqp+zeq+21rXxqU+7+HEdXLTnej1XKKfqCXOtFebD29t4xlwhLv2CdgIyFYyRcRLJ6CnOz
 Y67tF2b/R0ATMqghMYK+i0EP33hm5vlXqDS8jXZ6mTsXuDbqVUCzeII2NNDemyoSXN/VrPWbYCH
 oEhsHAOPA+tRuxjwD94aRPHH86mLHaG7NdB1d4hEudKAB5g2uYTt97G3rodEfkUayEY7M9b6f71
 LwuWaqYS3TQg73RQZv2JxOvs7zUfYx8KDTTxi2KdFkD65UHi+B2mM165+drNyp+
X-Received: by 2002:a05:600c:45c3:b0:499:4e47:eaf2 with SMTP id
 5b1f17b1804b1-499b8325c3fmr280466845e9.6.1787564131042; 
 Mon, 24 Aug 2026 02:35:31 -0700 (PDT)
Received: from titanium.opsys.org (253.124-78-194.adsl-static.isp.belgacom.be.
 [194.78.124.253]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482c9b78df1sm7384270f8f.10.2026.08.24.02.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 02:35:30 -0700 (PDT)
From: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
To: buildroot@buildroot.org
Cc: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
Date: Mon, 24 Aug 2026 11:35:27 +0200
Message-ID: <20260824093528.3357438-1-rhidian.dewit@openpixelsystems.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] Duplicate efi slot bootname to avoid double
 free
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

Signed-off-by: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
---
 src/bootloaders/efi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/bootloaders/efi.c b/src/bootloaders/efi.c
index 889ccca4..631ea39d 100644
--- a/src/bootloaders/efi.c
+++ b/src/bootloaders/efi.c
@@ -513,7 +513,7 @@ gchar *r_efi_get_current_bootname(RaucConfig *config, GError **error)
 	g_hash_table_iter_init(&iter, config->slots);
 	while (g_hash_table_iter_next(&iter, NULL, (gpointer*) &slot)) {
 		if (g_strcmp0(slot->bootname, bootcurrent->name) == 0) {
-			return slot->bootname;
+			return g_strdup(slot->bootname);
 		}
 	}
 
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
