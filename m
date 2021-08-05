Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1C6C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 09:22:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19C3D61029
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 09:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19C3D61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D976883979;
	Thu,  5 Aug 2021 09:22:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zSklFiPkG2xa; Thu,  5 Aug 2021 09:22:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E8AE8385D;
	Thu,  5 Aug 2021 09:22:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3128C1BF852
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 09:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C61F401B0
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 09:22:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3FWOhATjhF2D for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 09:22:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E7A0400AF
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 09:22:39 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso5764676wmg.4
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 02:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zxdl6tm3JrmBY93hzasxgMIRJ+Rr2CQ3452IA4kPPHc=;
 b=SIU7760qF4vSWjgR6sf9owNHD7VRo8p3GdJb0BJhNNKPzYqpOkMaHkObpk3yhdUL/j
 HFszYb+nr9/cZnwcrRyHe7ytRFydxgWEk0CIVcqQcE2PkXm50Jl7LLaohVe41lqmaU0p
 6DMLoIPC+YgqUFWfCQHiSvTz72zzoqT3HJsTP6Gg/0hQkCRvIDcu+v3EsA4zsFCMw7zU
 b7hp7lXgwy2vuFdayxAXbtCw7ufhRZS9Rk9bm+Xv/DXJ9BMVtUmXWevaKRlqiv82vrwT
 9IIrMIs509IanptWsCio9558r9LFWAk6hJ+qfsc4EOi3ttEIwJTsKlQ0tdR65fda3vjr
 utzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zxdl6tm3JrmBY93hzasxgMIRJ+Rr2CQ3452IA4kPPHc=;
 b=oyUTB/fTIiq/tNhC/FaeQveBLhQtwPsQkbXVT5ibQLsmlsK/labAY4XbsI2ElDtX6P
 zBBDbZjx1Y9y/+iUUf/pGalVQoO47CZNv2Yorb2QrktMeWOuZAd5jEy7b14fYOfXit2U
 C90byKA60OTkcmaBAAzVI2/VYgS/0o8G7Uvdc6BF4Dv2TSeZXrZiT4jS/s7L3sd3Tmvz
 nXy4lsKqxOH8P6WxcPjX/M77FSrSv4wtFmZh7sl1FIy539ybBo1mEfqJkKWu2jJD1NAj
 QKPcsdJ1jlU0b6s+w/5+PxVn4PGMVqwAwmNsIEYCs5ALLf6F1+47XudAdopjM2As6MBK
 yNYA==
X-Gm-Message-State: AOAM530VRj8vn0m274t4/40hHky/cgZ+lBQMNAkib6zj8Jo2n/ScAQfm
 QVhuYPjURW74pOeC/s5ftolwSYUWpNkZSA==
X-Google-Smtp-Source: ABdhPJxqP0t2Z4uZkB9xr3n+JAHEDvYbFU7AzerTeJ98tZe3t3JAWJp87zINOMNNY14o0NemGgI4sw==
X-Received: by 2002:a7b:c84d:: with SMTP id c13mr10152406wml.18.1628155357471; 
 Thu, 05 Aug 2021 02:22:37 -0700 (PDT)
Received: from kali.home (pop.92-184-97-192.mobile.abo.orange.fr.
 [92.184.97.192])
 by smtp.gmail.com with ESMTPSA id v6sm5351430wru.50.2021.08.05.02.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 02:22:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Aug 2021 11:22:25 +0200
Message-Id: <20210805092226.2110638-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/2] package/mupdf: renumber second patch
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix mistake in second patch number added by commit
d7d23710facd789c8986de055e30792af2591f2c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...703366-Fix-double-free-of-object-during-linearization.patch} | 0
 package/mupdf/mupdf.mk                                          | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename package/mupdf/{0001-Bug-703366-Fix-double-free-of-object-during-linearization.patch => 0002-Bug-703366-Fix-double-free-of-object-during-linearization.patch} (100%)

diff --git a/package/mupdf/0001-Bug-703366-Fix-double-free-of-object-during-linearization.patch b/package/mupdf/0002-Bug-703366-Fix-double-free-of-object-during-linearization.patch
similarity index 100%
rename from package/mupdf/0001-Bug-703366-Fix-double-free-of-object-during-linearization.patch
rename to package/mupdf/0002-Bug-703366-Fix-double-free-of-object-during-linearization.patch
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 294cd8a61b..d3d9d3b101 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -22,7 +22,7 @@ MUPDF_DEPENDENCIES = \
 	xlib_libX11 \
 	zlib
 
-# 0001-Bug-703366-Fix-double-free-of-object-during-linearization.patch
+# 0002-Bug-703366-Fix-double-free-of-object-during-linearization.patch
 MUPDF_IGNORE_CVES += CVE-2021-3407
 
 # The pkg-config name for gumbo-parser is `gumbo`.
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
