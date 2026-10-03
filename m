Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D64CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 22:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD38160675;
	Sat,  3 Oct 2026 22:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zgQBoQozVkjb; Sat,  3 Oct 2026 22:45:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 342E860B94
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791067514;
	b=nyEgE0hcSDFPWC8gTPdWha0S9lg0MKQbQ1XhGRRd6iKKjwku1HAnLN0KO/6/57EZT8c/
	 5BPKqUPPcxF+zUswYZQ3gfQJmOpD371pJW6/kEHQKpdWU5wtk39PP70tlUvBg7kFKbiVt
	 V5jlbDCwIjJbDGTx1ZNuRsaeicWYlEDVcJp5yN/smHe0JfR2LhaK8JPhQKNUk4HuL/HUs
	 hU25GANn3M9X26JHWnkHfLVcpV/uLHxiRsM+Jga9K0yWixhHXB+DvbTZq7zgW6ATUuPYm
	 OCzirMHSgc9SenGCtKonLHoysouK/znk0cTvHX7Jqx2OyjCu/DFXUT0yYjCDTIE/amA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791067514;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ym1Q7uWXaHy83xl+r56194krGvTQd2Ta5JugScZ3JYQ=;
	b=RVbj9jeJmeKXQxF6PzsbhTYMVAuc7t2zoqes1Jr+rvsQxi+IHpOrSA4gnTVJggx1rtk2
	 aOKP6zc2ThgfF1V0x58et9tzRl/PoCXn0+gZXgQ8cKKeJTaZ6eEcjB9f4E1VGZ2NDdvoV
	 QRqcGsBTYqUpl+VTrL0aovmO0el52Jf0locRlC6tmzeJLtGqaVPt1jEpQHjEhor2dRhgp
	 O9jhjdv+i7OWvuu3luVu445Y6Gbw//GFYn6/bLmp3Vg+Tcgnz3y1oWgt08sKZ0qqFjaJe
	 KiXUPxJ9wJ+yHTPgY61Ft0De99h8hRb6tEs+H1ADjwlO3NcFQMhnTTKjJzSe5ZnXLLg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RqWjIN8N;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791067514;
	bh=ym1Q7uWXaHy83xl+r56194krGvTQd2Ta5JugScZ3JYQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=sscXzGdi6y/UzXR/RXabXu6WmMPyiLvbJr7hTQJoxAFEns4UKx89DfwZFBd1iXw0a
	 3koBaVTMtNfp4zjnAVBad7TyL2DiOF79YTw7erBTg9nwoHnQyp1ESg3VYzX6GztMu1
	 gPKzpKJCAycRNmemi6A9xwxmvx6WJomczssEVMm2NggEzGz5gZmvSvBG5kj/tZRAC4
	 Q12Ua3w5TWVX7BPWScuAqOHEGaGAuH5aTb7qF8ehhZT2OUbZ05ghX36licDiCXmEGF
	 QHrA2Dpl5oCvLAmio7LNBgW5MNm7367EdGvaVh5qUkEST0baoWiuEU044h/tJyyVpE
	 DxcM+VS432bwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 342E860B94;
	Sat,  3 Oct 2026 22:45:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CF70263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2324760863
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DqxCigJzmhxT for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 22:45:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C95A660D7C
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791067511;
 b=fcBs4zA1T9nEGyrR0U8bTFZ7oLNBBnIrLTduInDZeXQoChbnVBhukZWawODz5pblS+n7
 6NLMJd3WP7ibJtImpVgVD8LyEvptNNEThZjQ1Gu4GCAYPCA/ctwlNEkrtfL1617KrWf0q
 H6gKADSVU1XQ/vaw2RneYp3Qr0mTJlrrHdceQMvEg3PMREGeARGTWE3ClGKH3w8tsxgyn
 g6ZkE1Tw98D4nnr0a7mRd8tUK0wOy8K5Bpmsr51LlH7EUFj8OQZ9rpPjDURt7u6j1qQPC
 ywGJcB1NculgOAlVDRxfr4YOfK0fxj70sHJRVi+OgngQxyzSSr4oV9vUcCbQ/ZcljFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791067511;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=KZt8wnZj3AVyP09NQwCKQ0TyKMGpAI9JP0Ke+mwAKy4=;
 b=oA7qreQWisPWwV6h/1xkLHDpOq/TSqkGvQxpHG8GAz/zSzvclUXxSEzy4/K1xH2NjGmf
 GrOGqRyqk60j3wRrTGERNas79xhOjr4/7zJt/daYDJY47xTOkQNKtwKim5FaV6mQMws1Y
 t8cF5arCotSKlepoA0uQtqhoNNUfttleZmWw9o/V7XUNIXl+mcv1PjqnEqoVzCXNNYeHI
 zR1fWc14W9NOpehU+Bjo7a3o27uFjFjNdEir2yjK0J0AthnCGP1zRs53a6yMyYwbOeGN0
 w1kU2qgcmZ9D2rvjrPA2cTG9wdgInHrF/DN8Z2HWwHNyqQL/XQR2kTd23mYNpRWuZZA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=RqWjIN8N; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=RqWjIN8N
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C95A660D7C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:45:10 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-823545ce223so896651a34.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 15:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791067509; x=1791672309; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=KZt8wnZj3AVyP09NQwCKQ0TyKMGpAI9JP0Ke+mwAKy4=;
 b=RqWjIN8NCGQyWAzhcfE4r/CCzK/UiTMbx/7VFrHkhxOE4Kjv94Iih4oApzMDGAdPfS
 M+WE4fAdGEmHOJEyB0s4k1eZ+YJpD5WriqKDLa3LqlgNmqhj8ql18PxBz1PTEFa+vqdZ
 u3IVBmIuGX+198B8ZJmjISU4hj7kNoJZG6fXLR8XaE8TX4lHASw6vaFcFx/hL7mcmqca
 wvbhZk164BxjrC3fnC1TRmF3+cymiYfXR7bowo72mqgIpwbiFP7z0aCqHLPgrK7JvdSE
 47/NVRNSyBLGYKhRp4UxIGwW0OtiGLA4j/OTOhbVA6Wkjy/dkz2LdSQD2x8DC1KvmFIU
 5t+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791067509; x=1791672309;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KZt8wnZj3AVyP09NQwCKQ0TyKMGpAI9JP0Ke+mwAKy4=;
 b=C3xLa9A8gquYHZLBL3VXvDcsk0JjU9A3oLIqrderYvWuWmdJPGMtdhUpc+nfT8h/T3
 KlCR/8kkgov+v+NCVzbFQvej//T4+yRYLFogGaayMlA91YlAIVVecSYb2X/b4p1Iixi1
 Yir/34TzKpwiigXtYwk4tHHgG6R0wl99o6mFY2MxUGXaICkhHXPl2e7BoER5Czzn/0SL
 0VwCF/zVrayV3rF3kx7+IC7yMhGpOpcPzOro35XYiUpMG+AoOMnfJEk6f4qids8jzw74
 qMshdKg//ySivvrc89Lhi6VrNVtcZkcclWTbpCNv9xFNbAW7JRtvT7R+DZPFDRmFuUOO
 FwEQ==
X-Gm-Message-State: AFuF++kz2D0d4N0Fvy11hw63cqlAUiGqoLHrczH9wOOp/zKmW7NcFBPY
 MlaI2JFaxJgatS/O+ZObWSiR+SjJYcyvtBnvJHMkWW039sTuEhms0HqDJ/stcw==
X-Gm-Gg: AYBFou2RIZ5LggFdgT+4IVGJ/FqBmj3y9wb1SMwMScMyu4bLFMSyT+qTmdprM7P8Meb
 Tw8AGvXbaQu4iC091FnNvkeVvLHiyQ1cpKxHIWJlj36/5kq6nQJ8CF+1XE5WvlM9FeHlMv0qIp1
 eO6bHDGffS8ZYBwximNXHRfQ+yDyCgZbtz4KZutCux4NP3AWH/MRNvxE0Y2cHrm9aX/kgGFkuQV
 G0fmV7fV0BwxJ2gZ5h1B5KkZ6ssYvIAVwrPANmTf8MKhXM7ILvGabAQkwOpKZ9GOL0cAWZO4DK1
 5PrWrtidG7twtS2MAmy/0XlxV83rj32C/mGPxCvoepv3EU8lruu+AM9sOmGC8XSPJclNAYnoAWs
 pTctwiEGCtUiwGq8yIgVRC3uCqsdROYrD3fQXUT5xvLfvf5tADUoPk4Euah4rVfOkig4Y0F+Med
 cGAHiAX5IP7QuRj3OzMlD4rVZeHN+6sW7pU3z43XZ0doL28Z6cQsX9EfcRGIo7VwPYe5MWqJvOn
 KlrCvRbtZlTocXGrEviwEvkMC8Xl/qlVJwEInZF+6LSwfad0NKf753qupx2vwuex7zIsGr3UaoK
 a2O/hmtGepzwctcbrshW/Zev+Zr6WRwBujtIz7pxMxR4skFRGFTeudrlVSZ1NEVF7TMjOVFu8tM
 BIQPqoTe7XRwmBD7t+dVvf7oJVz+2zBeYPAPQxRnsvw==
X-Received: by 2002:a05:6830:6a86:b0:81c:4784:a5e2 with SMTP id
 46e09a7af769-823fc8306c5mr3683894a34.6.1791067509303; 
 Sat, 03 Oct 2026 15:45:09 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a36943bsm7262522a34.19.2026.10.03.15.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 15:45:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 16:44:35 -0600
Message-ID: <20261003224447.744966-11-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-webencodings: bump to
 version 0.6.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to the flit build backend.

Use the standalone license file, including the updated notices:
https://github.com/CourtBouillon/webencodings/commit/42e8f38a90d62379cbe448f778883e920722aa10

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-webencodings/python-webencodings.hash | 6 +++---
 package/python-webencodings/python-webencodings.mk   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-webencodings/python-webencodings.hash b/package/python-webencodings/python-webencodings.hash
index 87c41a9632..8d7903d564 100644
--- a/package/python-webencodings/python-webencodings.hash
+++ b/package/python-webencodings/python-webencodings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/webencodings/json
-md5  32f6e261d52e57bf7e1c4d41546d15b8  webencodings-0.5.1.tar.gz
-sha256  b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab16748587e1923  webencodings-0.5.1.tar.gz
+md5  47dfd43da448410f24fbc08d597ac72d  webencodings-0.6.1.tar.gz
+sha256  565f9ad031c702dae404e27a099e3e09186a3ab1b9520f06d215502b651fd910  webencodings-0.6.1.tar.gz
 # Locally computed sha256 checksums
-sha256  c27693b0174d6d04dafd0242857ae72763f5404b675972c777fd865bc3c0abe1  PKG-INFO
+sha256  e06ef33485e7498ad592887c41fa79cc8a7fecde576c7210e11bfdddef58040e  LICENSE
diff --git a/package/python-webencodings/python-webencodings.mk b/package/python-webencodings/python-webencodings.mk
index 63c6d37373..f7c3fcc862 100644
--- a/package/python-webencodings/python-webencodings.mk
+++ b/package/python-webencodings/python-webencodings.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_WEBENCODINGS_VERSION = 0.5.1
+PYTHON_WEBENCODINGS_VERSION = 0.6.1
 PYTHON_WEBENCODINGS_SOURCE = webencodings-$(PYTHON_WEBENCODINGS_VERSION).tar.gz
-PYTHON_WEBENCODINGS_SITE = https://files.pythonhosted.org/packages/0b/02/ae6ceac1baeda530866a85075641cec12989bd8d31af6d5ab4a3e8c92f47
-PYTHON_WEBENCODINGS_SETUP_TYPE = setuptools
+PYTHON_WEBENCODINGS_SITE = https://files.pythonhosted.org/packages/d5/a0/8fd707bcb776a7be556bad06a2ea5fb9bd519df78ef8e26f70ccf0f38bff
+PYTHON_WEBENCODINGS_SETUP_TYPE = flit
 PYTHON_WEBENCODINGS_LICENSE = BSD-3-Clause
-PYTHON_WEBENCODINGS_LICENSE_FILES = PKG-INFO
+PYTHON_WEBENCODINGS_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
