Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C3FC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:42:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B256E61166
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B256E61166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BC4B84024;
	Wed,  6 Oct 2021 15:42:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BTikgoct5ab1; Wed,  6 Oct 2021 15:42:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA1D483FB7;
	Wed,  6 Oct 2021 15:42:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11A961BF947
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D29A4011C
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:42:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2jANucVqZdcc for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 15:42:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D02E400C1
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 15:42:25 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j8so10132023wro.7
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 08:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lA2SDLzYOJaq9g9jFLL6F0jhi4rACxre0/n7NP5LlJU=;
 b=RJeUO3PejKp3TlxLNTLW0eKeBqE+k1mClcbzYzlBjuDkm1ysZgz6AARocPmuUHvTVs
 wPuJc3rHamZtfFf4WzSwczXEilqx6/OEG7NKq5rR0Lu3wNRoAWM5qWwowYV8ofFvy4i0
 ihby0/DuIanZltdPvO7397pmdCM58Z4SqxINiCwcUriDOyHtA16cLwwP3OvkpFSMMGAa
 M7BWfo1TUcIoRuoSrPNyv9xr3ZoxHht2ZA3eFJTvoIpdx5Ut4CzKjXrbE/kIeExyDoXN
 oEb3LqkjqPa+Cj/JrtXPYze99PTrtOnIjIJJ75+N7O2TOEkhicXITROjM5AMQFHOAKaO
 UAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lA2SDLzYOJaq9g9jFLL6F0jhi4rACxre0/n7NP5LlJU=;
 b=ioOQWL8StwDtI8AGrvGkcpV10W1veqcltt5zpB4Lv/TKl2Aj+059RHUHkMMi5krkPs
 NNyox+/RFWyYZPoSN6T99Fq70+NlSwP8klcLRAUkqWWufcSAKPzWUEujenSq3PRgrohQ
 YQ/CayRNopinh6YInKTX32CeTn5UqXWVS094P12jIcs3pIHCNW4N7touFZAJKTW/zg15
 ES/uap1NIdxrR2Qpua+t1BhAa7Z72kB2gNemdQu/EcThE1pLEN3dumKuhAQMuD1cyIQK
 S3dFaR7FgoXiBAdTQLbfZca7s8rKcQd50Zq2FuFyy4OIpGfg7Nhf62xSFULZ15oEsXrj
 gLEA==
X-Gm-Message-State: AOAM530gyRczsPvP2ZGP5E9Q8Fw5rDmU2/ssX4ORyQZscFQezunOUnMY
 VXM1aJO63LvgR16kfinV7KXzW12l/a0=
X-Google-Smtp-Source: ABdhPJyiF+8VnojcJpCZ3PUpSOYcB6FIxAI73hzUUMoQyGLq3Pq55X429EsCXL4WVIRaoMuKvpaKmQ==
X-Received: by 2002:a7b:cc88:: with SMTP id p8mr10761058wma.101.1633534943422; 
 Wed, 06 Oct 2021 08:42:23 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id e8sm5419100wme.46.2021.10.06.08.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:42:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 17:41:36 +0200
Message-Id: <20211006154136.2243511-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/supervisor: drop python-meld3
 dependency
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

python-meld3 is not a dependency since bump to version 4.1.0 in commit
5da3e1a3e6ccd3c0bfc7e3a9ebe0b14f903af518 and
https://github.com/Supervisor/supervisor/commit/d09d843493eb77cb8c3df52e1f7e636ad0e5b4dd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/supervisor/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/supervisor/Config.in b/package/supervisor/Config.in
index 623c3a836e..7ca3cae134 100644
--- a/package/supervisor/Config.in
+++ b/package/supervisor/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_SUPERVISOR
 	bool "supervisor"
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON_MELD3
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime dependency
 	help
 	  A client/server system that allows its users to control a
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
