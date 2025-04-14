Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CAEC369A2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 13:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8015F60AC6;
	Mon, 14 Apr 2025 13:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pS9RPQfrWG8T; Mon, 14 Apr 2025 13:32:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8C7B60A7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8C7B60A7D;
	Mon, 14 Apr 2025 13:32:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D3A8EDE
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 13:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C48DC80DDB
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 13:32:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35LHBgwLyubZ for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 13:32:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6C7FB80F82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C7FB80F82
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C7FB80F82
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 13:32:41 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso2365019f8f.2
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 06:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744637560; x=1745242360;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J4hXPofXEjTbNRf5yherJYgRY5/qNJCpbrtzoIYM15g=;
 b=ir+0z5jVnaInkwWFw6P/XK32idABTUMk6mI8EdrNBekdok8k107fyOmccs4ZbUHePy
 Zia5beCAbEnpFWslGE8FT/myEcCGrVli/z8x71exnO3GArB+Hh/6dmDCFLkXXqlYrK+E
 hZzz/q24a/Ewzxp2j57RNQ93oiaZW3vRUfZljHddirBYpLJkP60SzyGvrOQLucrZqBc6
 7aB+aArlb+RwZhzneiGPD97p/GQmdpgbNCyp41P8ldNcZaONsxZaQcvP4YwWr4muMcSw
 ZzrWpChMfp7fSJlHRRUO29kfB5yRiSSABHhyjgd9dRU65Os+ibwU5oWXjH11317/LpT7
 tN9w==
X-Gm-Message-State: AOJu0YxovkZBWweRqjUp1WJ5egakvUcdk5ukryrrMZn/CIcraMdt4z8X
 qNtIjaAvVmQoCWhhrPPLiG/hKfN8cO8VJbvMehMlJnxmnWUMq7h6V9da4Eu1lENDN2ztFLzFKzq
 26SvpbA==
X-Gm-Gg: ASbGncul9vLbxdtGSrzCShh0VEcQl1IrGoZhC5yBj2qseoEOH/acmMG/l9B6DBNUs7w
 egdE/7iPKe1Jj6YDfW3xfarkLZ/rgPhsVQTXIeBtXvpvI4wvVLKikfxkps0N+Ic54fny6vEoAvv
 eUbXZAmIEx0YnFztDs8Zl1U2/eAmb7W/+P2sOWL2x/ELGfz0tXUd7jH24YhtCo/feH6Wjh6Tgb8
 U24hpEkIRy6Mds34i5roymDFXIUi/f/LAXRouGoesQqgOPmp2g1opp3gqmGZHp8CJ5HeVvgwdFn
 /2s4bya0ls+ycGOatsTFCr7uOufIn9jhlqLeMrysYwR6EGqMC7Hq3Pq7eZxf
X-Google-Smtp-Source: AGHT+IHNfixMW0iuB1KDLFpRTgMriBzHpctUiFecVCqDuzJK6mFotDm4WgwnKg0Yc28P891Iv7fRpQ==
X-Received: by 2002:a05:6000:2585:b0:39c:266c:136d with SMTP id
 ffacd0b85a97d-39ea51d3604mr8894107f8f.12.1744637560055; 
 Mon, 14 Apr 2025 06:32:40 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([213.211.140.212])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2075fc78sm181212465e9.27.2025.04.14.06.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 06:32:39 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 14 Apr 2025 15:32:33 +0200
Message-ID: <20250414133235.987304-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744637560; x=1745242360; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J4hXPofXEjTbNRf5yherJYgRY5/qNJCpbrtzoIYM15g=;
 b=AReh2aSkFX44m5SiznYU8ZhiY30xIUgR/1ZHQdlS92E0S8uNBdqANdbVWe+9wNr6Sq
 Gfez1G2M5QqI87BFZKZ/TWcEG0Is/PjB+WqGv2Hvc0hY/Cu6sXFOvO1MjrdbZdu3YBrT
 t+6Qno0NJstC/0C2MazT66eKmiS2+ML1NAIqF6TRq8t5s58jFDhlwwObK6DJt0qWbLhN
 ES+/xuWMkwkUwcbHKNmD77lVeWxhb/0Ji0F8LiGiguQ1E85JEMj5P9OPlK0R2/Utal0c
 eCqFoCr/AaozKjK6r5YDcDrAnM2qHbuDHvyKnuA1M5vPWpEuDULZ2AxREII3D944MgLY
 SXww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=AReh2aSk
Subject: [Buildroot] [PATCH 1/1] package/libopenh264: ignore CVE-2025-27091
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: Bernd Kuhls <bernd@kuhls.net>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Qm90aCBvcGVuaDI2NCAyLjYuMCBhbmQgMi41LjEgY29udGFpbiB0aGUgZml4IGZvciB0aGlzIENW
RSAoc2VlIHRoZQpyZWxlYXNlIG5vdGVzIGF0IFsxXSkuCgpJbiBvdGhlciB3b3JkcyB0aGUgdmVy
c2lvbiB3ZSBoYXZlIGlzIG5vIGxvbmdlciB2dWxuZXJhYmxlIHNpbmNlCmE3YWViNWE0NmVhYWY4
YTM5NTYwYzg2NjQ1OTMwMThjZjI1MzgzNWEgKCJwYWNrYWdlL2xpYm9wZW5oMjY0OgpzZWN1cml0
eSBidW1wIHRvIHZlcnNpb24gMi41LjEiKSBidXQgcGtnLXN0YXRzIHN0aWxsIHJlcG9ydHMgaXQu
CgpBbiBlbWFpbCB3YXMgc2VudCB0byB0aGUgTlZEIHRvIGZpeCB0aGUgQ1BFIHZlcnNpb24gbnVt
YmVyLCBidXQgaW4gdGhlCm1lYW50aW1lIGxldCdzIGlnbm9yZSBpdCB0byByZWR1Y2UgdGhlIG5v
aXNlIGluIG91ciBDVkUgY2hlY2tlci4KClsxXTogaHR0cHM6Ly9naXRodWIuY29tL2Npc2NvL29w
ZW5oMjY0L3JlbGVhc2VzL3RhZy8yLjUuMQoKU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90
dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0KIHBhY2thZ2UvbGlib3BlbmgyNjQvbGli
b3BlbmgyNjQubWsgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbGlib3BlbmgyNjQvbGlib3BlbmgyNjQubWsgYi9wYWNrYWdlL2xp
Ym9wZW5oMjY0L2xpYm9wZW5oMjY0Lm1rCmluZGV4IGY5YTUwZTRjNjEuLjlhZTk5NmZlZTEgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvbGlib3BlbmgyNjQvbGlib3BlbmgyNjQubWsKKysrIGIvcGFja2Fn
ZS9saWJvcGVuaDI2NC9saWJvcGVuaDI2NC5tawpAQCAtMTIsNiArMTIsOSBAQCBMSUJPUEVOSDI2
NF9DUEVfSURfVkVORE9SID0gY2lzY28KIExJQk9QRU5IMjY0X0NQRV9JRF9QUk9EVUNUID0gb3Bl
bmgyNjQKIExJQk9QRU5IMjY0X0lOU1RBTExfU1RBR0lORyA9IFlFUwogCisjIFRoZSBmb2xsb3dp
bmcgQ1ZFIGlzIGZpeGVkIGluIDIuNS4xLCB0aGUgTlZEIENQRSBpcyBub3QgdXAgdG8gZGF0ZQor
TElCT1BFTkgyNjRfSUdOT1JFX0NWRVMgKz0gQ1ZFLTIwMjUtMjcwOTEKKwogaWZlcSAoJChCUjJf
YWFyY2g2NCkseSkKIExJQk9QRU5IMjY0X0FSQ0ggPSBhYXJjaDY0CiBlbHNlIGlmZXEgKCQoQlIy
X2FybSkkKEJSMl9hcm1lYikseSkKLS0gCjIuNDkuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
