Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778E1D0BB49
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 04:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D19960844;
	Thu, 24 Oct 2024 04:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m9JicpctEpTl; Thu, 24 Oct 2024 04:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5835B608A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5835B608A0;
	Thu, 24 Oct 2024 04:41:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02639972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D76B340729
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZzrjaTfs_dQT for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 04:41:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B321E4071F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B321E4071F
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B321E4071F
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:41:07 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-83ab21c26e5so18877639f.1
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729744866; x=1730349666;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OqS3nf4yxLFifqJFdn1mn4+zhS8WKhrvHR3GtNAmR5w=;
 b=ihwt4g0usB1yGHdR83rBcDgoZn9wRr8BPDz/tXN9sxZ4uT+kDV+4EbFrJar02oK27j
 9GIOIKXsPj+asMa81Eh/aXHldd3P1MzE344TJ6VMyoyYRlZzgRtAFI1Ptl8aYdkoMEyV
 w4/cCO0GMa1G+mqsj0lyWtY4mFkhD3gOWAKb0g2LSuC/fZwnEF4eiSV/HjTx4jpcXKFB
 RKVCoC2jS0Ez1hP7N+L6P17KP/GlTeEfpkzJLpII4hzDaBeMhcLhDOz7+TjZXV1EOxgZ
 OvKqoRvpKZ2FFdxws9WAObdWXgXhGDs4032BGUgFT08zY53HB3s9eMi4oBiiR//Sjcz6
 vWHQ==
X-Gm-Message-State: AOJu0YzhnWzJTeA7+m4JLTkZ7RlXmMCmvNKcXNd3qTuKE1tyN1EpgLJW
 G7nkhds0OmSWX9x/WOZIauLZdBCDfEHI0UB/bZxgz3JQlAFCsBTTeaDD5w==
X-Google-Smtp-Source: AGHT+IEHZNIDwpLu69ofm1tmqdmyoRPTT0MKjYvxZ208NYGKOd/3FAXpmbb5MFHqklDP5K7DnFJlVg==
X-Received: by 2002:a05:6602:6d0c:b0:835:46cb:6747 with SMTP id
 ca18e2360f4ac-83b04032065mr92841739f.4.1729744866148; 
 Wed, 23 Oct 2024 21:41:06 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a661aeesm2518948173.179.2024.10.23.21.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 21:41:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 22:41:04 -0600
Message-Id: <20241024044104.3372620-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729744866; x=1730349666; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OqS3nf4yxLFifqJFdn1mn4+zhS8WKhrvHR3GtNAmR5w=;
 b=RcQL7aZOhByFk0nI1yaITSwCut5Ioamma3DCKYT9SHszZUPR41aR649ELFBVdedHey
 3ssB1z3RUCuG91XMfgEpoul4rRoSqfhM2UB4sYcuNCTIiAeqXR2zAnw/U8yt75pA+kkI
 B21JdIIpOFaLMGviEScCXSVHmtzVYgxJVx4JiROM2HHGsI412rOvFQrRG5x9Nn5NjQwy
 D6AiGT+yVvBxexGlhvNPcjjuSKkjYPSuDHG06QZfQHvwRhHmnie4c7V6l/rxrLYF8Evy
 M6q+iTs03Sk/rPh9wFwNMl02Xnjo8HOQSWjEBmIHEgiQzXCG0urumOQKjcowFOhlzR4V
 A/TA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RcQL7aZO
Subject: [Buildroot] [PATCH 1/1] package/python-twisted: use hatch setup type
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-twisted/python-twisted.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 71d1b32df2..01d2dff391 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -7,13 +7,12 @@
 PYTHON_TWISTED_VERSION = 24.7.0
 PYTHON_TWISTED_SOURCE = twisted-$(PYTHON_TWISTED_VERSION).tar.gz
 PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/8b/bf/f30eb89bcd14a21a36b4cd3d96658432d4c590af3c24bbe08ea77fa7bbbb
-PYTHON_TWISTED_SETUP_TYPE = pep517
+PYTHON_TWISTED_SETUP_TYPE = hatch
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
 PYTHON_TWISTED_CPE_ID_VENDOR = twistedmatrix
 PYTHON_TWISTED_CPE_ID_PRODUCT = twisted
 PYTHON_TWISTED_DEPENDENCIES = \
-	host-python-hatchling \
 	host-python-hatch-fancy-pypi-readme \
 	host-python-incremental
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
