Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5338CC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:29:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2BCE60F59
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2BCE60F59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABFB5400A8;
	Sun,  1 Aug 2021 08:29:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LV1IBzH0iW_g; Sun,  1 Aug 2021 08:29:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0964400C2;
	Sun,  1 Aug 2021 08:29:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C55F1BF42D
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B84E605EF
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ok4NYIIW1Iot for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 08:29:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E182C605E6
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 08:29:26 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 l4-20020a05600c1d04b02902506f89ad2dso9975705wms.1
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 01:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MPItw34gX8vFcap4cDXlulm3AoqtXczFHT6XeNi+ynY=;
 b=cFHp8/eIkNnwbDEuNuOt7KeU+Mr10As1M+tKO84OKnDyzQbSMC5/MdGdWaVR5Hpf+z
 +7pQ3K2D/FwUR3wgpAZVIOp9qQfRTQdxsfu4TjelQD/Ep/ujARy3KX8hQjsj+Octntmx
 UwBLZa5Yc5vnzeZdjSUhLDHib7wjV9oO0UzQxqGxZNh+2lINO93DQFIhFyjVcxJS06A5
 BoplslJKWhQxXf71ZhuKr2vYxQnb7oBKg/aJvWMPLc0owj66cyjgb2Fk/fk7zos0AgjH
 3RnwqHyCb+y0uIq1h6EYsFPrksUplgE0cnbA6iXG0fHf/Xnq8Di2H757MElKOoAUx43/
 z8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MPItw34gX8vFcap4cDXlulm3AoqtXczFHT6XeNi+ynY=;
 b=R2Aw8htxuGxLm80IRHqlQ/eKnb7mjB2TIH2ZDkwSgawXxk5Mb8KqqyST4PpkTfKQjb
 0e+uzJ02+1ZsFwQSWz3phWryELTGqDc3N2YU5OJvXaB/njubPlD3LeD7lSW9eXbqwIBL
 q32hHXPTAfDGrFtpigHZEIiqpq9yA7kTAbkSBhLfdQAe2lmf5aazRV+V06BjsMhnHkHo
 p7GaX6Tc5m0+7D3ZGdYxqFZbV2KExcqmu6NUrU2E2AzDVWfeXb0T+yZRB7JW0s/gCze9
 P2xdlQgnq08O9VfT90gNcWZEUf2r4QZOMUY/Pq1RXY2PLmblmF7/BoXd4r8jlMIQ0Wm/
 zMQQ==
X-Gm-Message-State: AOAM532c2tk4vYVVwHJhWFgn0jq3BbJKKcDnkwCEIHPW6G2ll/mGxSHz
 9kdIYwLuhUepGjXt1TlrXspRNum75d4LEQ==
X-Google-Smtp-Source: ABdhPJxG7xzspYLgZDjZT47JpHXNt2F++X+K50FPQKqWHVKeQXPR2K03+84n+lIeYSKlxrBm/5BluA==
X-Received: by 2002:a1c:7907:: with SMTP id l7mr11422881wme.87.1627806564881; 
 Sun, 01 Aug 2021 01:29:24 -0700 (PDT)
Received: from kali.home (pop.92-184-116-243.mobile.abo.orange.fr.
 [92.184.116.243])
 by smtp.gmail.com with ESMTPSA id l4sm503782wrw.32.2021.08.01.01.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 01:29:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 10:29:19 +0200
Message-Id: <20210801082919.2716993-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cegui: needs gcc >= 5
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

cegui needs gcc >= 5 since bump to current master in commit
352a8b3fe8b1d78073b1119369f10688e00bc859 and
https://github.com/cegui/cegui/commit/17f7f6156eb0ba903d5ae926e372b8c5c26d8c68
or the build will fail on:

/home/buildroot/autobuild/instance-1/output-1/build/cegui-00b4e1fe174da53b7ed726ab5970ba51bd5b5ee0/cegui/src/widgets/Spinner.cpp: In member function 'virtual CEGUI::String CEGUI::Spinner::getTextFromValue() const':
/home/buildroot/autobuild/instance-1/output-1/build/cegui-00b4e1fe174da53b7ed726ab5970ba51bd5b5ee0/cegui/src/widgets/Spinner.cpp:310:116: error: 'defaultfloat' is not a member of 'std'
             tmp << std::fixed << std::setprecision(d_precision) << d_currentValue << std::setprecision(defPrec) << std::defaultfloat;
                                                                                                                    ^

defaultfloat is not available before gcc 5 and
https://github.com/gcc-mirror/gcc/commit/c4b64f5bcac6f7d5e1ae7d3026a3e228fb8adbbd

Fixes:
 - http://autobuild.buildroot.org/results/006ce109980a76870d2347e53307082b36d9904a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cegui/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/cegui/Config.in b/package/cegui/Config.in
index 1bd0ee1cc3..20b865835b 100644
--- a/package/cegui/Config.in
+++ b/package/cegui/Config.in
@@ -1,11 +1,13 @@
-comment "cegui needs a toolchain w/ C++, threads, dynamic library, wchar"
+comment "cegui needs a toolchain w/ C++, threads, dynamic library, wchar, gcc >= 5"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
-			|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
+			|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
+			|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 config BR2_PACKAGE_CEGUI
 	bool "cegui"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11 PR59987
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GLM
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
