Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0972EC4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 05:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EC0082040;
	Tue, 13 Feb 2024 05:03:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cvczz_chMMs5; Tue, 13 Feb 2024 05:03:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1560B81F72
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1560B81F72;
	Tue, 13 Feb 2024 05:03:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B451A1BF377
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 05:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A891040802
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 05:03:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pmyz35BoIEAa for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 05:03:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 687E0407FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 687E0407FC
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 687E0407FC
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 05:03:16 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6d9f94b9186so3282265b3a.0
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 21:03:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707800595; x=1708405395;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NkxLLrVv2cBYli6rTMTF0TVzUi4PfwR66mezVuE/sy8=;
 b=sm4Zya80+AEoNmTuoTxDlS8l+alpC0uwgpqlt9/faFv1BlYwFLyzSuVSX+VaEjydsz
 k26i5aZikfd8SEKp9qfYsiha5NKSaAX+5DgpsZAh+Jl/IiVVfbZ2bjxb0jUe0XAHTpzC
 WGJLYGZEGEO1nyWZxYChuzQHqXihlwbNeVijv3znUuZ//CyMJ+psm7tiAgEjlnc/cEpN
 amCaGbvdLXYPy5Lky3XnTUhjeSHdtre/m81kJUseDnKhzEKoYZRuFbUcWr9eglf4oYnt
 Wj6mc4IH+UTApsKwOnoJcEviJI3YHC2xptV/paelw6QcmaO7CdfbM0gap9vccdQo25Q9
 nUDg==
X-Gm-Message-State: AOJu0YwPxYCixowWmS86ajIEoQxNRrGOkZlMMlO8Aq3TpVK70BgJ/zQ6
 sTrgmQ6D49DOsDjW5HA+880BGSxtBjr07CChksyHw9H2lDzbwdiii6QJrwFKFCk=
X-Google-Smtp-Source: AGHT+IFUy50cQEMErTHae6rlfqQQiuer98BTG/KL4gkkMxmEdeEAVDP31jcPFAEQvCA5ourVwXmsgg==
X-Received: by 2002:a05:6a00:1d1f:b0:6de:3b41:2845 with SMTP id
 a31-20020a056a001d1f00b006de3b412845mr11535348pfx.32.1707800594764; 
 Mon, 12 Feb 2024 21:03:14 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 g15-20020aa79dcf000000b006e09e975596sm6019143pfq.38.2024.02.12.21.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 21:03:14 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 21:01:06 -0800
Message-Id: <20240213050106.1371689-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707800595; x=1708405395; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NkxLLrVv2cBYli6rTMTF0TVzUi4PfwR66mezVuE/sy8=;
 b=UDhUWoFd+sQK/QNkf/9dT26z8v7OaPz8+bCK27oNnVqpHkG4KQPWQwRIXdx02mZ41z
 DiQcvhUFZnWxjnGvglG4oZm8f44fOl17sY7BL3Jb1iBJ+7bEHOPwKPKg8g4M8KbOulPN
 ddefJMBmRgZr9pQSy9zi4faog5JxST/zbBGwKQusQfoNn59TFojTyR+fDQNC5sCQmFUy
 ZpO7X/ae7kChZkQQ75y3xGEuroT+Y+iuZ5fJdiP+whNfWxdkkQ1aaAp/MQCIoSo9KInv
 RJUNBHhCpbCc9FX5/Nsea8yl9KtMJaPrOpbA5G08WTUiT3EgtacKYS1ELevyq+a2GA51
 OY0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UDhUWoFd
Subject: [Buildroot] [PATCH 1/1] board/freescale: Fix check-package warning
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

$ utils/docker-run make check-package
board/freescale/imx93evk/patches/linux-headers/linux-headers.hash:3: empty line at end of file
board/freescale/imx93evk/patches/linux/linux.hash:3: empty line at end of file
402624 lines processed
2 warnings generated
make: *** [Makefile:1248: check-package] Error 1

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 board/freescale/imx93evk/patches/linux/linux.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/freescale/imx93evk/patches/linux/linux.hash b/board/freescale/imx93evk/patches/linux/linux.hash
index 5687ec7343..715a590825 100644
--- a/board/freescale/imx93evk/patches/linux/linux.hash
+++ b/board/freescale/imx93evk/patches/linux/linux.hash
@@ -1,3 +1,2 @@
 # Locally calculated
 sha256  eb94414f952444289c0af8ad82afa0dc2d07e08f9000ccd2cc39f11da5b494ea  linux-imx-lf-6.1.55-2.2.0.tar.gz
-
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
