Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C5DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E62483F00;
	Sat, 23 Jul 2022 17:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E62483F00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SEBOqhQwdplU; Sat, 23 Jul 2022 17:18:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21CD5833AE;
	Sat, 23 Jul 2022 17:18:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21CD5833AE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56DF61BF5DE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 307DA607FE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 307DA607FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kLgtYssxXjOU for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 17:18:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01A1A607D0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01A1A607D0
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 17:18:42 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 8-20020a05600c024800b003a2fe343db1so4071017wmj.1
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 10:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xXlVEv31yIB1e1paluCqLGIMmPTH3KhEh9W39PhSAWs=;
 b=fPus8uuYEhTtTszhIEer8tBEuxWP23PAP6oU9Rh6JUdhRxLd4fCI93Ey6OLQVWgpYP
 yNO+CePFu7sUk5x7VS2jWftLHsaSY158P53J+rmvEpO23yhzBwEctIT8Rexz4FJ3O2bc
 +++k+JMcDuHgxkU6XFtp/ItmFFnTMgKhFpajVQYru37yhgsfNMEAGSDOTHS1lBQN2VBZ
 gN+9iiRAkeKMvkRUc3JqpfszyYPAtw+RaxL7RYFLtE4WbYhLlVyiyxAgiIk/VTxUM8lO
 ONpJ5AcOVSdSCeX1bXfzURBZrPG4+jzERLNrQ6FbZniLbOu93MJRLsiqVGeWK4S1mLEB
 iRkQ==
X-Gm-Message-State: AJIora9q4uHEz0yg8xO80MKdi0CZTVPn3JfHa9e6epzE5qdmN150WrrH
 zefnHeYzRTprXezesKYQ1BJRDEg9ij310g==
X-Google-Smtp-Source: AGRyM1trWhQF85FDiCfwNHLDKsDePaIbB/vd10CoJkQhRdIX2bnMPx527I5RzdTW9ENGrmR1qPmWXg==
X-Received: by 2002:a1c:f607:0:b0:3a0:3dc9:c4db with SMTP id
 w7-20020a1cf607000000b003a03dc9c4dbmr16491671wmc.30.1658596720915; 
 Sat, 23 Jul 2022 10:18:40 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0a4700b003a31f71c5b8sm15115773wmq.27.2022.07.23.10.18.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 10:18:40 -0700 (PDT)
Message-ID: <305e27f0-973a-9592-dde7-9f27b24faeb4@mind.be>
Date: Sat, 23 Jul 2022 19:18:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Frederik Van Bogaert <frederik.vanbogaert@mind.be>, buildroot@buildroot.org
References: <b3533f15-b70a-9c5c-7509-f372d9f60994@essensium.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <b3533f15-b70a-9c5c-7509-f372d9f60994@essensium.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=xXlVEv31yIB1e1paluCqLGIMmPTH3KhEh9W39PhSAWs=;
 b=NHuJy8FGR8IZ/Tb+Rta+fto/sna9PFB5zz5UMq21WyumE447C8qJEiSeTtnEloj8h3
 n7Zr/AG19NALyxfJCfBthdx66fqeFtpzfNg5TX6H1zYA6TJowYT6llruOQ5R8/t8t6mE
 kvEF9ExIl0MifQQ8Yg/IGuqMvcPF+hNVg4EFPB8fA/a+NVfQNm7tOCVfaIjpRO2/OUdR
 lTtv5VVT1KFqCtsKOt1h2/+2Q7RQknEiNEWf4tkutsSFX0K50BaNK5hlEJmHJ5dYuM6t
 Ra/Fqyqk8TmLrIjYNt88nGPs9NGyjopeKJWdcDIIaX9MKCtu0FIiLNyuEBQIO6WO6VEW
 KEQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NHuJy8FG
Subject: Re: [Buildroot] [PATCH] package/libunwind: Upstep to v1.6.2
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNC8wNi8yMDIyIDE5OjAzLCBGcmVkZXJpayBWYW4gQm9nYWVydCB3cm90ZToKPiBUaGlz
IGFsc28gcmVtb3ZlcyBhbiBvbGQgcGF0Y2ggdG8gZml4IGF0b21pY19vcHMgZm9yIEFSTSBwcmUt
QVJNdjYuCj4gYXRvbWljX29wcyBzdXBwb3J0IGhhcyBiZWVuIHJlcGxhY2VkIHdpdGggQzExIGF0
b21pY3MsIHNvIHRoZSBwYXRjaAo+ICDCoMKgIMKgZGlkIG5vdCBhcHBseSBhbnltb3JlLCBhbmQg
c2hvdWxkIGJlIHVubmVjZXNzYXJ5Lgo+IAo+IFRoaXMgZG9lcyBtZWFuIGNvbXBpbGF0aW9uIHdp
bGwgZmFpbCB3aXRoIHN5c3RlbXMgdGhhdCBkb24ndCBzdXBwb3J0Cj4gIMKgwqAgwqBDMTEgYXRv
bWljcywgaS5lLiBHQ0MgdmVyc2lvbnMgb2xkZXIgdGhhbiA0LjkKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBGcmVkZXJpayBWYW4gQm9nYWVydCA8ZnJlZGVyaWsudmFuYm9nYWVydEBtaW5kLmJlPgo+IC0t
LQo+ICDCoC4uLk9fUkVRVUlSRV9DQVMtdG8tZml4LWJ1aWxkLW9uLUFSTS12Ni5wYXRjaCB8IDU2
IC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgwqBwYWNrYWdlL2xpYnVud2luZC9Db25maWcuaW7CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKwo+ICDCoHBhY2thZ2UvbGli
dW53aW5kL2xpYnVud2luZC5oYXNowqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0K
PiAgwqBwYWNrYWdlL2xpYnVud2luZC9saWJ1bndpbmQubWvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgIDYgKy0KPiAgwqA0IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
NjIgZGVsZXRpb25zKC0pCgpbc25pcF0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJ1bndpbmQv
Q29uZmlnLmluIGIvcGFja2FnZS9saWJ1bndpbmQvQ29uZmlnLmluCj4gaW5kZXggNTI4NGI1ODY0
Yy4uYjkxNGNkNDZmNyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYnVud2luZC9Db25maWcuaW4K
PiArKysgYi9wYWNrYWdlL2xpYnVud2luZC9Db25maWcuaW4KPiBAQCAtMjMsNiArMjMsOCBAQCBj
b25maWcgQlIyX1BBQ0tBR0VfTElCVU5XSU5ECj4gIMKgwqDCoMKgIGJvb2wgImxpYnVud2luZCIK
PiAgwqDCoMKgwqAgZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTCj4gIMKgwqDC
oMKgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTElCVU5XSU5EX0FSQ0hfU1VQUE9SVFMKPiArwqDC
oMKgICMgR0NDIDQuOSBpcyB0aGUgZmlyc3QgdG8gaW1wbGVtZW50IEMxMSBhdG9taWNzCj4gK8Kg
wqDCoCBkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzRfOQoKICBUaGlzIGFs
c28gbmVlZHMgdG8gYmUgYWRkZWQgdG8gdGhlIGNvbW1lbnQgYmVsb3c6Cgpjb21tZW50ICJsaWJ1
bndpbmQgbmVlZHMgYSB0b29sY2hhaW4gdy8gdGhyZWFkcywgZHluYW1pYyBsaWJyYXJ5LCBnY2Mg
Pj0gNC45IgoJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9MSUJVTldJTkRfQVJDSF9TVVBQT1JUUwoJ
ZGVwZW5kcyBvbiAhQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyB8fCBCUjJfU1RBVElDX0xJQlMg
fHwgXAoJCSFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzkKCiAgQXBwbGllZCB0byBtYXN0
ZXIgd2l0aCB0aGF0IGZpeGVkLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+ICDCoMKg
wqDCoCAjIGZvcmNlZnVsbHkgbGlua3MgYWdhaW5zdCBsaWJnY2Nfcywgb25seSBhdmFpbGFibGUg
aW4gZHluYW1pYwo+ICDCoMKgwqDCoCAjIGxpbmtpbmcgY29uZmlndXJhdGlvbnMKPiAgwqDCoMKg
wqAgZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGli
dW53aW5kL2xpYnVud2luZC5oYXNoIGIvcGFja2FnZS9saWJ1bndpbmQvbGlidW53aW5kLmhhc2gK
PiBpbmRleCBkZTAwYzU5OTg4Li4xZDUzMmE3ODMwIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGli
dW53aW5kL2xpYnVud2luZC5oYXNoCj4gKysrIGIvcGFja2FnZS9saWJ1bndpbmQvbGlidW53aW5k
Lmhhc2gKPiBAQCAtMSw1ICsxLDUgQEAKPiAgwqAjIExvY2FsbHkgY2FsY3VsYXRlZCBhZnRlciBj
aGVja2luZyBwZ3Agc2lnbmF0dXJlCj4gLXNoYTI1NiA5MDMzNzY1M2Q5MmQ0YTEzZGU1OTA3ODEz
NzFjNjA0ZjkwMzFjZGI1MDUyMDM2NmFhMWUzYTkxZTFlZmIxMDE3IAo+IGxpYnVud2luZC0xLjUu
MC50YXIuZ3oKPiArc2hhMjU2IDRhNmFlYzY2Njk5MWZiNDVkMDg4OWM0NGFlZGU4YWQ2ZWIxMDgw
NzFjMzU1NGZjZGZmNjcxZjljOTQ3OTQ5NzYgCj4gbGlidW53aW5kLTEuNi4yLnRhci5nego+ICDC
oCMgSGFzaCBmb3IgbGljZW5zZSBmaWxlCj4gIMKgc2hhMjU2IDZhMGRiYmRhZWMyYjMxMzZiN2Jm
MDQ1NTg2ZjQyMTJiZGY3NGU3YWY2ODhiZjlkZmU5MTU0NjA3Y2Y1ZWMxNTYgQ09QWUlORwo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL2xpYnVud2luZC9saWJ1bndpbmQubWsgYi9wYWNrYWdlL2xpYnVu
d2luZC9saWJ1bndpbmQubWsKPiBpbmRleCBhYWEzMzQ2NGE5Li45Y2Q1ODdkMGEzIDEwMDY0NAo+
IC0tLSBhL3BhY2thZ2UvbGlidW53aW5kL2xpYnVud2luZC5tawo+ICsrKyBiL3BhY2thZ2UvbGli
dW53aW5kL2xpYnVud2luZC5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICDCoCMKPiAgwqAjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwo+IC1MSUJVTldJTkRfVkVSU0lPTiA9IDEuNS4wCj4gK0xJQlVOV0lO
RF9WRVJTSU9OID0gMS42LjIKPiAgwqBMSUJVTldJTkRfU0lURSA9IGh0dHA6Ly9kb3dubG9hZC5z
YXZhbm5haC5nbnUub3JnL3JlbGVhc2VzL2xpYnVud2luZAo+ICDCoExJQlVOV0lORF9JTlNUQUxM
X1NUQUdJTkcgPSBZRVMKPiAgwqBMSUJVTldJTkRfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiBA
QCAtMTYsOCArMTYsNCBAQCBMSUJVTldJTkRfQ09ORl9PUFRTID0gXAo+ICDCoMKgwqDCoCAtLWRp
c2FibGUtdGVzdHMgXAo+ICDCoMKgwqDCoCAkKGlmIAo+ICQoQlIyX0lOU1RBTExfTElCU1REQ1BQ
KSwtLWVuYWJsZS1jeHgtZXhjZXB0aW9ucywtLWRpc2FibGUtY3h4LWV4Y2VwdGlvbnMpCj4gLWlm
ZXEgKCQoQlIyX1BBQ0tBR0VfTElCQVRPTUlDX09QUykseSkKPiAtTElCVU5XSU5EX0RFUEVOREVO
Q0lFUyArPSBsaWJhdG9taWNfb3BzCj4gLWVuZGlmCj4gLQo+ICDCoCQoZXZhbCAkKGF1dG90b29s
cy1wYWNrYWdlKSkKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
