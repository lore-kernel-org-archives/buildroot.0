Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5361E83EF4
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 08:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D57B60A89;
	Wed,  4 Feb 2026 08:54:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c2AbwjLOWLhZ; Wed,  4 Feb 2026 08:54:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ECDC60A96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770195286;
	bh=KRu6sioVCQ7KDhNWSiHRPR7vLgqzr7xWqyGcNoYNH5A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IfHLHG9MN7hYe0hVJHtFMS5bb5DMdBSyC4K2eH08HzwexDT2DaDv0IlUBTa55aJ01
	 mUmT3gIN5mm+R6bfHQNBPXgNabHXZLBvCYWv+adcdEKNpnonajG7/m2d3NK1kf6Qaz
	 6NyotH+ftVk5ZwwpB2I+kcpYYHW0hSfX5YS4lKx2Anacu1SpnpZXkDGz8umJqIkdxW
	 rJk26dGAN0gNAAA3nKfKaH2raykI7K9VSfvKPv1V4b0tOkD7Rgsy+INURZsV9NeBk/
	 exA9UXYEeik0cO4UzCCoS4lAUOVjUHvs5d8ik7OnXhxVkfBCX2jcuXkcluJi3Z08ku
	 pA85jGlJ2wEuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ECDC60A96;
	Wed,  4 Feb 2026 08:54:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E12BF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 08:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B2FF60A96
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 08:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uSYXFIioaHwE for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 08:54:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6DCF60A89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6DCF60A89
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6DCF60A89
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 08:54:43 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-432d28870ddso281301f8f.3
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 00:54:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770195282; x=1770800082;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=omPBEEMdc6RUi27fOFay6MvllmkBQAXEdZJ5UNtIHvo=;
 b=qRYikOMvCdYpOyKxBG9Rj8ayrvsxk+AVWb/mxnUJoGF2ZPuzh/rSA+Y1HWSmLoRP+G
 t9ce8EKznJF3he51v7FVcdg1NSFkBRH3C3FTmRlEgFHvLtryRelH92Vd8hbNquBD/kLl
 kguH9KQ7sJptciVs0DpY1OlP3g61OXsFk6kU6iiaQLhBTxuboniA0Ri+UXBBoql3ojdp
 KN9fPOvntu6PPlbXR6MdwgSkC+fFEiun7KJdH0lxGG+h/glaXMZK4zhVEIoMhOi9cIxb
 GcO/DZM8WoCOLFnbGwQVFBNQ4qULySPtehT0BZfzv+4frpLyzKI2f87B7GWVfleULixb
 D1Jg==
X-Gm-Message-State: AOJu0YxOhg73ihSt2oxFBHTrHRk9M9riNz0+D9MNzpVGXMk9gWEtAbgh
 aqmfGHP4ZXpVgqsbNwvzqNDjA89rdGb6blBZHAXNWpFbDhZSvhEBmVWDnCFAg3SggfNdnmaXmFA
 32XO2Lq8=
X-Gm-Gg: AZuq6aKXYUXO+Ee+ZfqErREl0FffGBCO/iaYrkHAvkr9PjyG6sJV+YszimI0PsFiWAx
 U+9zuWtrCDopT0NgC0qh6XUM2VmU0XBBmKZturb2HLtbnsN7OuWxv9yLagHV1Z7+GEsauiLVUL3
 /sEXh0JAQCpuoJTKFK+S/VEP1/q3O4IEKG2pMY06bJxbg47M8VFlUFy5q7OOe2M9p5Nxk6i7Bwn
 4tLB+8n2s8vbSyBBqw+l3dMJqxA+xAYnvuIeIhfW5Q5iPvmipZrfa18OEopJPPc2mJ86/z9OZmE
 R7C6/aC0jwVV6/VD8V/cT+Pg92ZIHkXQdWuFCN375s/3rvyCemdGNxPdBpD47XT1y1ftcziFeJa
 XXBbWuEZp0A9e9wQs/lGVaBupNx8LmpsnZSZz9zuwDAj4NwMu8SsbV6H4s3b9aDWba5Q/Mija7o
 lwGMLdo6gThzjm2diSD4GHB3i+pNaQjqnH5GqxcjSB55qt/oK1JJS4nzqgZoKDAek=
X-Received: by 2002:a05:6000:2388:b0:435:9aa7:46a3 with SMTP id
 ffacd0b85a97d-436180611b4mr3366224f8f.56.1770195281575; 
 Wed, 04 Feb 2026 00:54:41 -0800 (PST)
Received: from [172.16.2.208] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e25d02sm4592727f8f.3.2026.02.04.00.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 00:54:41 -0800 (PST)
Message-ID: <95ad9b01-8e54-4b5a-8b8a-bea23502b345@smile.fr>
Date: Wed, 4 Feb 2026 09:54:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, bernd@kuhls.net, romain.naour@gmail.com,
 thomas.devoogdt@barco.com, thomas.petazzoni@bootlin.com
References: <20251226101445.2b29f439@windsurf>
 <20260103084002.2045193-1-thomas@devoogdt.com>
 <20260103084002.2045193-2-thomas@devoogdt.com>
 <dc38e220-92ea-4cd7-a178-2792ebc289a6@smile.fr>
 <CACXRmJiaRH-8v_ngEN=c4Ld+cbeQr43Y22Tz2g9YJTY-uEDroQ@mail.gmail.com>
Content-Language: fr
In-Reply-To: <CACXRmJiaRH-8v_ngEN=c4Ld+cbeQr43Y22Tz2g9YJTY-uEDroQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770195282; x=1770800082; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=omPBEEMdc6RUi27fOFay6MvllmkBQAXEdZJ5UNtIHvo=;
 b=30LlrBW0tzb799O3GHUZunq8vJciu7Xji5U/uQZSmzeBiXSiWw2M/V/bcmqXaTzm4Y
 bKRkdShX/RCznjBK/lleADanawQqM8wNSsDPZS1zsXWzoXJ1qRK/zqNYW/UifLa9HWmT
 5x9rs3HuJlkc0F2e/Hlm4wLes7+dcx+eT9Vc8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=30LlrBW0
Subject: Re: [Buildroot] [PATCH v2 2/2] package/mesa3d: fix compilation with
 host-llvm enabled
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

SGkgVGhvbWFzLCBBbGwsCgpMZSAwNC8wMi8yMDI2IMOgIDA3OjExLCBUaG9tYXMgRGV2b29nZHQg
YSDDqWNyaXTCoDoKPiBIaSBSb21haW4sCj4gCj4gUmVzZW5kaW5nIGl0LCBhcyBteSBvdGhlciBt
YWlsIGFkZHJlc3MgaXMgbm90IHRydXN0ZWQgYnkgdGhlIG1haWxpbmcgbGlzdC4KClBsZWFzZSwg
YXZvaWQgdG9wIHBvc3Rpbmcgd2hlbiB0aGUgbWFpbGluZyBsaXN0IGlzIGluIENjLj4KPiAKPiBJ
IG5vdGljZWQgdGhpcyBwcm9ibGVtIHdoZW4gY29tcGlsaW5nIHRoZSAyMDI1LjAyIGJyYW5jaCwg
d2hpY2ggaXMgc3RpbGwgb24gTExWTQo+IDE1LjAuNy4gTXkgUEMgc2hpcHMgd2l0aCBMTFZNIDE4
LjEuMy4gU28sIEJSIHdhcyB0cnlpbmcgdG8gdXNlIGEgbmV3ZXIgY29uZmlnCj4gdmVyc2lvbiAo
MTguMS4zKSBhcyBpdCB3YXMgc2hpcHBpbmcuIFNlZSBlcnJvciBsb2cuIEluIHRoZSBtZWFudGlt
ZSwgbWFzdGVyIGhhcwo+IGV2b2x2ZWQsIGFuZCBzaGlwcyB3aXRoIExMVk0gMjEuMS44LCB3aXRo
IHRoYXQgY29tYmluYXRpb24sIG5vIHByb2JsZW0gcGVyc2lzdHMKPiBhcyB0aGUgYXZhaWxhYmxl
IHZlcnNpb25zIGFyZSBhbHdheXMgbmV3ZXIgdGhhbiBteSBvd24gUEMuCj4gCj4gU28gaW4gc2hv
cnQsIHlvdSB3b24ndCBzZWUgYW55IHByb2JsZW0gaWYgeW91ciBob3N0IExMVk0gaXMgb2xkZXIg
dGhhbiB0aGUKPiB2ZXJzaW9uIHdoaWNoIGlzIHRyeWluZyB0byBiZSBidWlsdC7CoAo+IAo+IEJ1
dCB3aGF0IEkgZG9uJ3QgdW5kZXJzdGFuZCBpcyB3aHkgdGhlIHJpZ2h0IExMVk0gaXMgZm91bmQg
b24geW91ciBob3N0IFBDLiBBCj4gcXVpY2sgbG9vayBhdMKgaHR0cHM6Ly9naXRsYWIuZnJlZWRl
c2t0b3Aub3JnL21lc2EvbWVzYS8tL2Jsb2IvbWFpbi9tZXNvbi5idWlsZD8KPiByZWZfdHlwZT1o
ZWFkcyA8aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL2Jsb2IvbWFp
bi8KPiBtZXNvbi5idWlsZD9yZWZfdHlwZT1oZWFkcz7CoGRvZXNuJ3QgdGVhY2ggbWUgYW55dGhp
bmcuIEFuZCBmb3IgbWVzb24sIEkgZG9uJ3QKPiBzZWUgcmVjZW50IGNvbW1pdHMgdGhhdCBtaWdo
dCBoYXZlIGNoYW5nZWQgc29tZXRoaW5nwqBodHRwczovL2dpdGh1Yi5jb20vCj4gbWVzb25idWls
ZC9tZXNvbi9jb21taXRzL21hc3Rlci9tZXNvbmJ1aWxkL2RlcGVuZGVuY2llcy9kYXRhL0NNYWtl
TGlzdHNMTFZNLnR4dAo+IDxodHRwczovL2dpdGh1Yi5jb20vbWVzb25idWlsZC9tZXNvbi9jb21t
aXRzL21hc3Rlci9tZXNvbmJ1aWxkL2RlcGVuZGVuY2llcy8KPiBkYXRhL0NNYWtlTGlzdHNMTFZN
LnR4dD4uwqAKClRoZSAyMDI1LjAyLnggTFRTIGJyYW5jaCBzdGlsbCB1c2UgbWVzYTNkIDI0LjAu
OSBhbmQgdGhlIGhvc3QgdmFyaWFudAooaG9zdC1tZXNhM2QpIGlzIG5vdCBhdmFpbGFibGUgeWV0
LiBTbywgSXQgc2VlbXMgeW91ciBwcm9qZWN0IGJhY2twb3J0ZWQgbWVzYTNkCjI1LjAuNiAobWVy
Z2VkIGluIDIwMjUuMDUpIHRvIEJ1aWxkcm9vdCAyMDI1LjAyLnguCgpDYW4geW91IHByb3ZpZGUg
YSB3YXkgdG8gcmVwcm9kdWNlIHRoZSBpc3N1ZSB3aXRoIGEgZGVmY29uZmlnPyBvbiAyMDI1LjA1
IG1heWJlID8KCkkgYmVsaWV2ZSB0aGF0IHRoaXMgY2hhbmdlIGlzIGNvcnJlY3QgYnV0IGNhbiB5
b3UgaW1wcm92ZSB0aGUgY29tbWl0IGxvZyB0bwpleHBsYWluIGhvdyB0byByZXByb2R1Y2UgdGhl
IGlzc3VlLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IAo+IEtyLAo+IAo+IFRob21hcyBE
ZXZvb2dkdAo+IAo+IE9wIGRpIDMgZmViIDIwMjYgb20gMTg6NTAgc2NocmVlZiBSb21haW4gTmFv
dXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcgo+IDxtYWlsdG86cm9tYWluLm5hb3VyQHNtaWxlLmZy
Pj46Cj4gCj4gICAgIEhlbGxvIFRob21hcywgQWxsLAo+IAo+ICAgICBMZSAwMy8wMS8yMDI2IMOg
IDA5OjQwLCBUaG9tYXMgRGV2b29nZHQgYSDDqWNyaXTCoDoKPiAgICAgPiBGcm9tOiBUaG9tYXMg
RGV2b29nZHQgPHRob21hcy5kZXZvb2dkdEBiYXJjby5jb20KPiAgICAgPG1haWx0bzp0aG9tYXMu
ZGV2b29nZHRAYmFyY28uY29tPj4KPiAgICAgPgo+ICAgICA+IE1lc29uJ3MgY3VzdG9tIExMVk0g
cGFyc2VyIHVzZXMgbGx2bS1jb25maWcgd2l0aCBhIGRlZmF1bHQgc2VhcmNoIHBhdGggb2YKPiAg
ICAgPiAvdXNyL2JpbiwgY2F1c2luZyBpdCB0byBkZXRlY3QgdGhlIGhvc3Qgc3lzdGVtJ3MgbGx2
bS1jb25maWcgKHZlcnNpb24gMTguMS4zKQo+ICAgICA+IGluc3RlYWQgb2YgdGhlIGJ1aWxkcm9v
dC1jb21waWxlZCBvbmUuIFRoaXMgZm9yY2VzIGFsbCBMTFZNLXJlbGF0ZWQKPiAgICAgcGFja2Fn
ZXMgdG8KPiAgICAgPiBtYXRjaCB2ZXJzaW9uIDE4LjEuMywgYnV0IHNpbmNlIHRoZSBob3N0IHN5
c3RlbSBsYWNrcyBsbHZtc3BpcnZsaWIsIHRoZSBidWlsZAo+ICAgICA+IGZhaWxzLiBUaGlzIHBh
dGNoIGZvcmNlcyBNZXNvbiB0byB1c2UgdGhlIGJ1aWxkcm9vdC1jb21waWxlZCBsbHZtLWNvbmZp
Zy4KPiAgICAgPgo+ICAgICA+IE5vdGUgdGhhdCBMTFZNX0NPTkZJRyBpcyBhIENNYWtlIG9wdGlv
biwgbm90IGEgTWVzb24gb25lLiBUaGlzIGlzIGJlY2F1c2UKPiAgICAgPiBNZXNvbiBoYXMgY3Vz
dG9tIGRlcGVuZGVuY3kgcmVzb2x1dGlvbiBsb2dpYyBmb3IgTExWTSAoc2VlCj4gICAgID4gaHR0
cHM6Ly9tZXNvbmJ1aWxkLmNvbS9EZXBlbmRlbmNpZXMuaHRtbCNsbHZtIDxodHRwczovL21lc29u
YnVpbGQuY29tLwo+ICAgICBEZXBlbmRlbmNpZXMuaHRtbCNsbHZtPikuIFRoZSBFWFRSQV9CSU5B
UklFUyBtZWNoYW5pc20KPiAgICAgPiBjYW5ub3QgYmUgdXNlZCBoZXJlLCBhcyBpdCBvbmx5IGFw
cGxpZXMgdG8gY3Jvc3MtY29tcGlsYXRpb24gc2NlbmFyaW9zLCB3aGljaAo+ICAgICA+IGRvZXMg
bm90IGFwcGx5IHRvIGhvc3QtbWVzYTNkIGJ1aWxkcy4KPiAgICAgPgo+ICAgICA+IEZpeGVzOgo+
ICAgICA+Cj4gICAgID7CoCDCoGxsdm0tY29uZmlnIGZvdW5kOiBZRVMgKC91c3IvYmluL2xsdm0t
Y29uZmlnLTE4KSAxOC4xLjMKPiAKPiAgICAgbGx2bS1jb25maWcgaXMgaW5zdGFsbGVkIG9uIG15
IGhvc3QKPiAKPiAgICAgJCB3aGljaCBsbHZtLWNvbmZpZwo+ICAgICAvdXNyL2Jpbi9sbHZtLWNv
bmZpZwo+IAo+ICAgICAkIGxsdm0tY29uZmlnIC0tdmVyc2lvbgo+ICAgICAxOS4xLjcKPiAKPiAg
ICAgQnV0IGJ1aWxkaW5nIGhvc3QtbWVzYTNkIGlzIGFibGUgdG8gZmluZCB0aGUgb25lIGJ1aWx0
IGJ5IEJ1aWxkcm9vdCBhbmQKPiAgICAgaW5zdGFsbGVkIGluIEhPU1RfRElSOgo+IAo+ICAgICBs
bHZtLWNvbmZpZyBmb3VuZDogWUVTIChbLi4uXS9ob3N0L2Jpbi9sbHZtLWNvbmZpZykgMjEuMS44
Cj4gCj4gICAgID7CoCDCoFJ1bi10aW1lIGRlcGVuZGVuY3kgTExWTSAobW9kdWxlczogYml0d3Jp
dGVyLCBjb3JlLCBjb3ZlcmFnZSwgZW5naW5lLAo+ICAgICBleGVjdXRpb25lbmdpbmUsIGluc3Rj
b21iaW5lLCBpcnJlYWRlciwgbGliZHJpdmVyLCBsaW5rZXIsIGx0bywKPiAgICAgbWNkaXNhc3Nl
bWJsZXIsIG1jaml0LCBuYXRpdmUsIG9wdGlvbiwgc2NhbGFyb3B0cywgdGFyZ2V0LCB0cmFuc2Zv
cm11dGlscywKPiAgICAgYWxsLXRhcmdldHMsIGNvcm91dGluZXMsIGZyb250ZW5kZHJpdmVyLCBm
cm9udGVuZGhsc2wsIGx0bywgd2luZG93c2RyaXZlcikKPiAgICAgZm91bmQ6IFlFUyAxOC4xLjMK
PiAgICAgPsKgIMKgRGVwZW5kZW5jeSBMTFZNU1BJUlZMaWIgZm91bmQ6IE5PLiBGb3VuZCAxNS4w
LjAuMCBidXQgbmVlZDogJz49IDE4LjEnIDsKPiAgICAgbWF0Y2hlZDogJz49IDE1LjAuMC4wJywg
JzwgMTguMicKPiAgICAgPsKgIMKgUnVuLXRpbWUgZGVwZW5kZW5jeSBsbHZtc3BpcnZsaWIgZm91
bmQ6IE5PICh0cmllZCBjbWFrZSkKPiAgICAgPgo+ICAgICA+wqAgwqBvdXRwdXQvYnVpbGQvaG9z
dC1tZXNhM2QtMjUuMC42L21lc29uLmJ1aWxkOjE4ODI6MjE6IEVSUk9SOiBEZXBlbmRlbmN5Cj4g
ICAgIGxvb2t1cCBmb3IgTExWTVNQSVJWTGliIHdpdGggbWV0aG9kICdwa2djb25maWcnIGZhaWxl
ZDogSW52YWxpZCB2ZXJzaW9uLAo+ICAgICBuZWVkICdMTFZNU1BJUlZMaWInIFsnPj0gMTguMSdd
IGZvdW5kICcxNS4wLjAuMCcuCj4gCj4gICAgIGlzIHRoaXMgaXNzdWUgc3BlY2lmaWMgdG8gdGhp
cyBtZXNhM2QgdmVyc2lvbiAoMjUuMC42KSA/Cj4gCj4gICAgIFdlIGFyZSB1c2luZyBtZXNhM2Qg
MjUuMy40IGFscmVhZHkuCj4gCj4gICAgID4KPiAgICAgPsKgIMKgQSBmdWxsIGxvZyBjYW4gYmUg
Zm91bmQgYXQgL2hvbWUvdGhvbWFzL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvaG9zdC0KPiAgICAg
bWVzYTNkLTI1LjAuNi9idWlsZHJvb3QtYnVpbGQvbWVzb24tbG9ncy9tZXNvbi1sb2cudHh0Cj4g
ICAgID7CoCDCoG1ha2VbMV06ICoqKiBbcGFja2FnZS9wa2ctZ2VuZXJpYy5tazoyNjMgPGh0dHA6
Ly9wa2ctZ2VuZXJpYy5tazoyNjM+OiAvCj4gICAgIGhvbWUvdGhvbWFzL2J1aWxkcm9vdC9vdXRw
dXQvYnVpbGQvaG9zdC1tZXNhM2QtMjUuMC42Ly5zdGFtcF9jb25maWd1cmVkXSBFcnJvciAxCj4g
ICAgID7CoCDCoG1ha2U6ICoqKiBbTWFrZWZpbGU6ODM6IF9hbGxdIEVycm9yIDIKPiAgICAgPgo+
ICAgICA+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBEZXZvb2dkdCA8dGhvbWFzLmRldm9vZ2R0QGJh
cmNvLmNvbQo+ICAgICA8bWFpbHRvOnRob21hcy5kZXZvb2dkdEBiYXJjby5jb20+Pgo+ICAgICA+
IC0tLQo+ICAgICA+IHYyOiBNb3ZlZCBwYXRjaCB0byB0aGUgZ2VuZXJpYyBob3N0LW1lc2EzZCBz
ZWN0aW9uLgo+ICAgICA+wqAgwqAgwqBBbHNvIHVwZGF0ZWQgdGhlIGdpdCBtZXNzYWdlIHdydCBM
TFZNX0NPTkZJRyBvcHRpb24uCj4gICAgID4gLS0tCj4gICAgID7CoCBwYWNrYWdlL21lc2EzZC9t
ZXNhM2QubWsgPGh0dHA6Ly9tZXNhM2QubWs+IHwgMyArKysKPiAgICAgPsKgIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykKPiAgICAgPgo+ICAgICA+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L21lc2EzZC9tZXNhM2QubWsgPGh0dHA6Ly9tZXNhM2QubWs+IGIvcGFja2FnZS9tZXNhM2QvCj4g
ICAgIG1lc2EzZC5tayA8aHR0cDovL21lc2EzZC5taz4KPiAgICAgPiBpbmRleCAwOWIwOTg2Mjhh
Yi4uZGEzODBiM2IzODkgMTAwNjQ0Cj4gICAgID4gLS0tIGEvcGFja2FnZS9tZXNhM2QvbWVzYTNk
Lm1rIDxodHRwOi8vbWVzYTNkLm1rPgo+ICAgICA+ICsrKyBiL3BhY2thZ2UvbWVzYTNkL21lc2Ez
ZC5tayA8aHR0cDovL21lc2EzZC5taz4KPiAgICAgPiBAQCAtMjkyLDYgKzI5Miw5IEBAIGlmZXEg
KCQoQlIyX1BBQ0tBR0VfTUVTQTNEX1ZVTEtBTl9EUklWRVJfSU1BR0lOQVRJT04pLHkpCj4gICAg
ID7CoCBIT1NUX01FU0EzRF9UT09MUyArPSBpbWFnaW5hdGlvbgo+ICAgICA+wqAgZW5kaWYKPiAg
ICAgPsKgCj4gICAgID4gK0hPU1RfTUVTQTNEX0NPTkZfRU5WID0gXAo+ICAgICA+ICvCoCDCoCDC
oExMVk1fQ09ORklHPSIkKEhPU1RfRElSKS9iaW4vbGx2bS1jb25maWciCj4gCj4gICAgIE90aGVy
d2lzZSBsb29rcyBvayBmb3IgbWUuCj4gCj4gICAgIEJlc3QgcmVnYXJkcywKPiAgICAgUm9tYWlu
Cj4gCj4gCj4gICAgID4gKwo+ICAgICA+wqAgSE9TVF9NRVNBM0RfQ09ORl9PUFRTID0gXAo+ICAg
ICA+wqAgwqAgwqAgwqAtRGdsdm5kPWRpc2FibGVkIFwKPiAgICAgPsKgIMKgIMKgIMKgLURnYWxs
aXVtLWRyaXZlcnM9JChzdWJzdCAkKHNwYWNlKSwkKGNvbW1hKSwKPiAgICAgJChIT1NUX01FU0Ez
RF9HQUxMSVVNX0RSSVZFUlMteSkpIFwKPiAKPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
