Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AAFC433EF
	for <buildroot@archiver.kernel.org>; Sat, 26 Feb 2022 18:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A371540441;
	Sat, 26 Feb 2022 18:24:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MhiC2ZTE4UWv; Sat, 26 Feb 2022 18:24:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B04E24036F;
	Sat, 26 Feb 2022 18:24:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC9DA1BF281
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 18:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5A69606E7
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 18:24:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eOfPi2jtrFcD for <buildroot@lists.busybox.net>;
 Sat, 26 Feb 2022 18:24:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCD0C606E6
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 18:24:46 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id s13so9215142wrb.6
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 10:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fhPbkiv0PueKljfZqZj7f0CEdWfQOgnS26YR8iW/fgk=;
 b=P6hCh4WkJp3JNVuBUKcDBnFiWuE19Hp/ueiDDEAE0mqzqMESk+zW+tGYOCEwpx7XSO
 BcVCUHNp4nZZTbpwbhkbtU8skKmiAmA3XAjbH8arrBJUg2gRvpUG+5KEWGkOJz0zryU0
 TpL+PJRt6ZC3o4hiOhRiDrAHmyQgjfYUvKuiNOU//JrR0Y0SDVJiBW2RPyrP7bBn6RIJ
 fNr1Rc5TI1y+C6wHLMFQmqvY1jK09T3SiefzAf4dFYKZGc/MPPzd8T1RN3jmZ0uGp4Ip
 4WwGgaoy4nxIHNguRdvCwnpew2efWdtFHlP33CkgWTLbRw+8kLc7Y0VvZfqS3yi9Q1Hu
 ZAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fhPbkiv0PueKljfZqZj7f0CEdWfQOgnS26YR8iW/fgk=;
 b=hkkT+/O6U6j8dpgc4PZoQTQH6KxTX6od6X2rwDecygDz2uJWu3GqdlZpS71y188DkA
 ZW+aLXxawqeCUvpyvNV9vmcVS44zGzbpdfLU0GECNUe3DaeOMibFJgqfhALG1OmlnWW3
 DLm0WAwmyUJQg3mW+sPrSD+q/3tdbmthSu+QdyMzqhsLq5bjvNrNnahtoeYvU5v+YJ6Q
 T1jypSJHDi15+rlDAGjWKmtvhQRXgdQiJTwY6nD+7Hn58Rp1aF70c2XZh8MDfAJE3ke0
 6C3AQo3QxzW0ixzxLkT572mt0FiGPvcdIlUEuZ59ZidFRk504zVQcRW+Q/w8pRtylvuZ
 iRww==
X-Gm-Message-State: AOAM530RM6IMX3Gn4eIgMOrB9s23Ck9JVhA8dlpWjVdUUI74J1/d0OS4
 k4p8L4V3irAy+bj0/AL638nDTj6BPx4=
X-Google-Smtp-Source: ABdhPJyDGRSQXiCVTEqhHRSNkG2riIaZ20iKvezaMrK/h65FgHsCGl/A2hEiVxLyY0cBV684USLWZw==
X-Received: by 2002:a5d:4890:0:b0:1ed:9d4e:f8ef with SMTP id
 g16-20020a5d4890000000b001ed9d4ef8efmr10476581wrq.595.1645899884876; 
 Sat, 26 Feb 2022 10:24:44 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d29-20020adf9b9d000000b001e75e86d39fsm5637384wrc.74.2022.02.26.10.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 10:24:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Feb 2022 19:23:56 +0100
Message-Id: <20220226182356.3035297-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/cukinia: bump to version 0.6.0
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
Cc: Shyam Saini <shyam.saini@savoirfairelinux.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/savoirfairelinux/cukinia/compare/v0.5.1...v0.6.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cukinia/cukinia.hash | 2 +-
 package/cukinia/cukinia.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cukinia/cukinia.hash b/package/cukinia/cukinia.hash
index e6ae602011..6e76a6ab88 100644
--- a/package/cukinia/cukinia.hash
+++ b/package/cukinia/cukinia.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  b867ec63e448e7fa0a9276f6844a8b3a8f92d99e63e8518fe24e9debd32679b5  cukinia-0.5.1.tar.gz
+sha256  79dc77c7b9f2784e7d22d961dd2c4ad9c78deebbc6e8f39df4fa214118682b40  cukinia-0.6.0.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPLv3
diff --git a/package/cukinia/cukinia.mk b/package/cukinia/cukinia.mk
index 84d4e60ea8..798c199b67 100644
--- a/package/cukinia/cukinia.mk
+++ b/package/cukinia/cukinia.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUKINIA_VERSION = 0.5.1
+CUKINIA_VERSION = 0.6.0
 CUKINIA_SITE = $(call github,savoirfairelinux,cukinia,v$(CUKINIA_VERSION))
 CUKINIA_LICENSE = Apache-2.0 or GPL-3.0
 CUKINIA_LICENSE_FILES = LICENSE LICENSE.GPLv3
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
