Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C3BC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 21:54:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01376601FA
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 21:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01376601FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B251B8392C;
	Sun,  1 Aug 2021 21:54:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mtxzJucdXKQp; Sun,  1 Aug 2021 21:54:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DBBF83906;
	Sun,  1 Aug 2021 21:54:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 926661BF36B
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 21:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8107A40471
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 21:54:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I1LRQTo0KxLh for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 21:54:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8E0540466
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 21:54:06 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id z4so19131731wrv.11
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 14:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C9STrMrNDm+7+LVlZwmFjn3ONOM4ra57Zbblq+oJ7kM=;
 b=cM4EhW9SvR+TNavajC48j75wUC7GbefKBqOpIn9O4/Z4SzIgv1Vbg2q3gk2aVLnvPd
 URQArbqGc3eKb+GYzA2F3/dBi0lWgWSPirPELchspuB58YzPHIUZeE613gxfeBKkmRPB
 5Ub6T0JvvHif+1tEkoaSuG6wP6ehFi8MVc9m30yguybYkoMQx03xw0qvFs4W/i707AZg
 u1PCgv4om0jFIMMS4oAss0D/P1WcKKz8OKwb1H+svwJsE+094tfh0KqTzB7Z5kz2vHf8
 lQ9DBcoWfIDTu1xUvk98cJeRLCgFCRlekpJta8rwdjP7vgYiT7BjClcRF5TRd6wVP134
 W2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C9STrMrNDm+7+LVlZwmFjn3ONOM4ra57Zbblq+oJ7kM=;
 b=P06Ly5lWZgmBSYE1YERUeIkvwqEFdeQ+lCZ4CW6kY4G4OmhTz9a75PeFclNhWIxyvK
 WroztunxaQbXCByrnPJIOymt25wd3N2jKdJHT2bUT90uH16Jy0/NzpJJk7khBC5elLdu
 agLiHUdfk6RoxJCTKreSbG6PmDDfva/hvT8sTmLdM1HaYdh2GNs1IUeLBrvrqm1qvk9L
 wC4eDjr5pHJAI6qORGTEt0wQA6oRwnP2G5Dims0nDMhUy3z86s3VZouzfK39c3NqRob2
 74R11GLA9aEYT7xVjHGg0fk2JtzICyX9KMgouHOW9/se6dLuvZIm1iPO+yZ/kVHsrSJ4
 gBQg==
X-Gm-Message-State: AOAM532rCMK5OJRN6pyxvYBudadQHyX0ezuTPa0UFhRGBqz6UItauN21
 dS/t5MNw/A6K28Dj1Q/KTLbD/Gcdo+IotQ==
X-Google-Smtp-Source: ABdhPJzp8fTGXr3qNmuroR0khQrWvXeQBeT+ibuPsJN49bVtWydFjR2h3onVWn9dpiEXfxSStHgAjA==
X-Received: by 2002:adf:a188:: with SMTP id u8mr14354528wru.245.1627854844926; 
 Sun, 01 Aug 2021 14:54:04 -0700 (PDT)
Received: from kali.home (pop.92-184-106-87.mobile.abo.orange.fr.
 [92.184.106.87])
 by smtp.gmail.com with ESMTPSA id z20sm8147252wmi.36.2021.08.01.14.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 14:54:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 23:53:57 +0200
Message-Id: <20210801215357.696067-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/opencv4: do not detect ccache
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

OpenCV-4's buildsystem will try to detect ccache and use it if
available. This may yield a system-installed ccache.

However, in Buildroot, ccache is entirely hidden away and handled in the
toolchain wrapper.

Forcibly disable detection of ccache.

Commit 505e7f47715c77d8586444a4fefe4a190b77aaad already applied this
change to opencv3.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opencv4/opencv4.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index 3cc6c05769..040fc63e4e 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -49,6 +49,7 @@ endif
 # OpenCV build options
 OPENCV4_CONF_OPTS += \
 	-DBUILD_WITH_STATIC_CRT=OFF \
+	-DENABLE_CCACHE=OFF \
 	-DENABLE_COVERAGE=OFF \
 	-DENABLE_FAST_MATH=ON \
 	-DENABLE_IMPL_COLLECTION=OFF \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
