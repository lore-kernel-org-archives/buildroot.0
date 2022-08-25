Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722E9C64990
	for <buildroot@archiver.kernel.org>; Thu, 25 Aug 2022 14:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D44BF418C0;
	Thu, 25 Aug 2022 14:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D44BF418C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ldojDuzC8JZx; Thu, 25 Aug 2022 14:17:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B264418B0;
	Thu, 25 Aug 2022 14:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B264418B0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E69E71C1189
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 14:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C039D834AE
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 14:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C039D834AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wAg7ARD8VAuI for <buildroot@lists.busybox.net>;
 Thu, 25 Aug 2022 14:17:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C3E783486
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C3E783486
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 14:17:36 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id h22so29584783ejk.4
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 07:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=YcCbzjNvilHDVWL2cgGfMdnEEFyOaDb52Qx7n2DrQTQ=;
 b=Vg47w5fkin7daGqA2IFzf7vvYclWiEYLE2qIBpHUgGNYhJTCV1PnHeiX86aqeT03W7
 v+rgbKPY7vLb2JYOJC6K5D8ZrDEqHSYbcRSL9Iu1+7MQ5wlbUFsbm8jAEqWDjVHzn/be
 +h9m5S9pc0OFmdhK0b32dIue+XvInPrjMvK5E5O7/PbwbnLTzRjYyBceEaMGt52MdC4p
 xzWnHeqgnxNaUPm0FP11Tt/Xohf6iw3a1J3L0F1V2LDtH9Y8RLC1B6+bk1p6tW9a6T0P
 +ak2vLuFN4Wi11OQpYJHyn2qmQa44GMQoEhiDQQnPA2CgJgAiFpdIm0OXTPtnhROHnrw
 NoQA==
X-Gm-Message-State: ACgBeo0HVpNYQyXFpmtP7mFtkUNzHKV2a/vgRm0p8pZaF+EpwKkJxrRq
 XFHCpSRz4vFdzX9RajcRJNHKqg==
X-Google-Smtp-Source: AA6agR6pfEO0mTxL+PQI9S4iTEQe9/29+7giHTL/BeEIc3azU+loyhymVZj9pG7wDS1HpOD/Z7YPZQ==
X-Received: by 2002:a17:906:fc6:b0:72f:d080:416 with SMTP id
 c6-20020a1709060fc600b0072fd0800416mr2684374ejk.1.1661437054526; 
 Thu, 25 Aug 2022 07:17:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fk2-20020a056402398200b00445b5874249sm4779861edb.62.2022.08.25.07.17.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 07:17:33 -0700 (PDT)
Message-ID: <83b6994b-1c0a-372f-80a4-78c4ce3efd67@mind.be>
Date: Thu, 25 Aug 2022 16:17:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>, buildroot@buildroot.org
References: <20220823194732.701895-1-marcus.hoffmann@othermo.de>
 <705af3ef-1388-85bf-6ac9-f24bca8d8a1c@mind.be>
 <3b3f344d-f06d-dc4a-e055-72e7b335044a@othermo.de>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <3b3f344d-f06d-dc4a-e055-72e7b335044a@othermo.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=YcCbzjNvilHDVWL2cgGfMdnEEFyOaDb52Qx7n2DrQTQ=;
 b=Bx/36R5KAVibFyl0vwxbU1VoApemsJL859wavzTDvJrHMATF9bCUJUeCydWQegS5oE
 zl101ADGjRHeZ4CpRKmGzvbc0OQFGLXOwzsfEjfTEuTbI9OuGykl6g/KDIMR7p8pdRB5
 TsVMRl8PAFawQlBdBQKKcOdiV6p3epYJkr96v7W1Y1sOws8sdCPIL5Y99sPChVU9r3Sp
 9VlUiWUZ2J88aRcJZh3JZj1HTtiMhuaWu6ym68lIdgbiIUue1QZe8uyY10AItBiZZU8B
 wX+MG87yA4yciJCJTUX6BcNg9n+WvAGfx4i7jiISL1zGVJpqgW9evH0kyjUT9agr0koN
 qimg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Bx/36R5K
Subject: Re: [Buildroot] [PATCH 1/2] package/python-paho-mqtt: bump to 1.6.1
 to fix running on python 3.10
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
Cc: Davide Viti <zinosat@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNS8wOC8yMDIyIDEyOjQwLCBNYXJjdXMgSG9mZm1hbm4gd3JvdGU6Cj4gSGkgQXJub3V0
LAo+IHRoYW5rcyBmb3IgdGhlIHJldmlldy4KPiAKPiBPbiAyNC4wOC4yMiAyMjo0OCwgQXJub3V0
IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDIzLzA4LzIwMjIgMjE6NDcsIE1hcmN1
cyBIb2ZmbWFubiB3cm90ZToKPj4+IEZpeGVzIHRoZSBmb2xsb3dpbmcgZXJyb3Igb24gY2FsbGlu
ZyBtcXR0LnB1Ymxpc2goKToKPj4+Cj4+PiDCoMKgIEZpbGUgIi91c3IvbGliL3B5dGhvbjMuMTAv
c2l0ZS1wYWNrYWdlcy9wYWhvL21xdHQvcHVibGlzaC5weSIsIGxpbmUgMjIyLCAKPj4+IGluIHNp
bmdsZQo+Pj4gwqDCoMKgwqAgbXVsdGlwbGUoW21zZ10sIGhvc3RuYW1lLCBwb3J0LCBjbGllbnRf
aWQsIGtlZXBhbGl2ZSwgd2lsbCwgYXV0aCwgdGxzLAo+Pj4gwqDCoCBGaWxlICIvdXNyL2xpYi9w
eXRob24zLjEwL3NpdGUtcGFja2FnZXMvcGFoby9tcXR0L3B1Ymxpc2gucHkiLCBsaW5lIDEyNiwg
Cj4+PiBpbiBtdWx0aXBsZQo+Pj4gwqDCoMKgwqAgaWYgbm90IGlzaW5zdGFuY2UobXNncywgY29s
bGVjdGlvbnMuSXRlcmFibGUpOgo+Pj4gQXR0cmlidXRlRXJyb3I6IG1vZHVsZSAnY29sbGVjdGlv
bnMnIGhhcyBubyBhdHRyaWJ1dGUgJ0l0ZXJhYmxlJwo+Pj4KPj4+IFRoaXMgd2FzIGFjdHVhbGx5
IGNoYW5nZWQgaW4gcmVsZWFzZSAxLjUuMCBidXQgMS42LjEgaXMgYWxhcmVhZHkgb3V0IGZvcgo+
Pj4gYWxtb3N0IGEgeWVhciwgc28gd2UganVzdCB1cGRhdGUgdG8gdGhhdCB2ZXJzaW9uLgo+Pj4K
Pj4+IENoYW5nZWxvZzoKPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9lY2xpcHNlL3BhaG8ubXF0dC5w
eXRob24vYmxvYi9tYXN0ZXIvQ2hhbmdlTG9nLnR4dAo+Pgo+PiDCoMKgSnVtcGluZyBmcm9tIDEu
NC4wIHRvIDEuNi4xIGF0IHRoaXMgcG9pbnQgaW4gdGhlIHN0YWJpbGlzYXRpb24gbW9udGggaXMg
bm90IAo+PiBpZGVhbC4uLgo+IAo+IFRoZXJlJ3MgdHdvIG90aGVyIG9wdGlvbnMgSSBjYW4gdGhp
bmsgb2YsIEkgd2Fzbid0IHN1cmUgd2hhdCdzIGJlc3QgaGVyZToKPiAKPiAqIGJhY2twb3J0IGh0
dHBzOi8vZ2l0aHViLmNvbS9lY2xpcHNlL3BhaG8ubXF0dC5weXRob24vcHVsbC80OTcvZmlsZXMs
IHRoYXQgCj4gc2hvdWxkIGJlIGVhc3kgZW5vdWdoCj4gKiBVcGRhdGUgdG8gMS41LjEgKG5vdCAx
LjUuMCBhcyBJIGNsYWltZWQgYWJvdmUpIHdoaWNoIGlzIHRoZSBmaXJzdCByZWxlYXNlIHRoYXQg
Cj4gaW5jbHVkZXMgdGhlIGZpeCBmb3IgdGhlIHByb2JsZW0KPiAKPiBEbyB5b3UgaGF2ZSBhIHBy
ZWZlcmVuY2UgZm9yIG9uZSBvZiB0aGUgdHdvIG92ZXIgdXBkYXRpbmcgdG8gdGhlIGxhdGVzdCBy
ZWxlYXNlPyAKPiAoSS5lLiBkZWZlciB0aGUgMS42LjEgdXBkYXRlIHRvIG5leHQpCgogIElmIHlv
dSBmZWVsIHVwIHRvIGl0LCBib3RoIGlzIGlkZWFsOiBiYWNrcG9ydCB0aGUgZml4IGZvciBtYXN0
ZXIgYW5kIAoyMDIyLjAyLngsIGFuZCBkbyB0aGUgYnVtcCBmb3IgbmV4dC4KCgo+Pj4gU2lnbmVk
LW9mZi1ieTogTWFyY3VzIEhvZmZtYW5uIDxtYXJjdXMuaG9mZm1hbm5Ab3RoZXJtby5kZT4KPj4+
IC0tLQo+Pj4gwqAgcGFja2FnZS9weXRob24tcGFoby1tcXR0L3B5dGhvbi1wYWhvLW1xdHQuaGFz
aCB8IDYgKysrLS0tCj4+PiDCoCBwYWNrYWdlL3B5dGhvbi1wYWhvLW1xdHQvcHl0aG9uLXBhaG8t
bXF0dC5ta8KgwqAgfCA0ICsrLS0KPj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1w
YWhvLW1xdHQvcHl0aG9uLXBhaG8tbXF0dC5oYXNoIAo+Pj4gYi9wYWNrYWdlL3B5dGhvbi1wYWhv
LW1xdHQvcHl0aG9uLXBhaG8tbXF0dC5oYXNoCj4+PiBpbmRleCBiZjM5OTNlOTE5NS4uNTY3ODNl
M2ZjMDggMTAwNjQ0Cj4+PiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1wYWhvLW1xdHQvcHl0aG9uLXBh
aG8tbXF0dC5oYXNoCj4+PiArKysgYi9wYWNrYWdlL3B5dGhvbi1wYWhvLW1xdHQvcHl0aG9uLXBh
aG8tbXF0dC5oYXNoCj4+PiBAQCAtMSw2ICsxLDYgQEAKPj4+IC0jIG1kNSBmcm9tIGh0dHBzOi8v
cHlwaS5weXRob24ub3JnL3B5cGkvcGFoby1tcXR0L2pzb24sIHNoYTI1NiBsb2NhbGx5IGNvbXB1
dGVkCj4+PiAtbWQ1wqAgZTNhYzI5Y2Q1ZGMyNDdhMDEwODNhMmE4ZjNmZGRkMDjCoCBwYWhvLW1x
dHQtMS40LjAudGFyLmd6Cj4+PiAtc2hhMjU2IGU0NDBhMDUyYjQ2ZDIyMmUxODRiZTNiZTM4Njc2
Mzc4NzIyMDcyZmNkNGRmZDJjOGY1MDlmYjg2MWE3YjBiNzkgCj4+PiBwYWhvLW1xdHQtMS40LjAu
dGFyLmd6Cj4+PiArIyBwYWNrYWdlIGhhc2hlcyBmcm9tIGZyb20gCj4+PiBodHRwczovL3B5cGku
b3JnL3Byb2plY3QvcGFoby1tcXR0LyNjb3B5LWhhc2gtbW9kYWwtZThlOGUwZGUtMWFlYy00NjJk
LThhZTAtZDg1OGQ0ZjVhMGQ3IAo+Pj4KPj4+ICttZDXCoCBiZGIyMGY4OGRiMjkxZmRiNGEwZmU4
MDRjMGYyOTMxNsKgIHBhaG8tbXF0dC0xLjYuMS50YXIuZ3oKPj4+ICtzaGEyNTYgMmE4MjkxYzgx
NjIzYWVjMDAzNzJiNWE4NTU1OGEzNzJjNzQ3Y2JjYThlOTkzNGRmZTIxODYzOGI4ZWVmYzI2ZiAK
Pj4+IHBhaG8tbXF0dC0xLjYuMS50YXIuZ3oKPj4+IMKgIHNoYTI1NiA3NmYxMzcyOWU4NGU5MjIy
ZTU0MzMwM2RmMDBmODdkMWIyYzA5OTViNmE1MDVjZDg1OWEyODU2NjdlNDRiYWJiIAo+Pj4gTElD
RU5TRS50eHQKPj4KPj4gwqDCoFVuZm9ydHVuYXRlbHksIHRoZSBMSUNFTlNFIGhhc2ggY2hhbmdl
ZCwgYmVjYXVzZSBpbiBmYWN0IHRoZSBsaWNlbnNlIGNoYW5nZWQ6Cj4+IEBAIC0xLDMgKzEsMyBA
QAo+PiAtVGhpcyBwcm9qZWN0IGlzIGR1YWwgbGljZW5zZWQgdW5kZXIgdGhlIEVjbGlwc2UgUHVi
bGljIExpY2Vuc2UgMS4wIGFuZCB0aGUKPj4gLUVjbGlwc2UgRGlzdHJpYnV0aW9uIExpY2Vuc2Ug
MS4wIGFzIGRlc2NyaWJlZCBpbiB0aGUgZXBsLXYxMCBhbmQgZWRsLXYxMCBmaWxlcy4KPj4gK1Ro
aXMgcHJvamVjdCBpcyBkdWFsIGxpY2Vuc2VkIHVuZGVyIHRoZSBFY2xpcHNlIFB1YmxpYyBMaWNl
bnNlIDIuMCBhbmQgdGhlCj4+ICtFY2xpcHNlIERpc3RyaWJ1dGlvbiBMaWNlbnNlIDEuMCBhcyBk
ZXNjcmliZWQgaW4gdGhlIGVwbC12MjAgYW5kIGVkbC12MTAgZmlsZXMuCj4+Cj4+IMKgwqBBbmQg
dG8gdG9wIHRoaW5ncyB1cCwgZXBsLXYyMCBpcyBtaXNzaW5nIGluIHRoZSB0YXJiYWxsLi4uCj4+
Cj4+IMKgwqBDb3VsZCB5b3UgY2hlY2sgaWYgdGhlcmUgaXMgYSB2ZXJzaW9uIHRoYXQgZG9lcyBo
YXZlIHRoZSBlcGwtdjIwIGZpbGU/IAo+PiBQZXJoYXBzIGV2ZW4gZnJvbSBhbiB1cHN0cmVhbSBn
aXQgcmVwbz8KPiAKPiBBaCwgSSBzdXBwb3NlIHRob3NlIGhhc2hlcyBhcmUgb25seSBjaGVja2Vk
IG9uIGBsZWdhbC1pbmZvYCBhbmQgbm90IGEgbm9ybWFsIAo+IGJ1aWxkIG9mIHRoZSBwYWNrYWdl
PwoKICBZZXMsIEkgYWx3YXlzIGRvICdtYWtlIGZvby1sZWdhbC1pbmZvJyBvbiBhIHZlcnNpb24g
YnVtcCB0byBjaGVjayBleGFjdGx5IHRoaXMuCgoKPiBodHRwczovL3d3dy5lY2xpcHNlLm9yZy9w
YWhvL2luZGV4LnBocD9wYWdlPWNsaWVudHMvcHl0aG9uL2luZGV4LnBocCBzdWdnZXN0cyAKPiBp
bnN0YWxsYXRpb24gdmlhIHB5cGkvcGlwIGlzIHRoZSBjYW5vbmljYWwgd2F5IGJ1dCBvZmZlcnMg
ZnJvbSBzb3VyY2UgCj4gaW5zdGFsbGF0aW9uIGFzIGFuIGFsdGVybmF0aXZlLgo+IAo+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9lY2xpcHNlL3BhaG8ubXF0dC5weXRob24gYW5kIHRoZSBnaXRodWIgYXV0
by1nZW5lcmF0ZWQgCj4gdGFyYmFsbCBjb250YWluIHRoZSBlcGwtMjAgbGljZW5zZSBmaWxlLCBz
aG91bGQgSSBjaGFuZ2UgdGhlIHNvdXJjZSBkb3dubG9hZCB0byAKPiB0aGF0PyAoSSByZW1lbWJl
ciBnaXRodWIgYXV0by1nZW5lcmF0ZWQgdGFyYmFsbHMgYmVpbmcgcHJvYmxlbWF0aWMgaW4gdGhl
IHBhc3QgCj4gYmVjYXVzZSB0aGV5IG1pZ2h0IHNpbGVudGx5IGNoYW5nZS4gRG9lcyB0aGUgYnVp
bGRyb290IHByb2plY3QgaGF2ZSBhIHBvbGljeSBoZXJlPykKCiAgZ2l0aHViIGF1dG9nZW5lcmF0
ZWQgdGFyYmFsbHMgaGF2ZSBiZWVuIHN0YWJsZSBmb3IgdGhlIGxhc3QgNiB5ZWFycyBvciBzby4g
ClBsZWFzZSBkbyB1c2UgdGhlIGdpdGh1YiBoZWxwZXIgaG93ZXZlci4KCiAgSXQncyB3ZWlyZCB0
aGF0IHRoZSBnaXRodWIgdGFnIGRvZXMgaGF2ZSB0aGUgZmlsZSwgYnV0IHRoZSBwaXAgdXBsb2Fk
IGRvZXNuJ3QuLi4KCiAgUmVnYXJkcywKICBBcm5vdXQKCgo+IAo+Pgo+PiDCoMKgUmVnYXJkcywK
Pj4gwqDCoEFybm91dAo+Pgo+IAo+IFsuLi5dCj4gCj4gQmVzdCwKPiBNYXJjdXMKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
