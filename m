Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E460C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 14:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5D8E610FE;
	Wed,  5 Jun 2024 14:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIkX2UFjmh2T; Wed,  5 Jun 2024 14:18:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75ED3605CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75ED3605CC;
	Wed,  5 Jun 2024 14:18:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7969C1BF23C
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 14:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8890A41867
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 14:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vjonUmQ7BM3Z for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 14:18:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7FEE3417FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FEE3417FC
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FEE3417FC
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 14:18:22 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-421208c97a2so60363875e9.1
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 07:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717597100; x=1718201900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OIoktNVsMZgfcGdwdgXzE1r+gnrRJ43JujFCTZw2e04=;
 b=g1Dv47nAsxbru9As6+wg3NDCeZSfwezW2+PZUHGlIc/67YlDbjeGM1bzpOGvX3F0hw
 i+PWqseOHOc0AY0sPgPl5KponwXRFUAVdWedWmHcuciLJA1LAppFt6zrLTWywC/ux1hx
 lTT8RvJF903WlpAN+mKAN5iZx1eMpzRzOdabz/t8lb/hcKBWP2zjAQo1ROb+7J5Vf2ev
 +kXMsnGGQHbV75hQ2xJYuCzzkbpImxK+2xaKdc/QM44bdHV6weZVoQV5/uKaJXFvlbiF
 D6cUU/EI62pN7tmVCL2gF9QdcV7NgsnWPw6N6OqFngUTthZAb+ZjE5oVpcMInCefepMf
 7dLA==
X-Gm-Message-State: AOJu0YwbOiebjOPYM647+CN8f0lqx/HpzAgt3FZRPLvPzvU5EysxudpX
 /y45/rP1Es3EvFB63c+4F1kLaTHLTa3Cv0Kp5Hs1x7vUNxE0DCmJqfYK+g==
X-Google-Smtp-Source: AGHT+IHQCEMVi4UskaN9cW3AOToGzeh2h7KTPurs3DRHE/EGuyc8MPQ4Nu7iSEYnJM3VpWuhHYtPCg==
X-Received: by 2002:a05:600c:4f0f:b0:421:2a43:6518 with SMTP id
 5b1f17b1804b1-4215634cc35mr19505535e9.33.1717597100561; 
 Wed, 05 Jun 2024 07:18:20 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158149057sm24253925e9.36.2024.06.05.07.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 07:18:20 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 16:18:15 +0200
Message-ID: <a01c2e3aaf6f5814195aa17dc00165f153833f3e.1717597094.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717597094.git.yann.morin.1998@free.fr>
References: <cover.1717597094.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717597100; x=1718201900; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OIoktNVsMZgfcGdwdgXzE1r+gnrRJ43JujFCTZw2e04=;
 b=V5y3SboEyWpt9Ytthtwnl6n4WTTFpy0RuuywZqyoVo6CVm7jsL0OJP0sAt8VpUpENE
 tfwehcZxTEB62Vhx4yEbgG2o4Q3LXYiVQTfrvxlVXi9dX0GKQi5y1spEFgf4gwGby/iU
 J4RqyHM4kE02nKZ5RvlNrxgod+PKcF3G2S//6D9sSDyubVahY+SsuV/LFIUe3nuuwI5Y
 0eyNr3ReoO0k9QeaGbNNqy7NJerBKxKw8LGk865+ZK8TjhwDKV7TmzWyz+YRkA9wW2wz
 j+Jyuzmwl/zEQZleJdhXqz4dQAloMnyZOdnWRXd3eDCvwMegUe6m4n6PPJt+58AB6LGQ
 OAeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V5y3SboE
Subject: [Buildroot] [PATCH 7/9] support/download/cvs: use appropriate TAR
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
 support/download/cvs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/cvs b/support/download/cvs
index b771caf280..a6840fea7b 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -68,4 +68,4 @@ export TZ=UTC
 _cvs ${quiet} -z3 -d"'${uri}'" \
      co "${@}" -d "'${basename}'" ${select} "'${rev}'" -P "'${rawname}'"
 
-tar czf "${output}" "${basename}"
+${TAR} czf "${output}" "${basename}"
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
