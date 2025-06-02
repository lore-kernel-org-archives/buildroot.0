Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1782AC54FB3
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 09:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A96EA811B0;
	Mon,  2 Jun 2025 09:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xx0s8zh-fJxq; Mon,  2 Jun 2025 09:29:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE44F811A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE44F811A7;
	Mon,  2 Jun 2025 09:29:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 56D7A1F7
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 09:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4826160E32
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 09:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXi73AXMo91v for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 09:29:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8594F60DEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8594F60DEC
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8594F60DEC
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 09:29:29 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so7748925e9.2
 for <buildroot@buildroot.org>; Mon, 02 Jun 2025 02:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748856567; x=1749461367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IBqj7b87f3rRc1hbwAT+bnyPSl8TAUyGIKLA6lNL8r8=;
 b=oESaH27OTD5IkEBCB5AEOZsXeya1Is3/STzD4Usqhkx0tC24/vDicag9KXdFw/S9LR
 ClxMiioMRVuyy63RLPwPcim4tgynyFS9zVc12146ZaxWo9KKvydmyxw1VMc8+4Pd+eQo
 lo6a8rUYEtxSdAJg2TXZMsAJPk+hU+VdP7GLaJFqHVkZgkYB3pNZDHmzx7REIqa5Pg2Z
 qvxlCBuSSHCP+Spzhsn4CebQXC+WT/oOH5EcFdVX2ujOi0JnOkpFbsPSH5V3LBc4nFka
 VOWsIz0MovBNmvXftRcrTJBdGno+p74ZYG80QNbF0FWjHWcuHNajDrrlS3nXO/Q1haSn
 qdrQ==
X-Gm-Message-State: AOJu0YzeuTOxqAiREvZ7fe3tFffsNwOTIUjtViD7AOn8uZjBNH4myTSK
 gl6NCdA0NTCmmnM1M3+SSnc8nb5qC1UzVlv5+R8a7YtvUd3eoo4YhplFexUkgDHPipUHQcSVDU0
 8SEBX
X-Gm-Gg: ASbGncveJI2VQson4f8vvgaX8WMOsIbFLrQBE9cF7qxSHnhdVTcDxGbw9ZIsct7Y0Kr
 YoNYsrobPv/yJYrrgfdQwSqZuEvBBBPHxqQqUy2sCWHq2lfSkHqO3J7AFIL4Lw6lcpgNC9lVuvv
 4n/xDcZourDK1KwD9YtlA20Yx3E0Wbeedvt4WoQYFRwukU5pN90N5m52CLWZzF8xJP4x+C+Hced
 4Ny4FGIm6XpRMdnIKY1EKcy78hEXAWwXifvPGeeornZGNKeVpyICHpNkjzpV1rcv+L2DyME4OOh
 HFdYyyfUtBIEbqK6DxwTra25QxtJs29JFjNhMVG67gqub8ayTm7xUkbEF2jr4rdW+ZvsRZNbcAw
 Brx4uewI653KZ9UFbJf/nZAoraFuFTrFgkLpuow71+EBGe32tq8UW3pl6
X-Google-Smtp-Source: AGHT+IERwHgLh1pMlj8PQe1Lg+GlOk2Qgk9K4950YUqBTPPpUKyYyqil/rNyRBRNe5tOTp7g4GNGbA==
X-Received: by 2002:a05:600c:3e06:b0:43d:b3:f95 with SMTP id
 5b1f17b1804b1-450d888b0femr72415435e9.28.1748856567113; 
 Mon, 02 Jun 2025 02:29:27 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f009757fsm14316229f8f.78.2025.06.02.02.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 02:29:26 -0700 (PDT)
To: buildroot@buildroot.org
Cc: dalang@gmx.at, joseph.kogut@gmail.com, romain.naour@gmail.com,
 valentinkorenblit@gmail.com, El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Mon,  2 Jun 2025 11:28:54 +0200
Message-ID: <20250602092854.19981-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602035936.904546-2-dalang@gmx.at>
References: <20250602035936.904546-2-dalang@gmx.at>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1748856567; x=1749461367; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IBqj7b87f3rRc1hbwAT+bnyPSl8TAUyGIKLA6lNL8r8=;
 b=K5gecfm7t0JS+Xubjwx+lBES7hCfOYl43i1l2KiSjOP7V0Dcq6xIV9cuZvV67CFhjp
 rHGRatCBXo7AOmvxGt4t6ZjpuE0CSi6nQit+NGBo1jsTrqVSOkUGxpEvABRv0GUioeJR
 MrZivjtPg22Yl0S+njPJkxlEkrrNxhhPduduA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=K5gecfm7
Subject: [Buildroot] [PATCH next] package/llvm-project/clang: remove merge
 artifacts
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Daniel,

Thanks for the correction!

Reviewed-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>

Best regards,
Mehdi

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
