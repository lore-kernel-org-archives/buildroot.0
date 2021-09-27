Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1B1C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 09:56:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0686560F70
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 09:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0686560F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A13B34020A;
	Mon, 27 Sep 2021 09:56:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CmhFnp2DX0z2; Mon, 27 Sep 2021 09:56:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDCF9400F5;
	Mon, 27 Sep 2021 09:56:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E06041BF97F
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 09:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE945400F5
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 09:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P-MrF_qq4gxd for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 09:56:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DA7F400DB
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 09:56:04 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id c4so11400191pls.6
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 02:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cm5/b0a5dVbsmqP1pSUl3WtzN/NQxVQhQ5+ipmgvq1c=;
 b=sNag+niY3KL5fLHmDGRK7eTOQF0g6YNtcSSfEq1y97r/Cba22BoMXzDeI3U8B5vxNj
 BUVT4tnDJhELZ3xeOVmYvvcOFkfNivEElxHQvsLbRO0IWsoXSU7OVFs2/APzGi80H5yd
 Geo9793/lzffE4J5kxkWKVWzYYsHiIen6we7TgQtUd9ajEgUzNbHZcDoYC8+TES29GnX
 rzkH787Rewo10IAfKfGylEpKpwet+crf7z29fwPiVdH35uDiTVm7dMFuILiHxZU753hV
 qaFgTV6hOR2/mz3mU7eWR3vnayGl2cOoVpHHvedxUJarubgOdfaGYeHxHJG/A7jvo3JY
 kn3w==
X-Gm-Message-State: AOAM530SGFwLtBDDGz7EzpWyifvlV1EPrBFWpqi3ejy6ww0VVHRMN+gq
 naLQVGXUv62MfQA+ND4S8ud4zxLkcd3IJA==
X-Google-Smtp-Source: ABdhPJzbrcD5WZH6hLmMfzPzUwDP7WQQeXQt65T9jXxf91yLyC7KthzSI9w/konSTeFjMJzEDR9HuQ==
X-Received: by 2002:a17:902:f08c:b0:13d:ee10:8f90 with SMTP id
 p12-20020a170902f08c00b0013dee108f90mr14778856pla.9.1632736563469; 
 Mon, 27 Sep 2021 02:56:03 -0700 (PDT)
Received: from localhost.localdomain (ip68-111-8-11.sb.sd.cox.net.
 [68.111.8.11])
 by smtp.gmail.com with ESMTPSA id j7sm16528470pfh.168.2021.09.27.02.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 02:56:03 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 02:55:56 -0700
Message-Id: <20210927095557.360485-2-christian@paral.in>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210927095557.360485-1-christian@paral.in>
References: <20210927095557.360485-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/docker-engine: bump to version
 20.10.8
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index d07ca33307..07acb87864 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b80142035de46904605fb7b8f18075cd94154f8c3d67ff346ea554d1e9d579b9  docker-engine-20.10.7.tar.gz
+sha256  2505d00032f5d40ead5ac779c2840303dcead04713c93ba974be4c19b3ab8d0a  docker-engine-20.10.8.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 372717775b..7d338a5c0c 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 20.10.7
+DOCKER_ENGINE_VERSION = 20.10.8
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
