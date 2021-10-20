Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B2DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 16:40:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4980360551
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 16:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4980360551
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D2A34060C;
	Wed, 20 Oct 2021 16:40:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id umOzwmGdksOA; Wed, 20 Oct 2021 16:40:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D54D4036A;
	Wed, 20 Oct 2021 16:40:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 857801BF372
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 16:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75BDF600B9
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 16:40:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q2SgH8FseU38 for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 16:40:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22FDE60591
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 16:40:21 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id p21so20251767wmq.1
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 09:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C5AvG7G4RKUa6sKlgJMrW6rqBa/NC8/NzaYzA3WGjpA=;
 b=CDF2KvouhzRRHIu0OWvtlbfCb82GeuQoU8/eBFejS84DrKSptAUq4paoGLpwaX5q6e
 CeqEgXQ0L9oqE9e2agsbdfUiuCjpJAW2TqaGmKWSH1hH1lVNOyIO4apld5m74qcsrYTX
 Fqdf3T4zqPwPHrgb1jQoNOCpoa91AhepLmTEm2h/Qq+IYBfAHBlqbTkJeNZaYUd/f+K9
 Ok5Se60TEc/mN5gwGE2NdMfAH/Ig/XV2Iz8yTbXYhU8mI6ZaYidm9ab3ScXGPC4Pj+bY
 pWTSP7imf0d8qq7S8F190/AJNULazSvTFOH9bMWQyVFjVrKoCdDFKpHUg5/i7UNuuVXA
 /nAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C5AvG7G4RKUa6sKlgJMrW6rqBa/NC8/NzaYzA3WGjpA=;
 b=X2FU5RtjYUmK51GaFSatyJoRPw6JqMYEIfZ0g+EZx2zeBOUKBLEGScU02NE5PKciY4
 gp5vFMldZiH8aRUVeeCFWInIYGKs+EkU3C9ef6UGkELGE6e6VaKbwH8PyvTXNpgDD+bk
 suwJ5ksrTm8Cmx8bWqpK6MDb7vNLrP8ucvB5BlXjZsJWJ69expoKvxRZp81q5OJkw5rq
 hRBzIuH9tNGorf9qnsSOKyb6LHCNxA6CrEJ1LeMVu3gJdS6aBoXgspejhd1uBdHbXqfS
 C8cD7OckKXikBTIwP8t+x/V29DbuUz1C3McTfq33wrif4pxLfx0/Ybm/jGnQnNjwVStW
 ZqtA==
X-Gm-Message-State: AOAM530IMHU2oV6gm1SV0AjV6QrG/grHPhn33cS2ZSvxU8WWkXV5URt0
 h7SVYvXqWCT3b5hUoYxWvklkirYzgwQ=
X-Google-Smtp-Source: ABdhPJxw6/vmK07ZfNXEBnQjWpE4uAzKfPFyPTTDV7EVtpiUHyYuc7DZb5e+HlzGALc+ufoypBEvtA==
X-Received: by 2002:a05:600c:284b:: with SMTP id
 r11mr14919349wmb.179.1634748019069; 
 Wed, 20 Oct 2021 09:40:19 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id n12sm3065667wri.22.2021.10.20.09.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 09:40:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 18:38:58 +0200
Message-Id: <20211020163858.2698313-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/drbd-utils: bump to version 9.19.0
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/LINBIT/drbd-utils/blob/v9.19.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/drbd-utils/drbd-utils.hash | 2 +-
 package/drbd-utils/drbd-utils.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/drbd-utils/drbd-utils.hash b/package/drbd-utils/drbd-utils.hash
index 47f6f6ecf5..58d282714e 100644
--- a/package/drbd-utils/drbd-utils.hash
+++ b/package/drbd-utils/drbd-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e89be59e60fc33534481a5dcae90de242e35867512d85cef2878ca757bfb074a  drbd-utils-9.15.0.tar.gz
+sha256  3827bfed6630f8784ec558a8ac3de68175d544876d897c0810ad141a61487cad  drbd-utils-9.19.0.tar.gz
 sha256  1ca3e8f71b7de618968e7ea9fe47822d9e704dc476aef8544033abedec355225  COPYING
diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
index 6482cf70b6..2082810a37 100644
--- a/package/drbd-utils/drbd-utils.mk
+++ b/package/drbd-utils/drbd-utils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DRBD_UTILS_VERSION = 9.15.0
-DRBD_UTILS_SITE = http://www.linbit.com/downloads/drbd/utils
+DRBD_UTILS_VERSION = 9.19.0
+DRBD_UTILS_SITE = http://pkg.linbit.com/downloads/drbd/utils
 DRBD_UTILS_LICENSE = GPL-2.0+
 DRBD_UTILS_LICENSE_FILES = COPYING
 DRBD_UTILS_SELINUX_MODULES = drbd
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
