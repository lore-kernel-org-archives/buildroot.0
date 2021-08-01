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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF72C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 11:44:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AC93610CC
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 11:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0AC93610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D60D160699;
	Sun,  1 Aug 2021 11:44:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id owU6YQg5vI0Z; Sun,  1 Aug 2021 11:44:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4038D605BC;
	Sun,  1 Aug 2021 11:44:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B94B71BF303
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 11:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6470403EC
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 11:43:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rPZocHigrSOk for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 11:43:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1C8A403EA
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 11:43:58 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 f14-20020a05600c154eb02902519e4abe10so11984727wmg.4
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 04:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wPvLBJh/BZP4yV49KTGsGpoFZguS9Zmukdwi3hJkSXA=;
 b=oCeM+uMoX7C96bIjwMB7qDQxmlh6DWL8fwYxV2/OpGU0UpQSVtVYwRq63T/QDFtw5P
 T7ktKcwFA0P5z/6Kz1+XMMmsEvQFBtzUJ+9sSWHtzFOR1WlMTBG9dE+xvw5xLp6JEFeM
 J+xdqtgMh5M4+i1p9vTbagr4TVTOg9WOHaqbTI8MPhrXyYxhSVgb8l9079wLyc71ccW0
 wglfc5gCwk4UdMAGaiFNHM45yH+XOd5jcaM8tIoaB6BYqdf+syis6JL6Md8sEnPdvCew
 BCubSQUcGyR+ub6eACEJEWaCCeP8IugwDBQudFkJzi3cziWZZTCxjQnXOPIyr8M4tDKQ
 pb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wPvLBJh/BZP4yV49KTGsGpoFZguS9Zmukdwi3hJkSXA=;
 b=SSE03049yj2li4RxotnJQaOx+TzVxpyvoNkQNTIeGyhCtW1gK5uqyVtm5CI5/nWVik
 tqWx8ueqfkvn8K3REYmfGvfQLEk55CPZg27R6na2dh/2bqqOWnsQ5d7rNWNEhA/+Mbnp
 NuNALl7kVdThLB6hOAxKnh53fXjJeKa8o3e6OEdupRHBBYwMzdEG7MshJ3u21NajRVrk
 1DyGkwD27YtHqy7x7wRy4Qjak0xX9p/U3ed+7mZoC5NDGwm6Ola0mL/VZzsASKzkzcH+
 IHtJ5lw8bOogOabLtoki79bqlIz0CxurNz5RqH0q/Ut26IK4cRRPsSAFSGtT1A5F/1Lg
 5PxQ==
X-Gm-Message-State: AOAM533GmsTH1JTHAF9eCvgZnqj7eTCkRltoTCuPl0nWKGw4SKR7mtO6
 v4ktQR+kv3cXRCw/bV39gq47qE5ITnHnpA==
X-Google-Smtp-Source: ABdhPJznXIUTaZXKWvdeZpEsdI2TdOkXSBd51UqsxdVimxHQ/nyeKPVMPxbxmZss+bhYZUpDJvBCcw==
X-Received: by 2002:a1c:4b18:: with SMTP id y24mr385796wma.49.1627818236784;
 Sun, 01 Aug 2021 04:43:56 -0700 (PDT)
Received: from kali.home (pop.92-184-116-62.mobile.abo.orange.fr.
 [92.184.116.62])
 by smtp.gmail.com with ESMTPSA id w9sm6988529wmc.19.2021.08.01.04.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 04:43:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 13:43:52 +0200
Message-Id: <20210801114352.2763317-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/smstools3: add SELinux module
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

Support for smstools3 is added by the services/smstools module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/smstools3/smstools3.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/smstools3/smstools3.mk b/package/smstools3/smstools3.mk
index 87d189baa8..d13900bc03 100644
--- a/package/smstools3/smstools3.mk
+++ b/package/smstools3/smstools3.mk
@@ -8,6 +8,7 @@ SMSTOOLS3_VERSION = 3.1.21
 SMSTOOLS3_SITE = http://smstools3.kekekasvi.com/packages
 SMSTOOLS3_LICENSE = GPL-2.0+
 SMSTOOLS3_LICENSE_FILES = doc/license.html LICENSE
+SMSTOOLS3_SELINUX_MODULES = smstools
 
 SMSTOOLS3_CFLAGS = $(TARGET_CFLAGS)
 SMSTOOLS3_CFLAGS += -D NUMBER_OF_MODEMS=$(BR2_PACKAGE_SMSTOOLS3_NB_MODEMS)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
