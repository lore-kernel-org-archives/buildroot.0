Return-Path: <SRS0=a43l=QF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51044C433EF
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 21:03:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9612461929
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 21:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9612461929
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33193605BC;
	Thu, 18 Nov 2021 21:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fR73uSbkvdMg; Thu, 18 Nov 2021 21:03:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F84860664;
	Thu, 18 Nov 2021 21:03:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22E2C1BF417
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 21:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 129F08194C
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 21:03:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BMs-N-elAm7g for <buildroot@lists.busybox.net>;
 Thu, 18 Nov 2021 21:03:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5CD88190B
 for <buildroot@buildroot.org>; Thu, 18 Nov 2021 21:03:08 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id w29so14035718wra.12
 for <buildroot@buildroot.org>; Thu, 18 Nov 2021 13:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vT/k5KuYEDfHVK7CuQpNd6Njcgq8fy7phvWSCO8JK8s=;
 b=S+Ltn41PhBLrkZNHXk2qQweRiMt+gjm9EsoSZo/W4klUlJaIgD/WTGh/bPe56+t6Ik
 xXlkLTeJHT2McDpWhF9VH0i49m2ctC00BoC6mQUbWpUh33Er+F1Vy/Y7fs8NnMw7jAr0
 hrjITkraQLW1l5Fg6B0ed5co1EdCkX8kEW2ZHESGTwJQXf2CQfUtLOk5mQr3C48mRwDH
 DlgCC3kY1B+f6tcI8kdTZ+e6unoq/7o2WYQ1rt0fo8RYTN6wjMD9StGxHNcBdy3yEV/n
 MFpDapGXa+jo/baBz2yo4cxTFZFqtsjyoPGAZPCaNdt3gX1BwSJ3JG2qbqZm/1+QmiYx
 7IiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vT/k5KuYEDfHVK7CuQpNd6Njcgq8fy7phvWSCO8JK8s=;
 b=iKtGy1sgxxUHlFpwZzstHQfy1u2GVuqlnHmvwSIR633wQUeOy7HF7uDCtuLJEuKgID
 nWl510poKzWj3Mq7o/ZhRpIg/EgE5poBSVx2ARvtwmdXJyqQSCkZUt+CLxpmjhmZCK5s
 GsiqDIpm78SV+RUbw+4OTMrmYau5Q8jlq3qqQhSAEOi8NDyVHe7jang+uquYscKV1XMQ
 BWFD6m/ac49vBG4rs+6S/nQ0nGlRg8K8nzBQ1gVNyKgvXfj7f97OGOdeo9KYqr2TeBmO
 TdRKcCs/OQJgl+1wH5oyvYpJxrAlTfvhwYNLRmXRTodOkH5gW5FwEEMvxllq+IP5NT0Z
 /Uqg==
X-Gm-Message-State: AOAM5319ZXW6CtnlZX/83GJjk2qQTVtkP+El805nquupsky0uX4rBurA
 xzgYHYmNEoOyiMwXpad6ivQlwSy0vyU=
X-Google-Smtp-Source: ABdhPJwGaggHZEyhmGbyy2rZuPXAe9OEFdfTmsywDPK9cqiw13oRQUm9Yr1qnTFSuw1/S863SdzBWA==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr578835wrr.143.1637269386765; 
 Thu, 18 Nov 2021 13:03:06 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id m22sm1029724wmq.38.2021.11.18.13.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 13:03:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 18 Nov 2021 22:00:48 +0100
Message-Id: <20211118210049.1598576-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libhtp: bump to version 0.5.39
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

https://github.com/OISF/libhtp/releases/tag/0.5.39

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libhtp/libhtp.hash | 2 +-
 package/libhtp/libhtp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhtp/libhtp.hash b/package/libhtp/libhtp.hash
index 91c20697df..eae3009c76 100644
--- a/package/libhtp/libhtp.hash
+++ b/package/libhtp/libhtp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8365f338fdf5ef0f3b37f3cb4e2670d218c843eccc42aa87119819c0f018ef39  libhtp-0.5.38.tar.gz
+sha256  d5956b49314fc6a058864130fbcf040a12584ee1e38f3b6ea52aedfa99d4c14a  libhtp-0.5.39.tar.gz
 sha256  87c93904e5434c81622ea690c2b90097b9f162aaa92a96542649a157dbf98d15  LICENSE
diff --git a/package/libhtp/libhtp.mk b/package/libhtp/libhtp.mk
index 982ffe81cb..382750ea79 100644
--- a/package/libhtp/libhtp.mk
+++ b/package/libhtp/libhtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTP_VERSION = 0.5.38
+LIBHTP_VERSION = 0.5.39
 LIBHTP_SITE = $(call github,OISF,libhtp,$(LIBHTP_VERSION))
 LIBHTP_LICENSE = BSD-3-Clause
 LIBHTP_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
