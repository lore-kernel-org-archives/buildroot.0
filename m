Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEE4CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5644282C5E;
	Fri,  5 Jun 2026 12:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYVKyxiBW94F; Fri,  5 Jun 2026 12:50:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90DD182C61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663842;
	bh=0dhIKDsnHk21M8P9vHS/yS7tZwCvVBe9f3zkKvbgBJk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=om04S6xSeixCA7Z0On5GG9XqwNBzz5NEYMtFI9H7DcC5a6YwJ2d51DAHeVDR7HaUn
	 H47vFfsamd+o/UEwn4GLxQcBsSZ2M7QuLpLhwJZxaJKGGDt/JAdZxaJzYZuxH9ZA/9
	 ACxWdGPUZldttzA4J4MVrIGWNzN50SyWvZS2W5vV6Z+749ObYgzbEa/iUcTxm87mQL
	 1ZHwkhq06bd/SvOa8k14XWCWMh1alT8NokhDIpOPvNST+8mCpFJN33NsK7k8y5yoUi
	 gzdXmxewHrwwI1Qg0NM8DQnSzxXhOJJcS7+1eTt9I41wKxIMzD/zTU2y+Q08U1hVwr
	 QXTrLXRJrtwNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90DD182C61;
	Fri,  5 Jun 2026 12:50:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 63CDF388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FE1761114
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i3oT5EdkTSuI for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2A092610CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A092610CA
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A092610CA
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:36 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-490b915ded5so15322665e9.3
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663834; x=1781268634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8/+1T3CkRo4TObSqvXn/XeSCwhNc02qbGjPBSatBE0k=;
 b=B7QjwogxBeoviJfTa4ODLAA38tT5u5f6wL6tVOI+Ra+XWsXMpofM5LKOx/8INuheqB
 XeqFtRdAcPDUNXYjbfvl2RabPqwTVJDWJI9mB2RqmUDj2TLGaLLjfj5ZmlXesh7Q4eAq
 PagTl5DR0bp5JBEH99MtRK488irmNEiOG2ibVuDZF1Dq+TQsIBnGxumS9HjWnMBYAmYr
 wYFEX8lLsQHt6Hiz7I3sqDdlp/xb2FwUMXylwwf/0noECy2oz9jXeqRWDKIPN/GcMwDg
 ZCMpq6qEcvbUl9YaddP0xffbf+763oscFKkur3dqH7f9+7lgQ3mpBpOiCB2jcArZ5UAL
 FfWg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+cOksQ9z0HvTpnZukplvmBh7af+vqr2JQxv3x+EpkkakHNYi6hu8W+fAJm+jCxhrpdRP/WYsbqSF0=@buildroot.org
X-Gm-Message-State: AOJu0Yx4L/oF7Pchxv++GWfKCqLb/1wiJq8SUNSNSKY0gvVJBTS4aFpU
 kVgJaQlbBvpcWn1iUOViNVY3B0iYDlvqYoYESsPJonvhCWI1HX3SRKUKR/aBcfrrlnZzhUlCwqc
 uNKFv
X-Gm-Gg: Acq92OGVxRMueZ6i86mwsVYc4kysVOKwymf/Kvz+GX4NoMVTEA/e/7mwFGkVx7VnMGV
 5dGgP0oJIKEU9unKW21duS/9w6nYfoeeVfjvaRp0adtuH8Paht68pW4hloVyivSfDcu5dXcwt0y
 FWP/hyzOh8UD4/MG0P+XvvCyOsM9YlmKQ85n73pM9IUkOPbfRmuXXzRIlkZAjsdECOgtZhoGc73
 izBOTHWTfN1dndYvRFRpEVLL8+zH8MmJQlh32Ek2MVQZHiArYncPbsYBb3CzYadOlK0cHSFbvIL
 m5q+f9+ylvGv3QMf66yGuuJDFozBBzJJiU8dlGlv/PqaZGEhfyhdnuyoUDe7tiNfFzlYu9DfnJF
 Qv/XD+TwCdff5FvipQb/LJoM6leCXyeis1kprvfX2DZfLykv6+WcWU3TaTmSFLU+zmY97eQoZqb
 cLJ/XySz5IN6AQHV0FPHiEW4yiUM5+69y0QZMZ
X-Received: by 2002:a05:600c:83c8:b0:490:40f1:5314 with SMTP id
 5b1f17b1804b1-490c25b2b7bmr53049165e9.1.1780663834275; 
 Fri, 05 Jun 2026 05:50:34 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3a87dasm141896345e9.7.2026.06.05.05.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:34 -0700 (PDT)
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:32 +0200
Message-ID: <20260605125033.273756-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507123534.318763-1-thomas@devoogdt.com>
References: <20260507123534.318763-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663834; x=1781268634; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8/+1T3CkRo4TObSqvXn/XeSCwhNc02qbGjPBSatBE0k=;
 b=P5Rvgg4sspbvqFvAC7xbPNJdD1k+pURqNQaqAIUp6zuUGxh/Vw4nbENmqNkrNzOLtd
 Alx+rPqP/NJ4NIV/AAQWy8piyTivIbdOFqBdp/cZiNN3S5QZjgjidGANTGuAtopioTE3
 M6JGZqlxZYn6YUHWalTX4Gw+bTqO/3MMY/8he8SEzgcEuV4pjNgXiKm/ROanxkL9VueM
 FDwGMwBlGDQpXV4IOSZ/BVl1sH452UKoNZOL6D5MmNuHGhWIr31WPMYd3V/vdgsQANoA
 mWqphCYz3IyqRX4ATuEbMqKnrzqqFJZMyV1SbTiEOHH6XuLkGvOD41nSPUnm5SFPgIGL
 P6CQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=P5Rvgg4s
Subject: Re: [Buildroot] [PATCH v1] support/kconfig: fix compiler warnings
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gQ29tbWl0IDMyNDYxMmQ2OGUwOWQwZGI0NGM1MWM0NTFiYzZiODc0NjZm
N2Y4NzQgZml4ZWQgc2V2ZXJhbCBjb21waWxlciB3YXJuaW5ncywKPiBidXQgYWN0dWFsbHkgaW50
cm9kdWNlZCBhIG5ldyBvbmUgYnkgaW5jcmVhc2luZyB0aGUgYnVmZmVyIHNpemUgaW4gY29uZmRh
dGEuYyB0aGF0IGdldHMgcGFzc2VkCj4gYWxvbmcgdG8gZmlsZV93cml0ZV9kZXAgaW4gdXRpbC5j
LCBiZWNhdXNlIGJ1ZjIncyBzaXplIHdhc24ndCBpbmNyZWFzZWQgYWxvbmcgd2l0aCBpdC4KPiAK
PiAuL3V0aWwuYzogSW4gZnVuY3Rpb24g4oCYZmlsZV93cml0ZV9kZXDigJk6Cj4gLi91dGlsLmM6
ODY6MjY6IHdhcm5pbmc6IOKAmCVz4oCZIGRpcmVjdGl2ZSB3cml0aW5nIDEwIG9yIG1vcmUgYnl0
ZXMgaW50byBhIHJlZ2lvbiBvZiBzaXplIGJldHdlZW4gMSBhbmQgNDA5NyBbLVdmb3JtYXQtb3Zl
cmZsb3c9XQo+ICAgIDg2IHwgICAgICAgICBzcHJpbnRmKGJ1ZjIsICIlcyVzIiwgZGlyLCBuYW1l
KTsKPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICBefgo+IC4vdXRpbC5jOjg2Ojk6
IG5vdGU6IOKAmHNwcmludGbigJkgb3V0cHV0IDExIG9yIG1vcmUgYnl0ZXMgKGFzc3VtaW5nIDQx
MDcpIGludG8gYSBkZXN0aW5hdGlvbiBvZiBzaXplIDQwOTcKPiAgICA4NiB8ICAgICAgICAgc3By
aW50ZihidWYyLCAiJXMlcyIsIGRpciwgbmFtZSk7Cj4gICAgICAgfCAgICAgICAgIF5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gCj4gRml4IHRoaXMgYnkgaW5jcmVhc2luZyB0aGUg
c2l6ZSBvZiBidWYyIHRvIG1hdGNoIHRoZSBwYXNzZWQgYnVmZmVyIHNpemUuCj4gCj4gU2lnbmVk
LW9mZi1ieTogRGV2cmVlc2UgSm9yaWsgPGpvcmlrLmRldnJlZXNlQGJhcmNvLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgRGV2b29nZHQgPHRob21hcy5kZXZvb2dkdEBiYXJjby5jb20+CgpB
cHBsaWVkIHRvIDIwMjUuMDIueCAmIDIwMjYuMDIueC4gVGhhbmtzCgo+IC0tLQo+ICBzdXBwb3J0
L2tjb25maWcvdXRpbC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9rY29uZmlnL3V0aWwuYyBi
L3N1cHBvcnQva2NvbmZpZy91dGlsLmMKPiBpbmRleCA4NjY1ZjViYjg5Zi4uYzJlNzk3OWFjMTUg
MTAwNjQ0Cj4gLS0tIGEvc3VwcG9ydC9rY29uZmlnL3V0aWwuYwo+ICsrKyBiL3N1cHBvcnQva2Nv
bmZpZy91dGlsLmMKPiBAQCAtMzUsNyArMzUsNyBAQCBzdHJ1Y3QgZmlsZSAqZmlsZV9sb29rdXAo
Y29uc3QgY2hhciAqbmFtZSkKPiAgaW50IGZpbGVfd3JpdGVfZGVwKGNvbnN0IGNoYXIgKm5hbWUp
Cj4gIHsKPiAgCWNoYXIgKnN0cjsKPiAtCWNoYXIgYnVmW1BBVEhfTUFYKzIwXSwgYnVmMltQQVRI
X01BWCsxXSwgZGlyW1BBVEhfTUFYKzFdOwo+ICsJY2hhciBidWZbUEFUSF9NQVgrMjBdLCBidWYy
W1BBVEhfTUFYKzIwXSwgZGlyW1BBVEhfTUFYKzFdOwo+ICAJc3RydWN0IHN5bWJvbCAqc3ltLCAq
ZW52X3N5bTsKPiAgCXN0cnVjdCBleHByICplOwo+ICAJc3RydWN0IGZpbGUgKmZpbGU7Cj4gLS0g
Cj4gMi40My4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
