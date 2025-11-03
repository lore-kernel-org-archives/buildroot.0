Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5FDCCFA03
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 21:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2CF3406F0;
	Mon,  3 Nov 2025 21:12:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZRKjeNtmLh_i; Mon,  3 Nov 2025 21:12:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF18C406F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF18C406F7;
	Mon,  3 Nov 2025 21:12:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E5F77462
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D63BC60A68
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7A0GPjaLAye9 for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 21:11:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1081E60A64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1081E60A64
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1081E60A64
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:11:51 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47112edf9f7so39547825e9.0
 for <buildroot@buildroot.org>; Mon, 03 Nov 2025 13:11:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762204310; x=1762809110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FW2MNLeJA3sS1VhtA+D0Z3GBCRtSC9A6nD+lmubwOWs=;
 b=jnEfT6nASmLcuMMDq6OVRENsehzQGm1hR7kajoWcu2XnH+sh18OaEZWdI/inpe0CZ2
 HJBV5aMbuotnc5ad0JJP+c4zAsxdgX/F1zJpch+IBV4S9wFHaQS/JahIpoTV6bApm+Ey
 SFmGsme7ui+9cormct68nKAQJCDh4PprU/86k45jWVXsdtZ83Cd5CA3KqrLbhWjFt709
 6OtaVTIAjw1NWvrxW3qviX9Y71jq8/1ra/yM5fEgUdGrmpjIWpf+JXx6PwW7vt5/+0Ss
 hzF8g0JnDdaZpLDXhbDRdVYn+to7lEIkhwFIW7xGr2ks9wL3zvt4FRABRo9bLkNPKYMj
 3h/A==
X-Gm-Message-State: AOJu0YyF/P+0Zmk4dagmFoenTEBDtm+JgTJ6C430ps7lZLpJpFsb8nkL
 9oLHB7o5s6/kBwq3Qs4E2IMKDtdbbmR2Fe1dcM6+gSuXAfgdqHt+5Ne8JihyxAAzvh4d9W7RLKd
 XsUAw
X-Gm-Gg: ASbGncvVEr8t52lPAvTQ0QooMbfy9lhxuWu2MhJuvT5buvREklJ2xUt4PssG/V7kYVy
 5AV19qxuQI8v04PD6GXQorMn0Gk1AUYCnfQzxKfih0UE37uSm/iemE9oWDGMYliljQwanOLzodd
 M6MSqTO+HanGb0WaWuV+quEHAiJ2WFGmQYPHaI3BTcliKKfBYRpYbAzm02YyRZzUn/NZxGZWxjh
 0e03yDMVPjh/DgZ37hZYtTIBOWzVXMkHLUBY9FMyPtFqX0H1GOpu+T8YKe99xoWr1WRxdKqcnX3
 kvrVoVPtWCrEZxJucGxEmYQgdEmfYMmXN9J4ZimFIIDtJM1wQrfnyWyJd3lULjXMa742z1kEnFe
 7NFEIRHJw28hgc5O4+kYxelyJXNJ92RNefrC6f6uEj6I20KRDLTGK32tCFUKYjx3QmSMXlueX3V
 1j9etNRyQaczGEXjLkcZ9mpPhkQQ==
X-Google-Smtp-Source: AGHT+IGieG0RzG2yDSF6x8luUBugDAeu1JtmNn111I6zcV6k2dODcg78INMmUvO6nXr+zv8jTXaIaA==
X-Received: by 2002:a05:600c:470c:b0:477:bf0:b9da with SMTP id
 5b1f17b1804b1-477308aac1fmr136391485e9.19.1762204309826; 
 Mon, 03 Nov 2025 13:11:49 -0800 (PST)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c383b45sm179630745e9.9.2025.11.03.13.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 13:11:49 -0800 (PST)
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>, Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  3 Nov 2025 22:11:45 +0100
Message-ID: <20251103211146.57344-6-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103211146.57344-1-thomas.perale@mind.be>
References: <20251103211146.57344-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1762204310; x=1762809110; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FW2MNLeJA3sS1VhtA+D0Z3GBCRtSC9A6nD+lmubwOWs=;
 b=S3Mpct+Ly1+T4l767vr1B5YZV19fnMmN3AheYMnnolWxzVexCJhSLjZoN1ReOiJ4Jw
 /ULEKiLvJPvgNlkcQIlVxyHSst0ngDtA2+kphplly1Tm3DZ3CQfLe3yI0VL7ZEnpWG87
 Y8pyUl79zyeiHAQDJi9NEVHciSjDeitw4eRXTRKd2H7KU45jEKyP98MV4ZZtmO7pCNpE
 d0cXoRQM81Zaoq6RdLfTotbpS6dWpUBU4jhvx/3A029WdppQuDVcdI5M8AgvBJUlnWfe
 uHr0KQNoGQvTSqrfpZjg2PImtvrCaoV9PQBfWX08O5SQ2m9xwhr7H5uO3QCywAI3BnX/
 5CwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S3Mpct+L
Subject: [Buildroot] [PATCH 5/6] DEVELOPERS: add Thomas Perale to cve-check
 & cve.py
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7c2967f41d..a6ecd2b1ff 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3205,6 +3205,8 @@ F:	package/xorcurses/
 N:	Thomas Perale <thomas.perale@mind.be>
 F:	package/go/
 F:	utils/generate-cyclonedx
+F:	support/scripts/cve-check
+F:	support/scripts/cve.py
 
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
