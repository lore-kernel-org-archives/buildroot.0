Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7300C38A2D
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 10:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7045840527;
	Mon, 24 Oct 2022 10:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7045840527
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vbjbXyUcotDu; Mon, 24 Oct 2022 10:42:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E0024056E;
	Mon, 24 Oct 2022 10:42:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E0024056E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B1CD1BF39F
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 10:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB5BE81405
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 10:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB5BE81405
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s7Wbtb3fTGRY for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 10:41:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9E4F813FD
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9E4F813FD
 for <buildroot@busybox.net>; Mon, 24 Oct 2022 10:41:57 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id j15so4878515wrq.3
 for <buildroot@busybox.net>; Mon, 24 Oct 2022 03:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c7wGSl2huxJeaXU52sDiOUo5AZ+BwA+4ci18cnE61rw=;
 b=wWrW1fUFKvmB7CYPezv6wmonRH0WaZa4UcP1HAQEiPLpKOHQVWPu9hcrSJyQx/RszY
 WzJkB27zenCzkUXSwcJk2N8gQL3a5ZrKC6CEAj2EqxKrkOACQzCNk+cvS3EnkNFx+By5
 uBDJQCKpu+/B2j6VgoRsd2KZR0MHR+P3kjacMl+MtCJQqpjJFPWrRmZO4FF+Byz9vC1P
 B+HtJRYBc1ksA05ecqA2EBrB3mHEdWuolNlRRdvU9QIr9a747tn1RQNmFaOwVsUgahYp
 2xw2klQ+0iuVg2APYUjw3WFAcBMeCpbq55oEbv1vVKLTUICgP8OH6lAO6ZNVEwmoCVP4
 mFxg==
X-Gm-Message-State: ACrzQf0OiTTRfa3y7Q+642QenDdOz0CuWK1IFXVNqR87AFuHnIVz6GTK
 FRMZLxOTr43wmS1a+F7HWp9+jrEYL0o=
X-Google-Smtp-Source: AMsMyM4ejxPQzDHmRLHm2sOVKxM48w2UuOV18xuu69YJEUZIvl4KIp+g/wPg+vfoW+G3t9rynvj+3w==
X-Received: by 2002:adf:b612:0:b0:236:5d1f:143a with SMTP id
 f18-20020adfb612000000b002365d1f143amr7592341wre.364.1666608115921; 
 Mon, 24 Oct 2022 03:41:55 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adff552000000b002365730eae8sm8438198wrp.55.2022.10.24.03.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 03:41:55 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 24 Oct 2022 12:41:50 +0200
Message-Id: <20221024104150.1470698-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c7wGSl2huxJeaXU52sDiOUo5AZ+BwA+4ci18cnE61rw=;
 b=YcC9+xZ+d4tpd6V7wBukAjYMJGv1DhxZJpNHFuMOUzoLEc9ZjIwE1BW2DtVo1m0GU5
 Mx/STmOFpjmqP6tgi0Ra1dBECsPKH3BgJAUHHVvQRjZQn3/Jt9u4C21FEv96vHBDbO0F
 As7fEdL2iAktJG1ro6m2hpq2Xfp2k6Jv8M7c5m/id+77+AIGQdJs2UeCLsmrmVNopFz8
 2WnfE2PCaNi49cpYUnYUa63PJuCOUE2rAVHavaT2W5PaEHfBY3yj51FLO8qBAA9E9qAE
 MacznkXOEzM//ob+lFmP+5Rcmwd/8C2ThSxQ6b/6zP6A3M/F6sihg8jNX0R05xacB0uV
 NJmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YcC9+xZ+
Subject: [Buildroot] [PATCH] package/sqlite: bump to version 3.39.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index d5af2297f..936f42e8e 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  852be8a6183a17ba47cee0bbff7400b7aa5affd283bf3beefc34fcd088a239de  sqlite-autoconf-3390200.tar.gz
+sha256  f31d445b48e67e284cf206717cc170ab63cbe4fd7f79a82793b772285e78fdbb  sqlite-autoconf-3390400.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 01dbb153b..4f4164c37 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.39.2
-SQLITE_TAR_VERSION = 3390200
+SQLITE_VERSION = 3.39.4
+SQLITE_TAR_VERSION = 3390400
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2022
 SQLITE_LICENSE = Public domain
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
