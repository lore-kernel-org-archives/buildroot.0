Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825CFC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 21:05:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2438161208
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 21:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2438161208
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6FB261BA0;
	Fri, 10 Sep 2021 21:05:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cZFOgGCuhRiC; Fri, 10 Sep 2021 21:05:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56A1B61B93;
	Fri, 10 Sep 2021 21:05:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E24681BF38D
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 21:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1A2261B93
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 21:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ozi_kT9PRfkb for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 21:05:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36D51606B9
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 21:05:39 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso2212738wmi.5
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 14:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gskLCT481S6mOWryWjVRrM/pbyy7NIFxnF/gPx/HULo=;
 b=L7Wbh2ZzUJjaJUWIWd9wfiN4izZm3MdJ6CuPC3Px4TfrLJMQvKQptfRJZjBmRy+eE+
 adJBE1fglpgm7+atWQYR6QOaIxhB4BL2oQodajfQBAcYnMmLNp1MP95wvFhPSbV5TlQi
 1Obsnklk6cJ8GILx4aOUx/3/ReSxHjOJBkyIBN1r3gJVIJhruJJ/q/WKs5JjzpHheG3E
 NkhOolQrNAaj9qfanPRG1sBVim3B8pi9bAudW1Ct+fWAdQTlPmbYvgUfRl6cZYpChnWe
 KCIRX/84bfZGyuw53GSCsbfQPYjM+xpwGWlxLJkY4Ln9Z+BUTT0PfkSi3V4yjQ1KgxT2
 Rreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gskLCT481S6mOWryWjVRrM/pbyy7NIFxnF/gPx/HULo=;
 b=NmNFq4NfkMzmA8rhgFrNqQMILFV3PzhgTmqY1vOmDOkA05dVx9anGnfhGVbmuhuzJ1
 nV0csbqfTsv2wDe2t/T1irVX2BLdZTF/9ml6a8jnmrrR0otOR07S8lTSB8ZwBarswNrg
 f220rDF7cgpyEuRmrzzSU0fXjf6lEKUdvpAwRKlvYbOqumUfFfrZ4gIz87zEMBI5dfhi
 oh7zCiAIKnA4V+8Kdeu/ZGQn0pXlEepCGkiCO51BytwbD0P6W02VoVA7+rXObIVxmvNW
 ASN1GDYJjtMHo7FowXA9CAzBN2qx5u7R7nR0DEpC6R2cifo6FOw4MwT83ddFQ08hGNaf
 eh7A==
X-Gm-Message-State: AOAM531YmuoZcDGKWD9SXa3VNOw2oDewHaSoQnI3fRdABxT8DKLTkmGl
 za++wTEcuhdiQ1hAxPwm4zqt+9uDHmU=
X-Google-Smtp-Source: ABdhPJzIHI3vte9S8zIpuO0ItsYjLFsX/r2du9Le6wsQSPvTsQ+38fenLs5gu3mTLlmK0bODcch1kA==
X-Received: by 2002:a7b:cb9a:: with SMTP id m26mr10104637wmi.77.1631307937298; 
 Fri, 10 Sep 2021 14:05:37 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id k17sm4862912wmj.0.2021.09.10.14.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 14:05:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 23:05:32 +0200
Message-Id: <20210910210532.632503-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/openssl: fix spurious spaces
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openssl/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index f69e85978f..f79bac28fa 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -55,8 +55,8 @@ config BR2_PACKAGE_HAS_OPENSSL
 
 config BR2_PACKAGE_PROVIDES_OPENSSL
 	string
-	default "libopenssl"  if BR2_PACKAGE_LIBOPENSSL
-	default "libressl"  if BR2_PACKAGE_LIBRESSL
+	default "libopenssl" if BR2_PACKAGE_LIBOPENSSL
+	default "libressl" if BR2_PACKAGE_LIBRESSL
 
 endif
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
