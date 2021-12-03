Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F86C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 22:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFF1060BE2;
	Fri,  3 Dec 2021 22:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q8_fIPa30ZYs; Fri,  3 Dec 2021 22:31:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C37860BE0;
	Fri,  3 Dec 2021 22:31:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0606F1BF9D1
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 22:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F11D4405B9
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 22:31:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MbibhAFE8IN3 for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 22:31:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E30440140
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 22:31:39 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d9so8662470wrw.4
 for <buildroot@buildroot.org>; Fri, 03 Dec 2021 14:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5si+w2GvBzjB3lJzJ0+FgAHf8A1iZnVGbCMVnYSyr0Q=;
 b=YvCE9Z/+OUdnJc+kG4iC3aUIE2MAbJn6UwPMoHGL3SOxK+V8cNOATaG1fgus+SUHzJ
 srScHTDF9/iTri7yiMR4xu07PknrA6lL42cMKwLBP+IZNqtKgXg047sPAl6p22dOB1MV
 v/ZaP0kEG9OYBsIEmBp0LcWKlFoYC6a4y7iU/nR2OPyoqCAZXGrGmo+gOoAMGF/8T8k+
 g14FZEjFglfULS99P3Qi6m4mT7ZYnVU9DvYXva8iZSAF8JHEQuGoYWlytmM7ya3ZRk06
 mOGADjNFhWgsg4LeVHNXXZ8Ko4tVKCk9KE9N01aOi9SDld3iAGxXiTSdXaoQjvRVRXc5
 ELyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5si+w2GvBzjB3lJzJ0+FgAHf8A1iZnVGbCMVnYSyr0Q=;
 b=D464R7dMts3UBHxsnuQimksePCaDMt07qn/hPhz8J3tuAblI5rGlAvp0oiPAMnaUk+
 2a5KEH6K47lItqKewnc3kNQWJe9Fh0nSnaQhPtCHud6iEPQwqSHWkP/nL4wcWLDS+BCf
 uD3gf5qMblkwxEeCRY7+f00Pu72JyPnCWo/CRTA3ilDYsv9M3LGPzFIJlb1uvmb5yaYv
 3keLFtMJf8J+Gqeqazw95/+hE4HXBPo9AGnbIr2lIKleTHnRw/czDL3qBSW5BmNY6XQ3
 TWawyZ5VFAekBvP81l5j+7QrXsFHTp/kUUdfDsWkSj7Y1/K291WYs1CbpuWXwCz0jkC2
 +OMQ==
X-Gm-Message-State: AOAM5318uTiFC1m2ft+fKz3JyZrC+HyoFE6PWO7FuXIvfoPpdEY9lFgO
 R83pHVA9BKWwiHDBFJzXm/BCBhdC/twTcZrW
X-Google-Smtp-Source: ABdhPJy9EXlycDnSppnjLIiaUj+1T0wTLbfoAZFa+t1AC4jmSpbaIFVCL1XY+Ykoebuxj9YntZM9VA==
X-Received: by 2002:adf:f749:: with SMTP id z9mr25118929wrp.379.1638570697334; 
 Fri, 03 Dec 2021 14:31:37 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id l21sm3801798wrb.38.2021.12.03.14.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 14:31:36 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Dec 2021 23:31:23 +0100
Message-Id: <20211203223127.274985-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/4] package/systemd: set cgroups
 default-hierarchy to unified
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the unified hierarchy, which is systemds default since v243.
The biggest holdover was docker which now supports the unified
layout.

Note that systemd will automatically fallback to hybrid if the
kernel is too old or the unified hierarchy fails for other reasons.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v1->v2: no change
---
 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index a8b11faa5e..6c57a123bb 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -25,7 +25,7 @@ SYSTEMD_SELINUX_MODULES = systemd udev xdg
 SYSTEMD_PROVIDES = udev
 
 SYSTEMD_CONF_OPTS += \
-	-Ddefault-hierarchy=hybrid \
+	-Ddefault-hierarchy=unified \
 	-Didn=true \
 	-Dima=false \
 	-Dkexec-path=/usr/sbin/kexec \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
