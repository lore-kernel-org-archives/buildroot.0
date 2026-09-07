Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C34AC79F9E
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 12:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A707F606CA;
	Mon,  7 Sep 2026 12:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMJQmzbyvoiP; Mon,  7 Sep 2026 12:24:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 00859606CE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788783874;
	b=Wwb7v1mX6Z/VovH/VdjnGGUrbd5NrfQNsaBpqkPNGa+lBFBHz77chGmjypQyvhNYVTlu
	 cW+Y1f+G3pbGw04V9cjJB/GKjrNoLv28Rp1kp8N0/QlpPRW+6ooCH9TbK1ref0cmWKvqL
	 lc906/q+5953p1ezYBKP/oUNR4Ud4NiOg6DHDAa8RgaW/FfCmzcfuAdVvYGogZp2ZGq0M
	 3IQd1hqBGzgKnMWxkWEuFZFc2s1XNsVJM1vqyuYMlfOe8U5zbY9tHnF0Fa1+T1mP6v2zk
	 jbAv4vsehRn/xa4fP8YdI9r2gPeraXN0HA3TsGB6O7OWYWaEE3DhTxgAFRa1lUJF/HQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788783874;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=fV4cFvybcZrBmZziJ4NZfDdZY5tZZGOsAgagmBieUn4=;
	b=JesMiNFZ/enhEACXmdfmNnqXJgyE3oEhI0MsvHAPfiO0VPHN9MONlI217d7h8Qb15fEN
	 3kSMKKvl2WcFOZQsdS/qcd8Z7HX2uqYOta3oNDVzJSO8b9l4PlUyJ7Hf9tT1fnJVKJzD9
	 9LhaXLRaYx2mO78gxl/iYJ+Wms2YBKD/EvlzMiBjL6eiwd7ayqUpGXSNZArMwExoQY8J+
	 BoOhIqTKt0kQbHQ5b3doiPyMtMJLrj5UskR0fi9LtdarPOZzUvvNCD5r9aNbmd/r0KAab
	 HDvaCK2mK4sYhvog51nrjRVXbyprlOA+Od3p9Wzy9xfpUCYTzqYqafZPG3GxNwZSBfQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788783874;
	bh=fV4cFvybcZrBmZziJ4NZfDdZY5tZZGOsAgagmBieUn4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jRlTmxXoasd3i5u/mg3qp0SISVRKnwFN7WjyFHfE6zuKlJvFRixnjHX/JGj1TRM2M
	 TR8wLjqmT0WWFPKL/JxmCyudihcZtm3pcBHdSyhVMEgQmKepL8ccHuEQomBsVqxy3A
	 88704ZR39Qcpz0RvJW26iTOKvuMBTdCRHk505tC5L3SL+8mYUKj1IHvV+GkF+J0itG
	 crEzI7qsKienopeOaNBpFkOBTsSApb+o0boshNHjT4T5PZ1p89us8KiYVGLUTsqKaI
	 A4wDKT++KhAskyZEqoPFSBP4+ziKzP3/GB4tqe5VGT2cJSHFKxC2Z2DqbDI8h51hfn
	 GEJg7T6HWq5Pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00859606CE;
	Mon,  7 Sep 2026 12:24:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6D67AEB
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 12:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A582C405FF
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 12:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o32AGaIeZpEv for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 12:24:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 74076405E5
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788783871;
 b=Z74Ti0GaILUIMKjI0uJBOw7nYbMdhP0CHunuQl+DZP9igKZe1dOvMC74pA2Jvb/6UuwV
 +ojHJKDR/F0euxARxBAq5LXzatT67bnB4zonAYI+xlR45wKHUtwlA8H9MUzXWrwP78DNs
 fmbKMVNclb6ZbfwsUg/RHSMJx6c8C39Sptug8xKlx8j4asQduqMb3Vz4sW+aMaCRaOgLm
 BRr1Vhs3q+qHkdS64GyyH+owcmecqza+kgFrH4EVeWIt391qdQdbQ/vChKlw/dAenqMKs
 vHBuIcdUQGmreEm1UaW4DIaZIyxZqIGO6RcviY7puefJWL0Tmwnh4/bhejByY29T1Sg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788783871;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Q4lnpQHLFzHjpSrHZ8vWTwwMbd1l7UoNz/bCEOrq4xI=;
 b=NUscM1cYx+uegasTN1LaXG6gaBaFKnxQSJI0YbtDnoTALViK7Wf9rvE8evZ5FX0pLJtw
 Qgb1/Kg9yZUh4GpXjLV10/zTOTa0Zq7Uf88wksGvj5lK6Bz8fkOXQVxYkg0nd28anUUel
 DbDa/1y62OsCAzAV0YsO27TYb6tjEZwn9WzBdNeCRuAXFvbec4JAOQgnHzAEEW/7kkZ4+
 oUPrSYAbQFjhE1XmMWoPLOLFW8NyzEwThreP0E44P1bf/fFehOh55Qr26Sm0c6ZhWyhbT
 IBOU2TYkO/XPYgruc/39CimIJ0JnzBiBA9PeXCXvx81VrZy+CV7EXIzJGKRIKzcV1PQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=FZxAFm18; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=FZxAFm18
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74076405E5
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 12:24:31 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-4843e9c5960so3481770f8f.0
 for <buildroot@buildroot.org>; Mon, 07 Sep 2026 05:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1788783869; x=1789388669;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Q4lnpQHLFzHjpSrHZ8vWTwwMbd1l7UoNz/bCEOrq4xI=;
 b=FZxAFm183Qh1hTxtntc2blJo2wAglRt1lBAnZjdoBW2UUsXdJzyt3PRJ40osIAHhzx
 ZYa9JKqGHE2WN9gKO8PrAYoZOhXok05YRZJGe8eUhAlx9VpvhOo/aKnCn5o9r0jvAMKq
 8c5MfcfbAjrmwm6sj9Wbc1y+WeK3czl7B3XTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788783869; x=1789388669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Q4lnpQHLFzHjpSrHZ8vWTwwMbd1l7UoNz/bCEOrq4xI=;
 b=AITz8qOy8xzkWERv2QvcqwK7Z/5DlVgDwD5lz+x6Zb/Z5Q9aOTlczXh2izFfThIcMY
 tgwPWSTeGLk3w2DTWFzBn2yo/Zn1+xgAyYph+BWEQ5iYbhSwgkjF694DhgBHZDcefGDY
 lbBxDymo1VFg/KfdkOIC9B1DOsRhrnu5tpTsd4XrPDVxx6jqnyN3gslGL8CV/y7BlgX4
 aFQygZnoSLLV77buNlPHgvEuoTxv6X9NyeVwedGGMTK67digFMKu3x37/v3vgGcjWPOv
 54YcSS+2z2PJh4PxRFUQkuhduFayFnzJ5Rv3Gzj5X9l44SHwDFPmJ/2mlhIUgmJtRT3K
 MD9g==
X-Gm-Message-State: AFuF++k0nZG2DFn3vNBQeZo/FEupPsz5+8mWto5/BjlO+usMVYXNAmTJ
 qZOyyYUAi10Ln6EgiGXfAdC80lDBPo9a8R+fPIs0ie9ubkAc6pwUq7fCev70nP+5k26dqqOpslq
 zWLMUQOM=
X-Gm-Gg: AYBFou0Ven1+b4hgzf7QxoArWg8Xc6m61o6dcJK9X/VYlgJxOa5MY7QjY7wPnoHCw0+
 VsBYnPRqGnl6Mq1NwfzQdQoBTVJiIYKUtyY0wDedqlNW7jEclH2iILfU+BT7Bg9w639P5Dsskn0
 zSVDDxdPtbSxzJt7y6XTefhjl1n0Q363v/x5xIGU+3vv5yW94T1KmeyZDW5dsGB66s6HMWbMMC4
 aojKjBp6N+xvysKrSZ2zM12YKpextFQyjiCdI7FwNpnJUTYVBaJs4HqwDhATene6JA9yRD8tN8I
 /uIRGEm9TCDwjDhnjbhEP0X7uim5FcIzKHzVZRW/KTsXY4o/V92TNyxuR/JQ9KYoQReUX7hcuUk
 8yu8KxW0cPfncbw1BAAWEq0TR5EkuQpk5XycsyuxL2B04vLuKb8DYh1gUct9bnvEsiaEoi2lixY
 aPsr9T1pkPF32mnSETmiIo0FwFj6M48ed+GuzUIOQIERPU6lVtGZ8Lz960CgUjDc1qkjGHE6nmr
 CH6v8PCJOJbZ5amYVpmQCpglFQlre0esPhAWFE1JDvtQ94g8mGrGoEl
X-Received: by 2002:a05:6000:704:b0:485:8c16:5ee7 with SMTP id
 ffacd0b85a97d-4858c166050mr21319436f8f.33.1788783868984; 
 Mon, 07 Sep 2026 05:24:28 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:34bc:b4d0:3d5b:964d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885be01bsm27724930f8f.31.2026.09.07.05.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 05:24:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon,  7 Sep 2026 14:24:23 +0200
Message-ID: <20260907122423.1350497-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907122423.1350497-1-dario.binacchi@amarulasolutions.com>
References: <20260907122423.1350497-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/pocketpy: bump to version 2.2.0
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

Release notes:
https://github.com/pocketpy/pocketpy/releases/tag/v2.2.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/pocketpy/pocketpy.hash | 2 +-
 package/pocketpy/pocketpy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pocketpy/pocketpy.hash b/package/pocketpy/pocketpy.hash
index d6ba6e5da27c..0c36fc770021 100644
--- a/package/pocketpy/pocketpy.hash
+++ b/package/pocketpy/pocketpy.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  2b840e0c87c36ae00100fe892301565d7d905e07e1ce1f69cb4b9fcd65bc82ef  pocketpy-2.1.8.tar.gz
+sha256  c67cb6a1422abe26114219d2e58441cbb3625bae6b25901d5b7f6f46b23ae8b3  pocketpy-2.2.0.tar.gz
 sha256  5ad14c41f26ed1b8c9a0039ae566bc7ce00277aec1634220eae5db2bb8fc54ef  LICENSE
diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
index c1ae075d3897..1150a47fc561 100644
--- a/package/pocketpy/pocketpy.mk
+++ b/package/pocketpy/pocketpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCKETPY_VERSION = 2.1.8
+POCKETPY_VERSION = 2.2.0
 POCKETPY_SITE = $(call github,pocketpy,pocketpy,v$(POCKETPY_VERSION))
 POCKETPY_LICENSE = MIT
 POCKETPY_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
