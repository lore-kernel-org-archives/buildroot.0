Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846CEC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 18:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25F6C81D19;
	Mon,  1 Aug 2022 18:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25F6C81D19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ndkf9EjecYY; Mon,  1 Aug 2022 18:15:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32AA481846;
	Mon,  1 Aug 2022 18:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32AA481846
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E024A1BF337
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 18:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7CC681846
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 18:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7CC681846
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1fyQsGCL-wuW for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 18:15:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA8C18148E
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA8C18148E
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 18:15:17 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id a7so8872980ejp.2
 for <buildroot@buildroot.org>; Mon, 01 Aug 2022 11:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1MdR5I+xprAB/QnLu41M1Y7MC1jnckatNjKS04Arla8=;
 b=RS+8KxrG5idScehCr9anaapwnzOOem8Aget9lwd1xycoHOKKKnw4HE2V2wsOqhMuMd
 1/6ErilDBBt1RPqyV+Hd7g362fxbTsNdejOk7jGBmIhm7qCMcEDg/Bs+OlFd9Us8uYCn
 KJuQOJaufDxt5rT3QpykQIX7UE0qQ8Xgq2nt48BQnb0u0+4C2vATdxVcqXcaGqhiVZd+
 d7TbLngwXzlP4VPx1RWbIAZ74zZbBVEY1/q8I9/ULegxUBIFoMLjDN2ZYU3sytlROTMM
 Z6+3rmrmd/S9KR3XNjZnAcaD39O+SFJAqyk2gR2FL2gLClnZwtc5pieoRez4c0udkCFh
 bF+g==
X-Gm-Message-State: ACgBeo0tx0O/lAT5PWWKbzAZOIrEP7hev3fiutlFHiUGkJW79u9pEfkq
 3r8+/OZcNhmrZP/OBGRoi2/LRA==
X-Google-Smtp-Source: AA6agR6CAzS1nRwpGBJ41DAmit9R7PE61fE7ekhPOkQz4beK2LV11oDvjDebQ2FhSHVhjg7N0Z0PnA==
X-Received: by 2002:a17:906:cc16:b0:730:8523:f54 with SMTP id
 ml22-20020a170906cc1600b0073085230f54mr4472891ejb.497.1659377715947; 
 Mon, 01 Aug 2022 11:15:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 t23-20020aa7d4d7000000b0043bbc9503ddsm7232972edr.76.2022.08.01.11.15.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 11:15:15 -0700 (PDT)
Message-ID: <d351c158-0419-462b-29cf-39b1903de8f5@mind.be>
Date: Mon, 1 Aug 2022 20:15:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Guillaume Bres <guillaume.bressaix@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220727192948.18653-1-guillaume.bressaix@gmail.com>
 <20220727192948.18653-4-guillaume.bressaix@gmail.com>
 <20220801194254.118219ec@windsurf>
 <CAJe0E3e4wE+v16v9JQE-NDaXH+_9icVtHfPbTBW=ng5rr2EEYg@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAJe0E3e4wE+v16v9JQE-NDaXH+_9icVtHfPbTBW=ng5rr2EEYg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1MdR5I+xprAB/QnLu41M1Y7MC1jnckatNjKS04Arla8=;
 b=ZiJPzL6L9YmrtMshtWWebw0ASz7pjH0733xi//AueLKpkrXN15uJvp851X/ivACiEx
 GduAlCH2oWFz1pFEyPfGWmoJymuTSqrij8Ea+E+8pI+EJtjX2x7TxrXEvlnumDbklw5Q
 ydAmYoIfm4WDll807DGIQ0/jHSJGAd3Gpk2CSqvIAaN73SYhaamJOh/mZA9FF9Aw3CXb
 AQEA12DlzuNn9C421SSaE+UGCmkIg3k7+AO7GHQuasNLb86qT9usT88tM3gzsDmMyAuT
 8YWAWODLGluCI6XRpqb3hdWkbR49gKfD5vQaM7XbXQs8eTJfsIPAycYoCxQ6EoT4y+Ad
 Dn8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZiJPzL6L
Subject: Re: [Buildroot] [PATCH v5 4/4] package/python-scipy: new package
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
Cc: jmfriedt <jmfriedt@femto-st.fr>, buildroot@buildroot.org,
 "gwenhael.goavec" <gwen@trabucayre.com>, Asaf Kahlon <asafka7@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMS8wOC8yMDIyIDE5OjU4LCBHdWlsbGF1bWUgQnJlcyB3cm90ZToKPiBIZWxsbywKPiB0
aGFuayB5b3UgVGhvbWFzIGZvciBtZXJnaW5nIHRoaXMgc2VyaWUgYW5kIGFsc28gZm9yIGFkZGlu
ZyB0aGUgcnVudGltZSB0ZXN0LCBJIAo+IGRpZCB0cnkgdG8gcHJvdmlkZSBpdCBidXQgY291bGQg
bm90IGdldCBpdCB0byB3b3JrLgo+IEkgd2lsbCBnaXZlIGl0IGEgdHJ5IGluIHRoZSBuZXh0IGZl
dyBkYXlzCgogIERvbid0IGhlc2l0YXRlIHRvIHBvc3QgZXZlbiBhIG5vbi13b3JraW5nIHZlcnNp
b24gdGhhdCBwZW9wbGUgY2FuIGNvbW1lbnQgb24uIApQbGVhc2UgZG8gcG9zdCBpdCBhcyBhbiBS
RkMgdGhvdWdoICgtLXN1YmplY3QtcHJlZml4PVJGQykuIEFuZCBvZiBjb3Vyc2UgdGhlcmUncyAK
bm8gcHJvbWlzZSB0aGF0IHBlb3BsZSB3aWxsICphY3R1YWxseSogY29tbWVudCBvbiBpdCA6LSku
CgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+IEd1aWxsYXVtZSBXLiBCcmVzCj4gU29mdHdhcmUg
ZW5naW5lZXIKPiA8Z3VpbGxhdW1lLmJyZXNzYWl4QGdtYWlsLmNvbSA8bWFpbHRvOmd1aWxsYXVt
ZS5icmVzc2FpeEBnbWFpbC5jb20+Pgo+IAo+IAo+IExlwqBsdW4uIDEgYW/Du3QgMjAyMiDDoMKg
MTk6NDIsIFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20gCj4g
PG1haWx0bzp0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPj4gYSDDqWNyaXTCoDoKPiAKPiAg
ICAgSGVsbG8sCj4gCj4gICAgIE9uIFdlZCwgMjcgSnVsIDIwMjIgMjE6Mjk6NDggKzAyMDAKPiAg
ICAgIkd1aWxsYXVtZSBXLiBCcmVzIiA8Z3VpbGxhdW1lLmJyZXNzYWl4QGdtYWlsLmNvbQo+ICAg
ICA8bWFpbHRvOmd1aWxsYXVtZS5icmVzc2FpeEBnbWFpbC5jb20+PiB3cm90ZToKPiAKPiAgICAg
ID4gRnJvbTogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20KPiAgICAgPG1h
aWx0bzpqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4+Cj4gICAgICA+Cj4gICAgICA+IFNpZ25l
ZC1vZmYtYnk6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tCj4gICAgIDxt
YWlsdG86amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Pgo+ICAgICAgPiBbQXJub3V0Ogo+ICAg
ICAgPsKgIC0gSW5kZW50IGhhc2ggZmlsZSB3aXRoIHR3byBzcGFjZXMuCj4gICAgICA+wqAgLSBC
dW1wIHRvIDEuNy4zIHRvIGZpeCBidWlsZCBmYWlsdXJlIHdpdGggcmVjZW50IEdDQy4KPiAgICAg
ID7CoCAtIEdldCBmcm9tIGdpdGh1YiBpbnN0ZWFkIG9mIFB5UEkuCj4gICAgICA+wqAgLSBBZGQg
aG9zdC1tZXNvbiBhbmQgaG9zdC1weXRob24tcHl0aHJhbiBkZXBlbmRlbmNpZXMuCj4gICAgICA+
wqAgLSBQcm9wZXJseSBwcm9wYWdhdGUgQ29uZmlnLmluIGRlcGVuZGVuY2llcy4KPiAgICAgID7C
oCAtIENvcnJlY3QgdXNhZ2Ugb2YgQlIyX0lOU1RBTExfTElCU1REQ1BQIHN5bWJvbC4KPiAgICAg
ID7CoCAtIFJlbW92ZSBGNzcsIG5vIGxvbmdlciB1c2VkLgo+ICAgICAgPiBdCj4gICAgICA+IFNp
Z25lZC1vZmYtYnk6IEFybm91dCBWYW5kZWNhcHBlbGxlIChFc3NlbnNpdW0vTWluZCkgPGFybm91
dEBtaW5kLmJlCj4gICAgIDxtYWlsdG86YXJub3V0QG1pbmQuYmU+Pgo+ICAgICAgPiBbR3VpbGxh
dW1lOgo+ICAgICAgPsKgIC0gLWxucHltYXRoOiBucHltYXRoLmluaSBsb2NhbGl6YXRpb24gcHJv
YmxlbQo+ICAgICAgPsKgIC0gLWxucHlyYW5kb20gcmVzb2x1dGlvbiBwcm9ibGVtCj4gICAgICA+
wqAgLSBmaXggbGVnYWwtaW5mbyBmb3IgbGF0ZXN0IHZlcnNpb24gTElDRU5TRS50eHQKPiAgICAg
ID7CoCAtIHpsaWIgaXMgYSBzY2lweTo6aW8gbW9kdWxlIHJ1bnRpbWUgcmVxdWlyZW1lbnQKPiAg
ICAgID7CoCAtIHVwZGF0ZSBzZXJpZSBmb3Igc2NpcHkgMS44LjEgKGxhdGVzdCkKPiAgICAgID4g
XQo+ICAgICAgPiBTaWduZWQtb2ZmLWJ5OiBHdWlsbGF1bWUgVy4gQnJlcyA8Z3VpbGxhdW1lLmJy
ZXNzYWl4QGdtYWlsLmNvbQo+ICAgICA8bWFpbHRvOmd1aWxsYXVtZS5icmVzc2FpeEBnbWFpbC5j
b20+Pgo+IAo+ICAgICBJIGhhdmUgYXBwbGllZCwgd2l0aCB0aGUgZm9sbG93aW5nIGNoYW5nZXM6
Cj4gCj4gICAgICDCoCDCoCBbVGhvbWFzOgo+ICAgICAgwqAgwqAgwqAtIGFkZCBydW50aW1lIHRl
c3QKPiAgICAgIMKgIMKgIMKgLSBkcm9wIGRlcGVuZGVuY3kgb24gT3BlbkJMQVMsIHdoaWNoIGlz
IG5vdCBuZWVkZWQgaW4gYSBtaW5pbWFsCj4gICAgICDCoCDCoCDCoCDCoGNvbmZpZ3VyYXRpb24K
PiAgICAgIMKgIMKgIMKgLSByZW1vdmUgUFlUSE9OX1NDSVBZX05QWV9QS0dfQ09ORklHX1BBVEgg
bG9naWMgYXMgaXQgaXMgbm8gbG9uZ2VyCj4gICAgICDCoCDCoCDCoCDCoG5lZWRlZAo+ICAgICAg
wqAgwqAgXQo+IAo+ICAgICBDb3VsZCB5b3UgcGxlYXNlOgo+IAo+ICAgICAgwqAoMSkgUmV2aWV3
IHRoZSBydW50aW1lIHRlc3QsIHRvIHNlZSBpZiBpdCBjYW4gYmUgaW1wcm92ZWQgd2l0aCBzb21l
Cj4gICAgICDCoCDCoCDCoGJldHRlciB0ZXN0aW5nLgo+IAo+ICAgICAgwqAoMikgUmV2aWV3IHRo
ZSBPcGVuQkxBUyBkZXBlbmRlbmN5LCB0byBzZWUgaWYgaXQgbmVlZHMgdG8gYmUgYWRkZWQgYXMK
PiAgICAgIMKgIMKgIMKgYW4gb3B0aW9uYWwgZGVwZW5kZW5jeSBpbiBzb21lIHdheS4KPiAKPiAg
ICAgID4gKyMgUHJvdmlkZSBzeXN0ZW0gY29uZmlndXJhdGlvbiBvcHRpb25zIHRvIG51bXB5IGRp
c3R1dGlscyBleHRlbmlvbnMsIHRlbGxpbmcKPiAgICAgID4gKyMgdG8gZmluZCBhbGwgaW5jbHVk
ZSBmaWxlcyBhbmQgbGlicmFyaWVzIGluIHN0YWdpbmcgZGlyZWN0b3J5Lgo+ICAgICAgPiArZGVm
aW5lIFBZVEhPTl9TQ0lQWV9DT05GSUdVUkVfQ01EUwo+ICAgICAgPiArwqAgwqAgwqAtcm0gLWYg
JChARCkvc2l0ZS5jZmcKPiAgICAgID4gK8KgIMKgIMKgZWNobyAiW0RFRkFVTFRdIiA+PiAkKEBE
KS9zaXRlLmNmZwo+ICAgICAgPiArwqAgwqAgwqBlY2hvICJsaWJyYXJ5X2RpcnMgPSAkKFNUQUdJ
TkdfRElSKS91c3IvbGliIiA+PiAkKEBEKS9zaXRlLmNmZwo+ICAgICAgPiArwqAgwqAgwqBlY2hv
ICJpbmNsdWRlX2RpcnMgPSAkKFNUQUdJTkdfRElSKS91c3IvaW5jbHVkZSIgPj4gJChARCkvc2l0
ZS5jZmcKPiAgICAgID4gK2VuZGVmCj4gCj4gICAgIFRoaXMgcGFydCBpcyBhIGJpdCBhbm5veWlu
ZywgYXMgaXQncyBkdXBsaWNhdGVkIGZyb20gcHl0aG9uLW51bXB5Lm1rCj4gICAgIDxodHRwOi8v
cHl0aG9uLW51bXB5Lm1rPi4gSQo+ICAgICBsb29rZWQgYSBiaXQsIGJ1dCBjb3VsZG4ndCByZWFs
bHkgZmluZCBhIGdvb2Qgd2F5IG9mIGF2b2lkaW5nIHRoaXMKPiAgICAgZHVwbGljYXRpb24uCj4g
Cj4gICAgIFRoYW5rcyEKPiAKPiAgICAgVGhvbWFzCj4gICAgIC0tIAo+ICAgICBUaG9tYXMgUGV0
YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gICAgIEVtYmVkZGVkIExpbnV4IGFu
ZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gICAgIGh0dHBzOi8vYm9vdGxpbi5j
b20gPGh0dHBzOi8vYm9vdGxpbi5jb20+Cj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
