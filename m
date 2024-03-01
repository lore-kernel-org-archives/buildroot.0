Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4B7C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 13:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5868383438;
	Fri,  1 Mar 2024 13:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pz-NS7GKQ6aY; Fri,  1 Mar 2024 13:36:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30F9483443
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30F9483443;
	Fri,  1 Mar 2024 13:36:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75E811BF2C1
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6401F41DD7
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wTe5Q4qmBjhk for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 13:36:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8808441C61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8808441C61
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8808441C61
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 13:36:35 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-563d56ee65cso3481060a12.2
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 05:36:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709300193; x=1709904993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4zjm09BbWCn6jKtVskmNbCjwfubt1zvpGnXXIr07a/k=;
 b=FVJe1+hGJnVkkZ0wVrxPN7X9dyxFcFF92cGgy6M1oMMhNug7IkkWgGUpLE0RoCJuSR
 3ln4TT6NzIjDjMg0m2wIW3Jn4u2lw/eFH+YoOFgz8eQFURmFtWz/iI7xe7bcmyhSCPS3
 bqBwT3P7aeh49PpYMbIFaRXzRHDmPlT7EHQmUtNdxsY4KlSQPK8ZFfM9IyWRz9oSuu4/
 d8w9riviys0k3N+8Bm/CW+ZKzxkSZAZ3z+/xnoIAtqrT9hkLbRTD42dKgojrb5icWjhn
 9fOYwyXfyfIJSQg7/6DlbITia55RBfcvEBq+P/Jc9u3vC3pRRnNcaclTB7J/dGsbN9dk
 jyWA==
X-Gm-Message-State: AOJu0YwN4hFkPshfD6wHM8W3s/gX7ypORBE1Kk5k2pctuS4L2MZkGSsl
 lVA0ZltWu01T1pA5nbmWaippmjUxc6ejI+T/OT2JDkqLLhgTecmYeL5WTvj40OybmZ/Ul31kXD3
 3zzM=
X-Google-Smtp-Source: AGHT+IFwcckmTWZ/p3fOZuvn3d++Ce6aJ5U32tEi3NN4312JTo/76C32+YqhZzqwYsclbWj9rCfPYg==
X-Received: by 2002:aa7:d604:0:b0:566:edb1:3c7b with SMTP id
 c4-20020aa7d604000000b00566edb13c7bmr141653edr.34.1709300193489; 
 Fri, 01 Mar 2024 05:36:33 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5260:58bc:42cc:9d46])
 by smtp.gmail.com with ESMTPSA id
 q28-20020a056402033c00b005659ea1caf0sm1566608edw.6.2024.03.01.05.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 05:36:33 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 14:36:04 +0100
Message-ID: <20240301133620.3547430-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709300193; x=1709904993;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4zjm09BbWCn6jKtVskmNbCjwfubt1zvpGnXXIr07a/k=;
 b=fm7kefzkqB01DcCE00/VENZ2X2KpaamrDCjfRWLgs4NiURp+0ANeUSM5ceEtQnwnca
 Lsu4fFhtAsUBdq4tJz9dGiBJFBe2/e+2EVsO95b+vQzUQf4Di/fV5wMq9TkODHqbCZ+6
 phtA0N6x1nLSY2S4NyaJ7HI6iFbQJ6siUTw68=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=fm7kefzk
Subject: [Buildroot] [PATCH v8 07/23] package/python-rpds-py: add host
 variant
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts. This package is required by binman

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

no changes since v3

Changes in v3:
- Drop Config.in.host

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/python-rpds-py/python-rpds-py.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index 80670f2e4fde..cee2ff290a4e 100644
--- a/package/python-rpds-py/python-rpds-py.mk
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -12,3 +12,4 @@ PYTHON_RPDS_PY_LICENSE = MIT
 PYTHON_RPDS_PY_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
