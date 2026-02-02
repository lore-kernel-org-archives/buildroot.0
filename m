Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A349E7DF19
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 18:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 385DF6077A;
	Mon,  2 Feb 2026 18:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FYIubu7vfwyH; Mon,  2 Feb 2026 18:15:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4944360782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770056143;
	bh=TlNaaoOoy1FycNGNs4Z1LxHJx/QobOr3SGN4xKYS6+8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PQA2SqzbP5yO2rwyOz5SxSH6C9vmbKvvqEYfKLZ6hmXNgGA8tedzPUUtj4kYbidB8
	 qELvnYEvKU9In0glKC3FGDksJHCSY/91GiGNAw0Fj154j+Q8FEtblGBVR7g8tDosW9
	 sM0+IkCm9x/1AgQXf50+e1rPM7MmoBu3teaLfER+r4hy2ae0BbRtXxQc+E+ddrl0FO
	 sArhSzCgRI5/etJqP61bsO2e+Ga0BvulEGgs4pb5FRqXUPItpE7xrqBjCGZnyXDGMW
	 4RUGFcLOmHWpco3/GsaGQh6Nq6TAI9VEqsjXJ3s7PlXISLRxneJ/TH4XJYr/EyOQ/u
	 Kz4lzypLmEejw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4944360782;
	Mon,  2 Feb 2026 18:15:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ECB37F4
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF0C66077A
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xaQuhWxeHDa for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 18:15:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AAF14607AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAF14607AA
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAF14607AA
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:15:40 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4801c2fae63so36277385e9.2
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 10:15:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770056138; x=1770660938;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RmjvzmM3ep8bRQyP2YsmLNR31WtJ3OGVUPw46vt4/S8=;
 b=bLAjuhH9kgWGGQzCHJ1hwBtLsTvwX9c7fGvlvDqBmK0KFz8cnWF8MAX2zjsKNUqTLb
 PiBGyLWXnThaQ/jbuOLLSz8SPc353u/cFtou+ZHfnLj/8ZafM75cesG0f2pSuZHhU0lD
 TFqBVfSFEe4wqVEesuY+IQ5pY4codpCJ9PvkIQ9ufxG6Jc4bPoQMSC1dP6U5SwLn8q+n
 GhN+8oFnXbDtruFRgm8N9VwIZvGFMUm2HgD7rvnNZW30LOyT5TYtE/UEvfMJl/m8l3BT
 or89U0ixi8ZQuN6Kq4uQosx/9a2Si2d1spd9SJikfiibk/hsTeiq1dMKiyou86unj/r5
 9Qog==
X-Gm-Message-State: AOJu0YxxxFLAELnXOy9AmDjsV7F+Z0xtI+dDyJt3pLQUrpw0BMEzYJAi
 +ziY08ky7PanuBss5r9C28DXRt54IoKIHb+lzokohudefCNoNJIetYvVZgDkEbz7GpWPFhFi37N
 KppQjy9w=
X-Gm-Gg: AZuq6aIPZql8dmSReEuG36+lek95ZELo1lM84X8+O4DtMeioPS8baL+ENqS6JkK9fCN
 CGZ8wM1xQwYi7mqDeoDVMtfziTTrEp3qLz1DFuV1G/PNfsT1yZNOQVUTKxjqXStdMtZCUR1pXgV
 d8jQq2lwoiBG+sf9S7Vm9hMHSfF9kUylVOUGlRvGVS+L3XaQXzpPk/8ghQz0PEkwdGrZRdMlHbG
 waE/sB1ED+2oKi6qyDu9BIEEbIY3xNHb8+UD9iu0r2JfSN/2gh71obzmsPaVBSzieEHAtWxs+jT
 diJEQt3pHY8/WyvIuqqA+jNDx+TlTtxuIPF4RPZCOb+qKkyJh74gntIZD7MQRezvqQVaMWztXJX
 hB362BYzMbF2CzPj/C01bs8w6Q2gvEZXRlPSfS9nNa5OeuLjpwq9nQaTd6NiiWD8KjPstBvCEx7
 5nQ5oYzHaEkT8K0gz7Quozz/BbJJXzZF2dZtgQBdfu3TkfTxQB
X-Received: by 2002:a05:600c:3148:b0:475:da1a:53f9 with SMTP id
 5b1f17b1804b1-482db45deb2mr158403725e9.14.1770056138610; 
 Mon, 02 Feb 2026 10:15:38 -0800 (PST)
Received: from P-NTS-Evian (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4830511bfc6sm12452415e9.2.2026.02.02.10.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 10:15:38 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Mon,  2 Feb 2026 19:15:27 +0100
Message-ID: <20260202181527.2584850-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202181527.2584850-1-romain.naour@smile.fr>
References: <20260202181527.2584850-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770056138; x=1770660938; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RmjvzmM3ep8bRQyP2YsmLNR31WtJ3OGVUPw46vt4/S8=;
 b=0/WiiO7KDo7WwGTNL/v6aIvII4FmpSFtIzWSLqipkrSPaSdr4ty/LKqUsfJYLYU1NP
 n63wzVLmin4ah8c200SQbG82qxdBRl52KnCA6XS2Ke1RqpJVCWACOX2dHVcf1oikaZf3
 LSmYwUxH6R6jHlxkQqofyXrZ/GNqX+vmkYYLY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=0/WiiO7K
Subject: [Buildroot] [PATCH 2/2] package/python-zipstream-ng: select python
 zstd module
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since zipstream-ng v1.9.0 the python zstd module introduced in python
3.14 is required at runtime [1].

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/12857413941

[1] https://github.com/pR0Ps/zipstream-ng/commit/1e3754cb26a422e94984db38535139c2c92473af

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/python-zipstream-ng/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-zipstream-ng/Config.in b/package/python-zipstream-ng/Config.in
index 2de36dd861..b60f2ebe41 100644
--- a/package/python-zipstream-ng/Config.in
+++ b/package/python-zipstream-ng/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_ZIPSTREAM_NG
 	bool "python-zipstream-ng"
+	select BR2_PACKAGE_PYTHON3_ZSTD # runtime
 	help
 	  A modern and easy to use streamable zip file generator.
 
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
