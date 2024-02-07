Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6D7C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 09:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1D5F81399;
	Wed,  7 Feb 2024 09:25:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RQS0o3VGtGYF; Wed,  7 Feb 2024 09:25:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 116678136F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 116678136F;
	Wed,  7 Feb 2024 09:25:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F3B9D1BF868
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCAFA400B9
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:24:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3l57wF1KlMyT for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 09:24:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7901B400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7901B400C1
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7901B400C1
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 09:24:55 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40fe59b22dbso2889375e9.3
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 01:24:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707297893; x=1707902693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hsvnkm5PpmTyisR09aW702PIc4UH8dduDhltAR0cybk=;
 b=SAcFDRtDgPOGw3cpx9djFdINob7UX0cLgptHAnGYqrd3uSyqreff5LdXwVRrq7tNlr
 ZU/BiePlODtVjezCVmzeSnPRxNAA6Fzfo9b8cds7GAm27X6cLH0hlaTr5z4e/GHVSkC0
 dKQK19G3jc3NbP8D1WnszgSoFDsRg2P69XFg+NWcvSXDaJ/lOgZPQr8P3B8FOX6hwrqR
 D2R+LO5yP7Dlh/0nL6DgdOzLTntfRX1XLxUNoWOT1nu73oK60tiRCIr837fJAAOfPdnX
 dMDwXAq5x/bEii7/tLQMT4JLj+0+3JHKo8muWOefp+vZ8m3ZH9AlQynB3rJFM1ZuWGIL
 Kkjw==
X-Gm-Message-State: AOJu0YyDrajHyd28PMdfug5ZUsV6Ml2mU4X0c6n2yDqxrt68IPAuPMCp
 gcp84AKYXLO7yg6KhArTG+U+G3eH3ehInshvZODJLTDAH5XTdfpYEyrWCHERVwmsdDfwO9awwGz
 Wgmw=
X-Google-Smtp-Source: AGHT+IH3j7ajSkgsFpA+hhc67Cz33lYudHU9Xa0vokjMBHyMQBWUG5gth5yHVB6Jwi2G2gKP+zOW7w==
X-Received: by 2002:a05:600c:1c98:b0:40e:b260:eaad with SMTP id
 k24-20020a05600c1c9800b0040eb260eaadmr3958728wms.28.1707297893332; 
 Wed, 07 Feb 2024 01:24:53 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWdvwpto+shVGEOQQjRQQaU+E5Ue+fbg0Mw8HXuSzkgNOHl3oIL9yWm78N8N0l7ZULAtnCnOU2NsiE09XSIMU9vzbiuB8I8NX3AU80dav8hmh7zO4m3XFFEGXeGv49AVn9v5z7K9yUB
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (mob-5-90-63-114.net.vodafone.it. [5.90.63.114])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b0040fddaf9ff4sm4656822wms.40.2024.02.07.01.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 01:24:52 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 10:24:47 +0100
Message-ID: <20240207092447.2094160-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207092447.2094160-1-dario.binacchi@amarulasolutions.com>
References: <20240207092447.2094160-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1707297893; x=1707902693;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hsvnkm5PpmTyisR09aW702PIc4UH8dduDhltAR0cybk=;
 b=NqNf3hnFO+qV5kqSx67MSuwDpHBiknHvCWEQwfpg2X+N0X2SgYMWOd9/mep7eLC8RM
 QUZPC9WGCx3D2MHVPhbmQaXU7yoSg1Lqa2UIjQXs5566XV+lJ6Y/rAiO2oAtK5D4JXOU
 yQ9k2uT4Qh03+hnGhZ90hf0qh0r+76Av2A9Tc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=NqNf3hnF
Subject: [Buildroot] [PATCH v3 3/3] package/uboot-bootcount: bump to version
 3.0.0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Dario Binacchi <dariobin@libero.it>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Support for i.MX 8M chipsets
- README: updated documentation and source comments

Release notes:
https://github.com/VoltServer/uboot-bootcount/releases/tag/v3.0.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- The patch has been added to the series because a new version has been
  released in the meantime.

 package/uboot-bootcount/uboot-bootcount.hash | 2 +-
 package/uboot-bootcount/uboot-bootcount.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uboot-bootcount/uboot-bootcount.hash b/package/uboot-bootcount/uboot-bootcount.hash
index e1ebc442357e..7f46da22ebe0 100644
--- a/package/uboot-bootcount/uboot-bootcount.hash
+++ b/package/uboot-bootcount/uboot-bootcount.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  12b5aa83736efb2fefd22cd4d9f305a25c68dfaa10401d5efb17e55a5163934e  uboot-bootcount-2.0.0.tar.gz
+sha256  b26b9135716afb2ea967edc2327d1d307cdd15a643bd105dc223d062e18f2dda  uboot-bootcount-3.0.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uboot-bootcount/uboot-bootcount.mk b/package/uboot-bootcount/uboot-bootcount.mk
index 07b52ab89eb5..48a45b91aae0 100644
--- a/package/uboot-bootcount/uboot-bootcount.mk
+++ b/package/uboot-bootcount/uboot-bootcount.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_BOOTCOUNT_VERSION = 2.0.0
+UBOOT_BOOTCOUNT_VERSION = 3.0.0
 UBOOT_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-bootcount,v$(UBOOT_BOOTCOUNT_VERSION))
 UBOOT_BOOTCOUNT_LICENSE = GPL-3.0
 UBOOT_BOOTCOUNT_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
