Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A70CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 17:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7F3D60D61;
	Wed,  3 Apr 2024 17:04:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8kVY1jcppTCP; Wed,  3 Apr 2024 17:04:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEEC360DE5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEEC360DE5;
	Wed,  3 Apr 2024 17:04:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A17C11BF424
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 17:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B48160DE5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 17:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PnzQaT-Qhj2O for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 17:03:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6215C60D61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6215C60D61
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6215C60D61
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 17:03:59 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-516c11b6af9so76284e87.2
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 10:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712163837; x=1712768637;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z911Qj5jWnufXU+HJLGFNjzPv2aVG3stjXVkdUeEC18=;
 b=hrUySkVmrfcnFUuypyRJRlNMQ1Gwa9Ng02AtBMxr26vqtyM6SCvALyKiVZ3RkgqZJ5
 GsotXoP7/vGh39xcVJTtwKpaWL1DnA8PNapzQ4nY9uShAXEoWvLh4HjXDA6tnNCEczBI
 7idYvmNh8YrD58e+yUHVq7tQ73Lm7lAQPLPB0q5QbepyOTHU5YSe+AxD6hfPZ8KE7IB/
 bfjxoyTVKR3Im6IHSpZpbNcCLlXKHHy25s/11gWbiBJKw37TDv3wzGgssahSfRMX8quK
 5ha0IdeyWCuBjC1FwfQ0pk6jxSq+2yviSejwpaWmQZk03lBfCBmq63JEbFHaRFNZp6zs
 ZeyA==
X-Gm-Message-State: AOJu0Yxnc0PseNAH40kuZgSFfxKBCk+DNaFFWdUXmvu5jJ6Z+5NZtMV9
 zFG7L/XryTx+XwA6mekNRw0azHvNu2iUSr1VvoL9ZNscW0oxNtdQ+uciCRYj
X-Google-Smtp-Source: AGHT+IHaKnE9SQzDfnTMGNd2HrspqYceuCw3DXz9W0Do/50/kzmyB1pi42SfEiJLPTas/kR82f/Tow==
X-Received: by 2002:ac2:46d9:0:b0:515:d2b6:ba70 with SMTP id
 p25-20020ac246d9000000b00515d2b6ba70mr52036lfo.42.1712163836922; 
 Wed, 03 Apr 2024 10:03:56 -0700 (PDT)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 xd2-20020a170907078200b00a4e2e16805bsm7199803ejb.11.2024.04.03.10.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 10:03:56 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 19:03:51 +0200
Message-ID: <20240403170351.470997-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712163837; x=1712768637; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z911Qj5jWnufXU+HJLGFNjzPv2aVG3stjXVkdUeEC18=;
 b=JcOTIZnR/lZPSMx4ah+D+crjP4J5y8Z9zoJnr/83Ji67pUSjhWYMCHQ98Oqwg8SW1p
 EQlp1YsIiMl3LNJ2z4tAvqGyhuhoZvzQl/J3IU8Jd3/o4zYzBgEnu5N6IY0NoNrULXg1
 CK3EAsqHwM2VirOCRamU1NICnYfSW5DhnGtwpjZTtuVv3I41NBUyDfe0ne2NnEmYVmTW
 WsdINUpdR3g5wpk1EMMcSy1NCc0pxOVM0pcktkTZE8TmYWvY3J427fSNRThRF5dtcPXF
 0wkhhkHQmtOwRgRILOmoq0nIHsHbyghrPWtqlSpdPnFdemzacIIrDlxd+bQFXDvzFOxp
 n9sQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JcOTIZnR
Subject: [Buildroot] [PATCH 1/1] toolchain/helpers.mk: Use int as main
 return type
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
Cc: Petr Vorel <petr.vorel@gmail.com>, Robert Marko <robimarko@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Although -Wmain-return-type is not considered as error (unlike
-Wimplicit-int), but just a warning, let's fix it for the future.

<stdin>:1:1: warning: return type of 'main' is not 'int' [-Wmain-return-type]

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Based on the fix from Robert
https://lore.kernel.org/buildroot/20240403121807.2087547-1-robimarko@gmail.com/

NOTE: I also updated config project ML to get
support/gnuconfig/config.guess fixed.

Kind regards,
Petr

 toolchain/helpers.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index e5c838c0af..839ee278d0 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -483,7 +483,7 @@ check_unusable_toolchain = \
 #
 check_toolchain_ssp = \
 	__CROSS_CC=$(strip $1) ; \
-	__HAS_SSP=`echo 'void main(){}' | $${__CROSS_CC} -Werror -fstack-protector -x c - -o $(BUILD_DIR)/.br-toolchain-test.tmp >/dev/null 2>&1 && echo y` ; \
+	__HAS_SSP=`echo 'int main(){}' | $${__CROSS_CC} -Werror -fstack-protector -x c - -o $(BUILD_DIR)/.br-toolchain-test.tmp >/dev/null 2>&1 && echo y` ; \
 	if [ "$(BR2_TOOLCHAIN_HAS_SSP)" != "y" -a "$${__HAS_SSP}" = "y" ] ; then \
 		echo "SSP support available in this toolchain, please enable BR2_TOOLCHAIN_EXTERNAL_HAS_SSP" ; \
 		exit 1 ; \
@@ -494,7 +494,7 @@ check_toolchain_ssp = \
 	fi ; \
 	__SSP_OPTION=$(2); \
 	if [ -n "$${__SSP_OPTION}" ] ; then \
-		if ! echo 'void main(){}' | $${__CROSS_CC} -Werror $${__SSP_OPTION} -x c - -o $(BUILD_DIR)/.br-toolchain-test.tmp >/dev/null 2>&1 ; then \
+		if ! echo 'int main(){}' | $${__CROSS_CC} -Werror $${__SSP_OPTION} -x c - -o $(BUILD_DIR)/.br-toolchain-test.tmp >/dev/null 2>&1 ; then \
 			echo "SSP option $${__SSP_OPTION} not available in this toolchain, please select another SSP level" ; \
 			exit 1 ; \
 		fi; \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
