Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DF6C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 11:01:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F0DD60EE9
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 11:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F0DD60EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C861540144;
	Fri, 12 Nov 2021 11:01:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 31NDr_1nccBC; Fri, 12 Nov 2021 11:01:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0804403C2;
	Fri, 12 Nov 2021 11:01:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F44A1BF325
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 11:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E8CD60655
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 11:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e173HUCmq7kR for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 11:00:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C88060600
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 11:00:18 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id c4so14757295wrd.9
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 03:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iA9bCegHgup4QkgDAxDt1v9L/vK6aI6zZO8IW18wbAQ=;
 b=MhcTOPC+/B1iUy9IzfL8w/TPYZ2bGY28OD3tD6wa36HESKjVudBLCe9wwNnm19ThNt
 V6Rgn+ThmnPXaxG0Gw5z8a8unJXSbMGDceg0ziVTkHnLtnw2GUKHtBK+9JTISJmp0cFU
 Q0h2LULBi8MQzPax+7c1xBrna8T0WjV2xrc1T2dfER8+qt9aqYCBHMQicNPqzYEszDQF
 cmIWeMfOP1SNlD+5+1Sv1cKVmDcj/vyQLD0GbVHk3i/Yf3g+thJyEI6+SCVEQSvNu4NR
 V7/63ShPaFDy/xiepW4pF7Y1tjSiTDM7JUD2DGK6ZaYCJOgNTzgs0XJuOvE3EnV/biaB
 fm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iA9bCegHgup4QkgDAxDt1v9L/vK6aI6zZO8IW18wbAQ=;
 b=smP7jGpCcxWKalJ/rOlNb+g2Gaw46PiDzmTtJA9ZSSeFxmXJscoWrsEYk2iBNhbL/L
 5rUbXDQL/2I+9nBfRgtu56RdqnSTfmc6rX16FlY8tFWv0hpqY7LU5GAHMfoD1aXVqSgg
 yE4yRrXFnM9H6bQh2cNchMkhRvi9G6Q32HvVAC7LkPn63TUXQICvu2MOCTc4WSAsXZSH
 w5VaCnesiMJbNh3I7pCKrD0ZvDgIIX7kGC3xB1vJ+Kh1rPIwROHg2qrwTqXw5EOrh8Zx
 +/YuFLR/3jJIEY1nkUEHjqw3Kz+NOIQCI06KRjWEtdhDCNlU/b+uj2NUn6xzcD5kc6MH
 FiSw==
X-Gm-Message-State: AOAM533ZzPQeGWOXljU6gM2aHkpVPoBgAF5OJIfapE9yQX1VIPt0siaz
 qpR0o4LltiecZRcoN46Zl21unnCMzSc=
X-Google-Smtp-Source: ABdhPJzzxStFT3DP86YEExBAH1sw8hH5G8+V0eO6cKvI4vzfqrPSVsl10DWnC4sLWIcfuF5YbmpZ6A==
X-Received: by 2002:a5d:4b0f:: with SMTP id v15mr17908218wrq.264.1636714816499; 
 Fri, 12 Nov 2021 03:00:16 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id 8sm3748796wmg.24.2021.11.12.03.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 03:00:16 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 12:00:07 +0100
Message-Id: <20211112110007.787836-7-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112110007.787836-1-romain.naour@gmail.com>
References: <20211112110007.787836-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 6/6] support/testing: test_luvi: make luvi test
 reproducible
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXMgZXhwbGFpbmVkIGJ5IErDtnJnIFsxXSwgaXRlcmF0aW9uIHdpdGggcGFpcnMoKSBkb2VzIG5v
dCByZXN1bHQgaW4gdGhlCnNhbWUgb3JkZXIgc2luY2UgbHVhaml0IDIuMS4KCkZyb20gWzJdCiJU
YWJsZSBpdGVyYXRpb24gd2l0aCBwYWlycygpIGRvZXMgbm90IHJlc3VsdCBpbiB0aGUgc2FtZSBv
cmRlcj8KClRoZSBvcmRlciBvZiB0YWJsZSBpdGVyYXRpb24gaXMgZXhwbGljaXRseSB1bmRlZmlu
ZWQgYnkgdGhlIEx1YQpsYW5ndWFnZSBzdGFuZGFyZC4gRGlmZmVyZW50IEx1YSBpbXBsZW1lbnRh
dGlvbnMgb3IgdmVyc2lvbnMgbWF5IHVzZQpkaWZmZXJlbnQgb3JkZXJzIGZvciBvdGhlcndpc2Ug
aWRlbnRpY2FsIHRhYmxlcy4gRGlmZmVyZW50IHdheXMgb2YKY29uc3RydWN0aW5nIGEgdGFibGUg
bWF5IHJlc3VsdCBpbiBkaWZmZXJlbnQgb3JkZXJzLCB0b28uIER1ZSB0bwppbXByb3ZlZCBWTSBz
ZWN1cml0eSwgTHVhSklUIDIuMSBtYXkgZXZlbiB1c2UgYSBkaWZmZXJlbnQgb3JkZXIgb24Kc2Vw
YXJhdGUgVk0gaW52b2NhdGlvbnMgb3Igd2hlbiBzdHJpbmcga2V5cyBhcmUgbmV3bHkgaW50ZXJu
ZWQuCgpJZiB5b3VyIHByb2dyYW0gcmVsaWVzIG9uIGEgZGV0ZXJtaW5pc3RpYyBvcmRlciwgaXQg
aGFzIGEgYnVnLgpSZXdyaXRlIGl0LCBzbyBpdCBkb2Vzbid0IHJlbHkgb24gdGhlIGtleSBvcmRl
ci4KT3Igc29ydCB0aGUgdGFibGUga2V5cywgaWYgeW91IG11c3QuIgoKWzFdIGh0dHA6Ly9saXN0
cy5idXN5Ym94Lm5ldC9waXBlcm1haWwvYnVpbGRyb290LzIwMjEtTm92ZW1iZXIvNjI3OTM4Lmh0
bWwKWzJdIGh0dHBzOi8vbHVhaml0Lm9yZy9mYXEuaHRtbAoKU2lnbmVkLW9mZi1ieTogUm9tYWlu
IE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgpDYzogRnJhbmNvaXMgUGVycmFkIDxmcmFu
Y29pcy5wZXJyYWRAZ2Fkei5vcmc+CkNjOiBKw7ZyZyBLcmF1c2UgPGpvZXJnLmtyYXVzZUBlbWJl
ZGRlZC5yb2Nrcz4KLS0tCiBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2x1dmku
cHkgfCAxMCArKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rl
c3RfbHV2aS5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbHV2aS5weQpp
bmRleCBlYjE1YWQzMWI1Li4yNzE1NWE3NWI2IDEwMDY0NAotLS0gYS9zdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS90ZXN0X2x1dmkucHkKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2UvdGVzdF9sdXZpLnB5CkBAIC0yMywxMyArMjMsMTMgQEAgY2xhc3MgVGVzdEx1dmkoaW5m
cmEuYmFzZXRlc3QuQlJUZXN0KToKICAgICAgICAgc2VsZi5lbXVsYXRvci5sb2dpbigpCiAKICAg
ICBkZWYgdmVyc2lvbl90ZXN0KHNlbGYpOgotICAgICAgICBjbWQgPSAibHV2aSAtdiIKKyAgICAg
ICAgY21kID0gImx1dmkgLXYgfCBzb3J0IgogICAgICAgICBvdXRwdXQsIGV4aXRfY29kZSA9IHNl
bGYuZW11bGF0b3IucnVuKGNtZCkKLSAgICAgICAgc2VsZi5hc3NlcnRJbignbHV2aScsIG91dHB1
dFswXSkKLSAgICAgICAgc2VsZi5hc3NlcnRJbignemxpYicsIG91dHB1dFsxXSkKKyAgICAgICAg
c2VsZi5hc3NlcnRJbignbGlidXYnLCBvdXRwdXRbMF0pCisgICAgICAgIHNlbGYuYXNzZXJ0SW4o
J2x1dmknLCBvdXRwdXRbMV0pCiAgICAgICAgIHNlbGYuYXNzZXJ0SW4oJ3JleCcsIG91dHB1dFsy
XSkKLSAgICAgICAgc2VsZi5hc3NlcnRJbignbGlidXYnLCBvdXRwdXRbM10pCi0gICAgICAgIHNl
bGYuYXNzZXJ0SW4oJ3NzbCcsIG91dHB1dFs0XSkKKyAgICAgICAgc2VsZi5hc3NlcnRJbignc3Ns
Jywgb3V0cHV0WzNdKQorICAgICAgICBzZWxmLmFzc2VydEluKCd6bGliJywgb3V0cHV0WzRdKQog
CiAgICAgZGVmIHRlc3RfcnVuKHNlbGYpOgogICAgICAgICBzZWxmLmxvZ2luKCkKLS0gCjIuMzEu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
