Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEDEC531F9
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 03:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22CB6405E8;
	Mon, 27 Jul 2026 03:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RBxxx9Z6ll30; Mon, 27 Jul 2026 03:17:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 325ED405A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785122246;
	bh=j6qGv1dTVGHyaANitKT43SupGsgg+iuhs/PV+m68wv0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gtHYV/DY77X04YRetwemposkjoQp/VW92SpGDAM7dB07MtLOjpY2ieggh+aENOUyy
	 qBjbEyK4dzbNEwbOmZN2Wkd+Lxx/ZlL4rKeMDvVV830CPe/bTStD+E392C1tn3WUFn
	 on1hr8UcyZK86ZlLbJh5m0NgTDyA8Jud6pKqQPJg0pyf4jZBVqyBc8btSxzjy+Dx4a
	 vSt7PaFvdG/B+QkqgZPxulNWzjCi7fqC3Ao62mt2x0Xpc55bI72JmBnAJ/si7cXAQP
	 RsJbsgo4KhtK5xgbGzR3oaT7Q1MmKN8Sj0FQaMuVpxLAB2zu7nkn5RA52gyyIM8Jbc
	 PNRGcfpcFoShg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 325ED405A2;
	Mon, 27 Jul 2026 03:17:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 29101350
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 03:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1270780C75
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 03:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qj2Um5QjjWnj for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 03:17:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5CC6780BEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CC6780BEC
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CC6780BEC
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 03:17:24 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-38101f85591so2884884a91.1
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 20:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785122243; x=1785727043;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3q3ucMf8DJqd67BNmbGzEXqiCQ8X1F4eBiCcyW+eDi4=;
 b=OoQO4D9KStQNUdtxMA7C39e0VF2GFuWXJ0vwTgmmTVDnWhXR4rZcrYTtdSCtGXr771
 eRXst+earIyJKCoRV+Lep6N7z2GQVgbfR6uHzMx9hiUS/dKKRTQDBA1wAXAj0o+g10V2
 MT7MFo616y4VDJW7sPbWiywYFRyPj0hSIojb/sXWkJCr4iOkSY7f4YdvcduRhyx/VjbE
 Ql/oCuuyr1As8JswROY+B83FSvwBHzgQsYJAITHKqKiUBlZ6vH0LYKC12ogsL346l/W3
 mk2d+OguwHkspju7b/G3VRGkYPwk5wekmwoFuPdxLq89POIkWWiBZJvkPCZfjArjtz+s
 bmOw==
X-Gm-Message-State: AOJu0Yw6QxXw+VOdEVF5rmdV/Er13eneoDtCn2OoAanYi3ugeCzjRu7r
 S2U6G8BrYEHC58pdvktjQ8cYUb/17WAmrZUnELTlvwwxMcRNxuCMzUn6BMbzbyvY
X-Gm-Gg: AR+sD12zbJeVi0RGT9544UVrl6yRMHWXcpwxJ9AufIVPFAA5JB8X90fL47fNQURPorG
 RQPtGUq2TBv8D4pGeTtIbgVATIbxWQrSZsSn8rfnIN7BvVlU8GPOWRbVLT8kVq7mlQYD6zSOcSa
 8/dD+dUUm5yd35+Zs/uM+4PpSon+Vb8W2fxRE0Qeyc3TE7iHtp4dulnZYiwBDz0N4gNUq0+iB9M
 PHPpEbDL2FJxRvg2kZcNQYsVmMhUgxyvjsC1KxhN7fu3q47agpcK94u04A1t9x9OlkFPORaeZYi
 Ci0j79NaRih/SU4RAmZOJ0JJT2tAHjeUXr7szpUHMwfTcT7sR9SJlbyF3E39wuWCazBOKJgpKQi
 u6i9go8fKU5wmFTfLExzYt5NZNr/nO6R4aWs7ZUwhM/0TpTPeSAYnjfbs92mzLJ698Huwc18k9Z
 FS7qOqK/UzOkY7tK437nXo4bSPoijEb3E+5CIFmJf0kYeQIALdWSsMdvaI2Q4YKNg=
X-Received: by 2002:a17:90b:3145:b0:380:86d8:8162 with SMTP id
 98e67ed59e1d1-38f1f0132c6mr8985868a91.18.1785122243301; 
 Sun, 26 Jul 2026 20:17:23 -0700 (PDT)
Received: from kadvm.. (ip72-203-121-181.oc.oc.cox.net. [72.203.121.181])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13d6ba579c3sm20860283c88.8.2026.07.26.20.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2026 20:17:22 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sun, 26 Jul 2026 20:15:19 -0700
Message-Id: <20260727031519.104057-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785122243; x=1785727043; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3q3ucMf8DJqd67BNmbGzEXqiCQ8X1F4eBiCcyW+eDi4=;
 b=r/0nexndS2VnmREjwYs4aZu9tbRuWpxNrUtwoPkDbV7oZbZk39trMbC1ZqHEr/RDUG
 jOq3Li894pSYTKW7ygewzBF+wlfCKAwYxFikENF/ZAYQFezpBn3B1N2lGH+Jj8bOoncz
 yS3P9KwRYy9DQWwUsq8BHUWZeWCcRIJ/7Y4kbKpyQSb+U+h+0Ul1Yi0XJwwGRM2ccRTm
 OAdml/otIHCeiw18hQE0qYWkf5bOsBcIDBZ6H+SrOKDbNSHsl47JEOZcnmx/M/5JsNie
 0rZCw1iJ5UJUOCMf9CwWszqhzmv0OEaev2aj8O+IKS4rdHDFgjcr50PJ1eTUTl5DtgAZ
 MoGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=r/0nexnd
Subject: [Buildroot] [PATCH 1/1] package/ustreamer: bump version to 6.61
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Changelog:
https://github.com/pikvm/ustreamer/compare/v6.52...v6.61

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/ustreamer/ustreamer.hash | 2 +-
 package/ustreamer/ustreamer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ustreamer/ustreamer.hash b/package/ustreamer/ustreamer.hash
index f5351e4f9c..1e69272722 100644
--- a/package/ustreamer/ustreamer.hash
+++ b/package/ustreamer/ustreamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  db00adfa02acfbdf6682ffae8e418b582d623e1971672d5df19858e02e2f3b0e  ustreamer-6.52.tar.gz
+sha256  d280f260c2c8cf1bf029ac5a0eb79af4c36e7ec0d47b33b37dff7a1c245384c6  ustreamer-6.61.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ustreamer/ustreamer.mk b/package/ustreamer/ustreamer.mk
index b699b30c84..b9f0e8aafa 100644
--- a/package/ustreamer/ustreamer.mk
+++ b/package/ustreamer/ustreamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USTREAMER_VERSION = 6.52
+USTREAMER_VERSION = 6.61
 USTREAMER_SITE = $(call github,pikvm,ustreamer,v$(USTREAMER_VERSION))
 USTREAMER_LICENSE = GPL-3.0+
 USTREAMER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
