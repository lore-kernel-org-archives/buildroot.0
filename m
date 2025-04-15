Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B4AC369BD
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 19:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D735403BE;
	Tue, 15 Apr 2025 19:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sn0yjlcBP0jb; Tue, 15 Apr 2025 19:56:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A02F4051C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A02F4051C;
	Tue, 15 Apr 2025 19:56:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C0FD0108
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A28BC60801
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1bHMASaQyXqd for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 19:56:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A1B97610F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1B97610F2
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1B97610F2
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:18 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so49686525e9.1
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 12:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744746976; x=1745351776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fBEKDKeCayzbgqFUFz9M6nH9CxuaaGD2GsOXU3QRw9s=;
 b=G+Iw7Q5UVESXpJiWkWTD2htEnlNgw9BwnFeTmIAiaiE27q3vOflrAAUBOEJxW690A3
 XxZLxftWAd1vu9xo4ofP4MSa7aWLwEfQXRK+r6qiIoI7quwrzoMkMBtzU0CyvVaFedLS
 cUDtCj2t1qpAe91eDCG1O2hPCeLVdAuxr97Iup8H7XLfqLFJzBETnbFEf0jz6juxQLr2
 L8jX8hH+Bf6KOzBy4bWwPGJzmcyMd5Q18yLyR8ZhfzuBkYmyGkq1jEI4AV2j9CHy8vRF
 e493HRvBYigQGVBFricI+Q5n+jv19Mnq84PpxCYg9oE7xSsoRELFrufPmeckfdJcZPjK
 0JMg==
X-Gm-Message-State: AOJu0YxRM06u6Yz1WlNb3QK7pizAc06s2uaumPmFvliQQxPceLydB8Sj
 m+QQMyQSujdztHVvhORvgw5g/FdnzcteI3BgUQcPZmVHysZHoB/uGJf2xVrl1NPSGzf95LYYmOh
 X
X-Gm-Gg: ASbGnctVdc4PMVWdKTp2sOrAuLab4ouAfzXq96tbaQOjgEg86KjzSb184/eVl36lStH
 6ZGFxsk+5DSwYRMbE39viNE1Rok+3fbuLvvf8Ulg6NEj3wRId+2XIMdilJ5FPyybon/KmQgrPzH
 9yMjVE4mCESrWSm4PyrBNyxFSVp2USNAosbHndB4lm7a31LTK0XoktxsoNZXce6gyjW8AHiAuEI
 TcCF5vFlbKJR3GuUDCnubPFiagiK4p8LxUdSh9OAnItdYnmwEGmmDxoUFyvv55h6eDuoHniRa/N
 WeM9EUnX3yOLbmNPFY2ZTV4o3zoZCp4xeVwz0bRWaexPS22rGJvb08w=
X-Google-Smtp-Source: AGHT+IFRGI/uXdLWUkHa2QShfT2DTZtGGf6Z/86ZROdX4GznC1tDUHItGT4RsHeE5loTMswM0zCwBg==
X-Received: by 2002:a05:6000:2282:b0:391:4999:778b with SMTP id
 ffacd0b85a97d-39ee27519c1mr673554f8f.28.1744746976250; 
 Tue, 15 Apr 2025 12:56:16 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf447777sm14957366f8f.100.2025.04.15.12.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 12:56:15 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 21:55:40 +0200
Message-ID: <20250415195547.199428-8-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415195547.199428-1-thomas.perale@mind.be>
References: <20250415195547.199428-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744746976; x=1745351776; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fBEKDKeCayzbgqFUFz9M6nH9CxuaaGD2GsOXU3QRw9s=;
 b=VebaP3mAEmYLFxlN/Y2Z2nxWTDlP2jxdziMuBeUMUurVkwejlqOX3ezDrRnBY0YX3Q
 v5D/VYFV6BU7XAsogxvUsPMxdj89LnrcU1geuAusNdVxSXUYaPFqMKU68v7Nmo6vLq1Y
 7Wr+nnDX7ywTk+OD0tF3kV5CpFeRe+yqCLYnWi8ZE+5XUKPxtbMm0YsHDn4J+9Krfhhs
 mDjTFhyTL1JnnzPh6M9JEoqiIBpaGjkQ9JJ2ssmZpbdMQsRSOELVPE9juHlnqBDnrSUN
 NsbnLao93M9No5woM8fDNIh0F/w6hUk/sHAhF2KG5BB+pLVm7MRubKwCAKDngqBVVEdn
 Z7cg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VebaP3mA
Subject: [Buildroot] [PATCH 6/7] package/pkg-python: support PURL generation
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>,
 Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The PURL specification for python packages follows the coordinates from
the sonatype ossindex:

https://ossindex.sonatype.org/ecosystem/pypi

- The PURL type is 'pypi'.
- The PURL name is the package name. Since buildroot python packages
  include a 'python-' prefix to the name of package, this part is
  stripped.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-python.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 32ace4aac1..c125b2e009 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -454,6 +454,22 @@ endif
 
 endif # host / target
 
+ifndef $(2)_PURL_TYPE
+ ifdef $(3)_PURL_TYPE
+  $(2)_PURL_TYPE = $$($(3)_PURL_TYPE)
+ else
+  $(2)_PURL_TYPE = pypi
+ endif
+endif
+
+ifndef $(2)_PURL_NAME
+ ifdef $(3)_PURL_NAME
+  $(2)_PURL_NAME = $$($(3)_PURL_NAME)
+ else
+  $(2)_PURL_NAME=$$(patsubst python-%,%,$$($(2)_RAWNAME))
+ endif
+endif
+
 # Call the generic package infrastructure to generate the necessary
 # make targets
 $(call inner-generic-package,$(1),$(2),$(3),$(4))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
