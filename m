Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E23BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 16:48:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DDC1604E9
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 16:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DDC1604E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B8EF401C9;
	Sun, 12 Sep 2021 16:48:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WwkhxyGkUMxm; Sun, 12 Sep 2021 16:48:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7939B40132;
	Sun, 12 Sep 2021 16:48:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB6BE1BF423
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 16:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 955C8404A3
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 16:48:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ra4BUXgttCAY for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 16:48:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD3344049C
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 16:48:24 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so4922399wms.4
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 09:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zl1GPNxF9P3cWOY4np6i+iaF2u2TtSqCNE6lduL8Vm8=;
 b=H+6A+aqoNa/WO9I3gfTwYFjOhMUreonL9UZzgOks2FPuBZpwwm2oKzdYOq62t/sYSX
 Q6aVDymsQ0P5yhSCCdjvwtvvLAHO/FkGI0Dne+se41MDY7FjTuHu+mn/7F1gIyIYOI55
 DcvlMKvQUt5eFzCG1PEsmw+W7bRzWUELPJRDI1bYp7tu+sT3rwMyP/+qpm1IFwuVEflk
 Tnk/4t0dhd0ZQa+PsMZqDc+bfPNh3CXu7yJI3Ox5h2vjirfwU+WkLD4q093UEV5GCRFw
 iUt4GSk/vQjDaUyeTzR4A3ZDQ//dF2uFttl0Z42iV4UIa3N4izjDe911/dbH/pvh4QBs
 wtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zl1GPNxF9P3cWOY4np6i+iaF2u2TtSqCNE6lduL8Vm8=;
 b=mnNzF/IfllXRG1oQG9KUp0ajgtJDD0+dNepWb7QY2K1eDqYs7F3scoSucG90IatpiQ
 dT6y832IEUEeiZwGBa38igg2A1V0sO9gH5a14Zmd/PY9GCYEV4fye81KPpi8J18ceU+6
 SFyHNDBmqK0S6FZ9bJLutiU5d3Ae1nCLV4/FDk7tO7h5BnlhUA3uJND26MWkE3WCxmiq
 lzQZ5YhPKnagbEx4wFHkHdMEJuIgBU/n+UXGZD8ZzpiuMR0S1Qe6uwgnq/CktYKGcO2I
 cngkfVbZU6P8pErOCGTtWTbYQHrPL+73eGR+Bm1bqMYazmuTB2MvsaUO8iKL5tV2dLez
 ry9Q==
X-Gm-Message-State: AOAM5322Npq0G4MAXF0FA8CNCxlmi+1jXyeiPylRkxiD3FDyF6+pNyEO
 TLjjr/L9209UaZuG/8XcBTY+EVr7nDg=
X-Google-Smtp-Source: ABdhPJwKG3NvXo32H1dez/BEslrXYYS/qHX20RchWMz2n+e3IN83+vjzVGWzmU9GE3nVGBwjzVsoUw==
X-Received: by 2002:a1c:a757:: with SMTP id q84mr7489009wme.26.1631465302784; 
 Sun, 12 Sep 2021 09:48:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id z17sm5181071wrh.66.2021.09.12.09.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 09:48:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 18:48:19 +0200
Message-Id: <20210912164819.2164395-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/fio: bump to version 3.28
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

This will fix the following build failure with kernel >= 5.14 thanks to
https://github.com/axboe/fio/commit/382975557e632efb506836bc1709789e615c9094:

In file included from crc/../os/os.h:39,
                 from crc/crc32c-arm64.c:2:
crc/../os/os-linux.h:17:10: fatal error: linux/raw.h: No such file or directory
   17 | #include <linux/raw.h>
      |          ^~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/d85c044263c76ff7ef0fe47921d893a472954da9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix tarball hash

 package/fio/fio.hash | 2 +-
 package/fio/fio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fio/fio.hash b/package/fio/fio.hash
index 88319e4cc0..891ca4e40e 100644
--- a/package/fio/fio.hash
+++ b/package/fio/fio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  da9826f07a003656ea070d359c90f752db8c3216ced9ff865242eed1a1db93bc  fio-3.27.tar.gz
+sha256  859dca5241e5494d86c4aa1531a984cc556789c78e56b30d6070acfbdd193a8c  fio-3.28.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8a240c1ad13d1fe3e58588643d81d0695899be4a669fe6d8fafa76ca6a89db2c  MORAL-LICENSE
diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index 12e2b2ab7c..13818b60fd 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIO_VERSION = 3.27
+FIO_VERSION = 3.28
 FIO_SITE = http://brick.kernel.dk/snaps
 FIO_LICENSE = GPL-2.0
 FIO_LICENSE_FILES = COPYING MORAL-LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
