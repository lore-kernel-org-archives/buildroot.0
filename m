Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1CFC27C79
	for <buildroot@archiver.kernel.org>; Fri, 14 Jun 2024 16:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE1C440AF8;
	Fri, 14 Jun 2024 16:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ud-soGFuXRGD; Fri, 14 Jun 2024 16:22:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47B5941588
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47B5941588;
	Fri, 14 Jun 2024 16:22:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57D531BF326
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 16:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9322B61106
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 16:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQUFm_cM_QK3 for <buildroot@lists.busybox.net>;
 Fri, 14 Jun 2024 16:22:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8F2C761104
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F2C761104
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F2C761104
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 16:22:01 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-421bb51d81aso19107185e9.3
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 09:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718382119; x=1718986919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1qHmfyMQyHHiP7Bc38rFkKJR8BAlpvBmvc+7+tTOCbY=;
 b=uqvoCr2Ko6Prs7jxCdfplcr+JwRGvvTElIVrC9XVdBFvhsHpPL4DTBaZZAHypuKY6v
 DZsjop3Q3gAAg71nzzmdByJiEmNeLxOLpdKAcDgQnwR74C+IjMeWxvSck6JjjVSyWUBj
 zcwci4+/TibSXbK+U636pjR6FNxFwnfHpDwckFjj0jpIZIV7lSgNF7cqciYNH7xdicr6
 VEpiH0A5c5GRCfo2yfbhcp6sp8O7GXe/hTDoq/cEpzfQKfAe4iZ0iv/rLDsz2LbuzT4+
 Y9T6l5BI3XL4pp23FyoS5RHRQ234dIVHYgoPhWdTIqZQ5CwqLMH5fLTju1g4eHypJbEH
 8yPQ==
X-Gm-Message-State: AOJu0YyYEmBtGR0LCUfzlw+7Hw0T1W2Fp7l6aMDsfONjDQ3KfWSIiZ40
 Kf02m38xwgO7pHiW0iQ6eNHqvjFswwIgnAVY5CDL+WiNvxp2qUJkddCu5A==
X-Google-Smtp-Source: AGHT+IE8ZlYqvLlvt9EJaoHTWBRTW6KbRujL92ZWD5bKN5WQ9LR2S1QJmJRypycF4P49TJUeX312Ww==
X-Received: by 2002:a05:600c:4507:b0:422:1446:369 with SMTP id
 5b1f17b1804b1-423048228d1mr23508275e9.1.1718382119267; 
 Fri, 14 Jun 2024 09:21:59 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f612800csm67133175e9.28.2024.06.14.09.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 09:21:59 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 14 Jun 2024 18:21:53 +0200
Message-ID: <9e97f8655ad7d22ce0b8fe35c1096fbefab528ee.1718382114.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1718382114.git.yann.morin.1998@free.fr>
References: <cover.1718382114.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718382119; x=1718986919; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1qHmfyMQyHHiP7Bc38rFkKJR8BAlpvBmvc+7+tTOCbY=;
 b=dfWy9eWDiNhO8qLrnNDzfAjzW7eFOfxIEhP/AMJeLIHmjV97oj6KocyRUGjLfR+KcA
 0iOdm0UobJ8prh3u9PmfWREiRFEMrndl1aEgLM4FghvZYQacY0WrZVzes37N2xnxe3L9
 kG34jR5u6RLd2UrwfLaQDzPJ7FjbWQiRlvKibYx5O8Hf07CA11NFUVhcj2X9NsQx8JH+
 +tRZhSTaZ9WYDS9IL+e1zv1r/BBypRkhQzqvrpSrSy3gpYOmwB5Mok0h80wl3vcdkV4w
 cvFt0+hffKZ76rrOLQAylFfOiTdFsJ57llNJGx2/NblIN4dTb4greNTh7TE9Tk9fX+ru
 7BjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dfWy9eWD
Subject: [Buildroot] [PATCH 1/6] package/sentry-cli: needs pkgconf and
 openssl
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
 package/sentry-cli/sentry-cli.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sentry-cli/sentry-cli.mk b/package/sentry-cli/sentry-cli.mk
index df419f81e1..3ddf5e44fc 100644
--- a/package/sentry-cli/sentry-cli.mk
+++ b/package/sentry-cli/sentry-cli.mk
@@ -9,6 +9,6 @@ SENTRY_CLI_SITE = $(call github,getsentry,sentry-cli,$(SENTRY_CLI_VERSION))
 SENTRY_CLI_LICENSE = BSD-3-clause
 SENTRY_CLI_LICENSE_FILES = LICENSE
 
-HOST_SENTRY_CLI_DEPENDENCIES = host-zlib
+HOST_SENTRY_CLI_DEPENDENCIES = host-pkgconf host-openssl host-zlib
 
 $(eval $(host-cargo-package))
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
