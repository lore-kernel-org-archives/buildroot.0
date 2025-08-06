Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568C5C87FCA
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 06:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A69084404;
	Wed,  6 Aug 2025 06:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xC1lxyVJQn36; Wed,  6 Aug 2025 06:21:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FE9D84413
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FE9D84413;
	Wed,  6 Aug 2025 06:21:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B5C7D79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 06:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 280CA60E5C
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 06:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKkj-jaN3Iov for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 06:21:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B08D60FBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B08D60FBA
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B08D60FBA
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 06:21:53 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-55b823c9129so6300908e87.3
 for <buildroot@buildroot.org>; Tue, 05 Aug 2025 23:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754461312; x=1755066112;
 h=user-agent:mime-version:date:content-transfer-encoding:organization
 :references:in-reply-to:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rLgC4UJnnTq9WeeyJfXtR7ZeTCZR72Z00z2kSuxnkXw=;
 b=WOhsFuvYb0XqiRZ9I04jzHsSG7iu+apw1gsvLr5ysAh/sCkAtIJGfXA3+wVGvbeZCH
 SDEG2wktY/5jlu2OSOqHObu48k+RPJ4SBu7j0xeuHYT+73UD6Rb5Rn56YieloK+KHuZ2
 Uj2Dg26cKyhwBKERfMa7FasTf3fQfYXwLr80BB/k4fV2nnTK/j7jOOXPA5wR0hAUeQAI
 CzXb3jZw6ZCQxqmEyiCuggJXPfGXVVADvD/cqRZF2TeqWUQGs11JRo8U9QbyrwHX9BsS
 oHhY4XgpiuHq2KAWYupRhFEdVzywSShCmdS7+JJ2CQgYwnWT5iOm3FV0X32QeryWOk2D
 q2KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdngos8/u4t0TRbZ+23ZnaIwYC06g6disRwaMyp8KLoAX7s9q5JOEuTz/wZbGcy4rm44U94LifstI=@buildroot.org
X-Gm-Message-State: AOJu0Yy3WICEq8t77bPt62uot/CXHHAbRd+Ca5Eta4I/6/seof3HKHav
 w93+wFy1UvucNz47OACRevFU3Z4OIE97rqOOObQ829xY0D6RdU9o7Rjn
X-Gm-Gg: ASbGncvFht4EP1pvDhuFVQ/80LjbN+97qVkwQVibNXB1JNo2QIevTfq5soXoQTcV6iH
 HDctMKOqN8fqPA0b4d5HOF0LWsBU7IntcAc3TZb2U8iBYZjuMJlKy0Jxk6WMX3Gf8mMToQLPSzR
 GCDoyb/44pIRq1wAiPzPb/SYkPdFBlGuL9lgFRAcP4/znka1XwiSpRu9yyTSv/oO7arz9pcrS+k
 EXilJcyubX2sul1GphFELgq0ddTCJqP62HpD3dBw++t2reFoQCltn0UQakAbuiA2yYOZyrOZLKa
 0DKOUmcf7dbOiwUyNPgv/CSrEMFUvBdf7HmTVkmMfEfNxDVqPaoEFeyzIsUq98hTFJNjgeIXPlA
 U
X-Google-Smtp-Source: AGHT+IGq2xpeFCtkF7WxjSaARTkXyE6PeKxl3k0QUJsekXERHg66wGfqJzDK5ADFnIpxSlWo7nuDcQ==
X-Received: by 2002:a05:6512:39c3:b0:55b:8827:b7c4 with SMTP id
 2adb3069b0e04-55caf357830mr475723e87.40.1754461311724; 
 Tue, 05 Aug 2025 23:21:51 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:214:3500::522])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88ca2978sm2195593e87.116.2025.08.05.23.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 23:21:50 -0700 (PDT)
Message-ID: <73cc9c6b7a9eacfb39f4a831ecf0a9ec7eb2b8fb.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <20250805171603.1296472-3-ps.report@gmx.net>
References: <20250805171603.1296472-1-ps.report@gmx.net>
 <20250805171603.1296472-3-ps.report@gmx.net>
Organization: wires.se
Date: Wed, 06 Aug 2025 08:21:35 +0200
MIME-Version: 1.0
User-Agent: Evolution 3.52.3-0ubuntu1 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754461312; x=1755066112; darn=buildroot.org;
 h=user-agent:mime-version:date:content-transfer-encoding:organization
 :references:in-reply-to:cc:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rLgC4UJnnTq9WeeyJfXtR7ZeTCZR72Z00z2kSuxnkXw=;
 b=Pz670BebQJqOYMOSWrEZg7ofNKvtMr7eKrbVWinzOK3Pk5vmIJLU0mmLYEMUuRJkXV
 e3uS6gJMLAv+SmsiJSckrrvCSvPOPTdZ8/c+Hezgb6UJXIbhhV4fZO7BPMeMxJ0jQRGw
 SOhc1wlUjkmEJvt2K3+hheGV5bPogfrnZvky5EMeAdxmoXE1yPBOX4cxm2M7iZGbJPR6
 37nqaWMqH3lAbamIF98q5FJZcdCHzmLBofjVrchdz3QVmXu8Dshsdh85zUV+WyEEwgzg
 S0Wg75qYUzabsA1jRkVamjL3ZCWmLpsJJtCiuFV6kppd25AIK2VK0wMc+i2A4BEiYPLi
 nmxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Pz670Beb
Subject: Re: [Buildroot] [PATCH v3 3/3] package/ssdp-responder: update
 S50ssdpd (move shellcheck comment)
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

On Tue, 2025-08-05 at 19:16 +0200, Peter Seiderer wrote:
> - S50ssdpd: move shellcheck comment to the line where needed
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Reviewed-by: Joachim Wiberg <troglobit@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
