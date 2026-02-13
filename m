Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43907EDF16F
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 14:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D64CE81F43;
	Fri, 13 Feb 2026 14:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ddonlthiKywA; Fri, 13 Feb 2026 14:35:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C82C382057
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770993308;
	bh=O2A3qutxlfVoCRSqx5zU4AQ2DIrubLFMyU6MJRSsprE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=kNWfeHdTCQHFKS0/VXbiXtG2H+B8MEfD+bHbZQcG3joP0CYjXWU/ScCH4vew7BXoc
	 sKQ95X59mBfa0+DSoLJc3P4xoc07XhsvCyJ/3ZbuJFK4DSpTzDKEa/k8tMP+SYK/MT
	 nGmk8iHger2RJC3AO+37CQQHnbDlYzlu0y1wa3FwzM309i6ha+6zJjQLCu2L6xy+fA
	 I469WbkTG4Ga+I9iSgA23pqiQsVTz8UTPOZ5rm3/8g1p9IjHe/mDPcVeVkR4EcA1rC
	 qAIooWa55uxTqB++i6J/9Gfpgo2vohezfllgyz+OZLRJ3X1gNibsUSWZ3fI+gYzavk
	 NYDLlGqab4aMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C82C382057;
	Fri, 13 Feb 2026 14:35:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E562BEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 14:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6D8481D46
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 14:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQfULXiUUYlY for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 14:35:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7977981C6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7977981C6F
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7977981C6F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 14:35:05 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-48068127f00so9715865e9.3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 06:35:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770993303; x=1771598103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Vf0k7Z2/3Dpl8NFEZgRBN5960jHqOefEkyvjBVrv8s4=;
 b=D3GRu/u4dolO3ZirqFwU3u0Pgvq5NtGMR0FFxygXtBs8kxZ7fIi+1avrc1aoXW+baC
 6MtJ3C5VQwzku+vPuYG5n4n3NQD1cgxfgWpSWOc9FwreaWhnhV0TGXo5OVQ49VGWfkJh
 S87olsHT1eCxuUVg0sgiBw1fe2fwK7dThKdJ1Gjfbk0o4u4incq2g2HraseuE8hB33eM
 FwFjVetS1K1ZSgx0mUST/jvKzAm9gsrHYWTowuOK1hUCFwmW3vCOmBgrVGFsZ9MY7ad5
 bOITPJip9ADZHYFOyDKjC0mLx0MhTRgScRsVtMyuXKjo4xGrK5JldwRdrkmsH97PQUf6
 VQ4w==
X-Gm-Message-State: AOJu0YwHkgc3Zs+VGlGjY1nGmUWcr+NV8J4cFoytJBOPf3Pvvmju9a1B
 nvl26b6QJYFYY3PZ4swT5O2qHe4i5K/qIcAD/qu3rIFNiV6k/R9ms2HLiG09cZfcfC/NjwE6NjS
 GAQ58
X-Gm-Gg: AZuq6aKPsPngVb2P1B/oY0F3KjXLagOeB2XxUC3ti0zBZiluBaedNLy/7b+MeWv1aox
 o2byb7NU5PopKjxdCHE3abOGE6IBWyFFK2bnKJXQILMIXWsRmVu9E6P1ztpq9BENz6pzOy9IeZw
 0SG+kL1IfiPm2G3/R5IoHjLO39szISWpezSTowOHFgxwGDHy7WafqPvB3g/+S+tJEaeUFDoOaQf
 D1r+iXklGqmXNuAChTJZ17iu/5zIDrUfvJzbw0pNrFaQ9y3JAY+LO+JqeO4OfyO1aGVn58R4IIM
 7HljMBkGmpWAWsZJ6+d9Hh2380XxRWkpzxxB7TuBl9tSc51RCtQhMFT/wzcaULvY5bQ4OD7DSSY
 h+S4SPgWuS2UYnI/a0g/YwW+9Lkef1zb7XRQ/UsBpMuKe+RGL0d1bO1uDonKXO49A8RbUTNBK+e
 sxMHpQNXnFxjz5lbcDd7jz3z22kg==
X-Received: by 2002:a05:600c:5246:b0:483:71f7:2782 with SMTP id
 5b1f17b1804b1-48373a14406mr33687365e9.12.1770993302678; 
 Fri, 13 Feb 2026 06:35:02 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a02a79sm41320725e9.3.2026.02.13.06.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 06:35:02 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 15:34:59 +0100
Message-ID: <20260213143500.528726-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260213143500.528726-1-thomas.perale@mind.be>
References: <20260213143500.528726-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770993303; x=1771598103; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vf0k7Z2/3Dpl8NFEZgRBN5960jHqOefEkyvjBVrv8s4=;
 b=FjD13mC7do4CGCSweBYXK4n14Gp+5rVBe4G2JiMpOsaGcpiXueWSrsITbnkblhdouS
 hJQ/hAeJ4NkW/LxcJN5qPFs3KA5L85IPjfXL7sejKpdEJBgAJgDGDy7Qz6RjDyVSLlWq
 rIcaKpU3AinKM7uPV4K6unoSiiklnm0RTW3rP4D3loWLOjQfJfF+XvxWHHawPSsQH0Te
 DijWP0NULJJflw/qkxb3qITPKEqblGXgIRZhuWpPBx6QsdztOYEoHIHPz91k+ATAUkak
 I2zm05LSzzoNJ9/pt/ULuas1XR40J3kGLXhlmkGwbxxGLGAhyePH+XEt90oC2F/SdQ7H
 0EhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=FjD13mC7
Subject: [Buildroot] [PATCH 2/3] package/python-jinja2: update CPE
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Vadim Kochan <vadim4j@gmail.com>, James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The `pocoo:jinja2` CPE introduced in commit [1] is not deprecated but is
no longer used. All the security issue on the Github Advisory reference
CVE with the `palletsprojects:jinja` CPE instead (see [2]).

This commit updates the CPE accordingly.

[1] 165f60a092 package/python-jinja2: add CPE variables
[2] https://github.com/pallets/jinja/security/advisories/GHSA-cpwx-vrp4-4pq7

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-jinja2/python-jinja2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 74360ec258..a52fa77275 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -10,8 +10,8 @@ PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/df/bf/f7da0350254c0
 PYTHON_JINJA2_SETUP_TYPE = flit
 PYTHON_JINJA2_LICENSE = BSD-3-Clause
 PYTHON_JINJA2_LICENSE_FILES = LICENSE.txt
-PYTHON_JINJA2_CPE_ID_VENDOR = pocoo
-PYTHON_JINJA2_CPE_ID_PRODUCT = jinja2
+PYTHON_JINJA2_CPE_ID_VENDOR = palletsprojects
+PYTHON_JINJA2_CPE_ID_PRODUCT = jinja
 
 # In host/target build, setup.py tries to download markupsafe if it is not installed
 PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
