Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2331EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 22:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9492E40562;
	Sat, 14 May 2022 22:34:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S3W6W_cdQgZz; Sat, 14 May 2022 22:34:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5CF140484;
	Sat, 14 May 2022 22:34:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF0B41BF5F5
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 22:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A661B408F5
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 22:34:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QWVxYAyfo8uG for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 22:34:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAA84408EE
 for <buildroot@buildroot.org>; Sat, 14 May 2022 22:34:33 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id e15so12431712iob.3
 for <buildroot@buildroot.org>; Sat, 14 May 2022 15:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ery2jWzqXNf2snY46+W9Ad6YNTj6IWXq0BcMkCvM5IM=;
 b=m6d5b9vgm2f4YmRyZFAcjWNEYLEi/lIy06Ib0evBZGIFZAiA1nEGu/YHZlZgBAU3Yh
 H38SCwsw1IlLhrXF5iJ6mWE1YoQRKtdI7idHJTT2UEElGVbXCqqvlzUlMa1Hfg6KRTtw
 Rwa3xwNt+RJPHn/4dHDdrqF158Nrwc7d4Rn7k1yqaFLTAIGPGBjkISqfFxa7w1zgoIUc
 bconnjEV3SjI29pB0+BiimCI4S/ZIeIYdISdeDk341Dxe6VJyKiccTWGAv1kyNlGLvDf
 ov0zAF4ux+eFMlFgo2e82B05fJ0XQkr6PWzsuZ9RImaTiYX/qROMnq/I0+ifs28WwzaN
 pkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ery2jWzqXNf2snY46+W9Ad6YNTj6IWXq0BcMkCvM5IM=;
 b=8Ene/LR5LE2DbCCaOmjq7ufuzpJixwEPm5RzfGzhhiNza5N0walQt18xZVAh6PmCgx
 uR9UiO6s3oHcBZk1H0DTO28I6Uh8Ro4PO9bQng8FZSOOMEaozgT3n9Clnx9ThFl8nOVu
 2RHQ6QB28SoLQnOiTpGXgxUF7RKekACV6k8uykqFzqCV5pFWGiuKwhWHTlwLb9Yj10+T
 D60jkNAb1qJFDnxomigwuUGrXsXh8mJ7Qm0IkGxtwpMKDpzXnr26PlmEyfHLwgC584Tg
 D4FXaad46/Nbduq0EaT6HSN2u/8Wux1S5nlzYewvvusSy553bXUQGLaUmdorbsbR3Zkm
 Kduw==
X-Gm-Message-State: AOAM530FWP8+PkPJuucUpZmAB4WkWpKwCAnMZBo7PKTaBU1N36AhG+sw
 nexFKVvRSlyih2K2YIbjRIRs/5i1yps=
X-Google-Smtp-Source: ABdhPJwCta3NGOm9k3in1KTM04It2slnOKLx/RZthsxY6WdBG3MdQBD2D6K91qdb/ilds7D4ey3EUQ==
X-Received: by 2002:a6b:d003:0:b0:646:4652:bd57 with SMTP id
 x3-20020a6bd003000000b006464652bd57mr5028180ioa.51.1652567672853; 
 Sat, 14 May 2022 15:34:32 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 z14-20020a02ba0e000000b0032b3a78173dsm1733705jan.1.2022.05.14.15.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 15:34:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 16:34:08 -0600
Message-Id: <20220514223408.4119862-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ola: add missing python-numpy
 dependencies
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
Cc: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_NUMPY
  Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS [=y] && (BR2_TOOLCHAIN_USES_GLIBC [=n] || BR2_TOOLCHAIN_USES_MUSL [=n])
  Selected by [y]:
  - BR2_PACKAGE_OLA_RDM_TESTS [=y] && BR2_PACKAGE_OLA [=y] && BR2_PACKAGE_OLA_PYTHON_BINDINGS [=y] && BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS [=y]

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/ola/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ola/Config.in b/package/ola/Config.in
index e59637b57f..0d96e104e3 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -52,6 +52,7 @@ config BR2_PACKAGE_OLA_RDM_TESTS
 	bool "rdm tests"
 	depends on BR2_PACKAGE_OLA_PYTHON_BINDINGS
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	select BR2_PACKAGE_PYTHON_NUMPY
 	help
 	  Build OLA RDM tests.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
