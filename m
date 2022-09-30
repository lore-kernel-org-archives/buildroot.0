Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A73C4332F
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 03:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C87D541D2B;
	Fri, 30 Sep 2022 03:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C87D541D2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5BmDiaJ94Ymk; Fri, 30 Sep 2022 03:37:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69C8941D27;
	Fri, 30 Sep 2022 03:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69C8941D27
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2EEEF1BF9CB
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 03:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A04840165
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 03:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A04840165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yJ7YDL74QUW7 for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 03:37:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 476F140123
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 476F140123
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 03:37:27 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id v128so2379192ioe.12
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 20:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=NGMD2m7/OZhAQ45eKZ1oE602onhv9mzf4Arm11Yl4jI=;
 b=GSRxtFeb2piqmAbozDfo2EFUMYqTr67+OnB8eP3IBWhMYpWXbY0e+80NzRhS1v1Trj
 BlI5qTqW31Yz/yiK7l4ffkVYq2zOcj5nukXF70+3N5KGvCO6oqQ946n5icaxud6zVIxt
 om1hG/K/ZfhyxFY/5H6+dfheXeWskSGkCJTxjpGsCpRKeAS5H6d9DcT/BgMiTOhwPUBm
 m1DxWx+LEltI9d0o9WpzdR56pj9X+JuA05EFVK8R+3NwPrpRsA1nsmwOq6PDYJVpPkJM
 uK/6dpNxrVo50V+gyTlYoChVosciMtXGKOEAYI4HkwTeJiHLdY4U6S2+6SVffGhrFVkQ
 9cEA==
X-Gm-Message-State: ACrzQf1T6rUbNil+NTMe0goiAmd1IDPY1G5Qv2tmjrw8rua4LraHZGYT
 xRUG9Y6iBbogzm5I6G2psBL2JgfSfbvdjA==
X-Google-Smtp-Source: AMsMyM5jPTRRLtA89K1XA8Jooy+Ovi0L/Uw9sutOkzRK+wu/sk948OOtG8TGCyD6Wv1NAJi084Aw8Q==
X-Received: by 2002:a05:6602:2c02:b0:690:b560:7fae with SMTP id
 w2-20020a0566022c0200b00690b5607faemr3069964iov.169.1664509045753; 
 Thu, 29 Sep 2022 20:37:25 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 x22-20020a056602161600b006889ea7be7bsm537249iow.29.2022.09.29.20.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 20:37:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 21:37:22 -0600
Message-Id: <20220930033722.1898827-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=NGMD2m7/OZhAQ45eKZ1oE602onhv9mzf4Arm11Yl4jI=;
 b=FDeh4SMUDbnLNS/tXOT37hldqjRFU1i5MuWptIkroX/gJLz08/MZ7hbto+Wo/p2qCP
 8gI9wBP+4XKfGq8QfzZELD397+VmD0r16i4laLUFc3glT5Lh1qFuXL8Fsu5KDCb7GRU+
 qE+s0UHxwhm1yF+0Z3TD/C94oIvsDcxb9vzYKfqK4D1OouLjvKoHuyeb34LbGV810k7r
 79kfaiWtqIAsk09CmYGwDhbvntlsRf14jQdPA+bi7w8d0N2wzjO8fmoGy0La4uB5zPc2
 k/5jC86zT9w/RM0t5kq8eYqEUNkeS8Gg5VRsrF05zJCoj/zbaKjmQjiGwsByWouxAY4X
 C6Tg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FDeh4SMU
Subject: [Buildroot] [PATCH 1/1] package/spirv-llvm-translator: bump to
 version 11.0.0-297
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
 package/spirv-llvm-translator/spirv-llvm-translator.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index 6133b1326a..edfca1ea02 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  bcb0e5ae2d15f9876551fda46b222f911ed5afd626dfbcc66ddea9d36563ac9c  spirv-llvm-translator-v11.0.0-269-g13c76c4b275ae990d23883f7f15eec1a9adddc18.tar.gz
+sha256  bdd7cb677b9fcaaff1cce2153de9d69298f136edecaef3631915614bb5db09a1  spirv-llvm-translator-v11.0.0-297-ga619b34bce55360d79fea9058a93ded04919f2b2.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 73f7fe02de..159f7d3b52 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -6,7 +6,7 @@
 
 # Generate version string using:
 #   git describe --tags --match 'v11*' --abbrev=40 origin/llvm_release_110
-SPIRV_LLVM_TRANSLATOR_VERSION = v11.0.0-269-g13c76c4b275ae990d23883f7f15eec1a9adddc18
+SPIRV_LLVM_TRANSLATOR_VERSION = v11.0.0-297-ga619b34bce55360d79fea9058a93ded04919f2b2
 SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
