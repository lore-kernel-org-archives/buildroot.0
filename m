Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB9E10D14A2
	for <buildroot@archiver.kernel.org>; Mon, 30 Mar 2026 11:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F94940BAC;
	Mon, 30 Mar 2026 11:57:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ICcaW7PMems8; Mon, 30 Mar 2026 11:57:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B976140BA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774871829;
	bh=Q7As5nO1baYoPk+tKk0OuJ0fIb+7wa87Hiad+NJ4U3s=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KRb/VrcCLdlm/+2m40RVLzxEwdiNbsk+9VaLmcypJjMHHvxqeRiy2xLefOcgTsM77
	 5UdRi/3xbsMvnxNmwb1F6NCden+7Fa3wkD+NiQAPE4ijWlCaFx+4fWga3Zx/d26CAk
	 QSpMxME+Hp921Yuop2p7L4igJzS6GI82woWBtnI6sV5byDwv3FxnooISOUpb/WXcv1
	 ygy0zYeAia906kJNnBF+aJnnsJrF8Fm/3c+5umy9Rg9BQwcPq9/249qzM/Q6855Z73
	 2rzb8KWVszh1l3q0UEckOETxpP71Wx3UZB278ZC3WhyV9NJ5Ozdhv43ABdiw6wQDOU
	 vfeOHRyL8kbgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B976140BA2;
	Mon, 30 Mar 2026 11:57:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D77011D3
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 11:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C95AF81180
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 11:57:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ekSqI23Vdpvq for <buildroot@buildroot.org>;
 Mon, 30 Mar 2026 11:57:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=ferdinand.bachmann@go-e.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D53348117F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D53348117F
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D53348117F
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 11:57:07 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-486b9675d36so36809145e9.0
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 04:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774871825; x=1775476625;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CpgFgw/S5CFL3BnNZsrqz/Wm/FABbtoQgNWn7dfA1a8=;
 b=ap09t6t1njQlcUY1WV+dGdSjiRYxjbMEYDHWloT1gbXasCQLQeWUTUdabiV7uaWAg9
 94zrokvM0XcBqAYXi7VJRQdijtL4ykd9q99idM4AycLzXxXJ9lWVAatW15SnDkFpI/PP
 vcxYW5vWZcSIicXRFJ8QKXoyTANKAJo3CcPr3BUXXE5jdykwJ3kXG3u9mOYLWGRKo9Im
 xSyRB6NdhCCqup5cWVMS/ai2lQpThQMtDZlEpKUahGPjY8JCvTpmS02VLkWqB2Zs9RXL
 f4zwLYXLNAo8jAt5h44gTCHnsMxbx8EWLJG6KnB1/ZczNsMT5zg9KjNTXPgyjGZB1p68
 buog==
X-Gm-Message-State: AOJu0YxbsxUQrGTtlMsU9G63vgaLK7Nmgq4REqT2I8M9f3h1GjjOpV5U
 ctrpqyiTEM7AZxHPQ1c8L8dTZvUFV2GphnaqEXPMdxFiWmnLYc61tWfssFLgsQlM1RZS1TbavLA
 hnru+QofltCzwPuln9fwp74olWmTdCbSvU55rvJFK680owz/noluiw/kkNErWUIaG8poDDGG4WC
 Uf/9n9BOOHo24qCDD1PuF51bf5UXBab58XZlIr1fss4vMoTz1xn+Xv
X-Gm-Gg: ATEYQzy2CjYJhZsB932RJWKgV2lHeGSFsfRuaAf2SmplhpeTsAK0ruRPCO3MbdmV7yi
 gl2E9+4J0S60PmWqq27/tfsyjQ45mdqdKCDNsqz6Zt18i8cStbQtJDQ9EL/J7NQNVSylw8wFqLp
 YKHbxs+KCU1UsH+TlOlHkTYWwd/WjbaXtat47kZ2QCRbNGpOPRjS2QcRxcf5yeafOAfh5aQU3ot
 yWYK/tR4XZ9mtITe2YKXjxYf/PYk9LkCWIum+/Hgpm4MzRLtW3MKwtKb+wVaRByxCRj6BsHqAI6
 6GeFMjnNXL55ArtlAGHQnm56CRlxq0xSt5MbOFh9fw8tr0D3f6FHqCEQ/Iioce526EqyRZcKM+X
 vbiSaZmzFjZAWJj6xefCyCfIjIj0ve8+5YhWpjS4nNzuZIhLDv/46IbkgGppRjsMVviAzlBzlag
 QQ+JO9WC65NZblw/RJCmJecDwqaPJJ
X-Received: by 2002:a05:600c:a31b:b0:487:716:2fa2 with SMTP id
 5b1f17b1804b1-48727ec3c1dmr168755075e9.16.1774871824747; 
 Mon, 30 Mar 2026 04:57:04 -0700 (PDT)
Received: from goefb.lan ([185.236.72.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48730688605sm283802535e9.10.2026.03.30.04.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2026 04:57:04 -0700 (PDT)
From: Ferdinand Bachmann <ferdinand.bachmann@go-e.com>
To: buildroot@buildroot.org
Cc: Ferdinand Bachmann <ferdinand.bachmann@go-e.com>
Date: Mon, 30 Mar 2026 13:57:01 +0200
Message-ID: <20260330115702.1451432-1-ferdinand.bachmann@go-e.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=go-e.com; s=google; t=1774871825; x=1775476625; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CpgFgw/S5CFL3BnNZsrqz/Wm/FABbtoQgNWn7dfA1a8=;
 b=Et8Dp4E8jy7e2f83MM+wcZ+Tve7PyiRD1ozwtsjZjzXJ3VKU24QTUzqZV0U4FNZ/jQ
 MwmGcAx5msnPWbiDrL0/Y6rjcjjz2FRAFsd+6jZ+kMv7NY4kN1rvnfZOG0di1rpQrPIs
 9htwJFuXZvB6u8Zum1rUjACnBPXJboTJ1dUdBDQIzD0oT5p8kuI7T0g3m9MGjTwN5+jr
 elbF4rGmjoUj1O8amJlgPGAEBMYbFzFbpz/a3gIrU+HFbsZOE/+Zndykg7WyxrYRnvlh
 By7t8rxTh3Pz7zUBpPbXA1ValIeUjuTvapGxxwlt8/Bh9Q6+KD9GB3/cYgIJ1pmSnfNl
 9CxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=go-e.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=go-e.com header.i=@go-e.com header.a=rsa-sha256
 header.s=google header.b=Et8Dp4E8
Subject: [Buildroot] [PATCH 0/1] package/uboot-tools: fix FIT signature
 support
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

FIT signature support in uboot-tools is currently broken in buildroot
master due to changes in uboot-tools' Makefile from the big update in
2025.11. This patch fixes the changes by adding missing defines and make
options.

Note that I sent out a content-identical version of this patch a few
minutes ago that had the wrong git author (@yrlf.at instead of the
company email @go-e.com). Please disregard the previous version of this
patch series.

Ferdinand Bachmann (1):
  package/uboot-tools: fix FIT signature support

 package/uboot-tools/uboot-tools.mk | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
