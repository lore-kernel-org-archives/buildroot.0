Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7360EC432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 21:27:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FFBE60F6C
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 21:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FFBE60F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC4AC40637;
	Fri, 27 Aug 2021 21:27:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rOuEyPAm-CE5; Fri, 27 Aug 2021 21:27:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC5BA42788;
	Fri, 27 Aug 2021 21:27:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74C071BF384
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 21:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7196842788
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 21:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4KdRTbFb1KyG for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 21:27:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 881BA40637
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 21:27:43 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t15so6166163wrg.7
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 14:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0eo+Hu3RWd7CnMoUhncSLfiCmDIxqOQvYiGb46ek8/Y=;
 b=WR+0xSHUJA4zh9sQVxJmh/aaPxXIX9KQeCWnD2WMK1faK7SXdDPgGU4rK4qEHfP/qe
 hRt1GfcXitys8uIf42MO+R4H2/5I4rUsx8ziNs/wM8sU+qQzFTekN6yXF8CZPOqZym5P
 6HXbjDNTSxEaFFv3CVOecP6ugeks1dIfX2wqId1v1SuuSqY5xf2FhWd3HUqfLbqH6rNs
 H6moDb4YObY2EuchaVwOJML5aIN2eAiEX86jPXkvKAZa2HdvD7U/NWpW8ucep9+dL9mI
 bbQSmTrZgOLaHgdqgT3UuKWLgaPBSxc+xmIIPQ/vGOVYoUlbzy7rssCmjL6d1sViTYJd
 qlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0eo+Hu3RWd7CnMoUhncSLfiCmDIxqOQvYiGb46ek8/Y=;
 b=Urfi3rxMPRsy/duxU7ZRSmsmZHU+br/OUnu4wKW6u5KboNWWC9UkX1Xbgmrl0EycE8
 V87mUk3dpjwSPGqqzQ1vA1diVXS1bLgdh1MyTAqIGlcc3Y23HijBUlY5P9UWxZKCWVfu
 d/x5ULoq0a7iJg3gqBaJ6vtEVQYnK8968c277yON7p4lALH2NkS0Uq4Z8tWxvgGHKP7a
 Z5rjbkWJlbK6Waxu5y7F4HUzRccykIldCgr0dXDfkbic0xDh883bK9u7YgOaH1jZOmg2
 yb91lukk/SRqiMEX+k+5UPeCMZRg8bX9H2TOlBGwwIrePrWRBOx1JFpAEgCBgF/BET22
 wr/A==
X-Gm-Message-State: AOAM530/4x+UphUek0D+JsAwrEnJlFBlyf/IaJ8gwdVr/vnwArVft+5v
 bJdpBbPqCEijG3Mw7MPppj7uBM5y870=
X-Google-Smtp-Source: ABdhPJwbcrgGSlUi/bYFc598uv4aj6XhZ2yF5oGivatWZeZuk/DK29Az6CAdKpfRXZ5FucZAGgs+CQ==
X-Received: by 2002:a5d:534c:: with SMTP id t12mr12432535wrv.219.1630099661758; 
 Fri, 27 Aug 2021 14:27:41 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91?
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id r4sm11232343wmq.34.2021.08.27.14.27.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 14:27:41 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210827091743.2516027-1-romain.naour@gmail.com>
 <20210827204819.GE2661@scaer>
From: Romain Naour <romain.naour@gmail.com>
Message-ID: <75eb3db4-01a4-a335-f997-6ef81456682d@gmail.com>
Date: Fri, 27 Aug 2021 23:27:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827204819.GE2661@scaer>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCHv2] package/zfs: Fix
 cross-platform-compilations
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: =?UTF-8?Q?Jos=c3=a9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gWWFubiwKCkxlIDI3LzA4LzIwMjEgw6AgMjI6NDgsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiBSb21haW4sIEpvc8OpLCBBbGwsCj4gCj4gT24gMjAyMS0wOC0yNyAxMToxNyArMDIw
MCwgUm9tYWluIE5hb3VyIHNwYWtlIHRodXNseToKPj4gRnJvbTogSm9zw6kgTHVpcyBTYWx2YWRv
ciBSdWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+Cj4+Cj4+IFRoaXMgcGF0Y2ggZml4
ZXMgdGhlIGBtYWtlYCBleGVjdXRlZCBmcm9tIHRoZSBga2VybmVsLm00YCBpbgo+PiBjcm9zcy1w
bGF0Zm9ybS1jb21waWxhdGlvbnMgZW52aXJvbm1lbnRzOgo+PiBodHRwczovL2dpdGh1Yi5jb20v
b3Blbnpmcy96ZnMvYmxvYi96ZnMtMi4wLjUvY29uZmlnL2tlcm5lbC5tNCNMNTg4Cj4+Cj4+IEZp
eGVzOgo+PiBodHRwczovL2dpdGxhYi5jb20va3VidTkzL2J1aWxkcm9vdC8tL2pvYnMvMTUyMjg0
ODQ4Mwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZh
ZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxy
b21haW4ubmFvdXJAZ21haWwuY29tPgo+PiAtLS0KPj4gdjI6IGFkZCBhIHBhdGNoIHRvIHJlbW92
ZSBERVNURElSIHVzZWQgd2l0aCBJTlNUQUxMX01PRF9QQVRICj4+ICAgICBVc2UgTElOVVhfTUFL
RV9GTEFHUyBmb3IgWkZTX01BS0VfRU5WIGFuZCBaRlNfQ09ORl9FTlYKPj4gICAgIGh0dHA6Ly9s
aXN0cy5idXN5Ym94Lm5ldC9waXBlcm1haWwvYnVpbGRyb290LzIwMjEtQXVndXN0LzYyMTM1MC5o
dG1sCj4gCj4gSSd2ZSBvbmx5IGhhZCBhIGN1cnNvcnkgbG9vayBhdCB0aGUgcHJldmlvdXMgZGlz
Y3Vzc2lvbiwgc29ycnkuLi4KPiAKPiBIb3dldmVyLCBJIGJlbGlldmUgdGhpcyBpcyBpbmNvcnJl
Y3QgdG8gcGFzcyAkKExJTlVYX01BS0VfRkxBR1MpIGluIHRoZQo+IGVudmlyb25tZW50IGZvciBj
b25maWd1cmUgYW5kIG1ha2UuCj4gCj4gSW5kZWVkLCAkKExJTlVYX01BS0VfRkxBR1MpIHNob3Vs
ZCByZWFsbHkgb25seSBiZSB1c2VkIHdoZW4gYWN0dWFsbHkKPiBidWlsZGluZyBrZXJuZWwgbW9k
dWxlcywgbm90IHVzZXJsYW5kIHN0dWZmLCBiZWNhdXNlIGl0IGNvbnRhaW5zCj4gdmFyaWFibGVz
IHRoYXQgYXJlIG5vdCB2YWxpZCBvdGhlcndpc2UuCj4gCj4gRm9yIGV4YW1wbGUsIGl0IG92ZXJy
aWRlcyBIT1NUQ0Mgd2l0aCBhIHZhbHVlIHRoYXQgaXMgbm90IGNvcnJlY3QKPiBvdXRzaWRlIG9m
IGJ1bGRpbmcgdGhlIGtlcm5lbC4gSXQgYWxzbyBjb25kaXRpb25hbGx5IGNvbnRhaW5zIHRoZQo+
IHVuc2NvcGVkIHZhcmlhYmxlIExPQURBRERSLCB3aGljaCBuYW1lIGlzIHRvbyBnZW5lcmljLgo+
IAo+IEFsc28sIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgd2UgbmVlZCB0aGVzZSBhdCBjb25maWd1
cmUgdGltZSwgYmVjYXVzZSB3ZQo+IGFyZSB1c2luZyB0aGUga2VybmVsLW1vZHVsZSBpbmZyYSB0
byBidWlsZCB0aGUga2VybmVsIG1vZHVsZS4uLiBBbmQKPiBiYXNpY2FsbHksIHRoZSB0d28gYXJl
IG1vc3RseSBtdXR1YWxseSBleGNsdXNpdmUuLi4KClRoZSBjb25maWd1cmUgc2NyaXB0IGlzIHRy
eWluZyB0byBidWlsZCBhIGtlcm5lbCBtb2R1bGUgdG8gY2hlY2sgaWYgaXRzIGFibGUgdG8KYnVp
bGQgemZzIG1vZHVsZXMuIFdpdGhvdXQgTElOVVhfTUFLRV9GTEFHUywgaXQgdHJ5IHRvIGJ1aWxk
IHRoZSBtb2R1bGUgZm9yIHRoZQpob3N0IG1hY2hpbmUgdGhhdCBmYWlsIHRvIGJ1aWxkIHdpdGgg
b2xkIGNvbXBpbGVyL2Rpc3RyaWJ1dGlvbi4KCkkgaGF2ZW4ndCBsb29rZWQgZGVlcGx5IHRvIHRo
ZSBidWlsZHN5c3RlbS4uLgoKPiAKPj4gLS0tCj4+ICAuLi5pbi1kb24tdC11c2UtREVTVERJUi1h
bmQtSU5TVEFMTF9NT0QucGF0Y2ggfCA0NCArKysrKysrKysrKysrKysrKysrCj4+ICBwYWNrYWdl
L3pmcy96ZnMubWsgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKysKPj4gIDIgZmls
ZXMgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvemZzLzAwMDEtbW9kdWxlLU1ha2VmaWxlLmluLWRvbi10LXVzZS1ERVNURElSLWFuZC1JTlNU
QUxMX01PRC5wYXRjaAo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS96ZnMvMDAwMS1tb2R1bGUt
TWFrZWZpbGUuaW4tZG9uLXQtdXNlLURFU1RESVItYW5kLUlOU1RBTExfTU9ELnBhdGNoIGIvcGFj
a2FnZS96ZnMvMDAwMS1tb2R1bGUtTWFrZWZpbGUuaW4tZG9uLXQtdXNlLURFU1RESVItYW5kLUlO
U1RBTExfTU9ELnBhdGNoCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAw
MDAuLmUxZDBmOTE1MzMKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9wYWNrYWdlL3pmcy8wMDAx
LW1vZHVsZS1NYWtlZmlsZS5pbi1kb24tdC11c2UtREVTVERJUi1hbmQtSU5TVEFMTF9NT0QucGF0
Y2gKPj4gQEAgLTAsMCArMSw0NCBAQAo+PiArRnJvbSAxMjg1MWE4ZGJjMGFlYjhlNDhmMjFmMWUw
Y2I3YjMxMjMwMjk1OTRlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+PiArRnJvbTogUm9tYWlu
IE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+PiArRGF0ZTogVGh1LCAyNiBBdWcgMjAy
MSAyMzoxMjozMSArMDIwMAo+PiArU3ViamVjdDogW1BBVENIXSBtb2R1bGUvTWFrZWZpbGUuaW46
IGRvbid0IHVzZSBERVNURElSIGFuZCBJTlNUQUxMX01PRF9QQVRICj4+ICsgdG9nZXRoZXIKPj4g
Kwo+PiArREVTVERJUiBhbmQgSU5TVEFMTF9NT0RfUEFUSCBhcmUgdXN1YWxseSBzZXQgd2l0aCBh
YnNvbHV0ZSBwYXRoCj4+ICtieSBidWlsZCBzeXN0ZW0gKEJ1aWxkcm9vdCksIHNvIHdoZW4gdXNl
ZCB0b2dldGhlciBpdCBjb25jYXRlbmF0ZXMKPj4gK3R3byBhYnNvbHV0ZSBwYXRoLgo+PiArCj4+
ICtLZWVwIElOU1RBTExfTU9EX1BBVEggc2luY2UgaXQncyBzZXQgd2hlbiBidWlsZGluZyBhbiBv
dXQgb2YgdHJlZQo+PiAra2VybmVsIG1vZHVsZS4KPj4gKwo+PiArU2lnbmVkLW9mZi1ieTogUm9t
YWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+IAo+IFRoYXQgcGF0Y2ggb24gaXRz
IG93biBpcyBjb3JyZWN0LCB0aG91Z2guIEl0IHNob3VsZCBiZSBwdXNoZWQgdXBzdHJlYW0uCgpv
aywKCj4gCj4+ICstLS0KPj4gKyBtb2R1bGUvTWFrZWZpbGUuaW4gfCA2ICsrKy0tLQo+PiArIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+ICsKPj4gK2Rp
ZmYgLS1naXQgYS9tb2R1bGUvTWFrZWZpbGUuaW4gYi9tb2R1bGUvTWFrZWZpbGUuaW4KPj4gK2lu
ZGV4IDY5Y2FmNDg1Ny4uMDQzZjJiZGVhIDEwMDY0NAo+PiArLS0tIGEvbW9kdWxlL01ha2VmaWxl
LmluCj4+ICsrKysgYi9tb2R1bGUvTWFrZWZpbGUuaW4KPj4gK0BAIC03NiwxNSArNzYsMTUgQEAg
Y2xlYW46IGNsZWFuLUBhY19zeXN0ZW1ACj4+ICsgbW9kdWxlc19pbnN0YWxsLUxpbnV4Ogo+PiAr
IAlAIyBJbnN0YWxsIHRoZSBrZXJuZWwgbW9kdWxlcwo+PiArIAkkKE1BS0UpIC1DIEBMSU5VWF9P
QkpAIE09YHB3ZGAgbW9kdWxlc19pbnN0YWxsIFwKPj4gKy0JCUlOU1RBTExfTU9EX1BBVEg9JChE
RVNURElSKSQoSU5TVEFMTF9NT0RfUEFUSCkgXAo+PiArKwkJSU5TVEFMTF9NT0RfUEFUSD0kKElO
U1RBTExfTU9EX1BBVEgpIFwKPj4gKyAJCUlOU1RBTExfTU9EX0RJUj0kKElOU1RBTExfTU9EX0RJ
UikgXAo+PiArIAkJS0VSTkVMUkVMRUFTRT1ATElOVVhfVkVSU0lPTkAKPj4gKyAJQCMgUmVtb3Zl
IGV4dHJhbmVvdXMgYnVpbGQgcHJvZHVjdHMgd2hlbiBwYWNrYWdpbmcKPj4gKy0Ja21vZGRpcj0k
KERFU1RESVIpJChJTlNUQUxMX01PRF9QQVRIKS9saWIvbW9kdWxlcy9ATElOVVhfVkVSU0lPTkA7
IFwKPj4gKysJa21vZGRpcj0kKElOU1RBTExfTU9EX1BBVEgpL2xpYi9tb2R1bGVzL0BMSU5VWF9W
RVJTSU9OQDsgXAo+PiArIAlpZiBbIC1uICIkKERFU1RESVIpIiBdOyB0aGVuIFwKPj4gKyAJCWZp
bmQgJCRrbW9kZGlyIC1uYW1lICdtb2R1bGVzLionIHwgeGFyZ3MgJChSTSk7IFwKPj4gKyAJZmkK
Pj4gKy0Jc3lzbWFwPSQoREVTVERJUikkKElOU1RBTExfTU9EX1BBVEgpL2Jvb3QvU3lzdGVtLm1h
cC1ATElOVVhfVkVSU0lPTkA7IFwKPj4gKysJc3lzbWFwPSQoSU5TVEFMTF9NT0RfUEFUSCkvYm9v
dC9TeXN0ZW0ubWFwLUBMSU5VWF9WRVJTSU9OQDsgXAo+PiArIAlpZiBbIC1mICQkc3lzbWFwIF07
IHRoZW4gXAo+PiArIAkJZGVwbW9kIC1hZSAtRiAkJHN5c21hcCBATElOVVhfVkVSU0lPTkA7IFwK
Pj4gKyAJZmkKPj4gKy0tIAo+PiArMi4zMS4xCj4+ICsKPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
emZzL3pmcy5tayBiL3BhY2thZ2UvemZzL3pmcy5tawo+PiBpbmRleCAzYjFhZmI0MTlhLi41Mzdk
NGVjZTE1IDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3pmcy96ZnMubWsKPj4gKysrIGIvcGFja2Fn
ZS96ZnMvemZzLm1rCj4+IEBAIC0xMyw2ICsxMywxMSBAQCBaRlNfQ1BFX0lEX1BST0RVQ1QgPSBv
cGVuemZzCj4+ICAKPj4gIFpGU19BVVRPUkVDT05GID0gWUVTCj4+ICAKPj4gKyMgY3Jvc3MgY29t
cGlsZSBlbnZpcm9ubWVudCBmb3IgbGludXgga2VybmVsIG1vZHVsZQo+PiArWkZTX01BS0VfRU5W
ID0gJChMSU5VWF9NQUtFX0ZMQUdTKQo+PiArIyBgLi9jb25maWd1cmVgIHdpbGwgZXhlY3V0ZSBh
IGBtYWtlIG1vZHVsZXNgIHRlc3QgY2FzZQo+PiArWkZTX0NPTkZfRU5WID0gJChMSU5VWF9NQUtF
X0ZMQUdTKQo+IAo+IFRoaXMgaHVuayBJIGFtIG5vdCB0b28gaGFwcHkgYWJvdXQuLi4gOi0vCgpJ
IHVuZGVyc3RhbmQuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBSZWdhcmRzLAo+IFlhbm4g
RS4gTU9SSU4uCj4gCj4+ICBaRlNfREVQRU5ERU5DSUVTID0gbGliYWlvIG9wZW5zc2wgdWRldiB1
dGlsLWxpbnV4IHpsaWIKPj4gIAo+PiAgIyBzeXN2aW5pdCBpbnN0YWxscyBvbmx5IGEgY29tbWVu
dGVkLW91dCBtb2R1bGVzLWxvYWQuZC8gY29uZmlnIGZpbGUKPj4gLS0gCj4+IDIuMzEuMQo+Pgo+
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBidWls
ZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidXN5Ym94Lm5ldAo+PiBodHRwOi8vbGlz
dHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
