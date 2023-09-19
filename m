Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD35DCE79A8
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 20:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F5DF83417;
	Tue, 19 Sep 2023 20:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F5DF83417
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aRmjJCjlTAm3; Tue, 19 Sep 2023 20:43:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8B2E830B8;
	Tue, 19 Sep 2023 20:42:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8B2E830B8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 262071BF20B
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 20:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C5AA40C01
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 20:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C5AA40C01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fQ-NxbXv4cgl for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 20:42:57 +0000 (UTC)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6AF3E4039D
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 20:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AF3E4039D
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-57790939a2bso4246154a12.3
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 13:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695156176; x=1695760976;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FMarpmc1VCrFaAgo4vLcHsFgWLO1VN5KUzKwmdvLsGw=;
 b=Vtqybjja4vYaRuh6QZYtALGTRFER28+uLF3TiZi5hqe4r9qmvC8zEVmMxS5l4+HGZT
 muyEOsRN2jxWXK3Svue6PjbQS+vKMkGM/mwk/mgpP9QrNFcvy5enEQOsN3R3huHK05s0
 WYAxDxFAGQU8lqcm1VRbHPhuke5AlA9hC9BemfKWKs7+nA/lZ9hxemPsjrOFJPJTyedL
 e7gjJMet+QwAuHc0yLh+AJ2SPh7SQVPh6QmTdKOCOJ/t0LNGIhuiLoOl9zbUZKAQ0J76
 ZHtBcqM6NYazAqZ5TyORScbN6XKQzkA4bo0WH+0l8pdMT3GNfff74VISJxanug5c2Dh8
 Ltcg==
X-Gm-Message-State: AOJu0Ywd9kJMU2ZHlfG/Xe/HefYZ9Ttg3xU3/7Wc8VTSjeCEe7kHPev5
 nqHchEdoAjXRmoMaMjlSjzIRCe3qbzTKqvqZqs5UHg==
X-Google-Smtp-Source: AGHT+IE4IioIWbj2PPt3P7uwsI0XmRZkXB/RliyJ3Dn4Qch6PN+Ce/qizWi4GRhHE926HMTr2NefpQ==
X-Received: by 2002:a05:6a21:3d88:b0:134:2b44:decf with SMTP id
 bj8-20020a056a213d8800b001342b44decfmr605699pzc.21.1695156176264; 
 Tue, 19 Sep 2023 13:42:56 -0700 (PDT)
Received: from Adam-laptop.amarulasolutions.com ([172.56.201.58])
 by smtp.gmail.com with ESMTPSA id
 18-20020a056a00073200b0068844ee18dfsm8918700pfm.83.2023.09.19.13.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 13:42:55 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 19 Sep 2023 14:42:46 -0600
Message-Id: <20230919204252.2272594-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1695156176; x=1695760976;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FMarpmc1VCrFaAgo4vLcHsFgWLO1VN5KUzKwmdvLsGw=;
 b=ACdksaT9+2Oko9tp71soxh17kcimYFUExf7bEe4HUEand0x702cADTJl2LvZFrBvAA
 edQ7/+lwaXl3zS+Mbnu/f9SX8HnuuJ0UFEI+I/FBeXGqd6BTfBEPRyx5EAauNokWKvEH
 3+J2LOeDCa4Ned/BG82mAr58GHmQ+NNwqN4vI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ACdksaT9
Subject: [Buildroot] [PATCH v9 1/7] package/python-httplib2: add host variant
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
