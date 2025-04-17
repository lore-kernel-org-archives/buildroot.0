Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74882C369C9
	for <buildroot@archiver.kernel.org>; Thu, 17 Apr 2025 19:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBB5C8302F;
	Thu, 17 Apr 2025 19:05:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1C1M2KtZDp4F; Thu, 17 Apr 2025 19:05:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A73983B57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A73983B57;
	Thu, 17 Apr 2025 19:05:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ACA41F3
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 19:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4A158302F
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 19:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ePIOosK8gDfR for <buildroot@buildroot.org>;
 Thu, 17 Apr 2025 19:05:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6652F830C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6652F830C5
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6652F830C5
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 19:05:51 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-7399838db7fso1292609b3a.0
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 12:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744916750; x=1745521550;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u6jSsgCG2i5PgL46RdjQBtA5FIlMPR+peURvivd4fd8=;
 b=v9lqoI1dqXr7y6pkYms/kZ/5GEvO9F4NrZ5RIOkcqw9MJJhY4Bu9+3vc0i80Nt4eNQ
 MAbOiDunJGHzg/pme0UgvqoBtWUPWyvs68BPNb2U5EVphG5+EEzldaCQ0d5sBqxgsUmA
 PvjeoAn+MuSbYomYCtLCnf0cmtAmCYrmT6/7+fPJ5yKLDfDyd95E6km5DpRxEzSXcezH
 chVKUlVzzuaq/lhElaFb4J56XKGcM9lRvh6dOFup73WdM+W40GS89Ag2OrfgvjQQtCpU
 jXNSDMkG1BoGtn2xHlkFNkFUpMutSyUDOEN63xGAC+rVee55VU0EfG7S+PqXRp2qHSZE
 Yt3g==
X-Gm-Message-State: AOJu0YzpDwZkk2C7YnYicPAks1wFPmdLtzY3qN3kiLl66VE/vRiqrwli
 e14LPRzy/wSWykE8TKU2Pkm1dCDBljNiIxd579gujr0GLKaXMMDWIHOEvA==
X-Gm-Gg: ASbGncsuxx7Wcw8a2xlbGJDWJ87FbT7u8nCgjCULx1qGd0qehW2uSYWmwP2r/c0JIHl
 gshc4QoDG762uDEcBP292HiUUo9fgQB6LEWH5hrdYWSVBeQS7JaUMcbRoXnsJglrbVAcHHtXO1r
 m9ChH6K5Q1lhvrFhD1Wltfe1blQ/2bI7815JYBuDN1uZ9aXf1mlaJRDbEBZ9lpnV7AuQqwcJzi4
 lwteVzphvG3uwdJ14viY7Rp8CKkLzpr8q1GIDprBPWTsahxTPixsNyg1171Mbj2O1OpqpbK+bsL
 AKaDZjgpmwob07TDGPl1aQ==
X-Google-Smtp-Source: AGHT+IEcmFmPaj6EwhMJTWx1NRJ7AkBVTZiVxYtnrRpaeX3u7GEQrobAQaJ8SyQrvy8Gn3dGzbuPCw==
X-Received: by 2002:a05:6a00:3cc3:b0:730:9637:b2ff with SMTP id
 d2e1a72fcca58-73dbe958121mr1164692b3a.7.1744916750421; 
 Thu, 17 Apr 2025 12:05:50 -0700 (PDT)
Received: from ProgramPC.bm.local ([76.8.199.226])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73dbfa588d4sm217076b3a.96.2025.04.17.12.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 12:05:50 -0700 (PDT)
From: Lance Fredrickson <lancethepants@gmail.com>
X-Google-Original-From: Lance Fredrickson
To: buildroot@buildroot.org
Date: Thu, 17 Apr 2025 13:05:43 -0600
Message-Id: <20250417190544.1075310-1-lancethepants@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744916750; x=1745521550; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u6jSsgCG2i5PgL46RdjQBtA5FIlMPR+peURvivd4fd8=;
 b=fXUYXn4spnkpFVbKxmKA2DijepxjqQvl5EUzS/NtL+9eUSp70q7Q7Bjsi6T4sbZNad
 AWa7BKWuqfvbgyud+RCMiLSRw0jNKjpSKAB6gXY87MxzDLkRKFv9QC3lBp0ts3WUpBc/
 Jy3WNYprSdG0IOzzD/xST6Ivt+cy3l5liRh0E9a4qeAT3UtLOzRI3XTmcknedXqixMtW
 6Xr8oBAiIk547yvgXn4aB57T1xLmEZox7q/qwZuTkEeTgTLSa/1QmA4/orW35RaScZSA
 4lTxdaH/wm/hGTp3ywzOyhECNSoc/Y6gsgKhUNynuoRv7BIwAXN4L006qO0urOO7ALuQ
 TMog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fXUYXn4s
Subject: [Buildroot] [PATCH] package/libcurl: Also specify the CA bundle
 location
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
Cc: Lance Fredrickson <lancethepants@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Lance Fredrickson <lancethepants@gmail.com>

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
---
 package/libcurl/libcurl.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 2066ba0388..509feeab64 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -67,7 +67,8 @@ endif
 ifeq ($(BR2_PACKAGE_LIBCURL_OPENSSL),y)
 LIBCURL_DEPENDENCIES += openssl
 LIBCURL_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr \
-	--with-ca-path=/etc/ssl/certs
+	--with-ca-path=/etc/ssl/certs \
+	--with-ca-bundle=/etc/ssl/certs/ca-certificates.crt
 else
 LIBCURL_CONF_OPTS += --without-openssl
 endif
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
