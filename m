Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F344CCD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 09:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAFE5421DA;
	Fri, 29 May 2026 09:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aEwY22lFFzLg; Fri, 29 May 2026 09:45:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0EC942209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780047919;
	bh=dkDiOiaRYLZwiJ4jff7IRiBOlDD79jeZ8v8kx7Z9uUc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=lr+2jaZ9JepjldShYzd8zSh/+/APQH1LwHqS2w+5VZ1HaNfnEa8dYoO2ZElCL19UX
	 U9cqbFp4k7wT0cFe5z4OGHhVgW7FkXNJr1g2NHNTvCZs/8ECgKaiGli3nP1a+vsBXP
	 TpHT5wd0g2qcmqIMpTIvy2BedZZ7PMUM6TWR1c0VXhVl5xRFtzlysf1n7YMGoMLCSc
	 7xwdFSY4m1EtyEMB/t/GXAQgxIHq+kIJoBVOEmG+owdmSocZmVuQRf8gTCQS39qBhS
	 huPnIVHX2v/tgIVQ6YfYU04zj02LrO/Nsz4PD3WVfGNbHAAXXHrxUKrLFEAep4jyB7
	 5DCXFY7PeZviQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0EC942209;
	Fri, 29 May 2026 09:45:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B688ED3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A62FF613C7
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63S2hVpnAIBu for <buildroot@buildroot.org>;
 Fri, 29 May 2026 09:45:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 29ADC61392
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29ADC61392
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29ADC61392
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:16 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4909def6a21so1920875e9.3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 02:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780047915; x=1780652715;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xmcqpc0bbTp0B8KKOpjGeFHv4oDIz/c28ZvPaTGc6bs=;
 b=qE7YpRrBtP7Wl/32LOnx0RnXcw3E/0RLserHIqknieKsnpYfZ01sZB/dl2CSxXDIjA
 02NcQ82LVnGbPhsDjDqTH0bLOJCGoZy7S3PDp7ZaLbQGCdYaamebLcxMRso2Ny7c1Y4E
 ap9qUIKKZfKWyXizrc21Trwo1PnVBN6hZPVoVByGIDfASy5M2ncGWlpPEWwV/LC3L3oN
 QY9tp5GZ/zJ2MWtcgwRgyx8BoebMufkbgP6IzKIPm7/w9EEv73nrAv9CbIMeLqvpfb0y
 YgGJAcP12Ixo6heteGa5PASRq/arv7YYlkima0lkb4bcp3y/xUZr27gI9uPBr/qGoMxq
 Tyzg==
X-Gm-Message-State: AOJu0YyH1iSSZXUYquJ0qfhWzLZ+b0RxCqNoUxkXLZEpyz/3Qja/jjqY
 kfrUZFSimO0Xno1+pVrbEMWCKcYiH5xhTN5THdj93qFFsihAW4GHHtjQhJf9itI4AA8jQJehxcc
 9Sh4l
X-Gm-Gg: Acq92OFhNAvc//859x21tg7LdDFC21RFCZOYPak5OEjaMevahaf/oEBjocFm+rJHPD0
 o3cy35ZWhHhKUeIFhJaNr/ouPw/mNw9aBRtyG6F+1flvW0BtHMNnIXtZ8MnkWytx8ZmYOrxX37n
 6LvRuUwNg4caPR1VGFZBr1IrgkKhb4nOoiuzwUyojbrQ02DOo/mmdFKLQo08dhFdaBJVizqFfxQ
 8BDhhIVHo+bXWZ1L8Di7bjWKi/vZcTHgw8PFQsXKRBD8GiwVthNs9CpU6+asIv0k3p1qVK0I1/I
 whyJTm4xkv3SZVMZN0YcEhVyJN0WqSfEDZd7zfgU+ckYHznwuZ0YFmiaKQ4XQ7BoRX8NcigeVjL
 BhUXLDKsGksSCvGJw9QltZKQ9ok+jRmxdNI9jSPL9lXmpJTMG5JG3Oqeuq7oKkJ+Ov/pOVO4WUE
 8t5MpbM/BsA2Oew/qANIFvjmY8kraq4p4hed7DHWToRKO36XIYDNJJUOKYkw==
X-Received: by 2002:a05:600c:8582:b0:490:51e9:deba with SMTP id
 5b1f17b1804b1-4909c0bb2e7mr30518865e9.27.1780047914806; 
 Fri, 29 May 2026 02:45:14 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c1035ebsm14349985e9.5.2026.05.29.02.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 02:45:14 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 11:45:08 +0200
Message-ID: <20260529094514.178266-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780047915; x=1780652715; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xmcqpc0bbTp0B8KKOpjGeFHv4oDIz/c28ZvPaTGc6bs=;
 b=bTJYOdnl1rkygLTFx5aLQiu9uAWp4GVEj3sBVl8vS7i7zPxMXJh8+Ngpc7Thrq11AA
 YJPNWx/KHmoZJkQSq6byIDkFW742s7/FMaKpMV8sZOpYV8z1w/J3BzIPkmHiBYLfFhKW
 shNVVQAwRQTCVLv3Y+wK6B0WFkjzIuoW/Ecza1/nbA0F7eudwOs4Gu4C5jKR5a8uFbqC
 HwqyjxkJwmJQlo+CsyHg102QElrZulJBBapWGyoCfVOmXUc71miqlHKDx6VDHfU+xe30
 QssZUrxgdTAi45Ruy3JEi3FlYbUpr7cxkkEbwmNVTsD1n+HBa8U++X90wvDNUz1ABhb/
 WzHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bTJYOdnl
Subject: [Buildroot] [PATCH] pacakge/jq: update CPE vendor
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE "cpe:2.3:a:jqlang:jq:*:*:*:*:*:*:*:*" is valid for this package.

See the GHSA [1] and the associated CVE [2].

[1] https://github.com/jqlang/jq/security/advisories/GHSA-rmpv-jgvr-wpr9
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-44777

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/jq/jq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index b0776021fc..19a130b694 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -9,7 +9,7 @@ JQ_SITE = https://github.com/jqlang/jq/releases/download/jq-$(JQ_VERSION)
 JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation), \
 	BSD-2-Clause (strptime)
 JQ_LICENSE_FILES = COPYING
-JQ_CPE_ID_VALID = YES
+JQ_CPE_ID_VENDOR = jqlang
 JQ_INSTALL_STAGING = YES
 
 # uses c99 specific features
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
