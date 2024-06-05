Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0C2C27C52
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 17:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C33A6419E4;
	Wed,  5 Jun 2024 17:53:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1SNq1EbcgWJg; Wed,  5 Jun 2024 17:53:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F04741A77
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F04741A77;
	Wed,  5 Jun 2024 17:53:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 51E751BF5B3
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FB89402FD
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OfFlWrRgPqMN for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 17:53:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5DAEB41871
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DAEB41871
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DAEB41871
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 17:53:26 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-35b447d78f1so34810f8f.0
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 10:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717610004; x=1718214804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NvSism9bXPp3SYiTW+cnqZr50CZXmZcxCBVP2dgEeJ0=;
 b=NQ7L1z7kYQ490+IJfWXePPbfd/FIuWrzn5gLXZSRlETokz8Y3NYaeWP5SmC+rSyHYl
 Qn/qVAYQfn7kPR1QlLtJcyTkp6m6HG9zYCK/SJlC+q/ezwaSWk7fGl4ljRMLz2Nzul9A
 DiajZqs9E9jd++f4jzA/SUXEXmNovrv4tzPkGZ2/HgvLasexuyuoBth7EDJ9Ga1hUZMU
 ZRZv0JkzRcJ1axUFOl6Chj87MPICa+GcWaX8yTHBe50qez4rYFlgVvO/LqgQ084Ljs0z
 OfeyiL+o96BlJnNTxgosMEdFNGGB7iBsuJvg0lN1uyB1nRfBfsbHvTWtvbsKBa2yqUIC
 E2JA==
X-Gm-Message-State: AOJu0YxB8dnVu40T/TeNC/WaSoIkqWDO+3W0qQxaQ8lTeeeyLSJ86tDk
 Amj6qLyTnDNC95OOwErktwpfci/I6gUld0RKbqQK0u8t02hAeQGuVP4Hxw==
X-Google-Smtp-Source: AGHT+IG6eVzOaBh32reZP+QAi2UM5uBSouQQCJ997NUgWgWSK2RG1PAzhiiiUZ8KyqD5JeJoy00mfg==
X-Received: by 2002:a5d:6152:0:b0:356:4809:1a7e with SMTP id
 ffacd0b85a97d-35ef0dbc215mr303413f8f.34.1717610004355; 
 Wed, 05 Jun 2024 10:53:24 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04d90a8sm15520821f8f.46.2024.06.05.10.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 10:53:24 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 19:53:17 +0200
Message-ID: <0e71798f007c322ba6d3c1c140b37b5c3c4d4857.1717609998.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717609998.git.yann.morin.1998@free.fr>
References: <cover.1717609998.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717610004; x=1718214804; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NvSism9bXPp3SYiTW+cnqZr50CZXmZcxCBVP2dgEeJ0=;
 b=bDTZNav47stsAo88LoOW8PAUutY4Yyom/3H5MA3U+469FVvB06n8DFWDd0EbvZktxb
 Hjdr8IAjO4QuD/TO7YAGaYU+hPISFBPcqcMTXZKxsRw+7PRhaEhrXO2K64Jwufd7v/Zb
 P4VuDfur1UrpvxTr4Nhdp6+POcYI7+kvWiFLyn53yT7avv7vGveqyBrSAA2dw6EU/4g/
 XnePAY/Dafe3UA8Ot/d12huzDwx5JZFmCw4SAaLRFXe2mwxoifFx9sU15rZRbcHxuxps
 /1Zxu4qRLiQEfY5TbTBAy0uTQ6UWg1qu1XDkj9lCr2wzVhzInqOjUl96mKRDdoG/xGC8
 yUEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bDTZNav4
Subject: [Buildroot] [PATCH 05/10 v2] package/pkg-download: export TAR for
 download backends
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-download.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index bec213fb71..a78532ce8b 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -109,7 +109,9 @@ endif
 
 define DOWNLOAD
 	$(Q)mkdir -p $($(2)_DL_DIR)
-	$(Q)$(EXTRA_ENV) $($(2)_DL_ENV) \
+	$(Q)$(EXTRA_ENV) \
+	$($(2)_DL_ENV) \
+	TAR=$(TAR) \
 	BR_NO_CHECK_HASH_FOR="$(if $(BR2_DOWNLOAD_FORCE_CHECK_HASHES),,$(BR_NO_CHECK_HASH_FOR))" \
 		flock $($(2)_DL_DIR)/.lock $(DL_WRAPPER) \
 		-c '$($(2)_DL_VERSION)' \
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
