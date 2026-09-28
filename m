Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F40BCA5FA1
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 09:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1901E405F8;
	Mon, 28 Sep 2026 09:08:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rgqLju60puOa; Mon, 28 Sep 2026 09:08:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2EE24405F1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790586513;
	b=NmH05/CaJOFDP2baDnQTLFmna7kAoFdwKlr80uQRUvTO3ExFYXwjNadwpPPpn5NH/lOG
	 5lYQcinrSV/iWP6R/cY6AQR1pRhQVudMEPajJ/BDO/oJBt+TA7v0tisF26dVCz4yVx6bx
	 EuNPefLzh80BiVkTUhTb4EnbtuwDM5HlfJ7hqjGCqhqJEYfQohd6ch6dONPDrAhUWiGpu
	 StfnG+QkB0HyC7w6GwoFUOyw7DY3FlNml28eiqmZVG/+z+QugNbFLFlB4brHtSFmLHij6
	 4J2s8ho6rUpV7Fdga/3ZWmqRdj5nd8xPNI8o8vv2TfwdFWw0RsDwVBUjbmEHF1v/s7A==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790586513;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:Date:X-Gm-Features:Message-ID:To:
	 Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=t+QQFBTDdgO8iYkyZXFlVE2/jhL2vL9QHO4iky+t6Lg=;
	b=Ad9UWV/K1n07OmvqlUUprbfvK059p/kp/65RXBF6L6r62UQr1L8OiyLmui4OSvr3yw6C
	 Q+d2Sym/3/75nARow55a8T7hU8NPvqjTtRt5n1BfqMbFW9QdaBe7PgLBvqRUTPV8lUhm+
	 fLv66jjHdexqo4zrXstcf0ZysbktrnwGUEkTbr4X8oS5ZwW/ranavxr623JgyW95bnvso
	 HNwfj8adK8g6pTg+Gq1GgQKEr7O0Y1FPLU1UdqZsv6ypqyasCNz5H+ojTOFnAds7yBqbB
	 5ndxWmwvivVjEvuYODbIk2b+xQhYlL90lNHiQRLr5Xl7H6eU3yX0+GCtpVmtc58PlHw==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790586513;
	bh=t+QQFBTDdgO8iYkyZXFlVE2/jhL2vL9QHO4iky+t6Lg=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Z4H+gqRuEIISAqFSMcBEPBz8qpT5LQI7poZNSUqbVWsZ5aEj0odA/xjIurIyvpRUA
	 81Hzd86ArhQCwPWEZ6trTMMcRKDbPzPWa7zuVpyxjIQYrUxq3jGEbu78+mB+BXXvG3
	 KsT1hC7AITfEE5sQZLdkzrMVZMajfLLzzWCn06GisUalcbygzIQQeRCFdXBZ0Ocgag
	 nyIP3SsxN74R19Fljj/93YjoQilQTUiwj3gEZc1bh4X7X0MByiIOqyvn2EOczLIaeP
	 0zNAP49HcsCaoTKdQqXLnqJJ63Xy8BPq0w7Lsf+8uw86QVrxvi06chusrJv+Uce+w1
	 r/Vl6o7ZO0tAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EE24405F1;
	Mon, 28 Sep 2026 09:08:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B3D3B22B
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 09:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B111B80D34
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 09:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 61h-NmrNMXss for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 09:08:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8258580CFA
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1790586511;
 b=ANYOM0bi45g7mywTSzH2S/oXotBDcR6i/8LgnCpcNBLuBFtKJFxfdzYR4IeabF9nLX8O
 7RvY7U23to+v1N4CC2zT/7wiHkdmKkYtnyt0CW5u8EdnC0m6yqCX0xISYYq2ahdtFFJ5k
 Yj4g0as6QCVO6aR5FhudVQRDQQS7DpubnIbVyXyPvYXdA4Wdwzj74M2pjwukjicZ0AGQu
 YZHPrWQjM78a1rqgSPFRKzIjWWPxUntAHVgghF+3bGdxMWy8kn2gkyvsTzLryf73ZwTfp
 PxGKMUGe9d7RH/1kIiE1Mvq/aYB6et2DiFsLYiLkoky7KePvXu05kD4Gd143q060/Sg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790586511;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=0W+LkQHypx7A1bOUeQSHRVpwfZTvSzaHJjCSCIyQz+E=;
 b=M+GBpWA4l4syWacbr8IjspDlaNMw5MIk83krSVh+oCg1CMg/RrgEP5sbeJZhVeOXfWng
 d/z0U8mkA8sbPT/6RuWz4f2cjnIFWFM2wdwS+vJcTX9epNFnXJcwflKe7/pnnS8BrTOqp
 J+iZhD0wYmBodcFSDiPwRC3NoG3/gOV+Lr47xrevHSdD9/CwywcCzwfsNQg3jsE7omfgO
 7PC2y9gJvsS70K+k3Yhlz+A89wEYjyn9YbciFl6sETxCZb6R0eU33gQzDm5jItGsI1kfI
 tpn8Cl4iTjek5zOxrr+rMHn32XU3xzXmG5T5VVrmYsQJLF6lIwrMkLK4O1gLf/9pwig==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=tGJqc3QP; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:33::e"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:33::e;
 helo=mail-ed2-x0e.google.com; envelope-from=yegorslists@googlemail.com;
 receiver=<UNKNOWN> 
Received: from mail-ed2-x0e.google.com (mail-ed2-x0e.google.com
 [IPv6:2a00:1450:4864:33::e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8258580CFA
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 09:08:29 +0000 (UTC)
Received: by mail-ed2-x0e.google.com with SMTP id
 4fb4d7f45d1cf-6aae90f528fso3937634a12.1
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 02:08:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790586508; cv=none;
 d=google.com; s=arc-20260327;
 b=p+rSLozgEtRETkzHT0ymkYZ3dpkqHnyqFnHYyQyH/yOOENCyj27z8HPMq5zYIroDLs
 2hltnnGQ0946053f28N61CDzNFvXiqKh7QzEVTImFWYXyoqZz4HhCO55WCicgwY9ZP6Q
 MqN7QoeN9YwvcOidBfXDWNx2fbEbhWIZQIOqXKUoMp9FHAy3Wy2aS+Uph0ukHbw7vE87
 dlLG4KEHR5D+i4EfXAN2Txy4+aFZn+6Snjw9zJWvOGNopCsSwL+FE2wKPxQjsC02yejs
 7eQEYTtva87ZD2LYbg5pdBvcIuj1YP3cTDejx/OorU+sN6dFiV0z6vn9WnTbQkU5gGgl
 HGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=0W+LkQHypx7A1bOUeQSHRVpwfZTvSzaHJjCSCIyQz+E=;
 fh=Pv2yMr+uf9Z0Jj4hvc5rKp06NbEixl3KReSgrKtf0Rg=;
 b=YXUADwr0J/WXUDL6dvuONV61s+GHwCa532OEGjjAokrl97Ry3MylirUbtS52iFv2xx
 Cj4ElivajPVKP9jkFdeDfcX1JJoW7lfN19ADfewTzj8fCdneOfOAsTu7eK+fhSkIBBlQ
 rrytnI59Lybmy5zi6RspyC4Clfnk7XbOWgFG6NeZBcmeLoac+yrzQMgoOMhBMKtbPz2x
 rR396qyPYqQIO4CVJ5ZJ5yRy63i4j4ykBfRgDrqzt0NoG35cO8iLqrGmfRflUdcEBddA
 CQDrqXRPdglLf6A9b6V4TVkGosOqWRGlHj2YBsUPbl1RGD41p7U7TBA5ntgc9Ys2IBy3
 weKQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790586508; x=1791191308;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0W+LkQHypx7A1bOUeQSHRVpwfZTvSzaHJjCSCIyQz+E=;
 b=y/bO5HStwuvpdmLa+/bCjaPrGgx83gDfehyyhE5oYiXWP1SLvaEGv1pARBRVSgnk8l
 1Nb+40Yo2aiD/xSJ5EuUZRlC2TO/NOdU0QINwRxdFAsmvp+vrK3aPBgb86cGabcHTWNE
 9YePH3JmPoHvLnTuqtJLHYyujsKJyTX2rxCh+1i9nPWcyyaJP6WV2SOaM7ZwdkYJ61w2
 sPLfzuVMWJs4FJWMpqTf8tMAURVhqlNI2hQ6tNCzdMkRgbu4XFzjcawLnJPPX6w2OPuF
 wehBMT4XQbqnofzjQs5XyLWUaXZRM1TsbpwZZzcbnEgM39RGob62ylKOMS0Hv/Zat1ID
 20eg==
X-Gm-Message-State: AFq9FYLhM1n2xo6VD9fTbdk7QAabmvDbkOSd5libpWd+mCJkw8HXa3eK
 i+h8wJwqUatcVB662PwRiLUo/xDDohxctUDFGs0752FIdrleWo1WzlPDeOvQs8F0rzsVA4gidZK
 9SamfgIby6qhoqPi1lsBiiX9qyPsAUs8822hb
X-Gm-Gg: AYBFou32te39x8agb7nyviDM8imoHW5lGvUYUcCa2/XeBN7sQct2LIVOx+ylA0qdzg5
 WoqcislLR6aQuymcoR37DMStnYrAw75+goV9qrai2MGwoC1fOJUeHqufaeSZ5P47eb+5Vw3sToL
 0a5BMA3MykQ1vhvqq2pY4HB1aqMm7hK2DIZwwHSveRU19ETTtG2EnI6rp6HE1t793OKHB8kflPM
 rcKMkLYsQgzvJSXpwTZEXNDknoUX10d/kYPuvXTr674vuZL747yYUAwjzeiOhfNfTJlMjMT+4f2
 UrjddwZdljW77Hi5uBH7bIpfwvb4zZZhNQumGAEfjYym6auR4Dg4krIg
X-Received: by 2002:a05:6402:a30e:b0:6aa:f02c:dd96 with SMTP id
 4fb4d7f45d1cf-6aaf02ce0a3mr4629433a12.11.1790586507596; Mon, 28 Sep 2026
 02:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260926133654.2836794-1-yegorslists@googlemail.com>
 <aroq5mq_8nTxwbYv@windsurf>
In-Reply-To: <aroq5mq_8nTxwbYv@windsurf>
Date: Mon, 28 Sep 2026 11:08:54 +0200
X-Gm-Features: AclHuK8clXbmHhBofMh0PqSh8rfJTeiC8zmlDG48b-mvILzrTckFf71M_TjKEAo
Message-ID: <CAGm1_ksWtcOOUnGC=yoxJYAs09f95WEZJx_4jKPw_VHKU6LUdA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Will Newton <will.newton@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/libmicrohttpd: fix build without
 thread support
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gTW9uLCBTZXAgMjgsIDIwMjYgYXQgMTA6NTXigK9BTSBUaG9tYXMgUGV0
YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhlbGxvLAo+
Cj4gT24gU2F0LCBTZXAgMjYsIDIwMjYgYXQgMDM6MzY6NTRQTSArMDIwMCwgWWVnb3IgWWVmcmVt
b3YgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiA+IEFkZCBhbiB1cHN0cmVhbS1zdWJtaXR0ZWQgcGF0
Y2ggdGhhdCBtb3ZlcyBjb25uZWN0aW9uX2dldF93YWl0KCkgb3V0Cj4gPiBvZiB0aGUgdGhyZWFk
cy1vbmx5IHJlZ2lvbiwgYXMgTUhEX2dldF90aW1lb3V0NjQoKSBjYWxscyBpdAo+ID4gdW5jb25k
aXRpb25hbGx5LiBXaXRob3V0IGl0IHRoZSBidWlsZCBmYWlscyB3aXRoCj4gPiAtLXdpdGgtdGhy
ZWFkcz1ub25lOgo+ID4KPiA+IGRhZW1vbi5jOjQ1MjQ6MTg6IGVycm9yOiBpbXBsaWNpdCBkZWNs
YXJhdGlvbiBvZiBmdW5jdGlvbiAnY29ubmVjdGlvbl9nZXRfd2FpdCcgWy1XaW1wbGljaXQtZnVu
Y3Rpb24tZGVjbGFyYXRpb25dCj4gPgo+ID4gRml4ZXM6Cj4gPiBodHRwczovL2F1dG9idWlsZC5i
dWlsZHJvb3Qub3JnL3Jlc3VsdHMvMTBmMzM4Mjk1NTIwNTkyNjQxMDQ2MjMzNTNhOWVjMTU4NGIw
OGU0Zgo+ID4KPiA+IEFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLW9wdXMtNQo+ID4gU2lnbmVk
LW9mZi1ieTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgo+Cj4g
VGhhbmtzIGEgbG90IGZvciB0aGUgcGF0Y2guIEhvd2V2ZXIgY291bGQgeW91IGlkZW50aWZ5IHdo
aWNoIGNvbW1pdAo+IGludHJvZHVjZWQgdGhpcyByZWdyZXNzaW9uIHNvIHRoYXQgd2Uga25vdyB3
aGV0aGVyIHRoaXMgZml4IHNob3VsZCBiZQo+IGJhY2twb3J0ZWQgb3Igbm90PwoKVGhlIGlzc3Vl
IHdhcyBpbnRyb2R1Y2VkIHVwc3RyZWFtIGJ5IGNvbW1pdCA3M2M0M2E3ZWY3YmQgKCJBZGRlZAp3
b3JrYXJvdW5kIGZvciBzeXN0ZW0gY2xvY2sganVtcHMgYmFjayIpLCB3aGljaCBpcyBwYXJ0IG9m
IHYwLjkuNzUuClRoYXQgY29tbWl0IGFkZGVkIGNvbm5lY3Rpb25fZ2V0X3dhaXQoKSBpbnNpZGUg
dGhlCiIjaWYgZGVmaW5lZChNSERfVVNFX1BPU0lYX1RIUkVBRFMpIHx8IGRlZmluZWQoTUhEX1VT
RV9XMzJfVEhSRUFEUykiCmJsb2NrIGFuZCBhdCB0aGUgc2FtZSB0aW1lIGNhbGxlZCBpdCBmcm9t
IE1IRF9nZXRfdGltZW91dCgpLCB3aGljaCBpcwpidWlsdCB1bmNvbmRpdGlvbmFsbHkuCgpJbiBC
dWlsZHJvb3QgaXQgd2FzIHB1bGxlZCBpbiBieSBjb21taXQgOGVjMDAxYjQ2NwooInBhY2thZ2Uv
bGlibWljcm9odHRwZDogYnVtcCB2ZXJzaW9uIHRvIDAuOS43NSIpLCBzbyBhbGwgbWFpbnRhaW5l
ZApicmFuY2hlcyBhcmUgYWZmZWN0ZWQgKDIwMjUuMDIueCwgMjAyNi4wMi54LCAyMDI2LjA1Lngg
YW5kIDIwMjYuMDgueApoYXZlIDEuMC41LCAxLjAuOSBvciAxLjAuMTAsIHdoaWNoIGFsbCBoYXZl
IHRoZSBzYW1lIGNvZGUpLgoKSXQgd2VudCB1bm5vdGljZWQgZm9yIGEgbG9uZyB0aW1lIGJlY2F1
c2UgR0NDIDwgMTQgb25seSB3YXJucyBhYm91dAppbXBsaWNpdCBmdW5jdGlvbiBkZWNsYXJhdGlv
bnMuIEdDQyAxNCBtYWRlIGl0IGFuIGVycm9yIGJ5IGRlZmF1bHQsCmFuZCB0aGUgZmFpbGluZyBh
dXRvYnVpbGRlciBjb25maWd1cmF0aW9uIHVzZXMgR0NDIDE2LgoKWWVnb3IKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
