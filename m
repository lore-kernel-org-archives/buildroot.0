Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACE7CD4F24
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 11:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56C8440F1E;
	Wed, 13 May 2026 11:29:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhpJ2Tu2hUUu; Wed, 13 May 2026 11:29:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 855FE40F7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778671744;
	bh=EOPcuqe25coUcXm8AbBWjZuBXOuJHnm9uBxWJLw4V0M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=WoCBtw4mIx1U+XkWtKBd7qracreKQkwl56YCLubRtTxPmi08GbRLjYvAzG8pM8EQt
	 sEuAKHb72/b2MFFblLkuP5zOfR+5+mDILdda6eOgkxdxT9670kEkNyL5p27eK/31Ls
	 gU3AG19WrgyY+P0b0b4rfbR2fsJfqo0/hTUPgwnpdtU1ffgsZH7JN4WdvibWee+dSt
	 8nP3K+AacyI/ID0llGiKUc8z2lBQ5Bpp3gi8833E0A2V3jN/fToKJFcrUz/3mcaJfn
	 KvGPv5Ee/sO1YNoTFV+ljyo1PRRtLK2/Tf/ATAxK0OYm6wlNo0T3ZxAeMohD4vV/zJ
	 uCjUDkWjRPcVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 855FE40F7F;
	Wed, 13 May 2026 11:29:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CD23915F
 for <buildroot@buildroot.org>; Wed, 13 May 2026 11:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BECD0409DF
 for <buildroot@buildroot.org>; Wed, 13 May 2026 11:29:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V3A8KZ345vdE for <buildroot@buildroot.org>;
 Wed, 13 May 2026 11:29:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C871C409B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C871C409B0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C871C409B0
 for <buildroot@buildroot.org>; Wed, 13 May 2026 11:29:01 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48e8132c6d0so28960355e9.1
 for <buildroot@buildroot.org>; Wed, 13 May 2026 04:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778671739; x=1779276539;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+WyzJ5yoJUc+CUh5jzZPT7Xl4DpEO8sSod5n+HTAJhc=;
 b=LA9+/9pBUM79lbuTu0jEqqFYgapPMoVZMAz8WN2ETLo2uxm998L9gW61I+IuPr1dyh
 eAFFFEYZuvzP62exFE3iLqLWlmh+smkwu2nhmL0zB4QR+d4+8SkDrnpQd5YsuaMB8Cv/
 Cze38jjryGb0xiel4UAmKa3YYPjRp2xvqcYLr5QwYZLnOX0qI/UAeTZctc4mSOlGywdu
 Btv9qiE8FE/eYKT5RLXB7BRhlc6Ei6cp3w137U6SYcIndwyWGhHwiCnjB8GfXK/ZqqZl
 d5tFxEfrNGSscidoN/94mLsxcKcEQUCpxvt4qK2jjT2ZNGHnxPucPLw/IPLLzEWrlBKo
 xjHg==
X-Gm-Message-State: AOJu0Ywo8eAjchF67iXwC17IPWh5WamvY05WNP+o5y3LvMSDfH8+26Mu
 7r1XArvyeB/e1TnRSfVO/ni1RIgmoDAv466yVorZD9TykBg0r2yz0YLLE/Z+iHVOceUrVdHpeJp
 7SKIj
X-Gm-Gg: Acq92OEWDQWeqVTsyjHpJw0CIPbJMJo56BpM+PTL+H9yAPHPO2zLxl4uXm9Le3xHng+
 0EWZPOzKCHHJjGN6kf12hZbhu+p9PEJZVtVwtrRoyzpw1OkVZv/oBACr4im4IqTEDuJC5I/2YW1
 KHO6Q3P3sz3AcK2fqPO551HMAF4gJiJ4apGcs/+hGlQWFUdZHm1MopAHCX5RUYMQ3TxVH2PuH+s
 OOBcaMKNk6R9LLYpRY1I/l6uZz7h58XqTpmyQ0ZMImMkAN2EIVbwybMIRbVZlZCr8vqeQwtl5ez
 Ersg+14U0MhNKgUVP6tfJd2fbGMOO8pYT/3hkkNFXPBXpRALSyHY+vB4A9XmEcBxlwe6g9ZuIcI
 lNlSZ51EGX4sqABwPCFcGwPI9BSQbXqSzW7gjOGGfnRrhbD/nidH+0eZpPLFIuCElWtYZwsXn9+
 eFKnFczkhBzIdkKImLO2doBo3jUyWX7RN+Qi0/fjOYNNyp
X-Received: by 2002:a05:600c:34d3:b0:48f:99a9:bbcc with SMTP id
 5b1f17b1804b1-48fce9c09cfmr33976705e9.10.1778671738864; 
 Wed, 13 May 2026 04:28:58 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8e7491edsm41972285e9.13.2026.05.13.04.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 04:28:58 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 13:28:57 +0200
Message-ID: <20260513112857.433733-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778671739; x=1779276539; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+WyzJ5yoJUc+CUh5jzZPT7Xl4DpEO8sSod5n+HTAJhc=;
 b=aixSDMkWYOTtNFSIXvhBdDjblfwIluKNl0lunY7Mv2VIYEBrYzH7rzyihwwV3bdXe6
 BiBFzt9OZTWQkOKs1eWbiFEVVywAaGwkHk8sus/+0pu+hSwSEnPqZM7jWQ8dQYqBJxTE
 cwqkEDYX47qtXKv7vIt9Nhn42Q6CBd2z8nl7gXq4C81jenyMCa9nY2SYAqCrQTnQvo5I
 PuHEwUtiRqCiS6gxukZhIO8svEaJjDeq72Iw1LU8liAlWBsPhxn1z4VpdtAvutClZIwX
 hETw/4W5Ms7hBev30tmWdqzuzjIXU3s3scz2apGvhsr+6LDsM6yAvD7dYIZGu6EkILwQ
 SkYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aixSDMkW
Subject: [Buildroot] [PATCH 1/1] package/python-cbor2: add CPE ID
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The "cpe:2.3:a:agronholm:cbor2:*:*:*:*:*:python:*:*" is a valid CPE
[1][2] for this package.

[1] https://nvd.nist.gov/products/cpe/detail/C9CB66BA-6D92-430D-B3A8-D20C43E0655C
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-26209

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-cbor2/python-cbor2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 859ee4a1b5..bb8944f861 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -10,6 +10,8 @@ PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/bd/cb/09939728be094d
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
+PYTHON_CBOR2_CPE_ID_VENDOR = agronholm
+PYTHON_CBOR2_CPE_ID_PRODUCT = cbor2
 PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_CBOR2_ENV = CBOR2_BUILD_C_EXTENSION=1
 HOST_PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
