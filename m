Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96C8106ACF0
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 22:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26EEC607A1;
	Thu, 12 Mar 2026 22:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1oPotSJYn3fs; Thu, 12 Mar 2026 22:30:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0524F6078D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773354600;
	bh=hrSE2jEjq/CJB1us/3T0Y8YrJxR7CotCuFWXzQPPdTg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V/sTlCgIsdOQUNm/v9AFF0WhdMuo4qubcdaTWkFUIzKhoabTfMRPq6XT3RJ4WIDJo
	 XiT6hhQkDlZk++3b4CklECbKJFX6v3AQRh6qiqYrevKJ5kzx+n2IMVxI3AJxT2IEOF
	 nJeSOOoGPTvJQ1Hhm6ABV0lCO90vtSViwcEkJTY+ZA4oSe0cQepUn0kMB/qynbj/C3
	 2Qe/N9luUOj8pH1QTzNOVmdJVDV2g7H1TyP1DW8wMyRBEAF3RyccknLRkKan35keR0
	 J6xlXK1HdZYalwcHI6Am8dGJ+jYHrbyETO1MlVPJFOvg40jmdWSu25BNxqvkwP+JBI
	 Pq73NyrJ9SrTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0524F6078D;
	Thu, 12 Mar 2026 22:30:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A090786
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 22:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC0AE4087D
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 22:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hBpGhX2aY4oL for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 22:29:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A075E40879
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A075E40879
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A075E40879
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 22:29:57 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso13648095e9.3
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 15:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773354595; x=1773959395;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cP1WPdfeylEEfaYuaTVET6MTKwSyquT9o0bR8Tr48ao=;
 b=HnYR96UCDHifYHleQl276DLtijh6Aw3eBKBNrLw4EKaJD8NXuHBFbzAYbt+yRIQp+D
 6tx1xLkaxpgsO3kMhJ2cZT5RbfUpk+NU7+F0lMbvsmJLxJaN2/hrPZwnHjRhBDPgwOaM
 Px5JF5zk+0YMly2l/RtfyigWDAILrXpb9iE72u8ZA/17u+xkLYSsS8aoq1A1Nkh4eNO/
 k/qDwWuaZUqW1Slnujax32jbOckh3Abc+cWQnVDLKZb4Z0+Y0T0mhVj4ZCPuPmqX+RF+
 ypWSshbfKTKYMl1NaBEdlfjJKKRIiMrxBPTXbUZDLKJYfDF01ZKcFjRxFznTpCBLiZrM
 PiCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFj+j1pPJuORsOYvI7RT4briBX7ABPMUULp4428S+//tyMbGFCeWKpBTOlLRX9VXACM2OJ38sPc6s=@buildroot.org
X-Gm-Message-State: AOJu0Yy3Qs9bFu9dJqWyHqqb54mKarSl8TghySc1EU1m1xt4BDz3P5DU
 gV3G+kmaUibcDkzbEBjEiCJZRJJPKjE9/hgz5L0IbFu1Vwgdt8fMjVFwWOqioumuH7w=
X-Gm-Gg: ATEYQzw9CwImm/iLXJ7hOFrRf7MESdz1fAybMUvgLeNJeSGOiLO1rxbFk6xe4CmeVml
 dYSbXYnzsim0drkBWBW9uJNkxSoSa36KjBqKuhucJAuLLnn92x2hQbrJUPxkxM8VFqpuBFBFggu
 9qPf0sQ5o8g0lhLbWI7CORhytfJj2pIF6W67SpHveV1HpPTFRFxkmy/cautHSsaSElwgPV1rFLB
 v7aU6MEq1S+tFTtO7xtDORx2eMf9zN6kx7SSNqaEVmVxeE41HsWXG/3DfUF/f3oEjljqxZQ6+lz
 RGpAJRCu30d48WSn67pHO7nrfzMBcbBrbVGfalJwDUz7eM+lQl5Su0I0T9DEG0LbsRye8U7mdjY
 KxcldX5nlIno98Hb5eUaOJ2MSNK7Tf/MsTtQMNpkmasInkq6vjwa5ZHutj2+HzFaRedkmdkbqpL
 GV5LMA4sjdmFJRnox9E5Vglmd1V8qydHlfqBkrZVDA0vAdTmNu3DtCGYTKa1ki+5EB6Ht+RIZGO
 p/aVn3WTC6OzEaR4w7XAOTEuE7fTDqfW5hOB3iQ7objbKfnHcVGBbB4jDtRvXFsyA==
X-Received: by 2002:a05:600c:4f8f:b0:485:345b:ccb7 with SMTP id
 5b1f17b1804b1-4855671028emr16131355e9.34.1773354595468; 
 Thu, 12 Mar 2026 15:29:55 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541acea11sm292767645e9.7.2026.03.12.15.29.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 15:29:55 -0700 (PDT)
Message-ID: <2281e975-a405-469f-97db-267cedc95b87@smile.fr>
Date: Thu, 12 Mar 2026 23:29:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Philippe Proulx <eeppeliteloop@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260209223259.1002212-1-ju.o@free.fr>
 <20260209223259.1002212-4-ju.o@free.fr>
Content-Language: fr, en-US
In-Reply-To: <20260209223259.1002212-4-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773354595; x=1773959395; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cP1WPdfeylEEfaYuaTVET6MTKwSyquT9o0bR8Tr48ao=;
 b=oeIJOLMa1n1N158hqQTtANEubIDzPGjcfjPlv/OeODKuqA4ickLEADh+BCfNjvHZ4q
 yVCB8gMVZ3tPfHrANXhmprD3gH5Fyktcofjx77JRGNg7eL9Qlm3SUn0ChKO0SyycjqNj
 1yjXscMWFz9MGvzBCJn7xDQUy7OQiRdPN3t8E=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=oeIJOLMa
Subject: Re: [Buildroot] [PATCH 4/6] package/xfsprogs: enable host package
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLCBBbGwsCgpMZSAwOS8wMi8yMDI2IMOgIDIzOjMyLCBKdWxpZW4gT2xpdmFp
biB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gVGhlIGhvc3QgbWtmcy54ZnMgaXMgbmVlZGVk
IHRvIGNyZWF0ZSBYRlMgcm9vdCBmaWxlc3lzdGVtcwo+IGluIEJ1aWxkcm9vdC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+IC0tLQo+ICBwYWNrYWdl
L0NvbmZpZy5pbi5ob3N0ICAgICAgICAgIHwgMSArCj4gIHBhY2thZ2UveGZzcHJvZ3MvQ29uZmln
LmluLmhvc3QgfCA2ICsrKysrKwo+ICBwYWNrYWdlL3hmc3Byb2dzL3hmc3Byb2dzLm1rICAgIHwg
NyArKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS94ZnNwcm9ncy9Db25maWcuaW4uaG9zdAo+IAo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL0NvbmZpZy5pbi5ob3N0IGIvcGFja2FnZS9Db25maWcuaW4uaG9zdAo+IGlu
ZGV4IDIxNjBhMGY1NTguLmI5OTBjZThiMTQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9Db25maWcu
aW4uaG9zdAo+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluLmhvc3QKPiBAQCAtMTI4LDYgKzEyOCw3
IEBAIG1lbnUgIkhvc3QgdXRpbGl0aWVzIgo+ICAJc291cmNlICJwYWNrYWdlL3V0cF9jb20vQ29u
ZmlnLmluLmhvc3QiCj4gIAlzb3VyY2UgInBhY2thZ2UvdXV1L0NvbmZpZy5pbi5ob3N0Igo+ICAJ
c291cmNlICJwYWNrYWdlL3Zib290LXV0aWxzL0NvbmZpZy5pbi5ob3N0Igo+ICsJc291cmNlICJw
YWNrYWdlL3hmc3Byb2dzL0NvbmZpZy5pbi5ob3N0Igo+ICAJc291cmNlICJwYWNrYWdlL3hvcnJp
c28vQ29uZmlnLmluLmhvc3QiCj4gIAlzb3VyY2UgInBhY2thZ2UvemlwL0NvbmZpZy5pbi5ob3N0
Igo+ICAJc291cmNlICJwYWNrYWdlL3pzdGQvQ29uZmlnLmluLmhvc3QiCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UveGZzcHJvZ3MvQ29uZmlnLmluLmhvc3QgYi9wYWNrYWdlL3hmc3Byb2dzL0NvbmZp
Zy5pbi5ob3N0Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5mMjAw
Yjc2NmZlCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UveGZzcHJvZ3MvQ29uZmlnLmlu
Lmhvc3QKPiBAQCAtMCwwICsxLDYgQEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX0hPU1RfWEZTUFJP
R1MKPiArCWJvb2wgImhvc3QgeGZzcHJvZ3MiCj4gKwloZWxwCj4gKwkgIFRoZSBYRlMgZmlsZSBz
eXN0ZW0gdXRpbGl0aWVzIGFuZCBsaWJyYXJpZXMKPiArCj4gKwkgIGh0dHBzOi8veGZzLndpa2ku
a2VybmVsLm9yZwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3hmc3Byb2dzL3hmc3Byb2dzLm1rIGIv
cGFja2FnZS94ZnNwcm9ncy94ZnNwcm9ncy5tawo+IGluZGV4IGFiNzhmOGUyY2MuLjczNjdlYTUx
YmEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS94ZnNwcm9ncy94ZnNwcm9ncy5tawo+ICsrKyBiL3Bh
Y2thZ2UveGZzcHJvZ3MveGZzcHJvZ3MubWsKPiBAQCAtMjAsNiArMjAsMTIgQEAgWEZTUFJPR1Nf
Q09ORl9PUFRTID0gXAo+ICAJSU5TVEFMTF9HUk9VUD1yb290IFwKPiAgCS0tZW5hYmxlLXN0YXRp
Ywo+ICAKPiArSE9TVF9YRlNQUk9HU19ERVBFTkRFTkNJRVMgPSBob3N0LWluaWggaG9zdC1saWJ1
cmN1IGhvc3QtdXRpbC1saW51eAo+ICtIT1NUX1hGU1BST0dTX0NPTkZfT1BUUyA9IFwKPiArCS0t
ZW5hYmxlLWdldHRleHQ9bm8gXAo+ICsJLS1lbmFibGUtbGliNjQ9bm8gXAo+ICsJLS1lbmFibGUt
c3RhdGljCgpXaGF0IGFib3V0IGxpYmljdSBvcHRpb25hbCBkZXBlbmRlbmN5PyBpZiBub3QgcmVx
dWlyZWQsIHlvdSBzaG91bGQgZGlzYWJsZSBpdAp1bmNvbmRpdGlvbmFsbHk6IC0tZGlzYWJsZS1s
aWJpY3UuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gKwo+ICBpZmVxICgkKEJSMl9QQUNLQUdF
X0lDVSkseSkKPiAgWEZTUFJPR1NfREVQRU5ERU5DSUVTICs9IGljdQo+ICBYRlNQUk9HU19DT05G
X09QVFMgKz0gLS1lbmFibGUtbGliaWN1Cj4gQEAgLTM0LDMgKzQwLDQgQEAgZW5kaWYKPiAgWEZT
UFJPR1NfSU5TVEFMTF9UQVJHRVRfT1BUUyA9IERJU1RfUk9PVD0kKFRBUkdFVF9ESVIpIGluc3Rh
bGwKPiAgCj4gICQoZXZhbCAkKGF1dG90b29scy1wYWNrYWdlKSkKPiArJChldmFsICQoaG9zdC1h
dXRvdG9vbHMtcGFja2FnZSkpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
