Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF308C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 22:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C8BB616C3;
	Wed, 22 Feb 2023 22:31:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C8BB616C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4aUoKOalU7vZ; Wed, 22 Feb 2023 22:31:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3EBB612DC;
	Wed, 22 Feb 2023 22:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3EBB612DC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 257E31BF3D2
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F34F6612DC
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F34F6612DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i8aEo2pQVd58 for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 22:31:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBE3760B9B
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBE3760B9B
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 22:30:59 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id bo10so9051156qvb.12
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:30:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TEvWW7tVtEScydmT+qgul/lScIfCUrUeZxtONb9GVzM=;
 b=yGdPYs83xDAANAWZMZn/dpo/z9sj2UuctYhtUFwRzwi19iJtTgUHY49rV9qBCdeBL/
 mlbK+CpvcWsgJP6W4RDeXXh9beHRvilj8tYvBt5Voy96mAXD/LUACMtCP2G7SUVRU4mS
 KWwFvG5wj19vcbWLk8HzewGis8fwO0+A5vQJvTjjgWnIl1dxDvtSAi3qYHM3zlLD66cV
 iKQzR/g5t1yuk+WrYeDFcQmx/8VHVvrDEyMD5doH5pR67VCcGdpSDgpZCAyZbnEPv5U1
 WK0XfEjPR+NcaRkbR6tlV3eMmOkLT2nqoe6POj9DLrZJczxiPvyaLm5kIwxt21U2paPM
 KxNQ==
X-Gm-Message-State: AO0yUKWHjsK7F8RpUFmNnrWYKtd2eFDuDT9YG+yvd5xU4SaMjJzskbyo
 n45JZr8vd14+XkYkVtbUtZrhwSJn2oU=
X-Google-Smtp-Source: AK7set/aUKQpgUi5cKXfpHRsQQloCmcQCOhHRLRjTIB0ImFs91Y22Oj2yICswv7ZvKWvVwbnB/6qGw==
X-Received: by 2002:a05:6214:411a:b0:56c:1b8e:826e with SMTP id
 kc26-20020a056214411a00b0056c1b8e826emr19034675qvb.15.1677105058204; 
 Wed, 22 Feb 2023 14:30:58 -0800 (PST)
Received: from abyss.attlocal.net
 (108-193-1-150.lightspeed.sntcca.sbcglobal.net. [108.193.1.150])
 by smtp.gmail.com with ESMTPSA id
 d191-20020a3768c8000000b0073b4d8cb4a5sm3538837qkc.60.2023.02.22.14.30.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Feb 2023 14:30:57 -0800 (PST)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 14:30:50 -0800
Message-Id: <cover.1677104777.git.ckhardin@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230209231518.9458-1-ckhardin@gmail.com>
References: <20230209231518.9458-1-ckhardin@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TEvWW7tVtEScydmT+qgul/lScIfCUrUeZxtONb9GVzM=;
 b=clcjTZPC9+G3ZOGPZyG3ncVmNWtOo4vPBGWn8fogYp8KGdA36eGN8YKr07vEDYyuzk
 s8CEM4VF2S/c2skLezv6+9ONtqlv2XApGH0OizDk22zWHy9mkPwoOz2/QnvcwpfpgvOx
 MBvipaLhr69ce833JtVLeXlt+cLSlrP2uSP+iV/SOfdHucWI/59T4rBCXRcGAQ23Sqqo
 AiH8XLB0VdyUzv7obEBiRTuWFnhq6kghocHPL5wOEs3XSvRMG6NIpQLh8j/yOjijGMtS
 FNhd5cKSF5eOEr6bAppsUCV73bGifmOpeaeujF7TZ5A+Pw7qkPRavfW+X+I8Xs2zT4cC
 59Fw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=clcjTZPC
Subject: [Buildroot] RFC [PATCH v2 0/3] scmversion tracking for linux and
 uboot
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
Cc: Charles Hardin <ckhardin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adding source control tracking into the linux and uboot packages
specifically.

The generic problem is that buildroot needs to make reproducible tarballs
for verification which means the ".git" directories have to be excluded
from the archive since they can change even though the contents from the
git reference has not changed.

This leads to the problem that a setlocalversion script will not
work in the build because after the extract there is no access to the
history information given the reasons above.

To mitigate this problem and allow change control tracking for local
development and remote references a somewhat intruisive change needs to
be introduced at the download step for the archive to add an scmversion
during the creation when both the revision history in the source tree
exists and the archive is being created.

Charles Hardin (3):
  support/download: add a helper scipt to generate scmversions
  boot/uboot: add a scmversion rsync hook when overriding srcdir
  linux: add a scmversion rsync hook when overriding srcdir

 boot/uboot/uboot.mk         | 12 +++++++
 linux/linux.mk              | 12 +++++++
 package/pkg-download.mk     |  1 +
 support/download/dl-wrapper |  5 +--
 support/download/git        | 10 ++++++
 support/download/hg         | 10 ++++++
 support/download/scmversion | 63 +++++++++++++++++++++++++++++++++++++
 support/download/svn        | 10 ++++++
 8 files changed, 121 insertions(+), 2 deletions(-)
 create mode 100755 support/download/scmversion

-- 
2.24.3 (Apple Git-128)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
