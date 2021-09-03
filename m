Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75032C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 12:22:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A358661058
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 12:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A358661058
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CD04426B5;
	Fri,  3 Sep 2021 12:22:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id daGq-SWR4zkk; Fri,  3 Sep 2021 12:22:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74D52426B2;
	Fri,  3 Sep 2021 12:22:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DBF851BF4DB
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 12:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C405B615B6
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 12:22:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7tcM6c_HPlAi for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 12:22:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 320F0615AF
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 12:22:14 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id i6so7744974edu.1
 for <buildroot@buildroot.org>; Fri, 03 Sep 2021 05:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OgHh7avzy1Ziu4IE52QBQ0m6wQmmGUQoBs6IM/EOQK0=;
 b=RulSUx7QMvoI4NCAF+zGAirw8zkkBVo3GLFhGo/VB+Bh+zPvc6Ea7lJZij+feN1lEf
 A8TrztSat1CaOfnh0LnFuEWw1JNSLdgsZHKAoQkkaNqUNBtHelrcz9GARJgnYAPFx+zL
 NoBtUuDpbqfciaY2hg4R1Qm1edgRn4A0VM7Grfb+QLJBs33SI0tth9HzR4ED1BSfON2q
 5e1rrf3mF3s+HR3p+qPg9U/zZvzQmOEyocaJwxtaVmVzyWrEMMepVmX/GUnBveQpTUtA
 5BoEiyodCJMRN+4b2jEw+MB1QKt05QzcJwKJWIQ7K31DvxFdAmwCn1JpLBMkWtCglA0z
 CVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OgHh7avzy1Ziu4IE52QBQ0m6wQmmGUQoBs6IM/EOQK0=;
 b=nBxnhPRHqpFkqArKSyDKSjMThkqGX8nE4rz5S1RzqVLlXed+a0uIwV+kpy7/j3ewkh
 Wbxf5SNvXTAZxRAmykdHxq+J8+fGuZwN23L9KIkeJ+SbB39sL7Uie0zr9WXvonxXfRXx
 5JZie4ELeSnnIey1ZFySVL1irKXqJ/WnP6cfACjPYmjpRFc9tKjEBd5bXw9iEBhe4ALp
 DHpdWl1h19VaYmtKFRXIjrnd9NMBEPVs/ThKmyiB99fbgra8gsQIR3+xZ5DISLNg66NL
 hz2t9rc3PUGA1A+Nid/Ls8f8YGqOgJhe4i0hneT7Vh+6DWJqMMROZr0ujQcKgdp0gJgz
 WDqA==
X-Gm-Message-State: AOAM530rHApGA71ovvCzy+MsimlMLK6b6QSADHkhiIfxqDxbD85Qb0kx
 DPgL5n5M73aTKY7qbPlUWaKYWZXtm/8+q1ow
X-Google-Smtp-Source: ABdhPJxiBem9a1Jw9yacOe8LHqc+eYOCduFANmz2cdtROoAtcpfYgJI4o51ZJc6pER3x3/4Kd8SaTQ==
X-Received: by 2002:a05:6402:10d7:: with SMTP id
 p23mr3753636edu.74.1630671732872; 
 Fri, 03 Sep 2021 05:22:12 -0700 (PDT)
Received: from illias-PC.local.ess-mail.com
 (ip-188-118-3-185.reverse.destiny.be. [188.118.3.185])
 by smtp.gmail.com with ESMTPSA id j24sm2834315edj.56.2021.09.03.05.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 05:22:12 -0700 (PDT)
From: Illia Bitkov <illia.bitkov@mind.be>
To: buildroot@buildroot.org
Date: Fri,  3 Sep 2021 14:21:50 +0200
Message-Id: <20210903122152.2881120-1-illia.bitkov@mind.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] fix for alsa-lib support for python
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Illia Bitkov <illia.bitkov@mind.be>,
 Adam Dusketta <duskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hello.
First patch adding module smixer-python to build when option "Python support for alsa-lib" is active.
Currently this option doesn't influence a build at all.
Also smixer-python is the only component that depends on python and also supports python3.
So second patch removes dependancy to python2. 

Illia Bitkov (2):
  package/alsa-lib: add smixer-python module for alsa-lib python config
  package/alsa-lib: always use python3

 package/alsa-lib/Config.in   | 2 +-
 package/alsa-lib/alsa-lib.mk | 9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
