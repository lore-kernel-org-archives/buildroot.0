Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52208C3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 10:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBF6340116;
	Sat, 14 Jan 2023 10:49:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBF6340116
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t_XrgAo9-ZuR; Sat, 14 Jan 2023 10:49:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1627A405E5;
	Sat, 14 Jan 2023 10:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1627A405E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 203C81BF419
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 10:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFDA08137C
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 10:49:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFDA08137C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gy-0YHVS--4A for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 10:49:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FE3E81373
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FE3E81373
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 10:49:00 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id ud5so57767145ejc.4
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 02:49:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I63Z0cnHhHF2ZpYU5M3z5AnWayR2PS6AVsGDJYEWyxU=;
 b=GdbnzHZ0OCUtXzbbIspJP3djGSiAp4vaxv0m03GmDxRjJunUlcxfvQB9KkjFi7HX4M
 Ly3k8FZNjMq9XiJDEjIO+yx96tCenbP2FqpszMvkwmN3WjfxfW8/jfmwNTwnb9oAzgK6
 eszvMsF6Qn7nCennp7lLdgdOmVZfvqHZovWVeAmErNyZkJTmIFGf9iI3ftiiJn7WUDII
 WuwFYxAogLrQYOxnOfvzywkXLOmcfjatTNkjUfeNHJJ2rVtnE4l7rkLmtTM/FRwQW0Uc
 dA0Un+pV0Al/aqNjUJzav4MRbbNAHtGsPSTxXALBeB7V1rVXj5JPBSD3HVkX3jj6SXM0
 L7JQ==
X-Gm-Message-State: AFqh2kpbY63Qa/2WcDS6/a2hzWqhFSVrE4SETYHQnM+amIkhIn6HPKPU
 aGDN3gfU7NHWDQgHBWmOX/WcMWXHeac=
X-Google-Smtp-Source: AMrXdXtHogCulxDp1pLUwwhAMgqjRMLZSopklgqSdjNfy4OG2oX/SzV2pHCZ0LBWiz3jr6VFZJwWVQ==
X-Received: by 2002:a17:907:cbc8:b0:7c0:f2c9:4404 with SMTP id
 vk8-20020a170907cbc800b007c0f2c94404mr83348919ejc.21.1673693338194; 
 Sat, 14 Jan 2023 02:48:58 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 kw4-20020a170907770400b0084d397e0938sm8138825ejc.195.2023.01.14.02.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 02:48:57 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 11:48:34 +0100
Message-Id: <20230114104832.12702-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230114104832.12702-1-heiko.thiery@gmail.com>
References: <20230114104832.12702-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I63Z0cnHhHF2ZpYU5M3z5AnWayR2PS6AVsGDJYEWyxU=;
 b=kiFPqN4Ql4pDTstgw0wUAeoFFBrvtmntBEjXd8LhbLwzA6rZICTtPOfOg2QHWFGwSo
 /+KsNPZWbqwz2aqwOqfqjGcxQ5T9pKtjMMwaVqXO6oFysYlwLdmiVhhv+2+bS+rNMaM4
 oWMQYb41k+64bOqAb6PE+Lpqz6DP6wywOnnd0HRBnBBahrkXAHr64l3N+VdRkk+hxOck
 9CoNGUygGsZddDOvmJ4QLOuSXhw0CB8UgDzJkQYWpMN2AaoLZod+6yw4V6GuojlvNLGz
 tE/fiVTHravv1cD7hxcCQcCjuxlai5TifdVPfCEhtFf6Gi3E6vbQ4XjjlK6Tcto94fII
 rMgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kiFPqN4Q
Subject: [Buildroot] [PATCH 3/4] package/libnetconf2: bump version 2.2.12
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
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/sysrepo/sysrepo.hash | 2 +-
 package/sysrepo/sysrepo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
index 1db33df626..a90d8259bf 100644
--- a/package/sysrepo/sysrepo.hash
+++ b/package/sysrepo/sysrepo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  357a50851e4cc052b484b924ed0a5808c29159a7c9d48d9b1b8c42784c4b6917  sysrepo-2.1.64.tar.gz
+sha256  1bc866f13e41ba5e7e4acd52b5c3d42b1a2a1e032775e0a9b094f3265844cd25  sysrepo-2.2.12.tar.gz
 sha256  88f1b7e5c64d2c113e07105aa9c0fb80639b40287565be1c2afd0949df83d826  LICENSE
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index 0ed27e3cfb..9da8c22ca2 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSREPO_VERSION = 2.1.64
+SYSREPO_VERSION = 2.2.12
 SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
 SYSREPO_INSTALL_STAGING = YES
 SYSREPO_LICENSE = BSD-3-Clause
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
