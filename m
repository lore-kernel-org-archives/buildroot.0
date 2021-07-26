Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1737AC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:34:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C667C60F6C
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C667C60F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87586402A1;
	Mon, 26 Jul 2021 08:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YW7oNdob7vWM; Mon, 26 Jul 2021 08:34:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C99E04029C;
	Mon, 26 Jul 2021 08:34:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8DEF61BF293
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DAC04029C
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4TtvBkRZkUeL for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 08:34:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B826400D7
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 08:34:32 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id l18so2385380wrv.5
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 01:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hv2QW0ZLE/SBlsW6SauJjBYZHh2CW9bjbOzwOr3i54E=;
 b=M4sM+qpN0iTqJdQ1jYRgk7JBSh/y3bzfwHfoCFrbli1uy3+r1xOfB5C7DtlmzDqm+S
 fsKny97p5o1wGqdNLQEBcalkwOuDw0E9HtzTMD7u1cKseFUYyUgk6Ezv7GwjQ0FPIk2h
 zvZUpT/yU1r/++QjGAT8w4vunDt7UUNQNSJi0ZbZ2ijsFzG1YbXpGRA7ab8jbOQYiwVY
 XI2SUa2gKK8GBbVTo30425GMN+9hJSL2mOZhhB6bV93gQ8fYt1kvHYQqYTZ+GHLur2df
 PpHwRbMP0eEciTK242IcFlDlyGCmTcbs2N7gAi29h16FQNuk6v5qRMdu7ZYZ3+e3AA7y
 dLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hv2QW0ZLE/SBlsW6SauJjBYZHh2CW9bjbOzwOr3i54E=;
 b=XN6kmJh9a3roW1Lm+mzb6NN13ysofzjR4N2EkREQkbHadiEPd4hUHMk7c+F9otVrll
 e5ie+GngFJyZSLnEh9mVRXIbJQTG4vAdgDKkENA2WmGTiOCjeUdpm9MbRCD6ehMc7QL+
 UvzQw3hlIQvuLp5E8nGPefDs5clrFlv0EAOMVaCvSJHjad2WEdneV9CMn4pkGzzTSxug
 exIsongHqpC/Tw9e8rjg56NyVTfJBn6JxsgUBrXwoD2BlxZySxpJ4pr2ujF75imef54I
 /Jd5hS9e37W1b7Yr92udsd71t0ppLhX0uRtFdLJwzgKYSt6Qi0Y0sEFspliohg+58UYG
 +zsw==
X-Gm-Message-State: AOAM532i5JiuXQDJnW0y8fQuuA5QpRgOtsuR9yWSUYsO8D9qJj2Q1p2b
 i6aQ6HKrbdvY/6sXbvSQ6yRporutcGfxBQ==
X-Google-Smtp-Source: ABdhPJzkq0J2B1RwXBDcPa9hTnQAuftunhfi4pKJoT2fIzhHtIfxW+fGZWwL+2WQOx5qitcFaJskfg==
X-Received: by 2002:a05:6000:1801:: with SMTP id
 m1mr13130039wrh.198.1627288470275; 
 Mon, 26 Jul 2021 01:34:30 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id z11sm41382885wru.65.2021.07.26.01.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 01:34:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 10:34:23 +0200
Message-Id: <20210726083423.1707340-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gpsd: add SELinux module
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for gpsd is added by the services/gpsd module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gpsd/gpsd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index be7327ac95..407679ad3b 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -9,6 +9,7 @@ GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-2-Clause
 GPSD_LICENSE_FILES = COPYING
 GPSD_CPE_ID_VENDOR = gpsd_project
+GPSD_SELINUX_MODULES = gpsd
 GPSD_INSTALL_STAGING = YES
 
 GPSD_DEPENDENCIES = host-python3 host-scons host-pkgconf
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
