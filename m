Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D6FC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 17:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E00AC40614;
	Tue, 26 Jul 2022 17:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E00AC40614
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NpMsAbf_yrDE; Tue, 26 Jul 2022 17:34:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A796F40272;
	Tue, 26 Jul 2022 17:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A796F40272
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B5EE01BF957
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AAAE83337
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AAAE83337
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RUihidgRRnmW for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 17:34:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 342938333E
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 342938333E
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 17:34:33 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id v17so2187244wrr.10
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 10:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y8Q/o22aHvwFvwtxyh9EGWs5R/Wouwu0GdviQAgto5s=;
 b=ZWuDaTLZw6ZB4vJSVPIhJroj2aFphxnDv1ICzl/wsxmeyRR6xE4d4GVmh+9axYG/ll
 ouadFPcTSStAMVKd0iqjTvXnYTMmn/VJJCUb7bXWGJ/vazCy4SnS4VzKLcHrNqCHsN6f
 GDK/q+JBH3h2Mt/jT5e/KbLQVPZABqinIPkxcuq0W48CmREp/CF5Hwv7IKINykR2Yia1
 iSIax90sdW8zG09uIY2SuapQdiTyYUel+FeahwJbKT76eB8q+dJSAcBFUWDloMkfuBYu
 54+m9i60gAVL7jx4EsDaQmTaCVH9tuA5wrUOuIGKjmDNqjnr5fgo9fwPCIF95d+mGs6x
 SouQ==
X-Gm-Message-State: AJIora+jE8dlb887FqGLojD+SEiaMo4Q2vG6a/urLS/yPpM1D+Q4EAQG
 pvZFKe/85SKDMalC7SINJrF/oxJx4BlPEg==
X-Google-Smtp-Source: AGRyM1vrpVXRZn7dssQXJTq/Cw5ko4ng+udw2JvOMcZLBPsrEZKZB33dWrlZXKmJ5Omr9y/5o2cvdg==
X-Received: by 2002:adf:d1eb:0:b0:21e:5545:9ac9 with SMTP id
 g11-20020adfd1eb000000b0021e55459ac9mr11699976wrd.458.1658856871235; 
 Tue, 26 Jul 2022 10:34:31 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:86bb:8231:62d7:1874?
 ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 q9-20020adfaa49000000b0021e7e050404sm10789066wrd.117.2022.07.26.10.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 10:34:30 -0700 (PDT)
Message-ID: <c2d7bc55-88b6-6c63-7a7e-4512a965a9f4@smile.fr>
Date: Tue, 26 Jul 2022 19:34:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>, buildroot@buildroot.org
References: <20220208162409.496110-1-gwenj@trabucayre.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220208162409.496110-1-gwenj@trabucayre.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=y8Q/o22aHvwFvwtxyh9EGWs5R/Wouwu0GdviQAgto5s=;
 b=1c7zwBVlvKRwCtiZvWT9NLzAU0/QI7TFms7O3FZ19NdaNzX60r/hL77apydsgh/350
 H4YIYTXkswFOWrWeogoXdqpESvEzYctEtYydTs13sA1j4hU06+c/PGpaUfM9xmpR7Qgc
 746U0cRjstOFOjHb2ymGTX95p7kZZ58G1rfeeTXfxzvAsvr83ugk+kTSuUbHf55byju+
 molmfRlNrr5Ai/Z7PXY7LmF7Gnd2SDIaMaRve8WXLHspd9hQ7WAvyPwfwiO9iVUQVuSW
 vGAILbNllRIGaRWbO8K3oE+f6l4UzTOEWdmk83t67v4ufqI4UifjSiS6mXuN2RlUsj5S
 SnDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=1c7zwBVl
Subject: Re: [Buildroot] [PATCH 1/2] package/volk: new package
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR3dlbmhhZWwsCgpMZSAwOC8wMi8yMDIyIMOgIDE3OjI0LCBHd2VuaGFlbCBHb2F2ZWMt
TWVyb3UgYSDDqWNyaXTCoDoKPiBGcm9tOiBHd2VuaGFlbCBHb2F2ZWMtTWVyb3UgPGd3ZW5oYWVs
LmdvYXZlYy1tZXJvdUB0cmFidWNheXJlLmNvbT4KPiAKPiBWT0xLIGlzIHRoZSBWZWN0b3ItT3B0
aW1pemVkIExpYnJhcnkgb2YgS2VybmVscwo+IAo+IFNpZ25lZC1vZmYtYnk6IEd3ZW5oYWVsIEdv
YXZlYy1NZXJvdSA8Z3dlbmhhZWwuZ29hdmVjLW1lcm91QHRyYWJ1Y2F5cmUuY29tPgo+IC0tLQo+
ICBERVZFTE9QRVJTICAgICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAg
IHwgIDEgKwo+ICBwYWNrYWdlL3ZvbGsvQ29uZmlnLmluIHwgMzEgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ICBwYWNrYWdlL3ZvbGsvdm9say5oYXNoIHwgIDMgKysrCj4gIHBhY2th
Z2Uvdm9say92b2xrLm1rICAgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCA3NSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL3ZvbGsvQ29uZmlnLmluCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL3ZvbGsvdm9say5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3ZvbGsvdm9s
ay5tawo+IAo+IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IDFk
MWNmOTk4OTguLmM4YTliODdjNDcgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RF
VkVMT1BFUlMKPiBAQCAtMTE4MSw2ICsxMTgxLDcgQEAgRjoJcGFja2FnZS9weXRob24tbWFya2Rv
d24vCj4gIEY6CXBhY2thZ2UvcHl0aG9uLXJlbWkvCj4gIEY6CXBhY2thZ2UvcHl0aG9uLXNpcC8K
PiAgRjoJcGFja2FnZS91aGQvCj4gK0Y6CXBhY2thZ2Uvdm9say8KPiAgCj4gIE46CUhlaWtvIFRo
aWVyeSA8aGVpa28udGhpZXJ5QGdtYWlsLmNvbT4KPiAgRjoJYm9hcmQva29udHJvbi9waXR4LWlt
eDhtLwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmlu
Cj4gaW5kZXggZDYzMWVkNzg0YS4uYzAzNTM4MjlhMyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL0Nv
bmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj4gQEAgLTIwNjIsNiArMjA2Miw3IEBA
IGVuZGlmCj4gIAlzb3VyY2UgInBhY2thZ2UvdHovQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNr
YWdlL3R6ZGF0YS9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvdXZ3L0NvbmZpZy5pbiIK
PiArCXNvdXJjZSAicGFja2FnZS92b2xrL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS94
YXBpYW4vQ29uZmlnLmluIgo+ICBlbmRtZW51Cj4gIAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3Zv
bGsvQ29uZmlnLmluIGIvcGFja2FnZS92b2xrL0NvbmZpZy5pbgo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNDUzOWNkMjE1Mwo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9wYWNrYWdlL3ZvbGsvQ29uZmlnLmluCj4gQEAgLTAsMCArMSwzMSBAQAo+ICtjb21tZW50ICJ2
b2xrIG5lZWRzIGEgdG9vbGNoYWluIHcvIEMrKywgTlBUTCwgd2NoYXIsIGR5bmFtaWMgbGlicmFy
eSIKPiArCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUKPiArCWRlcGVuZHMgb24gIUJSMl9JTlNUQUxM
X0xJQlNURENQUCB8fCAhQlIyX1VTRV9XQ0hBUiB8fCBcCj4gKwkJIUJSMl9UT09MQ0hBSU5fSEFT
X1RIUkVBRFNfTlBUTCB8fCBCUjJfU1RBVElDX0xJQlMKPiArCj4gK2NvbmZpZyBCUjJfUEFDS0FH
RV9WT0xLCj4gKwlib29sICJ2b2xrIgo+ICsJZGVwZW5kcyBvbiBCUjJfSU5TVEFMTF9MSUJTVERD
UFAKPiArCWRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUwo+ICsJZGVwZW5kcyBvbiBCUjJfVE9P
TENIQUlOX0hBU19USFJFQURTX05QVEwKPiArCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUgIyB1c2Ug
Zm9yaygpCj4gKwlkZXBlbmRzIG9uIEJSMl9VU0VfV0NIQVIgIyBib29zdAo+ICsJc2VsZWN0IEJS
Ml9QQUNLQUdFX0JPT1NUCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfQk9PU1RfRklMRVNZU1RFTQo+
ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0JPT1NUX1NZU1RFTQo+ICsJaGVscAo+ICsJICBWT0xLIGlz
IHRoZSBWZWN0b3ItT3B0aW1pemVkIExpYnJhcnkgb2YgS2VybmVscy4gSXQgaXMgYQo+ICsJICBs
aWJyYXJ5IHRoYXQgY29udGFpbnMga2VybmVscyBvZiBoYW5kLXdyaXR0ZW4gU0lNRCBjb2RlCj4g
KwkgIGZvciBkaWZmZXJlbnQgbWF0aGVtYXRpY2FsIG9wZXJhdGlvbnMuIFNpbmNlIGVhY2ggU0lN
RAo+ICsJICBhcmNoaXRlY3R1cmUgY2FuIGJlIHZlcnkgZGlmZmVyZW50IGFuZCBubyBjb21waWxl
ciBoYXMgeWV0Cj4gKwkgIGNvbWUgYWxvbmcgdG8gaGFuZGxlIHZlY3Rvcml6YXRpb24gcHJvcGVy
bHkgb3IgaGlnaGx5Cj4gKwkgIGVmZmljaWVudGx5LCBWT0xLIGFwcHJvYWNoZXMgdGhlIHByb2Js
ZW0gZGlmZmVyZW50bHkuCj4gKwo+ICsJICBGb3IgZWFjaCBhcmNoaXRlY3R1cmUgb3IgcGxhdGZv
cm0gdGhhdCBhIGRldmVsb3BlciB3aXNoZXMKPiArCSAgdG8gdmVjdG9yaXplIGZvciwgYSBuZXcg
cHJvdG8ta2VybmVsIGlzIGFkZGVkIHRvIFZPTEsuIEF0Cj4gKwkgIHJ1bnRpbWUsIFZPTEsgd2ls
bCBzZWxlY3QgdGhlIGNvcnJlY3QgcHJvdG8ta2VybmVsLiBJbiB0aGlzCj4gKwkgIHdheSwgdGhl
IHVzZXJzIG9mIFZPTEsgY2FsbCBhIGtlcm5lbCBmb3IgcGVyZm9ybWluZyB0aGUKPiArCSAgb3Bl
cmF0aW9uIHRoYXQgaXMgcGxhdGZvcm0vYXJjaGl0ZWN0dXJlIGFnbm9zdGljLiBUaGlzCj4gKwkg
IGFsbG93cyB1cyB0byB3cml0ZSBwb3J0YWJsZSBTSU1EIGNvZGUuCj4gKwo+ICsJICBodHRwczov
L3d3dy5saWJ2b2xrLm9yZy8KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS92b2xrL3ZvbGsuaGFzaCBi
L3BhY2thZ2Uvdm9say92b2xrLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAw
MDAwMDAwMDAuLjlmY2E2YzFiMzMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS92b2xr
L3ZvbGsuaGFzaAo+IEBAIC0wLDAgKzEsMyBAQAo+ICsjIExvY2FsbHkgY29tcHV0ZWQKPiArc2hh
MjU2ICBkOTE4M2I5Zjg2YTMyY2RiYjg2OThjYmJlYjE1ZGU1NzQ5NjJjMDUyMDBjY2Y0NDVjMTA1
ODYyOTA3MzUyMWY4ICB2b2xrLTIuNS4wLnRhci5negoKV2hlbiBhdmFpbGFibGUsIHdlIHByZWZl
ciB0aGUgdGFyLnh6IGFyY2hpdmUKCmh0dHBzOi8vZ2l0aHViLmNvbS9nbnVyYWRpby92b2xrL3Jl
bGVhc2VzL2Rvd25sb2FkL3YyLjUuMC92b2xrLTIuNS4wLnRhci54egoKTm90ZTogdGhlIDIuNS4x
IGhhcyBiZWVuIHJlbGVhc2VkIGZldyBkYXlzIGFmdGVyIHlvdXIgY29udHJpYnV0aW9uLgoKPiAr
c2hhMjU2ICA4Y2ViNGI5ZWU1YWRlZGRlNDdiMzFlOTc1YzFkOTBjNzNhZDI3YjZiMTY1YTFkY2Q4
MGM3YzU0NWViNjViOTAzICBDT1BZSU5HCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvdm9say92b2xr
Lm1rIGIvcGFja2FnZS92b2xrL3ZvbGsubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAuLmNkYjBlYTlhNzcKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS92
b2xrL3ZvbGsubWsKPiBAQCAtMCwwICsxLDM5IEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Cj4gKyMKPiArIyB2b2xrCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gK1ZP
TEtfVkVSU0lPTiA9IDIuNS4wCj4gK1ZPTEtfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9nbnVy
YWRpby92b2xrL3JlbGVhc2VzL2Rvd25sb2FkL3YkKFZPTEtfVkVSU0lPTikKPiArVk9MS19MSUNF
TlNFID0gR1BMLTMuMCsKPiArVk9MS19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwoKVGhlcmUgYXJl
IHR3byBvdGhlciBsaWNlbnNlIGZpbGUgcHJlc2VudCBpbiB0aGUgcm9vdCBkaXJlY3Rvcnk6CkNP
UFlJTkctR1BMCkNPUFlJTkctTEdQTAoKQWJvdXQgdGhlIGxpY2Vuc2luZyBzdGF0dXM6CgpodHRw
czovL2dpdGh1Yi5jb20vZ251cmFkaW8vdm9say90cmVlL3YyLjUuMSNsaWNlbnNlCgpTbyBHUEwt
My4wKyBpcyBzdGlsbCBjb3JyZWN0LgoKT3RoZXJ3aXNlOgpSZXZpZXdlZC1ieTogUm9tYWluIE5h
b3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gKwo+
ICtWT0xLX1NVUFBPUlRTX0lOX1NPVVJDRV9CVUlMRCA9IE5PCj4gKwo+ICsjIGhvc3QtcHl0aG9u
LW1ha28gYXJlIG5lZWRlZCBmb3Igdm9sayB0byBjb21waWxlCj4gK1ZPTEtfREVQRU5ERU5DSUVT
ID0gaG9zdC1weXRob24zIGhvc3QtcHl0aG9uLW1ha28gYm9vc3QKPiArCj4gK1ZPTEtfQ09ORl9P
UFRTID0gXAo+ICsJLURQWVRIT05fRVhFQ1VUQUJMRT0kKEhPU1RfRElSKS9iaW4vcHl0aG9uMyBc
Cj4gKwktREVOQUJMRV9NT0RUT09MPU9GRiBcCj4gKwktREVOQUJMRV9URVNUSU5HPU9GRiBcCj4g
KwktREVOQUJMRV9QUk9GSUxJTkc9T0ZGIFwKPiArCS1EVk9MS19QWVRIT05fRElSPWxpYi9weXRo
b24kKFBZVEhPTjNfVkVSU0lPTl9NQUpPUikvc2l0ZS1wYWNrYWdlcwo+ICsKPiArIyBGb3IgdGhp
cmQtcGFydHkgYmxvY2tzLCB0aGUgdm9sayBsaWJyYXJ5IGlzIG1hbmRhdG9yeSBhdAo+ICsjIGNv
bXBpbGUgdGltZS4KPiArVk9MS19JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiArCj4gK2lmZXEgKCQo
QlIyX1RPT0xDSEFJTl9IQVNfTElCQVRPTUlDKSx5KQo+ICtWT0xLX0NPTkZfT1BUUyArPSAtRENN
QUtFX0VYRV9MSU5LRVJfRkxBR1M9LWxhdG9taWMKPiArZW5kaWYKPiArCj4gK2lmZXEgKCQoQlIy
X1BBQ0tBR0VfT1JDKSx5KQo+ICtWT0xLX0RFUEVOREVOQ0lFUyArPSBvcmMKPiArVk9MS19DT05G
X09QVFMgKz0gLURFTkFCTEVfT1JDPU9OCj4gK2Vsc2UKPiArVk9MS19DT05GX09QVFMgKz0gLURF
TkFCTEVfT1JDPU9GRgo+ICtlbmRpZgo+ICsKPiArJChldmFsICQoY21ha2UtcGFja2FnZSkpCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
