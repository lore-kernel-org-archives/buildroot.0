Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C82CCA464
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 19:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A60860A47;
	Thu, 15 Oct 2026 19:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kFhp9jWw8Z_m; Thu, 15 Oct 2026 19:33:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 21E9760A80
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792092788;
	b=MzFhzjIjf7M/Jh+U9kJ+KIXIAhYz7WL3MYTYWyzF1wZqSj81kv4qriNFNTbZz+eWm9oI
	 WsXuOEhT6yxtkTL98Dj3yFEeuNbJjYsaDKDe56nuwympwA1QP8sIXVifRz0Z0WKgWZuvK
	 1vJ/5Px+3schDZlrqBQ2lLwP45EI7lAvBZm6d3YAkoegCP3/siq36YXKXrME9h/TAxUDz
	 QiNFwiPxaLEu2jJrdgbC24zbKSm/7xwDSJBAJg5eDYh7/VjqdGqxHBkAqzLn9yXdrA+y8
	 1On61PFPEM8ZvmdVSvEAdDnzLghUmrFsNqteb4mnOSFCFMxkb03E+cUZnuizvmHsDDA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792092788;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=FxLPJsi2S3Uprl0U1h8WlaEpUKLq7dU9O2jmrYdZUog=;
	b=N9A0/itpduvxie8DjLZVYvF/RFPKCNiNmiwvDxCtn2PTeog17hkQ6mUcwertNBUzDJoD
	 TT5T7+CjlyF+ro5k2+kJnjWhYtgaxhbTgrbctXOk+lt72vpDSOgVZhHYsbdbY/TCqrRDn
	 P9IHe3EHm400KANKPAaiwqscbX5ptGu2XBKXerpZ0+m+n4rI4TZ8PJtYpWw7MlNrD5Un3
	 JUKIidFbBc4G0lxlY1rNrH7oDq+bTt/zTIPKyBrZSFv0RTygZTMQ6mjz/bKPF2ietIIUl
	 6MSw0iOEhmhh2WyQ+FTm200tcb82UxjL9ieJla2px+lL8eF6x/Z1wC+uB+hA4u/u1UA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792092788;
	bh=FxLPJsi2S3Uprl0U1h8WlaEpUKLq7dU9O2jmrYdZUog=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lUFLRIkBPbfFnEu7z2xJYdlA9YmUVUW1e+BvX18O/SN/7BD3Bg4Riw5PNE7+Z9WMQ
	 UMq7BwyCZAralyBOeFMwVwhj503ReClTE/B7TxmSqljSjiGldmy+QUEe1zsFmZab7S
	 BkvTLT+ElZh3jfdtR+bQOPpexGf2P4C8d2XTws4h2gJXSQBQ5SYELAWs24ZFTTbuRW
	 OKTV6OGlR310Mkn4IsjWg6DeYu8RpkNljxfCoJnzRVAi5u+u0yT27cb2FWJq7wDqD6
	 1qIGLYu8Gf0Om4StJ2YD2J0mPyACjSdVoAKAVeQ8fcX4Y2Vtbbp9958GTvh8mNqgv0
	 pZfoFpH4WKXTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21E9760A80;
	Thu, 15 Oct 2026 19:33:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 862A31AB
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7829A81203
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gosk1nMoeV71 for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 19:33:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C1C4B811DA
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792092785;
 b=L9K5Bt3s8TNnodS9a1eJaTmadL0HcwCULkLWDXZo2lBEsP0VPmHe43VSSrOEq7n+Wl+g
 u6o7QO7jDe8sAxrqz7w46DkoJqy7M8UDKS4ez+9YoWyqUakrhoiB44XdWLhB3yQD2ruQ+
 I8CDpcn0+Z1t5zVbOY58h0r7HYsKxvcJPGeODCoO4tp2yBka//i0FKa+0687CRb3t9Y7+
 GqXfsZNzvJSyOzf+dHZ5zDPITiyeALhiCn5JUTx3dAVZIw7uTk4/wRXnJAxaQTUcvud9C
 jbU6b9aOFoQOCcpsSLm3YbwUHJdAPBvryn6QnMTzORa02WNKe+Ml+Czq12HCdzG0C+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792092785;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=zKsxI0wed6HGlprP6z/a4eB/Kn8vzwMpOH0LCF0e1vk=;
 b=DCLMSAzPsxWsbE85yGZesOT9rxatPyiveLZkQKNcAvXf3e4PQPyn9U9TGhOnp5kjxado
 /vdlPQ5w3ff9F84PtmJI3yWZmkUShwdn0kGDbipPDbjJtAsqCDe6Xuu4WMwsJg82z+rT+
 VPKbsaJ6QxwiLsF5potPQDOCh6eR48vtDZWpZ1/KyqIZiuBx+fDl4NZZ4JAQ/hTajAL4H
 i4emWBz0OjJBWycxnubojiow3Y5HB7qO0JSEwGVSNQDlchOZpGuyGKDTryEOiwAGsYpGE
 ay5aLJ2jw6UktjT5ZUQbSiZMmbRY3esdDf2kWbrEKwoItCKb4/f3pLEFI/45M7b0iEw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=FNEz9nJ2; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=FNEz9nJ2
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1C4B811DA
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:33:04 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-6dd7070699eso1717781eaf.3
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 12:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792092783; x=1792697583; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zKsxI0wed6HGlprP6z/a4eB/Kn8vzwMpOH0LCF0e1vk=;
 b=FNEz9nJ2T0kGzz2MzRCCAgTrbv2KGW0Am1+BniR5KIvDJLl/vM+9kZJcRIFoJ6LwYO
 +a13fQFTC+Si183XXnu3NUtoPPiuewKgOy8+BJL+a+uDe4pjzs14dNhwoJYrGObYVtuY
 E5K2gzmkVP9qNmVSwTifA/0cKqp3wUr1iPaXC+djB0T24ykTCRvfLt0oasM7XTxsQCjK
 t8nWhu7jt4+UGn7/jpdreFWqPtDsf0mcXiPDgafzhvzF9dVnxqHEqpf0JhSFCpe0u16s
 rrI9lNhfSkuBS+D/WS7gtQ06IM6vh/8j0vDT+nd4YPRfs8eRH2bhJJAkY40fHexg9Jaa
 RNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792092783; x=1792697583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zKsxI0wed6HGlprP6z/a4eB/Kn8vzwMpOH0LCF0e1vk=;
 b=mPJjD94pkaMDPFUczvA0fBVEfFx1oxvBr51dEg4tlIpPHMrTdt7rg9iZUXkDMOguio
 aAbfia29zlsW9yNSP3ljoz1ES0AOP+ni6nx2wIdQ/cueQawhQZS5yJPhGHpIEbVIeWAc
 eYwRrXs11BA0i7XWaUIP6jMiKIETQOITuHpKfPjGzUNqw0T1m7p3ffZ9+/uNF1Xv3b8X
 WplgKue6AbTTQ4w4XdYRzwuMVM+r6WypT75xZce/TnOOm5JiZ5yh6fGfdcjE5tpSIHYX
 XnliSZ96HVvuTEbwEvkMWL0JiA1/D3VZX9ur/Kgf3VzMcY/6QpksLCPy4f7XWTxSrfZU
 8xSA==
X-Gm-Message-State: AFq9FYLTGt6TBqSCSohLxHrDF9L08NqXfPepMMIuo1lk5B4dq1x94Oz2
 DEAd1PXS9e9s+kJhxrb7nJMa81xx3ReUp85SUBtXOkBlDGRITmgddMnXDUNOIQ==
X-Gm-Gg: AYBFou2GfG+6LOZnTOMAEIQk3HuSLwuuuw/Syve9pHAFfA961ND+tRRS1Uk9sdsYjvL
 C3hdGODgrMY6JM6twYJ/s+0UBqjqpaApRglg+iLr+Bx0exXOZRNM6mErP6W66rnS8eT3iGUdrHZ
 SrCytUHmnY7lZ8VY6fqWDd3ro5hNKROWKIULoxe36IJoG3FbbAu3VJjBXFTEymAQfAE7a9hmyzw
 VqWMW7l/bvIsOta1QQZgg0v9OnZ/yOXHJmdZR1vXPUAq7L8Q1McfAUfQugg8fNW8rbVXLMnqvga
 /JmnJ5Zng889JoDQLqS+wOy5gjs2ynd5+f9/qzJjoIPQKwGgsSlH/1u6f+vkWtvg3KrCrKh68f8
 CALSnEVlHsdkBWcLCaBdfN5TUiYD2YRPyh0hM/6dvylb5qarc7atDS0BwkYhB4Pgz7avDUu0jax
 s6WQxfn1nFNJHAQ/8V6txQVfkPS4bcou8WQB+lyiFDP9xtXnIwfQqbJm4R9y0KyB/ohPx5OcC26
 OLCl5eD/hm7SQQzjH7AxkJoNmMPm8i0s1Z4jk/egToMdWLo/ar7TSmt5eDi5cIEyx02/N5sTVXR
 0Pi+0ytZWjCfUgklFwoiURRrxmxNcYf0WxKkS0XvC2lMpyGOcOXUOL+8OSJOeKRj+TWIrRLr3ux
 DrTsQ7mPlw2Zu0mxgMARSiNqjHdkQueAH0TnwG+yzmw==
X-Received: by 2002:a05:6820:984:b0:6df:428f:f173 with SMTP id
 006d021491bc7-6ef0eec88a2mr15160210eaf.19.1792092783518; 
 Thu, 15 Oct 2026 12:33:03 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-7018f2df328sm180045eaf.7.2026.10.15.12.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 12:33:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:32:40 -0600
Message-ID: <20261015193243.3299884-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015193243.3299884-1-james.hilliard1@gmail.com>
References: <20261015193243.3299884-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 6/9] package/python-jaraco-text: add host
 variant
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable a host variant for the standalone pkg_resources package.
Include its runtime dependencies as well as setuptools-scm, which is
needed to build the package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jaraco-text/python-jaraco-text.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/python-jaraco-text/python-jaraco-text.mk b/package/python-jaraco-text/python-jaraco-text.mk
index 2d612196a6..75536c6e3f 100644
--- a/package/python-jaraco-text/python-jaraco-text.mk
+++ b/package/python-jaraco-text/python-jaraco-text.mk
@@ -11,5 +11,12 @@ PYTHON_JARACO_TEXT_SETUP_TYPE = setuptools
 PYTHON_JARACO_TEXT_LICENSE = MIT
 PYTHON_JARACO_TEXT_LICENSE_FILES = LICENSE
 PYTHON_JARACO_TEXT_DEPENDENCIES = host-python-setuptools-scm
+HOST_PYTHON_JARACO_TEXT_DEPENDENCIES = \
+	host-python-autocommand \
+	host-python-jaraco-context \
+	host-python-jaraco-functools \
+	host-python-more-itertools \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
