Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023D1C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 16:22:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34F5260F11
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 16:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 34F5260F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF3A7405CE;
	Mon, 18 Oct 2021 16:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fkA7seZic8mh; Mon, 18 Oct 2021 16:22:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44A014055D;
	Mon, 18 Oct 2021 16:22:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE6871BF293
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 16:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA3534020C
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 16:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2XuZqlCnh8K8 for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 16:22:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7B28400BF
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 16:22:25 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 n7-20020a05600c4f8700b00323023159e1so2096887wmq.2
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 09:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WIaTamArrv2L+f/+zr/jbIb66ksws5BtVd0FsuZxhsE=;
 b=pZYLN1Y+LADEqDZjPN+cIxhK/RLsnfHMBTPtc4AUMOaRVr33SCpBURReQn1MMRBvAc
 ZYFTpr3BqSt72OaiRQvu85AHRGIsrbFHy40qPk33p4+DGC3ZLwKrT6xMNavX1gH4s3Z7
 XaDzAA9rI/YQOAPJgtURpl6ngSfoyG85Q3+96a9HNfI/CMXp+I0N/XSO6KG+BkFMkJd9
 iLU6uiMtVqIcKgnMWvn7NZzZP01NRQVRYWxPIUzfAm8E+WP1HbUB8nJc9k18BibwHR84
 m8HoRCQuk4mVeu6FUzbCjbGwV818ny4gZvC0Gsp3UMms4DSLoh8Z9Zv3ga1OR/ag8Nq6
 9ECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WIaTamArrv2L+f/+zr/jbIb66ksws5BtVd0FsuZxhsE=;
 b=YIREi9eTv7Iu6ODAD24CANTPA0UYE7LMkgoEOtnGr6VNZ5Qqp1UBpWg07cu8YyXgrl
 32b7VYo1ewQXV3iS1yuKzyaSdBPkuHlxaRJ0GKUcOVwwi4/T8sEC6WoPrhJTA+TLxKSH
 aioWFZ2MNpSwd9fyaFWj5dQ3XYvdvNwnFo4lejKa2JvP7XF7Z3FxjRdnbpeU2aNNvQB4
 iUcWsnJsKh/hymXPd+2CyrFtR8G/+FSiHsvnohiByzgeCtrT9ZlEQzkJenNLrUmkTNs/
 tcIdFjqU+HiRN7zrHxPoJurvOcRWc7/5wD4u4YXwnMz785w/NKfgzDSUpUDN5PkL9B5H
 YTiA==
X-Gm-Message-State: AOAM532Yp6oDFYB4jQorKUZrUp9HjjoQET6OQl5/ay8wemSjzlz9NNya
 hmC/BSjuVQwndrifOlTBsEHm6yBW+gQ=
X-Google-Smtp-Source: ABdhPJzZ77E2Pv0VkOvJPg3GjRHD0Jvp/XGHkgNy8Icozo/gkhsEUsZRxlq9gZzXEHfI5D0QhYiSQA==
X-Received: by 2002:a1c:7fd0:: with SMTP id a199mr45479881wmd.96.1634574143667; 
 Mon, 18 Oct 2021 09:22:23 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id i203sm15500046wma.48.2021.10.18.09.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:22:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 18:21:09 +0200
Message-Id: <20211018162109.1500021-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: remove qemu_cksy
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit b36c4e594c658d49d19bf388b7fd4a912b6fde42 forgot to remove
board/qemu/csky abd configs/qemu_csky* from DEVELOPERS file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 30383af538..0543d84541 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1106,9 +1106,7 @@ F:	package/reaver/
 N:	Guo Ren <ren_guo@c-sky.com>
 F:	arch/Config.in.csky
 F:	board/csky/
-F:	board/qemu/csky
 F:	configs/csky_*
-F:	configs/qemu_csky*
 
 N:	Gustavo Heinz <gustavo@gsthnz.com>
 F:	package/python-m2crypto/
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
