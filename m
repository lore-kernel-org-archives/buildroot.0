Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B905E108E1E4
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 10:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E50D40C01;
	Thu, 19 Mar 2026 10:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5F0odc_ADXWt; Thu, 19 Mar 2026 10:43:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C19F40C02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773916983;
	bh=sCnBGY+y8K9mUTgJAn12Hpy3gFcgCUMYsnlTpF4CQlg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mYfw+/hPnDmcWVd/CSJuoEkHgsV4/GjczmHV+4+BF0P3/MwtPQ7jiR+yKA7o70nzM
	 sP8Te1UinQQWVK1F1COveGmtWXVzWuSWUM+utiCu8/VxbZ5U4+ayuWYt/5dr586+89
	 UixQ5SyDiF+AWRgPGpIesPVvX8C6pTIBizyDcSBlPGsVjW3glI7/MRxi9RJrxk8lcR
	 N7PEPSMKmpsVZrNvSc+OflLXIhOPhc7Kgg4Db/0e/IVAmELCGlmjF7+CzQBMpQAUKB
	 gS72nU2xfGeP6wq9R5wf6KeKu+DPWCATJMUlTy+FepCgoI0wvXO+0JgcP/F5SrAwMN
	 jc1oU+oq2tnIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C19F40C02;
	Thu, 19 Mar 2026 10:43:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E6E1D1B6
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 10:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8DCF40D52
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 10:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jr0L0Ng_nsPO for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 10:43:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=nblochn@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE0DB40D50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE0DB40D50
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE0DB40D50
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 10:43:00 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so7768165e9.0
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 03:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773916979; x=1774521779;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1oMu2qAVTZ/S40qGIJ0BXY0cmRg88JehAS07QBfvK/4=;
 b=R2PM+73NtxDYdHZcEP+NruFGFR8mtUKFnqYD99uu04PW2HCeH7Ku6FPOBsd7c9y2uS
 zAb8FroixL08CNncA3h4Fo6bgQUvwYZ/kSL9zX5zUCXjwgXf6JxVJUAgCnw7i6X3BZ3W
 qdbWvhJkatgLGGp7VxcdKD7uQYkY021/tfpbGRCvhyBECldFhqLxmtTiu2Vqx7JMfugE
 bmL1UZJS7xtU8oCYrcvZAiUEA0QMpO2svmVETqS/NBVPjyAvM3425X0m2+dEHqFM1d2n
 dAIjtGySS3528UFbNga+i+x84Qok5lDOIHvaJ38h7n6msxo+6QICF8v+aEz7A7RTn+gR
 e3Pw==
X-Gm-Message-State: AOJu0YyEl/HFJa3XBkJ/BZs5StTS/qgpjrQ4nD0x0rPGpk1Pm+FEOOfi
 /fwp8kJNW+Y7t3VC3hELIG6MhQeYuiOhiV8W2qudF6Yxldz66rzSa5rWC2dxOY0I6gI=
X-Gm-Gg: ATEYQzwCbouNvtdB/DjkUrYWeopQEo3pcK+ZLf8vChUpfCFnZtSThwx/ygLngRPCUG8
 5kqBC9Xl9Uq8w8AtEcgWYLjtHTJpREB3/mekyvj9eO7adwZ2662P5vWiPwN8pgsXYlbLtfJ+hAv
 bmg9zhCtQIfXHVD5kocDtcDHmx81OvQrguNEtUugKveA1xrKJi4Ni8pvmn9ZRubzYVwdkCHZhgB
 OQiDZ0LyTNnGgZXWmd7AEBqfmxSs6f0qXfvZzohnaUq88t+HldyaBYsMiqZbRhmItZLSNdMyASQ
 QFU2fEeV9czaNljdd10kjnBo4UMggkaDaA1Xa+8h5XhqKUDa97+bAoi/9bHkpE31Laey+kRiaZ2
 +6Jt5jF5bJLIivfymqlY/JMKMKC2Gb4zS9hW3LUlqv/ZHRpdbzqgPrDxiAO21P4Vbap3Oxdq8gT
 Zxv13CfCDfbSGz0HkZBUSE75a8PmU4YehWyOEXUDKwvq4UlOZ4
X-Received: by 2002:a05:600c:5392:b0:485:40c6:f526 with SMTP id
 5b1f17b1804b1-486f4451109mr110340015e9.26.1773916978213; 
 Thu, 19 Mar 2026 03:42:58 -0700 (PDT)
Received: from seil-ifc-nb-d.solaredge.local ([31.154.58.254])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486f8c49073sm53515815e9.11.2026.03.19.03.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 03:42:57 -0700 (PDT)
From: Nathan Bloch <nblochn@gmail.com>
X-Google-Original-From: Nathan Bloch <Nathan.B@solaredge.com>
To: buildroot@buildroot.org
Cc: Nathan Bloch <nblochn@gmail.com>
Date: Thu, 19 Mar 2026 12:42:49 +0200
Message-Id: <20260319104249.22286-1-Nathan.B@solaredge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773916979; x=1774521779; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1oMu2qAVTZ/S40qGIJ0BXY0cmRg88JehAS07QBfvK/4=;
 b=CuaRgn1Q6K5CEIcup2dlgG7dAqWLDBylOY27WFXRug4vckDhMGfEPwkymaGmzFJZJj
 st1xJPE5vRMqJO3/wli3wYKkNUe62FTHxAWn4EuxPuow9faAsIQAB8fxZHPTAjtvXkFt
 4Uoab4m93CwvErUd6nYfWfZcfyLwCw0cY7eUaBJzJTpUj3QjpaujJwoddor47Yjh60F+
 DYyLGVFPh8tp2hdjDJTOypgcflp+rJ2MoJVenAe0A5HmlRQJbp3GOs95LzlI8IICEUXl
 VRFMdaNKNy+A7OxTdSrwSuT1D4CytRq6N+t9fOIuUE79/7yjQYs0zlXXXFl7weFlRi7s
 Vlrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CuaRgn1Q
Subject: [Buildroot] [PATCH] pkg-generic: suppress SOURCE_DATE_EPOCH warning
 in step_time
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogTmF0aGFuIEJsb2NoIDxuYmxvY2huQGdtYWlsLmNvbT4KClRoZSBzdGVwX3RpbWUgaG9v
ayBjYWxscyBkYXRlICslcy4lTiB0byBtZWFzdXJlIGJ1aWxkIHN0ZXAgZWxhcHNlZCB0aW1lLgpX
aGVuIFNPVVJDRV9EQVRFX0VQT0NIIGlzIHNldCAoZm9yIHJlcHJvZHVjaWJsZSBidWlsZHMpLCBH
TlUgY29yZXV0aWxzIGRhdGUKZW1pdHMgIldhcm5pbmc6IHVzaW5nICRTT1VSQ0VfREFURV9FUE9D
SCBpbnN0ZWFkIG9mIHRydWUgdGltZSIgZm9yIGV2ZXJ5CmNhbGwg4oCUIHR3aWNlIHBlciBzdGVw
LCBhY3Jvc3MgYWxsIHBhY2thZ2VzLCByZXN1bHRpbmcgaW4gaHVuZHJlZHMgb2Ygbm9pc3kKbG9n
IGxpbmVzLgoKVW5zZXQgU09VUkNFX0RBVEVfRVBPQ0ggaW5saW5lIGZvciB0aGVzZSB0aW1pbmct
b25seSBjYWxscywgc2luY2UgdGhleQptZWFzdXJlIHJlYWwgZWxhcHNlZCB0aW1lIGFuZCBkbyBu
b3QgYWZmZWN0IGJ1aWxkIHJlcHJvZHVjaWJpbGl0eS4KClNpZ25lZC1vZmYtYnk6IE5hdGhhbiBC
bG9jaCA8bmJsb2NobkBnbWFpbC5jb20+Ci0tLQogcGFja2FnZS9wa2ctZ2VuZXJpYy5tayB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcGtnLWdlbmVyaWMubWsgYi9wYWNrYWdlL3BrZy1nZW5lcmljLm1rCmlu
ZGV4IGEyNzQ5MzIwLi5lNGJmNmRlZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9wa2ctZ2VuZXJpYy5t
aworKysgYi9wYWNrYWdlL3BrZy1nZW5lcmljLm1rCkBAIC01MCw3ICs1MCw3IEBAIGVuZGVmCiAj
IFRpbWUgc3RlcHMKIGRlZmluZSBzdGVwX3RpbWUKIAlwcmludGYgIiVzOiUtNS41czolLTIwLjIw
czogJXNcbiIgICAgICAgICAgIFwKLQkgICAgICAgIiQkKGRhdGUgKyVzLiVOKSIgIiQoMSkiICIk
KDIpIiAiJCgzKSIgIFwKKwkgICAgICAgIiQkKFNPVVJDRV9EQVRFX0VQT0NIPSBkYXRlICslcy4l
TikiICIkKDEpIiAiJCgyKSIgIiQoMykiICBcCiAJICAgICAgID4+IiQoQlVJTERfRElSKS9idWls
ZC10aW1lLmxvZyIKIGVuZGVmCiBHTE9CQUxfSU5TVFJVTUVOVEFUSU9OX0hPT0tTICs9IHN0ZXBf
dGltZQotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
