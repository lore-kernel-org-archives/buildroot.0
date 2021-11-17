Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF06CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:38:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BF0F61AD0
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6BF0F61AD0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2603D40452;
	Wed, 17 Nov 2021 21:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JWzMUU0DpuLU; Wed, 17 Nov 2021 21:38:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2278E400EB;
	Wed, 17 Nov 2021 21:38:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 081871BF307
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB145400EB
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:38:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6JH_HXlLUBPv for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 21:38:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1970400D0
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 21:38:05 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id y13so17116444edd.13
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 13:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=t+s7USTxYXl4yHb1ffkOGGNeiA1zINriBRzfgmmBmo4=;
 b=gMpT9TwEUopZxqhuMhTa1hEbY0kQQSS8JkViSLLcHg3P0t31bu8rVBUohR85jpsUy2
 2zJm/B9I1OWVxNb36RJMGY6dixuiRHnGu1KTzGiX8F6d+LP/EftW0h05VcQHeETBchiG
 3hPVzWqZMvQLk08j742IthyAFDH6xRQVOXCWqiXRU6BtkbMWl2Eko1wKzrBw2xEWZSVx
 YsKbP4a2VrKk5npMNgu8mHcJDC8zVYKNUacqQMraQia4sa5MiCU1h0x3sbqSH868//jC
 yhMY0ThdWkyJGFirjh2PuZiRgXgJKw1ZUODzXv9Y83/JUlKDI+6jkrrwVkUWPGUgGoK0
 JYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=t+s7USTxYXl4yHb1ffkOGGNeiA1zINriBRzfgmmBmo4=;
 b=X/DO6HlyRkyiGG0rhYyXP+ptgHSw4rHscaK+0t3QX2zn3Pc+xcn+Lq3veAZSgRQbiC
 dxW9C9p14QT7kAFtFAG1U7w7US66uf69R9L/CI+XAmTIMjUbiRq1oDfEk62xpn2KTvuW
 hgMx1ZzYO3vmhXyNE7UVrLF7cOgEa6M+oZFM8AxvswKNE4o/OnEwrWNhL7dbdlI6Szue
 6KQmFNwh1ONCnG91zHo+oT84QBOPS7IlIgm2sq8L2EwRHPIsvx14TY0fMTKqyTBLugn8
 Uc1pvFghIiKKJ5OBlFX5Runk3Oq7negXVoCtPhrNKP5vcBJTmRe91o/y9pxI6TDJo+TM
 cyCQ==
X-Gm-Message-State: AOAM532JEjfDt7U07q/oEXAgpsRrxa3UnjNG8bZjsHwht7OGfB+af+cE
 ndvTCYebW72v2n74EMlzlLgGRuvxmYIfaQ==
X-Google-Smtp-Source: ABdhPJysH5Ehd9+rC4Hwxv+FnPTQKkJ8/18vLXjHJH6h/IV+7gF5W18SE7bP5Ig2f8Hx3L0w+Xr4ww==
X-Received: by 2002:a05:6402:1c01:: with SMTP id
 ck1mr3013134edb.262.1637185083886; 
 Wed, 17 Nov 2021 13:38:03 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e4sm489166ejs.13.2021.11.17.13.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 13:38:03 -0800 (PST)
Message-ID: <f67157e7-c19d-ac2f-380d-7f63d089ed84@mind.be>
Date: Wed, 17 Nov 2021 22:38:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
References: <20211027083502.5530-1-sebastien.szymanski@armadeus.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211027083502.5530-1-sebastien.szymanski@armadeus.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/stress-ng: bump to version
 0.13.05
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNy8xMC8yMDIxIDEwOjM1LCBTw6liYXN0aWVuIFN6eW1hbnNraSB3cm90ZToKPiBUaGUg
cHJvamVjdCBVUkwgcmV0dXJucyA0MDQgZXJyb3IgYmVjYXVzZToKPiAKPiBRdW90aW5nIENvbGlu
ZyBLaW5nOgo+ICJVbmZvcnR1bmF0ZWx5IHdoZW4gSSBsZWZ0IENhbm9uaWNhbCBsYXN0IHdlZWsg
dGhleSByZW1vdmVkIG15IHRhcmJhbGxzIgo+IAo+IFNvIHVzZSBnaXRodWIgYW5kIHVwZGF0ZSBo
YXNoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4u
c3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KCiAgQXBwbGllZCB0byBuZXh0LCB0aGFua3MuIE9yIHNo
b3VsZCBJIGhhdmUgYXBwbGllZCBpdCB0byBtYXN0ZXI/IFdlIHNob3VsZCBhdCAKbGVhc3QgYXBw
bHkgdGhlIGNoYW5nZSBvZiBfU0lURSB0byBtYXN0ZXIuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+
IC0tLQo+IAo+IENoYW5nZXMgZm9yIHYyOgo+ICAgLSBmaXggdGFyYmFsbCBuYW1lIGluIC5oYXNo
IGZpbGUKPiAKPiAgIHBhY2thZ2Uvc3RyZXNzLW5nL0NvbmZpZy5pbiAgICAgIHwgMiArLQo+ICAg
cGFja2FnZS9zdHJlc3Mtbmcvc3RyZXNzLW5nLmhhc2ggfCAyICstCj4gICBwYWNrYWdlL3N0cmVz
cy1uZy9zdHJlc3MtbmcubWsgICB8IDUgKystLS0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3N0cmVz
cy1uZy9Db25maWcuaW4gYi9wYWNrYWdlL3N0cmVzcy1uZy9Db25maWcuaW4KPiBpbmRleCA2NGI0
NzNiNzVjLi44MzljYmIxY2MwIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvc3RyZXNzLW5nL0NvbmZp
Zy5pbgo+ICsrKyBiL3BhY2thZ2Uvc3RyZXNzLW5nL0NvbmZpZy5pbgo+IEBAIC0xMiw3ICsxMiw3
IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9TVFJFU1NfTkcKPiAgIAkgIHN1YnN5c3RlbXMgb2YgYSBj
b21wdXRlciBhcyB3ZWxsIGFzIHRoZSB2YXJpb3VzIG9wZXJhdGluZwo+ICAgCSAgc3lzdGVtIGtl
cm5lbCBpbnRlcmZhY2VzLgo+ICAgCj4gLQkgIGh0dHA6Ly9rZXJuZWwudWJ1bnR1LmNvbS9+Y2tp
bmcvc3RyZXNzLW5nLwo+ICsJICBodHRwczovL2dpdGh1Yi5jb20vQ29saW5JYW5LaW5nL3N0cmVz
cy1uZwo+ICAgCj4gICBjb21tZW50ICJzdHJlc3MtbmcgbmVlZHMgYSB0b29sY2hhaW4gdy8gaGVh
ZGVycyA+PSAzLjMiCj4gICAJZGVwZW5kcyBvbiAhQlIyX25pb3MyICYmICFCUjJfYXJjCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5oYXNoIGIvcGFja2FnZS9zdHJl
c3Mtbmcvc3RyZXNzLW5nLmhhc2gKPiBpbmRleCBmM2ViNzZmYTgyLi4yZTNmOTk4NzY5IDEwMDY0
NAo+IC0tLSBhL3BhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5oYXNoCj4gKysrIGIvcGFja2Fn
ZS9zdHJlc3Mtbmcvc3RyZXNzLW5nLmhhc2gKPiBAQCAtMSwzICsxLDMgQEAKPiAgICMgTG9jYWxs
eSBjYWxjdWxhdGVkCj4gLXNoYTI1NiAgZjM3ZjczOWU0ZDE1MzQzMzYwYTQ3OTgwYjY3ZGM4YjJh
NmJmM2Q0ZDNlZjcyN2Q1NWUyZGQ5OWEwYjY0ZjllYSAgc3RyZXNzLW5nLTAuMTMuMDEudGFyLnh6
Cj4gK3NoYTI1NiAgM2RlNDllMTEwMDg2NjYzNGY1NDllOTljMTY0NDI4M2QwY2RlODE3Yjg0NGE2
OWRjZjdmODBhZmEyMjI3ZDM1MCAgc3RyZXNzLW5nLTAuMTMuMDUudGFyLmd6Cj4gICBzaGEyNTYg
IDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYxODRkOGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAxMDUy
MWI4ODA2NDMgIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zdHJlc3Mtbmcvc3RyZXNz
LW5nLm1rIGIvcGFja2FnZS9zdHJlc3Mtbmcvc3RyZXNzLW5nLm1rCj4gaW5kZXggZTBiMzg1ZTc1
Ni4uMGIyMjg3YzdmYiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3N0cmVzcy1uZy9zdHJlc3Mtbmcu
bWsKPiArKysgYi9wYWNrYWdlL3N0cmVzcy1uZy9zdHJlc3MtbmcubWsKPiBAQCAtNCw5ICs0LDgg
QEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAKPiAtU1RSRVNTX05HX1ZF
UlNJT04gPSAwLjEzLjAxCj4gLVNUUkVTU19OR19TT1VSQ0UgPSBzdHJlc3MtbmctJChTVFJFU1Nf
TkdfVkVSU0lPTikudGFyLnh6Cj4gLVNUUkVTU19OR19TSVRFID0gaHR0cHM6Ly9rZXJuZWwudWJ1
bnR1LmNvbS9+Y2tpbmcvdGFyYmFsbHMvc3RyZXNzLW5nCj4gK1NUUkVTU19OR19WRVJTSU9OID0g
MC4xMy4wNQo+ICtTVFJFU1NfTkdfU0lURSA9ICQoY2FsbCBnaXRodWIsQ29saW5JYW5LaW5nLHN0
cmVzcy1uZyxWJChTVFJFU1NfTkdfVkVSU0lPTikpCj4gICBTVFJFU1NfTkdfTElDRU5TRSA9IEdQ
TC0yLjArCj4gICBTVFJFU1NfTkdfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiAgIAo+IApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
