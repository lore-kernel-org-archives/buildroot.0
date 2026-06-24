Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD95CDE004
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 14:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A84160884;
	Wed, 24 Jun 2026 14:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eah6WFyXOtIy; Wed, 24 Jun 2026 14:07:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5481D60B12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782310020;
	bh=8cWG9xwQfc+FfeOiaPm9p4p5uwZS48kpQ8ft2ciw9s4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=AbFdh2lErLnW7COIiLtXsZLiezmF4qN3gxV4LmZPrGOWE5TgRalat/MhTK/VaYQdN
	 /74NeeisffC4dm1hoVpHfb5OjKEZ2V+cqiXv2vgcJofdyxfyTt5hqGCRWRbz+dY24M
	 2+kbp+2nJlPV3QbQA7PYsXy+dOD1iAABQW0ibEenHVAcYdIuhrziBUQaB/5DeHONS+
	 IsGGF7XhfhB7r+xsS//nQKRFg2s8fkAfYAUPTjQZ9FOA4Lx7kk3/WcVEawH637LO5O
	 zJlhgikA1k0iXUhzuU2MdOfiQeXBkopqBpMkA5dLWTtIae6iMGRdTMav4vxMYedr9B
	 fvIAtae3/qCsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5481D60B12;
	Wed, 24 Jun 2026 14:07:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A67AE367
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C52C5401CE
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFGdu5-Ckvr8 for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 14:06:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D85EA401CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D85EA401CC
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D85EA401CC
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:51 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-491609cdd8fso6995535e9.2
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 07:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782310010; x=1782914810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PFsn7lzCpV1ZiHjQnHvwfuACb9GGZsxzF7imqO0/FsY=;
 b=AXWLsGOcnlH1FMIVXNOLXVumz4KmcTc+7/zL290xlzkvAaquPCPQELRQOr8MOOzxcW
 cI2zZLqvHCo0EHPgqn5jiWSvcXm2obhvMqagTOBaftYBJE4YOEbP09ZKUWBvh4VPV7Cn
 cn8o4c0eBk6x+lyGD41SO1l8BYrQ/kS9UefYi8U8NYdrPRNdZEM6ND8v6BOFoNRYVwoC
 supD9OXIad0yORN7ddIW7vke0di5XMOo1xP5TJ0TKVldiibI6RVo0djNfrd4zY4gFiLX
 DNFRRiOrC+mRo7Nlv5KM6DtDVvaKJUjnuNx2jjWUgdi3LXMS6UrvGHuYHy/lrTGbEOj5
 YNaQ==
X-Gm-Message-State: AOJu0YzttNyeGRmtBSully2k7jQilNEfF0rag/ikwIwAqJ7LK3VCIh8q
 Ejwd1dnr5foPxYEuzEev7dkWeeHisBeWlSHG9TG4sE5c9X+DjimuCwIgmsEBS0ylkIPZ5XnMTAD
 Gi3F7
X-Gm-Gg: AfdE7clWnD7KndUbamf+14zeVSekfzFVy6frlTPozqyKZjFBGd4tv7hd9hqzSucd3zM
 k1guARt/wtOBuBIfYuFO0CODGVpmrb1MmKGUnBnAYRyZZilXnVB3bOKyR12RgCnrpDdxP8I+Q9S
 iGhKza4/k6fea0L4ex0muKhgY3P3CZofNmWbXDXHrjKU+b2H/QZwMHH1B9lS5GQJBGG7QzwckKR
 yYVbFosVw43oZErVGwh3tcr0O+tN4sSwzKgQbfH5XgKpjtvptKPDW5kWqDEhYM3sWVPJIoUc3Ry
 jFq7NTE6yMOsvIm/A/vvDlvFiuV5Bxvsgaq9eYmwApXVpT8A1RekGAU9Rc2C5lSXYQcLzdcqYiA
 y9KsaCxtjYb5iFd6QhzA2ZvPuJY7Xaw2SQA89lsJAuHA2WfT7s3ybvXwhfqaNMvY0aNB21PlVya
 t5kGvFJnR3yFwcx+o=
X-Received: by 2002:a05:600d:6402:10b0:490:e170:b80b with SMTP id
 5b1f17b1804b1-49260878218mr40946905e9.32.1782310009744; 
 Wed, 24 Jun 2026 07:06:49 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49260e14d0asm43700205e9.0.2026.06.24.07.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 07:06:49 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 16:06:36 +0200
Message-ID: <20260624140645.185318-6-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624140645.185318-1-thomas.perale@mind.be>
References: <20260624140645.185318-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782310010; x=1782914810; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PFsn7lzCpV1ZiHjQnHvwfuACb9GGZsxzF7imqO0/FsY=;
 b=iEqYXqUnFG2wuzqDgDdQGA7CPBeAFQQY6xiaXOy9sqwnkBk3mDmz0wdaT8W/AjExb8
 OhPVmXicRtITKX9//7w3BRK7GQ+LRDFlJ9Mdt1KAZjkIZTsbCQ5bjCBgphpYMbeIUTLA
 oEcFWOfWSUPqMalcd698G4E3BxiWjfVLNo276qTzT7WbuAoJzYiHgC9HOG0JHgguV43o
 YElpnK5hIpcA/0AtbdvQIRZbqj8VEiROax5Q2T1wN4XF+h1052cK2hACAEbj1z2mJGk3
 YEoAE4gb3nsmvcYmejYFQCmBppXQHB2Wou77QWp2IX4/e3ZAD1ehqsUu1NIlM2MIhak8
 U3tg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iEqYXqUn
Subject: [Buildroot] [RFC PATCH 05/14] package/sox: add vulnerabilities
 details
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All the vulnerabilities have been already fixed in the upstream used by
Buildroot but no new upstream version have been created. The CPE still
reference the last known version.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sox/sox.mk | 41 ++++++++++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 9fd3f2151c..90121cd02c 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -19,45 +19,60 @@ SOX_AUTORECONF = YES
 SOX_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
 SOX_INSTALL_STAGING = YES
 
-# sox-14.4.2-6-g6e177c45
 SOX_IGNORE_CVES += CVE-2017-11332
+SOX_CVE-2017-11332_STATUS = fixed
+SOX_CVE-2017-11332_DETAIL = sox-14.4.2-6-g6e177c45
 
-# sox-14.4.2-7-ge410d00c
 SOX_IGNORE_CVES += CVE-2017-11358
+SOX_CVE-2017-11358_STATUS = fixed
+SOX_CVE-2017-11358_DETAIL = sox-14.4.2-7-ge410d00c
 
-# sox-14.4.2-8-g7b3f30e1
 SOX_IGNORE_CVES += CVE-2017-11359
+SOX_CVE-2017-11359_STATUS = fixed
+SOX_CVE-2017-11359_DETAIL = sox-14.4.2-8-g7b3f30e1
 
-# sox-14.4.2-9-ge076a7ad
 SOX_IGNORE_CVES += CVE-2017-15370
+SOX_CVE-2017-11370_STATUS = fixed
+SOX_CVE-2017-11370_DETAIL = sox-14.4.2-9-ge076a7ad
 
-# sox-14.4.2-10-g968c689a
 SOX_IGNORE_CVES += CVE-2017-15371
+SOX_CVE-2017-11371_STATUS = fixed
+SOX_CVE-2017-11371_DETAIL = sox-14.4.2-10-g968c689a
 
-# sox-14.4.2-11-g515b9861
 SOX_IGNORE_CVES += CVE-2017-15372
+SOX_CVE-2017-11372_STATUS = fixed
+SOX_CVE-2017-11372_DETAIL = sox-14.4.2-11-g515b9861
 
-# sox-14.4.2-12-gf56c0dbc
 SOX_IGNORE_CVES += CVE-2017-15642
+SOX_CVE-2017-15642_STATUS = fixed
+SOX_CVE-2017-15642_DETAIL = sox-14.4.2-12-gf56c0dbc
 
-# sox-14.4.2-13-g09d7388c
 # CVE-2019-1010004 is a duplicate of CVE-2017-18189
 SOX_IGNORE_CVES += CVE-2017-18189 CVE-2019-1010004
+SOX_CVE-2017-18189_STATUS = fixed
+SOX_CVE-2017-18189_DETAIL = sox-14.4.2-13-g09d7388c
+SOX_CVE-2019-1010004_STATUS = fixed
+SOX_CVE-2019-1010004_DETAIL = sox-14.4.2-13-g09d7388c
 
-# sox-14.4.2-38-gf7091126
 SOX_IGNORE_CVES += CVE-2019-8354
+SOX_CVE-2019-8354_STATUS = fixed
+SOX_CVE-2019-8354_DETAIL = sox-14.4.2-38-gf7091126
 
-# sox-14.4.2-39-gf8587e2d
 SOX_IGNORE_CVES += CVE-2019-8355
+SOX_CVE-2019-8355_STATUS = fixed
+SOX_CVE-2019-8355_DETAIL = sox-14.4.2-39-gf8587e2d
 
-# sox-14.4.2-40-gb7883ae1
 SOX_IGNORE_CVES += CVE-2019-8356
+SOX_CVE-2019-8356_STATUS = fixed
+SOX_CVE-2019-8356_DETAIL = sox-14.4.2-40-gb7883ae1
 
-# sox-14.4.2-41-g2ce02fea
 SOX_IGNORE_CVES += CVE-2019-8357
+SOX_CVE-2019-8357_STATUS = fixed
+SOX_CVE-2019-8357_DETAIL = sox-14.4.2-41-g2ce02fea
 
-# sox-14.4.2-44-g7b6a8892
 SOX_IGNORE_CVES += CVE-2019-13590
+SOX_CVE-2019-13590_STATUS = fixed
+SOX_CVE-2019-13590_DETAIL = sox-14.4.2-44-g7b6a8892
 
 # 0006-voc-word-width-should-never-be-0-to-avoid-division-b.patch
 # This entry is NOT stale, those CVEs are not reported by pkg-stats
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
