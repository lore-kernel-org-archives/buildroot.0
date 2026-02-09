Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6775FEF0719
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 07:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B4938235D;
	Mon,  9 Feb 2026 07:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7y3GCDDcVIj; Mon,  9 Feb 2026 07:07:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CDEB82354
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770620840;
	bh=Zklm+o3izR7sO8NpAjwKiTzbZtb41lNVdDjEidNcMyo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=glO2hQJlhOUJsXt3F9Az9SXtx7y6r7CEVoiPluMXC1lVjUFC90wmOmQnlFuB3Ok/f
	 S5LO7QeFzu5Rv4lY3l+jZyifpqsNVHawNlQy+iTilKdiDc2ZhYFzGnYRB9tsJOJpp7
	 NchNBNYhPxkbt9VzZ4XKtP6aC2ktKWonJnJJOuxtBcPC84Vw0ZAlc2agMTzVDbWpym
	 hGWM7pck6t25oMFRNYOm83fTmqJ3rRjtKeMWFgGZ0hP8m0WPSw/XIuuGQvM6SAOAky
	 RMD+z833EiW6b0dziOb9GK86EbAZzqS+rjJGutcrIZuSlEqbLQc/w/hh9feq+lcAQK
	 7GdtlKLdkCjjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CDEB82354;
	Mon,  9 Feb 2026 07:07:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EACE4219
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 07:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFAE182354
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 07:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kk71zCwvw3FI for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 07:07:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D90D982351
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D90D982351
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D90D982351
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 07:07:17 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47f5c2283b6so38704605e9.1
 for <buildroot@buildroot.org>; Sun, 08 Feb 2026 23:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770620836; x=1771225636;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0hl2gSLkPXAr8fBDnfDiyBWpBmBEvl8yf5L4b248gic=;
 b=OtRFhc0sT0dmShewfl6cBM9YmHOeORdguEkRDGxHdIh+47L7loEjdKgAttXF8qDNxI
 Qa0WB6tTeWGlNUoC1uGi7nzAMYxafi2+p+GfphgIkgXXq2qwxRVB9tuWYFLNp0UB33Y6
 CYY3GovbmClzFjYvZpV9f1hsD9QRTdwDu3O0F9XVau3zFkTq/rm2bl3HAh2gRLS5Dy3O
 Qe2XogsMsSHsm6M1wliegVklysHh+rzD2XZQVFwbeoEVTw5ghPXgJZ7bpJgpw59xKDxi
 Q1sIq0cnpzC5AX3AYeysNcV/2WT6z1vXeVwGfOnxPvgFLwinvQbk88FGG5DJOVAVsNjx
 MyZQ==
X-Gm-Message-State: AOJu0YxFmwA/ryHU0la9+zlX82UiRAeAcjJw3dgSN2Xxb3Ts2JjI28w2
 sFGJ+DbWCAgdN+jcEpU0WSUv62N3fJAfmv4wp1gYa5ms1F+gMqYi3NQ1zWxB0Q==
X-Gm-Gg: AZuq6aLO7EkHvVrfKSskBsuEOZTDELlItdetcyF1TedyKvW7kRUoVj8jCB1vKPdhiM1
 BZrl5UT67BSB2H2fwd94T/gwxgBSQgJH8r2ZNfpGapXrWnU8+Dm0T4pB6IhvfI2hc+/R+bMG4fN
 nALo1VuWYAKPXvCbufno7DJdgMMxG0DfYmeMgKuBa6oSZyJn2h45oVxvOaex3OeY95Mbk+Mie57
 WYD5rqGBviTGgkR5U7YGcBcqRAtPiBdAqt0ZG9k1mehF9Q4OBSoocALM+VSI+0UoSIKYyf5ktr/
 H6N2Y5hOJQ0j7cfR3i8V072NcrJHUvGutghOTht02OYrNZ51vn8YSg8rpAMEntthE1WTJFRveO4
 ZkTXN/LuwLoN3wSNK2f1xTetPawhY9fUAy+CD2vlpdpEQ2ulMbqv8WCG2v9lqERl73BE8ENXu35
 4ht474eJTEV4W5us6P9nI3GrMy58q/0VsEkN05htN/uFMRSXn5qIFsnNmTjkw=
X-Received: by 2002:a05:600c:5246:b0:47d:73a4:45a7 with SMTP id
 5b1f17b1804b1-483202311b9mr158636475e9.24.1770620835283; 
 Sun, 08 Feb 2026 23:07:15 -0800 (PST)
Received: from flaviu-Aspire-E5-572G.. ([5.15.232.50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483206ced0dsm214858915e9.6.2026.02.08.23.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Feb 2026 23:07:14 -0800 (PST)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>
Date: Mon,  9 Feb 2026 09:07:08 +0200
Message-ID: <20260209070709.4499-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770620836; x=1771225636; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0hl2gSLkPXAr8fBDnfDiyBWpBmBEvl8yf5L4b248gic=;
 b=FjkdrTQ3yFYhSCWm4tVa32NGrwd3qeHEzY/yo6yLL56/lYVyQ+QD60ihY21sffmWSq
 g4sgaTTTO21hbn4zJ0rSbWBiA3UrQ7CqB6Y6AmC/zkWU5HVY/+3vv6UXWcO/6RJmoFlQ
 JfEIW2nDk78Jb0V6ksUB1pi3yK/DVUgWI0m/oUXte6dQqn+pJfueefutu0E3rNwo/bcz
 iijfUZerKAg0O22bZqC0SceW1998m2+3IX8BtzMWlou8ywwA1TTYast9Ayffx/7D1Z98
 xi7sVmRk0Zvc3GnfAYbAFZltOlRjO27FCWuMgOKPW/UZ2uB+l5k6P8xofkdGw+uIYD/q
 /lwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FjkdrTQ3
Subject: [Buildroot] [PATCH 0/1] linux/linux.mk: add kernel commit hash
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

Working with embedded platforms I found very useful having the
buildroot commit hash part of the kernel version string.
Building different images and I could always trace back to
any change made to buildroot in between different builds.

In the same way I also found very useful to know exactly which
commit hash was used to build the Linux kernel during development,
so I can check specific commits that could introduce later an issue.
With the default buildroot configuration, this patch adds the kernel
commit hash to the kernel version string, in case LINUX_DIR contains
a valid git repo.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Flaviu Nistor (1):
  linux/linux.mk: add kernel commit hash

 linux/linux.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
