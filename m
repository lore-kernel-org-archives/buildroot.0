Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE906C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 19:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CB9B40276;
	Tue, 11 Jan 2022 19:17:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mTgHHTH8Dut1; Tue, 11 Jan 2022 19:17:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0B6D4026F;
	Tue, 11 Jan 2022 19:17:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 304E61BF372
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 19:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1345482542
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 19:17:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AmxcKysfY8F0 for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 19:17:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30122823CB
 for <buildroot@busybox.net>; Tue, 11 Jan 2022 19:17:24 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id l4so14130wmq.3
 for <buildroot@busybox.net>; Tue, 11 Jan 2022 11:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dSQPKg+PM2sDMVgS1Pc/E78JmH0vkVdmJaE0nZ25R6Y=;
 b=MZy34d9CuErtjtTtPqy6bLDFd93++3thZl1FU9mzj5mb+ypz4mYqAEyCkXDbZAw4LQ
 RIKzaIxRbbaUSLSeDJwRbBmwfBT8hxYyx3qM7KIqA89+sIxrzNAbgm+wjuvKK2wYCqdh
 oeXpMn+q54FxKW/b4LrcyX2+Ll6mkDzueZJb48NesgPhuou841ulD2Igqe+GwOepSHSY
 XRDuymtt2Tw204KnYpdzudPVFt7C8SbXZKTXDLMJ3zPDY1osn52gjbnNyvdkfXBeHsGV
 6mrf7xah7x/M72Q/ON3ZvvgPqbTszgJSF/MPW6lwfmA1g7PP4KpciechAAHWtOvkymg0
 aR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dSQPKg+PM2sDMVgS1Pc/E78JmH0vkVdmJaE0nZ25R6Y=;
 b=HoV3wHmOOOUh3a2C/3aKo8TKaDF20WkXgu9yxIh8G2LMibmuQyc+Q4J62OKInwRSA8
 T5+y9YeX+yIeRjxgs3qPvO5Txj22sMx0EkCXBkPgRBEA3/03WUELVz9lynzzBvSXPVfN
 sbKZJwm2aJXPgptxYCqM/ABnyobAo62us8rIJY/Tik3sjozkNWVXm6OvvSmKUqF0P9e0
 IS5x+YM0s0H7EUpAGPHIyZfCcsNpE7i5P3nBgYWxZCHPhoQJFky+Gx0K/1GwvXNVnIEe
 IVYDW1CX24pbUOQZSPlK6UZEhXMjwcWum/m1iNOUuDaUGAn1Jmv8pVjrwgP2mLIp7+PM
 7sAg==
X-Gm-Message-State: AOAM531ef+9Y8+kHGd0Fqs3/mhhBlp19Y1BCF7dcw7wapN+PlSpeKCFy
 Im2tPj+xAGLZuiU4Bvt2mkykzsAxqcM=
X-Google-Smtp-Source: ABdhPJzfgDqeso0IQciI9+9goFe1tqNp45pbQ4uVQMCYv1j1RMgjZOwJlgIY2ynwC7QcMDhMfmOrzA==
X-Received: by 2002:a05:600c:4f8d:: with SMTP id
 n13mr3680774wmq.43.1641928642420; 
 Tue, 11 Jan 2022 11:17:22 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id p18sm3437250wmq.0.2022.01.11.11.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 11:17:22 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 11 Jan 2022 20:17:12 +0100
Message-Id: <20220111191713.11473-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/zic:  bump to version 2021e
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../zic/0001-remove-dependency-check-on-version-file.patch    | 2 +-
 package/zic/zic.hash                                          | 4 ++--
 package/zic/zic.mk                                            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/zic/0001-remove-dependency-check-on-version-file.patch b/package/zic/0001-remove-dependency-check-on-version-file.patch
index 193c26304..62adc59c8 100644
--- a/package/zic/0001-remove-dependency-check-on-version-file.patch
+++ b/package/zic/0001-remove-dependency-check-on-version-file.patch
@@ -18,7 +18,7 @@ diff --git a/Makefile b/Makefile
 index 1b714a8..00d2c09 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -587,7 +587,7 @@ INSTALL:	ALL install date.1
+@@ -593,7 +593,7 @@ INSTALL:	ALL install date.1
  # Otherwise, use $(VERSION) unless it is "unknown" and there is already
  # a 'version' file, in which case reuse the existing 'version' contents
  # and append "-dirty" if the contents do not already end in "-dirty".
diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 3cee80bcd..9e17621de 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2020-December/000064.html
-sha512  5f6bf1b508434842eb9dacacc744b5f3375c35b88e401ef372b5fde80ad2f523484fe52a6e99460e402230406ebf6a9261a97efde45a610f8e8085893d55c4ed  tzcode2020f.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2021-October/000069.html
+sha512  87b0335129ea41c5f42f687f548712e5da892baa8494cecf5d34851beceecf6ae52f22104696ed187713cf9e502570eb2041e277dfd3c043c11d0253bfde685a  tzcode2021e.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 7529b682a..13f3a83bc 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2020f
+ZIC_VERSION = 2021e
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = https://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
