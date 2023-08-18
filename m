Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7286EE498F
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 20:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CEF3841AE;
	Fri, 18 Aug 2023 20:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CEF3841AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DXhLjtGqGdos; Fri, 18 Aug 2023 20:05:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 846CB841AA;
	Fri, 18 Aug 2023 20:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 846CB841AA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D5041BF31D
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 20:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8CF9841AA
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 20:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8CF9841AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wOaVBTlU8tDh for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 20:05:50 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E76BD841A9
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 20:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E76BD841A9
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fe15bfb1adso1928101e87.0
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 13:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692389148; x=1692993948;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GQZFwMBss61RZ/db2B8eOMHzB6iGVTDiVTZZB++8rIo=;
 b=e018lQEgnd8EDZuieXaMVjnPYBlTWw7qwEFk7/o1qVcLiSYYYCLKvbD3At0boSgie8
 BvH3xJLGwUGzRZeKcomEkDrqKJ9/b5aXwI9w2JmG85OG43YIU5QHDfRioW9sSJ0ouzBP
 X5PTBHVJ1ETI7XiSCeLR5ekA7wHuroYjXrCpdMmyfzJsnf0BLvxJlXSvMRVB/SJqHZi0
 1LlsToqi6ZZ36o6cV8PvpVegrgiOYqThzPVcmK3NRwrLp5fTCtF+10x1uUoJRSo+QsTE
 Nai49zzBW5gwYjsG3BVin+qVzw9158Ho6HGRHlaD05ifHQTSufkyX4envKmy3028qH8d
 0+nw==
X-Gm-Message-State: AOJu0Ywt6qfyf3SJdLlSi4xvOJv/0Ee0N+yisVUfo33aBPhbKsR7WToP
 ckgMq01qr5m9j4T9z8SBiqZtL1TZaf70eHwb
X-Google-Smtp-Source: AGHT+IEvTRRkxH4HjfUtCDr8Quh2hscgaPDAMwJnFT7psh+M/o9FZ+yoQg3YNgIkVa0VyLcBXyXQIA==
X-Received: by 2002:a05:6512:114d:b0:4fd:d08c:fa3e with SMTP id
 m13-20020a056512114d00b004fdd08cfa3emr148145lfg.42.1692389147279; 
 Fri, 18 Aug 2023 13:05:47 -0700 (PDT)
Received: from iamthediyvecomputer.. ([2a02:8440:5141:73:73d9:45c8:67dd:2f42])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a056402048900b0052540e85390sm1411062edv.43.2023.08.18.13.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 13:05:46 -0700 (PDT)
From: Clement Ramirez <ramirez.clement3@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 18 Aug 2023 22:05:27 +0200
Message-Id: <20230818200529.41913-1-ramirez.clement3@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692389148; x=1692993948;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GQZFwMBss61RZ/db2B8eOMHzB6iGVTDiVTZZB++8rIo=;
 b=Q9UO9L3el6qTIYKGZz747qOgH3qIZ8PrscG6vayGwWDLiQqYBPKH7Oy27J/7FyHgER
 ukK9BzFTEt0Ddq8B2RQy7vr86TBJRYYxX2hoVK8pnJuLrHN6AqiqG0mflRRpa/eEEuJg
 APpNLe2dhJUhX2H1pHyV7DSW/LCHagyX1aGhwtwiI2g2OZY5KgjWp7OPhmv5ehPL3/0M
 ffv1owGCdeLONLapnIrWXAHSKygqvXmaTwNbznm+toN//r4xV1zFeqNkpkVdjPPMioLg
 n9zV02LFwPS8U9Hh7TcmKOq1kUgeWJp4jRKT/P03j/TTGRLiTInxvOCEWwTXblkJFt80
 mn2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Q9UO9L3e
Subject: [Buildroot] [PATCH 0/2] package/connman: fix CVE-2023-28488
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
Cc: Clement Ramirez <ramirez.clement3@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

This patch series is designed to fix the CVE-2023-28488:

- The first commit backports the CVE-2023-28488 patch fix onto the 1.41
  connman version.

- The second commit bumps connman to 1.42 and removes the previous
  deprecated patches that introduced fixes now present in the 1.42.

This way the first commit can be used to fix the CVE in LTS releases,
and the second one for future releases of Buildroot.

Clement Ramirez (2):
  package/connman: fix CVE-2023-28488
  package/connman: security bump version to 1.42

 .checkpackageignore                           |   3 -
 ...-gweb-Fix-OOB-write-in-received_data.patch |  36 ----
 ...-reference-counter-to-portal-context.patch | 142 --------------
 ...spr-Update-portal-context-references.patch | 175 ------------------
 package/connman/connman.hash                  |   2 +-
 package/connman/connman.mk                    |   9 +-
 6 files changed, 2 insertions(+), 365 deletions(-)
 delete mode 100644 package/connman/0001-gweb-Fix-OOB-write-in-received_data.patch
 delete mode 100644 package/connman/0002-wispr-Add-reference-counter-to-portal-context.patch
 delete mode 100644 package/connman/0003-wispr-Update-portal-context-references.patch

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
