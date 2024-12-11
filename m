Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBA9E77180
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 17:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A24083A63;
	Wed, 11 Dec 2024 17:00:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rX4S1oPtUiok; Wed, 11 Dec 2024 17:00:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26D4083F41
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26D4083F41;
	Wed, 11 Dec 2024 17:00:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 588D16F
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 17:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 466E483A63
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 17:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KtxKLVVFTszq for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 17:00:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC2E583FA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC2E583FA8
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC2E583FA8
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 17:00:40 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-385e87b25f0so583893f8f.0
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 09:00:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733936438; x=1734541238;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FuvMmx15igLUPZD207YxiJur09cr8ZIsrwr7g2CoByU=;
 b=LR7u9GVEr3yk6FJLQXsC2vkGemYkFQ8hJuA5vt0Pejz1VuU5Mj0c7bNAXmYb5N9LRx
 SRyFQUf8Dy/2g9om3RwJSoTS0E1pJ/PV8XdZqf8SR6NNEGLDd18eyYQ1gbFZ6NRltILb
 8TGXEZWqgcLwGqDTjmuSEokDAOooQ4ae3stU5+eUsm2uABQLCbUIuSjBs/IFhjLhTwCC
 obLeXi6uCR2YtRPo6uLhI1l+FfQ/elmhk+BSE0Ti4KdcoI9t+c26lzEtmiqfLaqpeAiF
 /dDw7doMrolRTYkPYef4E8pEfksv8dQpi6T+qxSht/R0X9WdO+5Wfhx+UuseAGTgL4Gb
 ksQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxEzXnYgU8isofVytAAatOmkXbGj19e5aOWHLfSht1SejfrYZjjYpjLvDPcI77uT+3fvyBZTjt7q8=@buildroot.org
X-Gm-Message-State: AOJu0Yy5XmoEcTAIsukLm1UmVGcSTljFSDPxx/57WlU7sNUc2iRlwqSj
 e7VEN+skkxkfexgCPsO5Of4gHecaY2YLXagithM/GygZjSbz2062ZO06cKOSOiY=
X-Gm-Gg: ASbGncvCr+ogvQZh0ZJNId4V/78tkCKcmUphDrli5OE9nVoN6aT9rCK4U5UpooQS/GO
 WVpoVfZnlcF8tndUVmdBBvlLMFrd5P1op6ikoJ7B/NcScgEkFe44lIHINoHCDIb88WIA9nIVlRE
 iLxaC1+Px2obyvHW6AfZ/zRSx8CZEBX1nQu6HbB8Xs35mbi03LcHuRVPNu340VK9+DAkdH0u8BO
 1hKx77YhDqDqRDS2cjrtV5jrqiqoOkzw32gKMrWP5wGUnUrYcmdix+3P26ls1zT839gYMwGDJOg
 dl+yerOaWPuR0FWJsJR+zd8frljp1/h3RgKoOtWvtw==
X-Google-Smtp-Source: AGHT+IGU2U8g59P9F+2/zOiP6zlKQlQVtJgPZQR4LZvOq2whVvZxTD7sCfFnszPZmNW87xn5u7/kMQ==
X-Received: by 2002:a5d:47c6:0:b0:386:37bb:ddf8 with SMTP id
 ffacd0b85a97d-387887b8642mr2578f8f.6.1733936436817; 
 Wed, 11 Dec 2024 09:00:36 -0800 (PST)
Received: from [10.5.90.20]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4361ec88993sm10369805e9.2.2024.12.11.09.00.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 09:00:36 -0800 (PST)
Message-ID: <81926468-ffde-4424-8461-1d9be15fdf21@smile.fr>
Date: Wed, 11 Dec 2024 18:00:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20241105202039.2556992-1-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20241105202039.2556992-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1733936438; x=1734541238; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FuvMmx15igLUPZD207YxiJur09cr8ZIsrwr7g2CoByU=;
 b=YGyM2/sgNcD0A99puDxw1i5DVLQx8PFRclQMsoUluUsQwEVOUNqpuwTFNai9u0YRtb
 uw3XWzFzQc5Lsc35hBq9KB+L7qA74BtiCdo5dGkSMvrsq2kFzkELClfca1sNgZw/iANx
 WY2sVr1H0lSqJY1QmJC4cSe9Ck8k997oz2GX8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=YGyM2/sg
Subject: Re: [Buildroot] [PATCH 1/1] support/testing/infra/emulator.py: add
 qemu version in run log
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

SGVsbG8gSnVsaWVuLCBBbGwsCgpMZSAwNS8xMS8yMDI0IMOgIDIxOjIwLCBKdWxpZW4gT2xpdmFp
biBhIMOpY3JpdMKgOgo+IEluIHNvbWUgc3BlY2lmaWMgc2l0dWF0aW9ucywgdGhlcmUgaXMgc3Vi
dGxlIGJ1Z3Mgd2hpY2ggZGVwZW5kcyBvbiBhCj4gc3BlY2lmaWMgUWVtdSBlbXVsYXRvciB2ZXJz
aW9uIGFuZCB0aGUgY29kZSBpdCBydW5zLgo+IAo+IEZvciBleGFtcGxlLCBFREsyIG9uIEFhcmNo
NjQgY291bGQgd29yayB3aXRoIHNwZWNpZmljIHZlcnNpb25zIG9mIFFlbXUsCj4gRURLMiBhbmQg
QVRGLiBTZWUgY29tbWl0IGNjMDgyM2MyZCAiYm9vdC9lZGsyOiBidW1wIHRvIHZlcnNpb24KPiBl
ZGsyLXN0YWJsZTIwMjQwNSIgWzFdLgo+IAo+IEFsc28sIHNvbWUgUWVtdSBidWdzIG1hZGUgdGhl
IGd1ZXN0IE9TIGNyYXNoLiBTZWUgZm9yIGV4YW1wbGUgY29tbWl0Cj4gOTUzNGI5YzAwICJwYWNr
YWdlL3FlbXU6IGZpeCBxZW11IDkueCBpc3N1ZSBmb3IgQUFyY2gzMiBTZWN1cmUKPiBQTDEmMCIg
WzJdLgo+IAo+IENvbW1pdCAwZDQxNzc1OTggInN1cHBvcnQvdGVzdGluZy9pbmZyYS9lbXVsYXRv
ci5weTogYWRkIGJ1aWxkIGhvc3QKPiBkaXIgdG8gcWVtdSBzZWFyY2ggcGF0aCIgYWRkZWQgdGhl
IGFiaWxpdHkgZm9yIGEgcnVudGltZSB0ZXN0IHRvCj4gc2VsZWN0IGhvc3QtcWVtdSBpbiBvcmRl
ciB0byB1c2UgaXQuIEl0IGlzIGFsc28gcG9zc2libGUgZm9yIGEgdXNlcgo+IHRvIHVzZSB0aGUg
InV0aWxzL3J1bi10ZXN0cyIgc2NyaXB0IG9uIGl0cyBob3N0IHN5c3RlbSBwcm92aWRpbmcgaXRz
Cj4gb3duIHZlcnNpb24gb2YgUWVtdS4gVGhlIEJ1aWxkcm9vdCBDSSBjYW4gYWxzbyB1c2UgaXRz
IFFlbXUgdmVyc2lvbgo+IGluY2x1ZGVkIGluIHRoZSByZWZlcmVuY2UgRG9ja2VyIGltYWdlLgo+
IAo+IFRoaXMgbWVhbnMgdGhlIFFlbXUgZW11bGF0b3IgZm9yIHJ1bm5pbmcgYSBydW50aW1lIHRl
c3QgY2FuIGJlIGZyb20KPiBzZXZlcmFsIHNvdXJjZXM6Cj4gLSBCdWlsZHJvb3QgRG9ja2VyIHJl
ZmVyZW5jZSBpbWFnZSwKPiAtIEJ1aWxkcm9vdCBob3N0LXFlbXUgcGFja2FnZSB2ZXJzaW9uLAo+
IC0gRGV2ZWxvcGVyIGhvc3QgT1MgcWVtdSB2ZXJzaW9uLgo+IAo+IFRob3NlIHZlcnNpb25zIGNh
biBhbHNvIGNoYW5nZSBpbiB0aW1lLgo+IAo+IEluIG9yZGVyIHRvIGhlbHAgZGVidWdnaW5nIG9m
IHRob3NlIHN1YnRsZSBlbXVsYXRvciBidWdzLCB0aGlzIGNvbW1pdAo+IGFkZHMgYSByZWNvcmRp
bmcgb2YgdGhlIGFjdHVhbCBRZW11IHZlcnNpb24gdXNlZCB0byBydW4gYSB0ZXN0Lgo+IAo+IFsx
XSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvY2Mw
ODIzYzJkMTQzMjFiOTFiOTQ4MDE4MzQwNTAzMzFmNWVhMjhlMQo+IFsyXSBodHRwczovL2dpdGxh
Yi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvOTUzNGI5YzAwYzIzY2ZkNjlh
NGUxMjJjMjZmY2E5ZDNkYTkzZDMyOQo+IFszXSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290
Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvMGQ0MTc3NTk4Y2U3ZTczZjJiOTdhYzU4YzIxZmIxNzcz
NDM2NDNlMwo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+
CgpOaWNlIGNvbW1pdCBsb2chCgpUZXN0ZWQgbG9jYWxseSB1c2luZyB0aGUgQnVpbGRyb290IERv
Y2tlciByZWZlcmVuY2UgaW1hZ2U6Cgo+IGVtdWxhdG9yIHVzaW5nIHFlbXUtc3lzdGVtLWFybSB2
ZXJzaW9uOgpRRU1VIGVtdWxhdG9yIHZlcnNpb24gNS4yLjAgKERlYmlhbiAxOjUuMitkZnNnLTEx
K2RlYjExdTIpCkNvcHlyaWdodCAoYykgMjAwMy0yMDIwIEZhYnJpY2UgQmVsbGFyZCBhbmQgdGhl
IFFFTVUgUHJvamVjdCBkZXZlbG9wZXJzCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQmVz
dCByZWdhcmRzLApSb21haW4KCgo+IC0tLQo+ICBzdXBwb3J0L3Rlc3RpbmcvaW5mcmEvZW11bGF0
b3IucHkgfCAxMiArKysrKysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL2luZnJh
L2VtdWxhdG9yLnB5IGIvc3VwcG9ydC90ZXN0aW5nL2luZnJhL2VtdWxhdG9yLnB5Cj4gaW5kZXgg
MjM4ZTEyMzMwMi4uZWY1YmUyYTE5ZSAxMDA2NDQKPiAtLS0gYS9zdXBwb3J0L3Rlc3RpbmcvaW5m
cmEvZW11bGF0b3IucHkKPiArKysgYi9zdXBwb3J0L3Rlc3RpbmcvaW5mcmEvZW11bGF0b3IucHkK
PiBAQCAtMTE2LDE1ICsxMTYsMjEgQEAgY2xhc3MgRW11bGF0b3Iob2JqZWN0KToKPiAgICAgICAg
ICBsZGF2Z19zdHIgPSBmIntsZGF2Z1swXTouMmZ9LCB7bGRhdmdbMV06LjJmfSwge2xkYXZnWzJd
Oi4yZn0iCj4gICAgICAgICAgc2VsZi5sb2dmaWxlLndyaXRlKGYiPiBob3N0IGxvYWRhdmc6IHts
ZGF2Z19zdHJ9XG4iKQo+ICAgICAgICAgIHNlbGYubG9nZmlsZS53cml0ZShmIj4gdGltZW91dCBt
dWx0aXBsaWVyOiB7c2VsZi50aW1lb3V0X211bHRpcGxpZXJ9XG4iKQo+IC0gICAgICAgIHNlbGYu
bG9nZmlsZS53cml0ZSgiPiBzdGFydGluZyBxZW11IHdpdGggJyVzJ1xuIiAlICIgIi5qb2luKHFl
bXVfY21kKSkKPiArICAgICAgICBzZWxmLmxvZ2ZpbGUud3JpdGUoZiI+IGVtdWxhdG9yIHVzaW5n
IHtxZW11X2NtZFswXX0gdmVyc2lvbjpcbiIpCj4gICAgICAgICAgaG9zdF9iaW4gPSBvcy5wYXRo
LmpvaW4oc2VsZi5idWlsZGRpciwgImhvc3QiLCAiYmluIikKPiAgICAgICAgICBicl9wYXRoID0g
aG9zdF9iaW4gKyBvcy5wYXRoc2VwICsgb3MuZW52aXJvblsiUEFUSCJdCj4gKyAgICAgICAgcWVt
dV9lbnYgPSB7IlFFTVVfQVVESU9fRFJWIjogIm5vbmUiLAo+ICsgICAgICAgICAgICAgICAgICAg
ICJQQVRIIjogYnJfcGF0aH0KPiArICAgICAgICBwZXhwZWN0LnJ1bihmIntxZW11X2NtZFswXX0g
LS12ZXJzaW9uIiwKPiArICAgICAgICAgICAgICAgICAgICBlbmNvZGluZz0ndXRmLTgnLAo+ICsg
ICAgICAgICAgICAgICAgICAgIGxvZ2ZpbGU9c2VsZi5sb2dmaWxlLAo+ICsgICAgICAgICAgICAg
ICAgICAgIGVudj1xZW11X2VudikKPiArICAgICAgICBzZWxmLmxvZ2ZpbGUud3JpdGUoIj4gc3Rh
cnRpbmcgcWVtdSB3aXRoICclcydcbiIgJSAiICIuam9pbihxZW11X2NtZCkpCj4gICAgICAgICAg
c2VsZi5xZW11ID0gcGV4cGVjdC5zcGF3bihxZW11X2NtZFswXSwgcWVtdV9jbWRbMTpdLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGltZW91dD01ICogc2VsZi50aW1lb3V0
X211bHRpcGxpZXIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbmNvZGlu
Zz0ndXRmLTgnLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29kZWNfZXJy
b3JzPSdyZXBsYWNlJywKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudj17
IlFFTVVfQVVESU9fRFJWIjogIm5vbmUiLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAiUEFUSCI6IGJyX3BhdGh9KQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZW52PXFlbXVfZW52KQo+ICAgICAgICAgICMgV2Ugd2FudCBvbmx5IHN0ZG91dCBp
bnRvIHRoZSBsb2cgdG8gYXZvaWQgZG91YmxlIGVjaG8KPiAgICAgICAgICBzZWxmLnFlbXUubG9n
ZmlsZV9yZWFkID0gc2VsZi5sb2dmaWxlCj4gIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
