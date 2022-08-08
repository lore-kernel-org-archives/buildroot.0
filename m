Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F96C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 20:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 222FB40928;
	Mon,  8 Aug 2022 20:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 222FB40928
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yFKooIDT2KZV; Mon,  8 Aug 2022 20:36:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C1514093F;
	Mon,  8 Aug 2022 20:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C1514093F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44E5A1BF365
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E9F940988
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E9F940988
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HSFbvb7ZImxW for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 20:36:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42FF640928
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42FF640928
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 20:36:30 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id b16so12785669edd.4
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 13:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SAs8GZD7KiZs3POKVqTTXUunrpt39hT8E2Lu0/BjGPY=;
 b=lEJ+qGo0IQziI8oDY8A4xUQ2HnGL2WvxHjGj//EjhfDcjyjwKBpvdhOFZ/8lYXVjnl
 o2AEgyc6lm99xxYPNH6Ht/BO1SLaDk6nQdEkSvHNbefCvDyup/5/KF8cigijjHtbdmRQ
 ZvhwgNwYtKfS/KwXM2X7StQ+CrGosCEhRXrgYq5dZTwSbb1c6Xbv83wyUZHlo9X4HbR4
 4fFtXwQlGwOt+FBreK0tXfWC6/o9wgM5pVDJkR5StYMwVp9mNtScqUgQ1EE174C4Zy3y
 /JV44iYuILqcsF4E4R439y2Yifq/vIl62ZVhgxLS9/wbJC88ZVKAbDuqsTY05FosllRx
 sRjg==
X-Gm-Message-State: ACgBeo3LevowPm/IAsKHy6rlhPG2ITZDZ4DFLV4kXmxgoPxx7sHVSak4
 zijXdWlZ91e/+4I+4/qic8DygQ==
X-Google-Smtp-Source: AA6agR50Xh+l2PcC0WdgLPhXAh9KwTvTYpSPXIkBJXUdXmXQNps/BO/YdQfDLz29VfqBrQD6bELeJA==
X-Received: by 2002:aa7:da93:0:b0:43d:1d9d:1e5 with SMTP id
 q19-20020aa7da93000000b0043d1d9d01e5mr19564858eds.55.1659990988239; 
 Mon, 08 Aug 2022 13:36:28 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170906308c00b00730ed9e4ce1sm240696ejv.198.2022.08.08.13.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 13:36:27 -0700 (PDT)
Message-ID: <9c799ee7-07ad-61b3-2442-4e9f0e12d389@mind.be>
Date: Mon, 8 Aug 2022 22:36:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
References: <20220112094250.27022-1-sebastien.szymanski@armadeus.com>
 <20220112094250.27022-3-sebastien.szymanski@armadeus.com>
 <8076da43-1938-7672-ede7-f96de58fda77@mind.be>
 <85b83da1-fd3c-0e05-61cd-b3adcdfec58e@armadeus.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <85b83da1-fd3c-0e05-61cd-b3adcdfec58e@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SAs8GZD7KiZs3POKVqTTXUunrpt39hT8E2Lu0/BjGPY=;
 b=drtdtgyzkZzEN/zB/4PFgHw4sUFPuLJXjKrfZhFVT5074u7tKxWrMStPLHAcNQGs12
 Zg8toy9a9nlnQJ3hRdkQG63dES6kpbiAz99r/lhxUt2vZ8tfCOqAsUZ+S/9tu5mMjOKR
 KTqlEZrihzD9+nRRLwJLl1XnRFUCSHjwBIgUHnwV/gFYtvcFLRriCPa2cgYyJ/hqPOnW
 gbJl9NI3UavPYiHjj3FxVE64dNeOgGTSQgJW53GsSLDjJjMIDNSUWXZwnPxdNlE7uhnM
 53x3z4FnHHdjTY4WBA8Nph2SzHAVXMCYYe6yEh5vII9gTe8iJ4NZ0zL0AnEgzVIIKBBq
 Uiiw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=drtdtgyz
Subject: Re: [Buildroot] [PATCH 3/3] package/gstreamer1/gst1-imx2: new
 package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOC8wOC8yMDIyIDE2OjE0LCBTw6liYXN0aWVuIFN6eW1hbnNraSB3cm90ZToKPiBIaSBB
cm5vdXQsCj4gCj4gT24gNy8yOC8yMiAyMTo1MSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6
Cj4+Cj4+Cj4+IE9uIDEyLzAxLzIwMjIgMTA6NDIsIFPDqWJhc3RpZW4gU3p5bWFuc2tpIHdyb3Rl
Ogo+Pj4gVGhpcyBpcyB2ZXJzaW9uIDIgb2YgZ3N0MS1pbXguCj4+Cj4+IMKgwqBQbGVhc2UgYWRk
IHRoZSBmb2xsb3dpbmcuCj4+Cj4+IMKgwqBBbHRob3VnaCB0aGlzIHJlcGxhY2VzIHRoZSBnc3Qx
LWlteCBwYWNrYWdlLCB3ZSB3YW50IHRvIGtlZXAgYm90aCBiZWNhdXNlIAo+PiB2ZXJzaW9uIDIg
cmVtb3ZlcyBzb21lIGVsZW1lbnRzIHRoYXQgYXJlIHJlbGV2YW50IG9uIGkuTVg2IHdpdGhvdXQg
WDExIG9yIAo+PiB3YXlsYW5kOiBpbXhnMmR2aWRlb3NpbmssIGlteGlwdXZpZGVvc2luaywgaW14
ZWdsdml2c2luay4KPj4KPj4KPj4+IFNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tp
IDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KPj4+IC0tLQo+Pj4gwqAgcGFja2Fn
ZS9nc3RyZWFtZXIxL0NvbmZpZy5pbsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAg
MSArCj4+PiDCoCBwYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1pbXgyL0NvbmZpZy5pbsKgwqDCoMKg
wqAgfCA3NSArKysrKysrKysrKysrKysrKysrKysKPj4+IMKgIHBhY2thZ2UvZ3N0cmVhbWVyMS9n
c3QxLWlteDIvZ3N0MS1pbXgyLmhhc2ggfMKgIDMgKwo+Pj4gwqAgcGFja2FnZS9nc3RyZWFtZXIx
L2dzdDEtaW14Mi9nc3QxLWlteDIubWvCoMKgIHwgNzUgKysrKysrKysrKysrKysrKysrKysrCj4+
PiDCoCA0IGZpbGVzIGNoYW5nZWQsIDE1NCBpbnNlcnRpb25zKCspCj4+PiDCoCBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9nc3RyZWFtZXIxL2dzdDEtaW14Mi9Db25maWcuaW4KPj4+IMKgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1pbXgyL2dzdDEtaW14Mi5o
YXNoCj4+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9nc3RyZWFtZXIxL2dzdDEtaW14
Mi9nc3QxLWlteDIubWsKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nc3RyZWFtZXIxL0Nv
bmZpZy5pbiBiL3BhY2thZ2UvZ3N0cmVhbWVyMS9Db25maWcuaW4KPj4+IGluZGV4IDhmZThhMzQz
OTUuLjQzNmM3NjM3OWQgMTAwNjQ0Cj4+PiAtLS0gYS9wYWNrYWdlL2dzdHJlYW1lcjEvQ29uZmln
LmluCj4+PiArKysgYi9wYWNrYWdlL2dzdHJlYW1lcjEvQ29uZmlnLmluCj4+PiBAQCAtOSw2ICs5
LDcgQEAgc291cmNlICJwYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1wbHVnaW5zLWJhZC9Db25maWcu
aW4iCj4+PiDCoCBzb3VyY2UgInBhY2thZ2UvZ3N0cmVhbWVyMS9nc3QxLXBsdWdpbnMtdWdseS9D
b25maWcuaW4iCj4+PiDCoCBzb3VyY2UgInBhY2thZ2UvZ3N0cmVhbWVyMS9nc3QxLWRldnRvb2xz
L0NvbmZpZy5pbiIKPj4+IMKgIHNvdXJjZSAicGFja2FnZS9nc3RyZWFtZXIxL2dzdDEtaW14L0Nv
bmZpZy5pbiIKPj4+ICtzb3VyY2UgInBhY2thZ2UvZ3N0cmVhbWVyMS9nc3QxLWlteDIvQ29uZmln
LmluIgo+Pgo+PiDCoMKgTm90ZSB0aGF0IHRoaXMgb25lIHNob3VsZCAqbm90KiBtb3ZlIHRvIHBh
Y2thZ2UvZnJlZXNjYWxlLWlteCwgaXQncyBjb3JyZWN0IAo+PiB0byBwdXQgaXQgaGVyZSBpbiBn
c3RyZWFtZXIxLgo+Pgo+Pj4gwqAgc291cmNlICJwYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1pbnRl
cnBpcGUvQ29uZmlnLmluIgo+Pj4gwqAgc291cmNlICJwYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1s
aWJhdi9Db25maWcuaW4iCj4+PiDCoCBzb3VyY2UgInBhY2thZ2UvZ3N0cmVhbWVyMS9nc3QxLXB5
dGhvbi9Db25maWcuaW4iCj4+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nc3RyZWFtZXIxL2dzdDEt
aW14Mi9Db25maWcuaW4gCj4+PiBiL3BhY2thZ2UvZ3N0cmVhbWVyMS9nc3QxLWlteDIvQ29uZmln
LmluCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4gaW5kZXggMDAwMDAwMDAwMC4uYjk1ZTZi
ZGIyMQo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4gKysrIGIvcGFja2FnZS9nc3RyZWFtZXIxL2dzdDEt
aW14Mi9Db25maWcuaW4KPj4+IEBAIC0wLDAgKzEsNzUgQEAKPj4+ICttZW51Y29uZmlnIEJSMl9Q
QUNLQUdFX0dTVDFfSU1YMgo+Pj4gK8KgwqDCoCBib29sICJnc3QxLWlteDIiCj4+PiArwqDCoMKg
IGRlcGVuZHMgb24gQlIyX2FybSB8fCBCUjJfYWFyY2g2NCAjIE9ubHkgcmVsZXZhbnQgZm9yIGku
TVgKPj4+ICvCoMKgwqAgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9MSUJJTVhETUFCVUZGRVIKPj4K
Pj4gwqDCoFRoaXMgc2hvdWxkIGJlIGEgc2VsZWN0Lgo+Pgo+PiDCoMKgT24gdGhlIG90aGVyIGhh
bmQsIGl0IHNob3VsZCBhbHNvIGhhdmUKPj4KPj4gwqDCoMKgwqDCoGRlcGVuZHMgb24gQlIyX1BB
Q0tBR0VfRlJFRVNDQUxFX0lNWAo+Pgo+Pj4gK8KgwqDCoCBzZWxlY3QgQlIyX1BBQ0tBR0VfR1NU
MV9QTFVHSU5TX0JBU0UKPj4+ICvCoMKgwqAgaGVscAo+Pj4gK8KgwqDCoMKgwqAgVGhpcyBpcyBh
IHNldCBvZiBHU3RyZWFtZXIgMS4wIHBsdWdpbnMgZm9yIHBsdWdpbnMgZm9yCj4+PiArwqDCoMKg
wqDCoCBGcmVlc2NhbGUncyBpLk1YIHBsYXRmb3Jtcywgd2hpY2ggbWFrZSB1c2Ugb2YgdGhlIGku
TVgKPj4+ICvCoMKgwqDCoMKgIG11bHRpbWVkaWEgY2FwYWJpbGl0aWVzLgo+Pj4gKwo+Pj4gK8Kg
wqDCoMKgwqAgaHR0cHM6Ly9naXRodWIuY29tL0ZyZWVzY2FsZS9nc3RyZWFtZXItaW14Cj4+PiAr
Cj4+PiAraWYgQlIyX1BBQ0tBR0VfR1NUMV9JTVgyCj4+PiArCj4+PiArY29uZmlnIEJSMl9QQUNL
QUdFX0dTVDFfSU1YMl9HMkQKPj4+ICvCoMKgwqAgYm9vbCAiaW14ZzJkIgo+Pj4gK8KgwqDCoCBk
ZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0lNWF9HUFVfRzJECj4+Cj4+IMKgwqBBbGwgdGhlc2UgZGVw
ZW5kcyBvbiBzaG91bGQgYWxzbyBiZSB0dXJuZWQgaW4gc2VsZWN0LCBhbmQgcHJvcGFnYXRlIHRo
ZWlyIAo+PiBkZXBlbmRlbmNpZXMuIFNpbmNlIHRoZSBkZXBlbmRlbmNpZXMgYXJlIGFsbCBhcmNo
aXRlY3R1cmUgZGVwZW5kZW5jaWVzLCBJIAo+PiB0aGluaywgdGhlcmUncyBubyBuZWVkIGZvciBh
IGNvbW1lbnQuIFlvdSBvbmx5IG5lZWQgYSBjb21tZW50IGZvciB0aGUgbGludXggCj4+IGRlcGVu
ZGVuY3kuCj4gCj4gSSBoYXZlIGNvcGllZCB0aGUgZ3N0MS1pbXggcGFja2FnZSB3aGljaCB1c2Vz
IGRlcGVuZHMgb24uIAoKICBXZWxsLCB3ZSdyZSB0cnlpbmcgdG8gaW1wcm92ZSB0aGUgc2l0dWF0
aW9uIDotKQoKPiBXaGVuIHVzaW5nIHNlbGVjdCB0aGUgZm9sbG93aW5nIGlzc3VlIGFwcGVhcnM6
Cj4gCj4gcGFja2FnZS9nc3RyZWFtZXIxL2dzdHJlYW1lcjEvQ29uZmlnLmluOjU6ZXJyb3I6IHJl
Y3Vyc2l2ZSBkZXBlbmRlbmN5IGRldGVjdGVkIQo+IHBhY2thZ2UvZ3N0cmVhbWVyMS9nc3RyZWFt
ZXIxL0NvbmZpZy5pbjo1OsKgwqDCoMKgwqAgc3ltYm9sIEJSMl9QQUNLQUdFX0dTVFJFQU1FUjEg
aXMgCj4gc2VsZWN0ZWQgYnkgQlIyX1BBQ0tBR0VfV0VCS0lUR1RLX01VTFRJTUVESUEKPiBwYWNr
YWdlL3dlYmtpdGd0ay9Db25maWcuaW46OTQ6IHN5bWJvbCBCUjJfUEFDS0FHRV9XRUJLSVRHVEtf
TVVMVElNRURJQSBkZXBlbmRzIAo+IG9uIEJSMl9QQUNLQUdFX1dFQktJVEdUSwo+IHBhY2thZ2Uv
d2Via2l0Z3RrL0NvbmZpZy5pbjoyODogc3ltYm9sIEJSMl9QQUNLQUdFX1dFQktJVEdUSyBpcyBz
ZWxlY3RlZCBieSAKPiBCUjJfUEFDS0FHRV9NSURPUkkKPiBwYWNrYWdlL21pZG9yaS9Db25maWcu
aW46MjQ6wqDCoMKgIHN5bWJvbCBCUjJfUEFDS0FHRV9NSURPUkkgZGVwZW5kcyBvbiAKPiBCUjJf
UEFDS0FHRV9MSUJHVEszCj4gcGFja2FnZS9saWJndGszL0NvbmZpZy5pbjoxNTrCoMKgIHN5bWJv
bCBCUjJfUEFDS0FHRV9MSUJHVEszIGlzIHNlbGVjdGVkIGJ5IAo+IEJSMl9QQUNLQUdFX1ZURQo+
IHBhY2thZ2UvdnRlL0NvbmZpZy5pbjoxOsKgwqDCoMKgwqDCoMKgIHN5bWJvbCBCUjJfUEFDS0FH
RV9WVEUgZGVwZW5kcyBvbiAKPiBCUjJfUEFDS0FHRV9IQVNfTElCRUdMX1dBWUxBTkQKPiBwYWNr
YWdlL29wZW5nbC9saWJlZ2wvQ29uZmlnLmluOjQ6wqDCoMKgwqDCoCBzeW1ib2wgQlIyX1BBQ0tB
R0VfSEFTX0xJQkVHTF9XQVlMQU5EIGlzIAo+IHNlbGVjdGVkIGJ5IEJSMl9QQUNLQUdFX0lNWF9H
UFVfVklWX09VVFBVVF9XTAo+IHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LXZpdi9Db25m
aWcuaW46NjQ6IHN5bWJvbCAKPiBCUjJfUEFDS0FHRV9JTVhfR1BVX1ZJVl9PVVRQVVRfV0wgaXMg
cGFydCBvZiBjaG9pY2UgPGNob2ljZT4KPiBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWdwdS12
aXYvQ29uZmlnLmluOjM5OiBjaG9pY2UgPGNob2ljZT4gY29udGFpbnMgc3ltYm9sIAo+IDxjaG9p
Y2U+Cj4gcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1ncHUtdml2L0NvbmZpZy5pbjozOTogY2hv
aWNlIDxjaG9pY2U+IGNvbnRhaW5zIHN5bWJvbCAKPiBCUjJfUEFDS0FHRV9JTVhfR1BVX1ZJVgo+
IHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LXZpdi9Db25maWcuaW46OTrCoCBzeW1ib2wg
QlIyX1BBQ0tBR0VfSU1YX0dQVV9WSVYgCj4gaXMgc2VsZWN0ZWQgYnkgQlIyX1BBQ0tBR0VfSU1Y
X0dQVV9HMkQKPiBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWdwdS1nMmQvQ29uZmlnLmluOjk6
wqAgc3ltYm9sIEJSMl9QQUNLQUdFX0lNWF9HUFVfRzJEIAo+IGlzIHNlbGVjdGVkIGJ5IEJSMl9Q
QUNLQUdFX0dTVDFfSU1YMl9HMkQKPiBwYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1pbXgyL0NvbmZp
Zy5pbjoyMTrCoMKgwqDCoMKgIHN5bWJvbCBCUjJfUEFDS0FHRV9HU1QxX0lNWDJfRzJEIAo+IGRl
cGVuZHMgb24gQlIyX1BBQ0tBR0VfR1NUUkVBTUVSMQo+IEZvciBhIHJlc29sdXRpb24gcmVmZXIg
dG8gRG9jdW1lbnRhdGlvbi9rYnVpbGQva2NvbmZpZy1sYW5ndWFnZS50eHQKPiBzdWJzZWN0aW9u
ICJLY29uZmlnIHJlY3Vyc2l2ZSBkZXBlbmRlbmN5IGxpbWl0YXRpb25zIgoKICBJJ20gdHJ5aW5n
IHRvIHNlZSB0aGUgcHJvYmxlbSB3aXRoIHRoaXMgZGVwZW5kZW5jeSBjaGFpbiwgYnV0IEkgY2Fu
J3QgZmluZCAKaXQuLi4gUGVyaGFwcyBpdCdzIHRoZSBjaG9pY2UgZm9yIGlteC1ncHUtdml2IG91
dHB1dCB0aGF0IGlzIGNhdXNpbmcgdGhlIHByb2JsZW0uCgogIFlvdSBkaWQgcHJvcGFnYXRlIHRo
ZSBkZXBlbmRlbmNpZXMsIHJpZ2h0PwoKICAgICAgICAgZGVwZW5kcyBvbiAoQlIyX2FybSAmJiBC
UjJfQVJNX0VBQklIRikgfHwgQlIyX2FhcmNoNjQgIyBpbXgtZ3B1LWcyZAogICAgICAgICBkZXBl
bmRzIG9uIEJSMl9UT09MQ0hBSU5fVVNFU19HTElCQyAjIGlteC1ncHUtZzJkCgoKICBSZWdhcmRz
LAogIEFybm91dAoKPiAKPiBUaGVyZSB3YXMgYSBzaW1pbGFyIGlzc3VlIGZvciBnc3QxLWlteDoK
PiAKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAxNjA5MjAyMjQzNTUubDc2YTNrZ2d1
cHVpdWdva0B0NDUwcy5sYW4vCj4gCj4gU28sIEkgd2lsbCBrZWVwIGRlcGVuZHMgb24gaGVyZS4K
PiAKPiBSZWdhcmRzLAo+IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
