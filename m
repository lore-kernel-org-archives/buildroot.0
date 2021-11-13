Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3560C433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 15:31:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3028A611AD
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 15:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3028A611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE96840559;
	Sat, 13 Nov 2021 15:31:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a4C6Jlbgcjzq; Sat, 13 Nov 2021 15:31:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FD974052D;
	Sat, 13 Nov 2021 15:31:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82A551BF306
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 15:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7169D40275
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 15:31:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dWGfL3Lqf0lc for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 15:31:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8672E40143
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 15:31:35 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id k37so30329555lfv.3
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 07:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xnht49HXGwIThdoBZ13te4+fo5O5MZ/uiPjVHyyG8nI=;
 b=bZDaAQEakzuOUskfp6i2mzdPRSNi+dQUWdIksh0OZtO75IIAQz3gEkqHQRKv3e1GMn
 BTpc8vGyd0LdB1t5MmteFQ5ItOAep76dHSqnBCyraf+MwOublGo00EPZNbOFvq9TkM3i
 3w1JkvePHKZjRUb5GcZr1qNBvYLCVSbQPNebaF2xOdxXtVEoXHmYkG78y16yKfHEwOCm
 q3qNqYsxo5k2spH8xm5jGVsVwebSrjFZWwTO6ZI4EKrLSv/0+zXiMJVSnBXeZe1HGvxT
 W1kaIWfSfrVkKL2Y42W3IC7j1Nd8ESlAqqyLW7s1IFtxAjh8Q+t6dHe2dKB+w44cabyd
 ZBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xnht49HXGwIThdoBZ13te4+fo5O5MZ/uiPjVHyyG8nI=;
 b=HIN9Cmsuh4XVZ4LJ5Nn77OBbMnu4uKrQb8Tgu/mwBQ9BP0PMkT6p5uMMHSZV4AKpyS
 NLXmja4iqBasz8IYDAtLPA8buu+PXNxfMi3FRSf9D1aSmUw9/SSa2ubUXmn+kt+HHyZr
 301W9yanak5gzp6KC2jqdfs32zTaw7PYcQ+e3UBgN9dmISdoNmcwRYmAZTMwle/qef8L
 z3FS/qIPgcxDNHUINxq7oHdIyikUcQlk6yDceVzuUDvkdT091tpFNoKJEas8hQn3hqe1
 2vy3z8xgzvayF8ZhbLW7xs3QcCmu37IQxjU4GijsUCHK+8TDlaEYbFIk84u9nRnNu9/a
 tESw==
X-Gm-Message-State: AOAM530OUm1mBqr44DAZSy/BiUjtLwztJfizs1TeAwCWIbg5A5GUCs9K
 SSdPWw5PWi8do1OMchXqRkL2RMzzHTk=
X-Google-Smtp-Source: ABdhPJymzlyGqndrtvMxz7x7AW1FgiPflu8458FGhrlTzQUek48reL5IdEHzKhYoSpgHa8r46Hvh8g==
X-Received: by 2002:a19:c185:: with SMTP id
 r127mr21794462lff.572.1636817493058; 
 Sat, 13 Nov 2021 07:31:33 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.197])
 by smtp.gmail.com with ESMTPSA id i12sm891723lfb.234.2021.11.13.07.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 07:31:32 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 16:31:20 +0100
Message-Id: <20211113153122.1745140-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] package/smcroute: bump version and add
 myself to DEVELOPERS
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Hi,

this patch set bumps the SMCRoute version, dropping the backported patch,
and adds myself to DEVELOPERS.

Best regards
 /Joachim

 DEVELOPERS                                    |  1 +
 ...Avoid-trying-to-delete-inactive-VIFs.patch | 51 -------------------
 package/smcroute/smcroute.hash                |  3 +-
 package/smcroute/smcroute.mk                  |  2 +-
 4 files changed, 3 insertions(+), 54 deletions(-)
 delete mode 100644 package/smcroute/0001-Avoid-trying-to-delete-inactive-VIFs.patch

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
