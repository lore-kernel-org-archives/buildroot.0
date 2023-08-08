Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832CFC001DF
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 00:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2502481F20;
	Tue,  8 Aug 2023 00:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2502481F20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iQNzkC0MvLe0; Tue,  8 Aug 2023 00:35:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BEB281D4D;
	Tue,  8 Aug 2023 00:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BEB281D4D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 768171BF30B
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 00:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D05960E07
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 00:35:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D05960E07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ONQT0TpQThUP for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 00:35:32 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3754D60E00
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 00:35:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3754D60E00
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1bbf8cb694aso43918815ad.3
 for <buildroot@buildroot.org>; Mon, 07 Aug 2023 17:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691454931; x=1692059731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R1ACUUlx+FKydQ71T9VEOtN15HgUPnb58+kVIWcwcc8=;
 b=luzUBph81Iwgg6gzk2pl6MiqaqDeXulr5X6uFCYBhLjJJ6I049HwmFdZYuI3Dj3W1n
 jo7Nrkf7NfNHoNfGqgIuILE3Gu2okyecVgV8evKzlmemMXinIWJtLfNvDnUZRpYADY16
 6yAeNTVizjz3HKJARbBTOuASFzk648u92kDFP3cn9KSVPI7jTXDMsLEzj0c5gcbARQgg
 HHxcuw5fHykX4tuyNpwCYTGxmJaM5HyCU8pVSO/trxiso8WUN/actc1GBP5/x+jy7lT9
 oIhAAXqn/qYBhE5hpcUBxxnofiHSUfV+JdHEcXQ2O62fG5fspigJ8AOngLoX/e4VznPk
 TvCQ==
X-Gm-Message-State: AOJu0YyXOKl6OehcrjVi8z19EoZmP3dBpnduVxoioH3/f7zSg0v7rgN2
 PuKuOCXRY1C1DfmXmlsLCOiC9EAYYHUeGYZbBUeXww==
X-Google-Smtp-Source: AGHT+IE+YMFyxESh7mllIQHWvGO1hoAjDgtsAn0zonmv7cC3S9G5EHrygzWEQH4KcisAXFFJMCLggA==
X-Received: by 2002:a17:902:8b84:b0:1b8:72e2:c63 with SMTP id
 ay4-20020a1709028b8400b001b872e20c63mr11219828plb.8.1691454931374; 
 Mon, 07 Aug 2023 17:35:31 -0700 (PDT)
Received: from fedora.amarulasolutions.com ([174.27.153.162])
 by smtp.gmail.com with ESMTPSA id
 ix10-20020a170902f80a00b001b03b7f8adfsm7531923plb.246.2023.08.07.17.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 17:35:31 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  7 Aug 2023 18:35:25 -0600
Message-ID: <20230808003527.1469175-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230808003527.1469175-1-adam.duskett@amarulasolutions.com>
References: <20230808003527.1469175-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1691454931; x=1692059731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R1ACUUlx+FKydQ71T9VEOtN15HgUPnb58+kVIWcwcc8=;
 b=ePUwX51G5l6fDCEXWpRmyJOLqowQ3dR9zZd/CSK7LcvEBWrLgmsfp5n0U0DBcp8Zqy
 v/z9zTxB6PpXq+yVTZ8Nag4N/ZpvKQepNtmjlrP249EVy2DhILZ8ftD7lQtsNK30g2A3
 783XllnRvUvNlXiZrJEwIj2myx5q6gZm1m6Bo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ePUwX51G
Subject: [Buildroot] [PATCH/next vRFCv2 1/3] package/python-httplib2: add
 host variant
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
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
