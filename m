Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A38E7C719
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 12:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA63880D86;
	Sun,  1 Feb 2026 12:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w18UMKNcwMgv; Sun,  1 Feb 2026 12:40:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1CFB840C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769949626;
	bh=n1bluai7d1EawXZkKPPYxWi2Awf6SBN6Aa1uBJkK38Q=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TWKwKrN7C+2/v6oW1R7QEH5qpla0NvuJytSp3wf/RxTyFdpFk4hG2xbtMXyYR9BMd
	 y+9CWyqxvrOkNb1S2nGZKUfivoxdDN6Yiq6pi6VFNbZZkOqwsB7+FYqd+8vJetU72F
	 vnQ58d1ll7JNOberuaqQImK5XZCoyeGUWTKRUb+tKcD1riqyfykL++b1QrTbUJqHKS
	 PCBF5Om/zStsEcc1EhHAa5L6opVVM/t2v1bhBPa5sKRShMgtds2NQC9+xcuZVtW67h
	 zikzOu/Yr99feO7u57FCOid2f4XR97XCXY/+8jUW/5CLVatPYO88GF1nzwxEsJuD+q
	 gp+T8SRMHz7EQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1CFB840C4;
	Sun,  1 Feb 2026 12:40:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8858D1E0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 12:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FD31840C4
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 12:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hvg1QNdS0BCe for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 12:40:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=fvb@funkworks.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC71F840C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC71F840C2
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC71F840C2
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 12:40:23 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4806d23e9f1so39736055e9.2
 for <buildroot@buildroot.org>; Sun, 01 Feb 2026 04:40:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769949621; x=1770554421;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+KbkPAYMPce+vj0xQ3GKsrYBJF5MF+bqFfwbWHjux34=;
 b=PoEawzE62V3lCkbiZniNPM6v7HsaIKVc3HWEzYWlpsQxIOMyRenHncLPhFRMzlCqdQ
 kEywi41KBs2RVN13wS7rY7P/UpRqxyIBGtlJ2I6HXtiSQ4+QBesSaT7HwhtKMPizWUbg
 CU7Q2IeMaRNcPx5zPb8vf2eUl8vc/kQUFBYUbfqJJIsfhqgbLSw7oFWy6Zdy5Nvca0zk
 T97mY7F3n7le3V13rO2GIxEhLM05qMZdo/inGgIYn3RZfzHPEm0mn/vyb7xmcGJfxfRq
 uK9ttEyrwCwxQbqrom+8TwjT7hXRUd8ieEha2y8cJ9jfBRffqJ3qpVSpVKAkJJZLKj9J
 r+2g==
X-Gm-Message-State: AOJu0Yzzr2nAEHz8+8Lj10WJs0qRctnDiBdAojqufZIfC0SzvJo3jSRh
 20EYdNSRrJvMha00eAKOxuEHckqNBx5WgcrptJkB+oeIysaznjLxKiKKnT1p7f79sUjOzhsWtep
 kFE3p5LkM
X-Gm-Gg: AZuq6aJEW3IMitsQ4jaiIP9ObnwSpkiqofAD5MTBWxQWOTwfNvXDWV0SjYFNmwtOWFm
 4deQRUYe5F79xHsoye0CBeGZ5cw09mxRGQhaNgp/XhZuYvhEzdES4BtNuDXVnvgT8SmxJOf58O0
 9RTtKYn95E3RC691rPaXNwtFOUMKpJb9A6A4m5EPCCv/GTSY6YJ/pwRmiB7NPLLXxIYUSvXcTUV
 gUSOBsGtG6GSZDSA6udthUDF76Ql1Vc4muYpbL5qLK7NZ0txXGWHkRyrMsCZXQGEvmq7zwmR5Nn
 wU89+O/mPwqK0dSqXvT4PX5dUUxwuHox0Ef6uX0HXLMSvUrEsglUD6Rn8vpfEutl5bU0C5KeonG
 WrHZhG744rmF2VBn0sn+9T5HbTMml8LoqdV4YrMzhyPEeUhPyRUvD9JK/kPPCIH/lKhBJVPTbrl
 IxXdAXU3Lw17L/
X-Received: by 2002:a05:600c:34ca:b0:480:3b4e:41ba with SMTP id
 5b1f17b1804b1-482db48d595mr98625645e9.18.1769949620909; 
 Sun, 01 Feb 2026 04:40:20 -0800 (PST)
Received: from tank.fosdem.net ([2001:67c:1810:f051:684b:abe9:4733:da16])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-480705956f1sm289923455e9.11.2026.02.01.04.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Feb 2026 04:40:20 -0800 (PST)
From: Frank Vanbever <fvb@funkworks.be>
To: buildroot@buildroot.org
Cc: fvb@funkworks.be
Date: Sun,  1 Feb 2026 13:40:15 +0100
Message-ID: <20260201124015.29808-1-fvb@funkworks.be>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=funkworks-be.20230601.gappssmtp.com; s=20230601; t=1769949621; x=1770554421;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+KbkPAYMPce+vj0xQ3GKsrYBJF5MF+bqFfwbWHjux34=;
 b=UIwylCPucCoBg1zkTH2KhHRyNktiFIyyQ1OmzD9140Oevh+dQ1KtI3hpeQNYIYGcQG
 VfZ5X3lEr6gsmAWbGltLNE4ug+a4nncQoak1yuITUjtWVoHiSSl7xP/+dllr1Ce01bPw
 2RXFx72G/zIU9e98ZhT7foha2ZYLWQ3ij3vXfc0AMQB+FXEnnHBzeFlSut92MqSWaDnB
 Nz4PiIcQ7W1k2TVnABByYdezAVULVcRKtpljCH9jkBLSYcq6SCG1Oi+xsclD3b7icm7z
 jAPuE1JkmBOi9y/MmMWv3ghF6c0Xznsz0OpwbXSRE0ZE+387h8X+JkH5k7RXjz+EHgUe
 rkLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=funkworks.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=funkworks-be.20230601.gappssmtp.com
 header.i=@funkworks-be.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=UIwylCPu
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: update e-mail for Frank Vanbever
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

Signed-off-by: Frank Vanbever <fvb@funkworks.be>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 08c98ec53b..aff26f8012 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1218,7 +1218,7 @@ F:	package/sane-backends/
 F:	package/upx/
 F:	package/zxing-cpp/
 
-N:	Frank Vanbever <frank.vanbever@mind.be>
+N:	Frank Vanbever <fvb@funkworks.be>
 F:	package/libmodsecurity/
 F:	package/nginx-modsecurity/
 
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
