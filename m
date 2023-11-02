Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393F3C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 18:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB6128523F;
	Thu,  2 Nov 2023 18:54:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB6128523F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SemrV5vzbNwq; Thu,  2 Nov 2023 18:54:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 298088525E;
	Thu,  2 Nov 2023 18:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 298088525E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE5EE1BF287
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7B758523E
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7B758523E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vvj9oEbXup2M for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 18:54:18 +0000 (UTC)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C7E28523C
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 18:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C7E28523C
Received: by mail-pj1-x1043.google.com with SMTP id
 98e67ed59e1d1-27ddc1b1652so1168278a91.2
 for <buildroot@buildroot.org>; Thu, 02 Nov 2023 11:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698951257; x=1699556057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yYhssssMfd4/eVdQnjInKgXwqEE/q8aJ1mg7Maa5Ahk=;
 b=eomqz71NHOQZ2+Fu9xHPYmXsfxWWzIIA84mzaVGkgYiC5oqu4c9J4UibxamwIbcpH7
 TnGTOCAiR/sroZ0eq9sBL/nA0oAZJ7Livi5YOLAN+bS9lZtPx/4mppifQplAZcwgRrDI
 +nGnCEaO664ktwDGACesEjEr6u5PtX6yNbLW0UUcHYaqtKVXabywEuErzSZkT0tqNPgw
 RaxXTDpg2ayKcImhwJvOO5uSMarXPwrAzqkmk4+91EHr1YKyoJH1gq1QSF9bWkRu7eFQ
 efI9WcQkeUnD40R2QQvhdVUD6JGsA6gfLRlV4aeemPKuarV2gQsqR6y6BeAw9RRgbvQ2
 HgPw==
X-Gm-Message-State: AOJu0Yx+3SrHFDrme6jmYqBQXw+l2jB0s5vwjuBG0JhNjNrsXgobX1Lu
 ZEcStW+VJUUd3PDrIn4QGv6VMjE26h7+rEvWl7xsv4XZ5fo=
X-Google-Smtp-Source: AGHT+IEg28mhCA8U4/ZVJHzgJZIjIvNNU8xhlRiGrFL7khMiKOZTAjFuDQs/Q1aq/OBBp+eqAi2u1g==
X-Received: by 2002:a17:90a:c683:b0:280:cc47:b60d with SMTP id
 n3-20020a17090ac68300b00280cc47b60dmr4437574pjt.14.1698951256668; 
 Thu, 02 Nov 2023 11:54:16 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 ge17-20020a17090b0e1100b0027cf8869ee7sm210962pjb.0.2023.11.02.11.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 11:54:16 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  2 Nov 2023 12:54:08 -0600
Message-ID: <20231102185411.51382-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231102185411.51382-1-adam.duskett@amarulasolutions.com>
References: <20231102185411.51382-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698951257; x=1699556057;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yYhssssMfd4/eVdQnjInKgXwqEE/q8aJ1mg7Maa5Ahk=;
 b=W5rKkY01kRPMhhsMK24OePNmZMz6VKakCfBC1FEj0sLG9O52k2rbK6gPJc3cdk/XQK
 RT33hA8v5gwzLHlEas71PErVKCPDxmLtz0OaclU3S+tlcHUt3dvAx5PfXW+oDjkceqMN
 RVKoaFhPpdKymltvvIBz/d537nuRBhXsmAL5Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=W5rKkY01
Subject: [Buildroot] [PATCH 2/5] package/flutter-engine: bump version to
 3.13.9
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-engine/flutter-engine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index 942b07786b..4701c1f536 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -21,7 +21,7 @@
 #
 # There is no hash provided, as the gn binary (used for configuration) relies
 # on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.13.4
+FLUTTER_ENGINE_VERSION = 3.13.9
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
