Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747E8C71153
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 21:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA77E61129;
	Tue, 29 Aug 2023 21:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA77E61129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nbxZnE30lYzD; Tue, 29 Aug 2023 21:37:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02C3360ECD;
	Tue, 29 Aug 2023 21:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02C3360ECD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC1321BF5A8
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 21:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85D9F8211D
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 21:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85D9F8211D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X1Mu67eddy8p for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 21:37:32 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3F248210E
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 21:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3F248210E
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-68a41031768so3564257b3a.3
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 14:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693345051; x=1693949851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R1ACUUlx+FKydQ71T9VEOtN15HgUPnb58+kVIWcwcc8=;
 b=UrWWvAaw5CT5qPC6S5BzDfGRR6j36NQAgXAcrZd1NyGgaW7XPM8xqgaKbCZGHceBxF
 MNqD+/mD/VM5ffHTaXgpGOKdJa2LyRt+Pq4Pb94YsFTCR7Z//nGEDXwh6fq1zBRpppJC
 WE5oafo2f0stHxyjGX99g2WVq+8742b4VHy24xpg21plV4I9c41VvSbQxDtCn+2wnpcl
 4tZDbtvXAWk5DdpQTNSGQ0cXXwT3mhC14DYPBxVgKTGWQ3Bt0VDFP5d6ZEV39Wu2mlP/
 /maRs4Zr1Bgxr6ZGYb1a2BINcsGIkR4EtqqVZmnCmWGovHpm1INAPYiAdn7kL5nn6h7N
 48ww==
X-Gm-Message-State: AOJu0YzJWuYjCJG2XB0WIVew+f5GHjzmkZE9hMDgwLv/eKeCF+TvDPuv
 yIQDguuCcW3OANnHkBR9rLu6wOTqe5b0qQMBGJ0=
X-Google-Smtp-Source: AGHT+IGtoP0Kyv3QNBxa3YxeL4aQnPxk/Z7xqJuDr5h7GQKaf381NJQaxx7Ens+Pv2qPNsdlqcYJmQ==
X-Received: by 2002:a05:6a21:71cb:b0:11f:6dc:4f38 with SMTP id
 ay11-20020a056a2171cb00b0011f06dc4f38mr615210pzc.55.1693345051049; 
 Tue, 29 Aug 2023 14:37:31 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.202])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170902a70500b001ae0152d280sm9691516plq.193.2023.08.29.14.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 14:37:30 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 15:37:20 -0600
Message-ID: <20230829213726.1957587-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829213726.1957587-1-adam.duskett@amarulasolutions.com>
References: <20230829213726.1957587-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693345051; x=1693949851;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R1ACUUlx+FKydQ71T9VEOtN15HgUPnb58+kVIWcwcc8=;
 b=jyxpQUi6VJdlUdVBOygBYmVofZf+bnt7jPY5IK4wMvnysQiWd6XRnIKgMhuDRq+8tX
 DNVgGE1TAexIPxWkak45ghCnIeYxiL0qu45JLIeBhdfRftQbcI6WuWo6RG9grDAewEOd
 owS713GtWLhDH+O2c18CCUX7rRF98rYz7k7bs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=jyxpQUi6
Subject: [Buildroot] [PATCH v7 1/7] package/python-httplib2: add host variant
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
