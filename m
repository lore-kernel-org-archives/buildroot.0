Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D15C531DC
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 19:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AC4C60D94;
	Thu, 17 Aug 2023 19:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AC4C60D94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LdU3dYH_WeEu; Thu, 17 Aug 2023 19:46:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EBA960F19;
	Thu, 17 Aug 2023 19:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EBA960F19
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECE921BF37F
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 19:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C54B64221C
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 19:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C54B64221C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WMJar77vrwZV for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 19:46:43 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69A2C4221B
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 19:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69A2C4221B
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1bc3d94d40fso1452905ad.3
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 12:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692301602; x=1692906402;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R1ACUUlx+FKydQ71T9VEOtN15HgUPnb58+kVIWcwcc8=;
 b=G9IZ5zhj0sW9TrEFfXpMERWOabBotXtw9UCOHqkqeAX2J5ffziCcEpdM/Yz6STDxXu
 +ecoNEKQVMBGYsZLSZNRVgWXzPBc3fCkWfNERcQU3LXvZK/zTYXGsvm44Udl65VUnAO5
 UnekJ72pLiVTWHCVgnVel+Nssnl3zFtHTnRrHzq+xckuzqc20nySY0bQOjNqgOad9vbH
 J24G77mpzG1w8tsPir45XZECJUDTEuaJgt3pS2MF5hgSuVNge7tcu0G8Ry3qjvlwfDZm
 1G1M5dUH2erN2lFDMRHKrGGe2NmUm0c3Tc0NFLzDvqbFnR/E2PhiusohGP9rD8BmtwQj
 YoZw==
X-Gm-Message-State: AOJu0Yzti6NWlFfE5HPhybCHHCQSQ5k1DU8+pYnpF17jey0RxwLlUReu
 pxxyyUx6sDOChUuOe3IyzAjr9QzGM4KNl3XQjwE=
X-Google-Smtp-Source: AGHT+IEQc8CDYfiWBrNsfT1Tm/VkW8S1WOE3Zt9lb0DB2uFWU+F+WwEQu7XNuHGwrlzdfsCLdkE3sw==
X-Received: by 2002:a17:902:aa92:b0:1bc:61ce:c1b with SMTP id
 d18-20020a170902aa9200b001bc61ce0c1bmr414216plr.43.1692301602519; 
 Thu, 17 Aug 2023 12:46:42 -0700 (PDT)
Received: from fedora.. ([75.174.130.12]) by smtp.gmail.com with ESMTPSA id
 13-20020a170902c20d00b001bdd62cf7a1sm137569pll.236.2023.08.17.12.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 12:46:42 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 17 Aug 2023 13:46:32 -0600
Message-ID: <20230817194638.780863-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817194638.780863-1-adam.duskett@amarulasolutions.com>
References: <20230817194638.780863-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692301602; x=1692906402;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R1ACUUlx+FKydQ71T9VEOtN15HgUPnb58+kVIWcwcc8=;
 b=nQ2tV/CXmISV6oxr9rT0dsU3cUoQqRDZwwaIY/02cC/knW89apEUcs9fLTCNtB4jc/
 wTTUJ7ea9MGcrvGqWhW7ZkAnlnpAlERgq26pxYytXfF3MKI7RsIuzjKq15v7Ie3JzdU7
 4f7AD61qHgE1QcJLUG2UA9yxaK5nxNx7pusOQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=nQ2tV/CX
Subject: [Buildroot] [PATCH v3] package/python-httplib2: add host variant
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
