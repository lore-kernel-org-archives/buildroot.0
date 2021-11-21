Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26E9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 17:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DA30403E7;
	Sun, 21 Nov 2021 17:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YaBGanRoT5nS; Sun, 21 Nov 2021 17:10:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9562403C7;
	Sun, 21 Nov 2021 17:10:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47A571BF3E1
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 17:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 451C780E1D
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 17:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XeVEFIV_Bb57 for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 17:09:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29EFD80E1A
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 17:09:29 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id w23so31800339uao.5
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 09:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FTzyHtNp54/YXFCWpzDNWclCqO8d56S5gErCmlkqIZk=;
 b=ViHkeKvbQlQzAw+QUxc2FP876QRYMiZKpGGFq4iqNgpagBfu8LRw4+CkwDG5fxnXwK
 uhmBEgycMHGiBZV9AdyfQv80IWsRnLnSwdzgIfi/sCUUD01AHqjsOBzXXyguViIk/0oV
 twuTHj3unSNQr9n6fHjvAKB+gmKk2kGcZXBQTvRFyBZltL0eyC7wCN3zPtzCfRR2VY/H
 fXD37n69l7LK8q/XW/0Q2Zzf94g1JR2sDYSEnIPqJ7qMmgwHun5NptFkKukriEB/dFI4
 6DQaH2t/PBTkrCvBfD+RuuWAuMpnU9jJrIVY41fKu4AJnBAsIsNwiXwpfwRH+FtlwOne
 rEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FTzyHtNp54/YXFCWpzDNWclCqO8d56S5gErCmlkqIZk=;
 b=zewQ49AlNxUX/F2rMx45r92yc+JIt5T9CpdMtWFwp6+nKV+jNRKyPuel7RAidtNnOd
 Wnt1/0T4J1zv/oTvfU7H+ghgegwJVHwLPnB203yZ6j63/YyQa+N9uM7uvv8sg/7GSYVk
 zwaREiU+JrVn5zXe02f4V/MwirQ3LFtXqJMfkZFGUsIcHevBmrZYwoD0TqNyaTxDjoWG
 o3LASsj1kfuYhqiUqzwNHGPQHxE5SWa56AAqKu0Zb+SRu0kzD0xJPo80UTXDzToPqYnt
 5jf/Otab9IooskRuEtUhptqbjiXqSfbDtPSOe/HASsc0Kp0AubC/WmFmil/PpsQRIcPg
 t/rA==
X-Gm-Message-State: AOAM532oWUHmLAN1ktqgQJO1raUGMIoi0cYDGfvH2zf1dDJwZ7FuScaW
 QqUvuDzD/e/VeDG9S/zBe+uLFgrWWHg=
X-Google-Smtp-Source: ABdhPJz5XKs2mWEfzDKKnSdobL4AyQBcH1LNWn+M5iXtKCIiAVo7kIJMs3sgdE8m009HP30yVDOWkQ==
X-Received: by 2002:a67:e9c4:: with SMTP id q4mr122795139vso.19.1637514568006; 
 Sun, 21 Nov 2021 09:09:28 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id q9sm3159121vkn.44.2021.11.21.09.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 09:09:27 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 14:07:54 -0300
Message-Id: <20211121170756.3810922-5-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211121170756.3810922-1-ricardo.martincoski@gmail.com>
References: <20211121170756.3810922-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-next v2 5/7] package/screen: rename patch with
 the proper naming convention
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported by check-package (by calling it directly):
use name <number>-<description>.patch

Output of:
make screen-dirclean screen-patch | grep 'Patching\|Applying'

Before:
>>> screen 4.8.0 Patching
Applying 0001-no-memcpy-fallback.patch using patch:
Applying 0002-install-no-backup-binary.patch using patch:
Applying 0003-install-always-chmod.patch using patch:
Applying 0004-install-nonversioned-binary.patch using patch:
Applying 0005-rename-sched_h.patch using patch:
Applying 0006-comm-h-now-depends-on-term-h.patch using patch:
Applying 0007-comm.h-needed-for-list_-display-generic-.o.patch using patch:
Applying 0008_CVE-2021-26937.patch using patch:

After:
>>> screen 4.8.0 Patching
Applying 0001-no-memcpy-fallback.patch using patch:
Applying 0002-install-no-backup-binary.patch using patch:
Applying 0003-install-always-chmod.patch using patch:
Applying 0004-install-nonversioned-binary.patch using patch:
Applying 0005-rename-sched_h.patch using patch:
Applying 0006-comm-h-now-depends-on-term-h.patch using patch:
Applying 0007-comm.h-needed-for-list_-display-generic-.o.patch using patch:
Applying 0008-CVE-2021-26937.patch using patch:

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
v2: new patch in the series
---
 .../{0008_CVE-2021-26937.patch => 0008-CVE-2021-26937.patch}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/screen/{0008_CVE-2021-26937.patch => 0008-CVE-2021-26937.patch} (100%)

diff --git a/package/screen/0008_CVE-2021-26937.patch b/package/screen/0008-CVE-2021-26937.patch
similarity index 100%
rename from package/screen/0008_CVE-2021-26937.patch
rename to package/screen/0008-CVE-2021-26937.patch
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
