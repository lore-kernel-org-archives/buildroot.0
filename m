Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911DEC433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 21:04:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FEED61159
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 21:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FEED61159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FB40401B0;
	Tue, 21 Sep 2021 21:04:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VPnIJODaXMiQ; Tue, 21 Sep 2021 21:04:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D8FC40401;
	Tue, 21 Sep 2021 21:04:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6AB941BF255
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 21:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 592A3605B2
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 21:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FZk03OQPF0-P for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 21:04:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 81D84605A9
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 21:04:46 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id eg28so1552985edb.1
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 14:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8FEIqgzsqNAJudGdMahE9NNu2+6VGpX92zhyuchKRnU=;
 b=MenwWy6sFO2KawGyXEYNAyyoFyyBeRtsmOAd9iK2PqmyLSZnm4auOhQZqKVOy1poAN
 DdE19RvdNGKxJ+xvGeTd7FfZVFMOrEAePCsvi7xQKGb/uUeR4uyQLsPSlfaodroSY//d
 5Mlt64rapJ+/IySA9/y0DDJp57501vAbDTc+KH4N+b8+ssed2xAaUD1p/4QZBoXw9DLo
 lh9MsfUaF25s6QZsNnAlD/d96v99mbUe1SD9HX7dAVpqYtX+EvFS2eBMMvVXsr61eFIo
 8LxE6IkbMa+HUHTjWV8ef4w8FEsT0bEsniBvt5l3aRFRMcZhdsW4rE8MWR57gB2cAptI
 eJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8FEIqgzsqNAJudGdMahE9NNu2+6VGpX92zhyuchKRnU=;
 b=V9wfPO/36owWFDBuQMH6rg9biMHT3oDrJm8okue2lxFbXvEy48Gcgy9InyrjP6m1IP
 kGintWu5UnuVarMFGjInXqKeWXtmthmN26J3RNBx9weQRVCTWuS4wS488H8ajbQ7akf/
 JDp1ZF9J6PAp5U9AinT4hsBQVwoKTIPe1Fimqc571FZ36w5gQh6pIg4YIoxdhBtedTWG
 LHYkUAq6znOOdHCoSYe8G4UWgIB2JrG+XbQ2AhCDdtCss4n+DEBgUZpzv8siFhUCGYtx
 aMFZgnunqGwlZJZcE6RlRRnCub8Uh7ilkJbCpMlQhhSfKyGVnKDLlfMEds0L0dwk51dl
 bASA==
X-Gm-Message-State: AOAM531F3/x+C3U7nDsTP0LmIq0QQpiydZaQTJJuFC4cekqRlTamrkpX
 5/apO1S81XmLj9CgoFWSb5X1Ys6N0Xw=
X-Google-Smtp-Source: ABdhPJzff9jlKLP9cyM9Sb7ZCx+GeihqowBMgmf0vQ6OU2FfdrIBwvkk/cJ3fSjupzyhIrrbCf1crA==
X-Received: by 2002:a17:906:aeda:: with SMTP id
 me26mr37598440ejb.83.1632258284630; 
 Tue, 21 Sep 2021 14:04:44 -0700 (PDT)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id h8sm29606ejj.22.2021.09.21.14.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 14:04:44 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 23:04:36 +0200
Message-Id: <20210921210438.41808-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v3 0/2] use python3 explicitly
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
Cc: Romain Naour <romain.naour@gmail.com>,
 David Laight <David.Laight@ACULAB.COM>, Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi,

changes v2->v3:
* remove __future__ from utils/getdeveloperlib.py (previously in 3rd
commit [1]; noted by Romain [2])

changes v1->v2:
* 3 more commits
* remove also python2 compatibility imports

Kind regards,
Petr

[1] https://lore.kernel.org/buildroot/20210915194839.22122-4-petr.vorel@gmail.com/
[2] https://lore.kernel.org/buildroot/41cb0bdf-845d-ab94-0322-c4d1393f40b8@gmail.com/

Petr Vorel (2):
  support: utils: use python3 explicitly
  utils/scanpypi: remove python2 compatibility imports

 support/scripts/cve.py                                 | 2 +-
 support/scripts/graph-build-time                       | 2 +-
 support/scripts/graph-depends                          | 2 +-
 support/scripts/pycompile.py                           | 4 +---
 support/scripts/size-stats                             | 2 +-
 support/testing/tests/package/sample_gst1_python.py    | 2 +-
 support/testing/tests/package/sample_python_gobject.py | 2 +-
 utils/check-package                                    | 3 +--
 utils/genrandconfig                                    | 4 +---
 utils/get-developers                                   | 2 +-
 utils/getdeveloperlib.py                               | 1 -
 utils/scanpypi                                         | 2 --
 utils/size-stats-compare                               | 2 +-
 13 files changed, 11 insertions(+), 19 deletions(-)

-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
