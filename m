Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C315ECD3430
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 00:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5184A409DD;
	Tue, 19 Sep 2023 00:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5184A409DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z22tqA1i1Xdp; Tue, 19 Sep 2023 00:33:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B4FB41691;
	Tue, 19 Sep 2023 00:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B4FB41691
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 901451BF95F
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 00:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A59441691
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 00:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A59441691
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XZsAhELsL3zC for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 00:33:43 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9D1D409DD
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 00:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9D1D409DD
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1c572c9c852so11364635ad.2
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 17:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695083623; x=1695688423;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FMarpmc1VCrFaAgo4vLcHsFgWLO1VN5KUzKwmdvLsGw=;
 b=w7GfcO+/PMPm67YS8gQ8O/sebRZVXHQlwvmp8u93gNoV5fQegLCQ0uu7O00oH/ZJGF
 iJOHZ4i+Txu7SXt/jdgxo5LqC8Ynf29vKbBgLCbpu1j+AvEQvzzXCZ7WZb2yZhArYdZS
 gqUWrJ6sv5UjWak4aDt1UBZ2rXA1wOYrBiR8cZ+iO6p4xHVZJtYHkcxlkQzlYNckTvC3
 d/XDO/x46GnWqhoIWUjjl0GH5enDhCB3XEIx2AN9Py/qvIZKhH01TGdlas7SOg58+wK1
 QGjNMJbcpJPWLQN9X58mQz4FqSVsqUnG0d6k+LJpNj3ITmp3VT6gHeBd0x2orebHZbUt
 GbwQ==
X-Gm-Message-State: AOJu0Yz9ZV5UPrbXSZD+0FNcnzOisQq77ODl/mvXtlNqFcMHKHH3F7G8
 wrgcXIYzOc9YMnvMJ4j+87CtFnrB2JNFts+1SRggJQ==
X-Google-Smtp-Source: AGHT+IHpmiKNhrwWNX4TIMFDazy1Xk4xAt4FDRtpiH53sm2FyG/Ha1xuC4OlPecW91OUc2wplO0hkw==
X-Received: by 2002:a17:902:e891:b0:1c0:d17a:bfef with SMTP id
 w17-20020a170902e89100b001c0d17abfefmr10661532plg.30.1695083622847; 
 Mon, 18 Sep 2023 17:33:42 -0700 (PDT)
Received: from Adam-laptop.amarulasolutions.com ([172.56.200.164])
 by smtp.gmail.com with ESMTPSA id
 iw13-20020a170903044d00b001c582de968dsm1558001plb.72.2023.09.18.17.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 17:33:42 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 18:33:31 -0600
Message-Id: <20230919003337.565432-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1695083623; x=1695688423;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FMarpmc1VCrFaAgo4vLcHsFgWLO1VN5KUzKwmdvLsGw=;
 b=BawqVTOcI8g9AAgzeb4gSUYUUUpGYlR1B9VHOWznArFPvc8Z07adBMaQaNwe4kpwao
 ltPgDkz6UC8C/0GnYgIa2dqpo+TPYr3w9JItAspjyEnvLGzdCYTECoYHqFzb111mtMC+
 jVlQqjtzsSx8HMWfYUF8Tk0V5SJ2pcTJgDeTw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=BawqVTOc
Subject: [Buildroot] [PATCH v8 1/7] package/python-httplib2: add host variant
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is needed for the host-depot-tools package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/python-httplib2/python-httplib2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index 1093ecab39..2f4eb98356 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -14,3 +14,4 @@ PYTHON_HTTPLIB2_CPE_ID_VENDOR = httplib2_project
 PYTHON_HTTPLIB2_CPE_ID_PRODUCT = httplib2
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
