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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA9EC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 09:19:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 985C560E53
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 09:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 985C560E53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65B8F835E9;
	Thu,  5 Aug 2021 09:19:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rwpCvx-O1x8d; Thu,  5 Aug 2021 09:19:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1CA88339C;
	Thu,  5 Aug 2021 09:19:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D789D1BF852
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 09:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D41F04023C
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 09:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DQT8-KGs49Vh for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 09:19:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1038340222
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 09:19:49 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id b128so2874332wmb.4
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 02:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zxdl6tm3JrmBY93hzasxgMIRJ+Rr2CQ3452IA4kPPHc=;
 b=d+vGHQm8csxKqGFR9HCxL4z6SoR6esDDPpeS9TFhukWTvdnz025kWf/R82zKfG4cWt
 R2h93ii/bUx/ok4ssZyp61AjPabbM6aGAOOEcguDZje7N5SmopBKKymB5R81NTdKRZjf
 nmqsnCPdD951EWQpwNo7IJWJDUZM+M90IewFpZIVgrnBNF1Bd9Gk2Vjbe/KHrIAocKEb
 vLT2eYjsJzLKtusCRDGrY/n3Zokzl8L+6fNCq9AyivWvtRDPR9rxATBJ2qVGJyBEYsIB
 nep95Pb5S8wAMQBsAkeeAM2kr96d1Vwao1QLtXVD1lXldv4FxVHhDGONNVnC9WqkDs6x
 TM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zxdl6tm3JrmBY93hzasxgMIRJ+Rr2CQ3452IA4kPPHc=;
 b=JYiVNFh4l10ID+eHzOIP0r46S6el5m6DNDBwW114HDio+gsHFj2Y6X0NMLCunNF/Di
 q5uqTk468t7GAJexf3KemOvaLrnySNTvauGbwwFQ1h4bBQqly85nKZD1iK2nPSQ2gQ6e
 cQVYRq0Lug7oyaTLTVtThRKUEwilJd2PPC3+IS/vpIYRZGyasvT/4qS3PvFlgL/6BhF9
 2SD0EOLwl3LT6Bi9AvlS2GBNQujYlhUwJ7tDm5qlEsH3qHXWUowYRPzlaMYFYOXz8dAr
 RNCJQ3Qa89ULfyU+xW+jsKvub+4k6XbM3R9r1RPbl8RPhLrQYoTp8zBxOSgnW8vJQBgS
 OkHw==
X-Gm-Message-State: AOAM532h9iFYTN4b+DFwZnzQxnbIvGt3CPpdu66K/dKzsiJMBNVNEL9p
 lCFjAAz+n28JxF1m8yGv06C2ZEUzJpvarg==
X-Google-Smtp-Source: ABdhPJz9pS7xo+nsRru6gbgCHsMfKmHrjp2cBEW9gi3snvvpA9P5wU1H+WTaJIZrPw2w7LMX2D4fog==
X-Received: by 2002:a05:600c:4a12:: with SMTP id
 c18mr14011384wmp.3.1628155186939; 
 Thu, 05 Aug 2021 02:19:46 -0700 (PDT)
Received: from kali.home (pop.92-184-97-192.mobile.abo.orange.fr.
 [92.184.97.192])
 by smtp.gmail.com with ESMTPSA id f15sm5383412wrp.12.2021.08.05.02.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 02:19:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Aug 2021 11:19:37 +0200
Message-Id: <20210805091938.2110379-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/mupdf: renumber second patch
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
