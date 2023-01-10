Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4B1C46467
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 12:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10F4B60FA6;
	Tue, 10 Jan 2023 12:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10F4B60FA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9qMd-Yx8TD1r; Tue, 10 Jan 2023 12:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ECC560F93;
	Tue, 10 Jan 2023 12:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ECC560F93
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0083C1BF307
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 12:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D00D281390
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 12:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D00D281390
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wwF4dkPvZ4vm for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 12:35:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B894480B22
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B894480B22
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 12:35:07 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id i9so17339144edj.4
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 04:35:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RX6mYVhTsmUKKl4wjPO/2/0n1Ip4yRTS0WdSl78ibYs=;
 b=PLx6MwJEjyIFTj8wNkkbLH2ppookQSXWspRq6nn19etJE4SEOxLJ4IzTgBFPFjHAXs
 x71AquZLah2npV17frUE+8OyKp5gFIZBIsS92L1Vyjj6C318fqThXfVhy4ourfNtXUUK
 hVvJB2xmddjgbex3xhkYYCeZhNhRfA0pC15nb1lNxm2LdOcFnZSVUpZZzRyW4esuSV3+
 XQpwL8ZIqtPFW5tzEN5npyqVEhXpKlXUmFuNSgr2lMYeCIXN2yrLK6bta+4mDTolh7Qr
 Vs2Ae4047Mil2GlWe1/4phBrSPslu/Cz131L2CQNdv/gIHaYR3VGI32gROIAlqIQlgjq
 OzNw==
X-Gm-Message-State: AFqh2krkZjMhiD0Mb7cmPqBH5f1O6w+R8Jn0d9Nk2RBvk/OAicBU6qN2
 b4AiJaQNjlrln1odSp/l08/02WsdIDvE6XNm5io=
X-Google-Smtp-Source: AMrXdXsu2I7WWpnTCZPI7PEcNHLcZhsjWt4nN9+i7k7aX/iJfhp+ZlvVY9XKIz6nPl0HI+8MGADyoaB26it2T5m7Xj8=
X-Received: by 2002:aa7:d689:0:b0:46b:2f7f:6fe4 with SMTP id
 d9-20020aa7d689000000b0046b2f7f6fe4mr7835163edr.189.1673354105938; Tue, 10
 Jan 2023 04:35:05 -0800 (PST)
MIME-Version: 1.0
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
 <20221128175851.1913859-5-james.hilliard1@gmail.com>
In-Reply-To: <20221128175851.1913859-5-james.hilliard1@gmail.com>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 10 Jan 2023 13:34:54 +0100
Message-ID: <CAKcgs2zzFm+SvhxZH-B_Ex0rX1=37UncnaJkX043Pzdo8HUocg@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RX6mYVhTsmUKKl4wjPO/2/0n1Ip4yRTS0WdSl78ibYs=;
 b=GsxctlcHuUPahRLZZUvDoWcpklbS7nrw1X+KusqbmOq/qlXcl7caVkTQ8C+FR6aRmr
 jVpXL55mkffgZUcnFo5269+gcUaaHqY3XxBgExz/a2j/FyK3U/Yhsv6dsrj0yucKh99v
 jlLx8112YCeCLCWxY30F68SalA0vGMJP8nXwJx7o/gugW9K25o9OfxlJbHAJnp034PFE
 gu4M7Nka1E0wtGCmqZIi/EzKk5cp+vjZLZsXf1oBt+NCMogT2xWjoxWgEn3P89p8Ayg8
 ukz+r6Y6J7NSEpBG0rkAPOvAAk/6ru2s7ZjjJXO4CZQRsvbxxdKIM2uBK7YabtyZ/Ruv
 2oiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GsxctlcH
Subject: Re: [Buildroot] [PATCH v2 5/8] package/neon-2-sse: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsIEhpIFN0ZWZhbiwKCkxlIGx1bi4gMjggbm92LiAyMDIyIMOgIDE5OjAwLCBKYW1l
cyBIaWxsaWFyZAo8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4gYSDDqWNyaXQgOgo+Cj4gVGhp
cyBwYWNrYWdlIGlzIHJlcXVpcmVkIGJ5IHRlbnNvcmZsb3ctbGl0ZS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+IC0tLQo+ICBw
YWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgIHwgIDEgKwpJZiB5b3Ugd2FudCB0byBi
ZSBtYWludGFpbmVycyBmb3IgdGhpcyBwYWNrYWdlLCBkbyBub3QgZm9yZ2V0IHRvCnVwZGF0ZSB0
aGUgREVWRUxPUEVSUyBmaWxlLgoKPiAgcGFja2FnZS9uZW9uLTItc3NlL0NvbmZpZy5pbiAgICAg
ICB8ICA5ICsrKysrKysrKwo+ICBwYWNrYWdlL25lb24tMi1zc2UvbmVvbi0yLXNzZS5oYXNoIHwg
IDQgKysrKwo+ICBwYWNrYWdlL25lb24tMi1zc2UvbmVvbi0yLXNzZS5tayAgIHwgMTQgKysrKysr
KysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL25lb24tMi1zc2UvQ29uZmlnLmluCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL25lb24tMi1zc2UvbmVvbi0yLXNzZS5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL25lb24tMi1zc2UvbmVvbi0yLXNzZS5tawo+Cj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KPiBpbmRleCBkMGQ5ZDI5MDVjLi4y
ZWM2MjNlZDhmIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCj4gKysrIGIvcGFja2Fn
ZS9Db25maWcuaW4KPiBAQCAtMjA4Niw2ICsyMDg2LDcgQEAgZW5kaWYKPiAgICAgICAgIHNvdXJj
ZSAicGFja2FnZS9tc2dwYWNrL0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9t
dXNsLWNvbXBhdC1oZWFkZXJzL0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9t
dXNsLWZ0cy9Db25maWcuaW4iCj4gKyAgICAgICBzb3VyY2UgInBhY2thZ2UvbmVvbi0yLXNzZS9D
b25maWcuaW4iCj4gICAgICAgICBzb3VyY2UgInBhY2thZ2Uvb3BlbmJsYXMvQ29uZmlnLmluIgo+
ICAgICAgICAgc291cmNlICJwYWNrYWdlL29yYy9Db25maWcuaW4iCj4gICAgICAgICBzb3VyY2Ug
InBhY2thZ2UvcDExLWtpdC9Db25maWcuaW4iCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbmVvbi0y
LXNzZS9Db25maWcuaW4gYi9wYWNrYWdlL25lb24tMi1zc2UvQ29uZmlnLmluCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4yNTYxM2M1ZWM0Cj4gLS0tIC9kZXYvbnVs
bAo+ICsrKyBiL3BhY2thZ2UvbmVvbi0yLXNzZS9Db25maWcuaW4KPiBAQCAtMCwwICsxLDkgQEAK
PiArY29uZmlnIEJSMl9QQUNLQUdFX05FT05fMl9TU0UKPiArICAgICAgIGJvb2wgIm5lb24tMi1z
c2UiCj4gKyAgICAgICBoZWxwCj4gKyAgICAgICAgIFRoZSBwbGF0Zm9ybSBpbmRlcGVuZGVudCBo
ZWFkZXIgYWxsb3dpbmcgdG8gY29tcGlsZSBhbnkKPiArICAgICAgICAgQy9DKysgY29kZSBjb250
YWluaW5nIEFSTSBORU9OIGludHJpbnNpYyBmdW5jdGlvbnMgZm9yCj4gKyAgICAgICAgIHg4NiB0
YXJnZXQgc3lzdGVtcyB1c2luZyBTSU1EIHVwIHRvIFNTRTQgaW50cmluc2ljCj4gKyAgICAgICAg
IGZ1bmN0aW9ucy4KPiArCj4gKyAgICAgICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9BUk1f
TkVPTl8yX3g4Nl9TU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9uZW9uLTItc3NlL25lb24tMi1z
c2UuaGFzaCBiL3BhY2thZ2UvbmVvbi0yLXNzZS9uZW9uLTItc3NlLmhhc2gKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmRlZDIwZDU4ZjUKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvcGFja2FnZS9uZW9uLTItc3NlL25lb24tMi1zc2UuaGFzaAo+IEBAIC0wLDAgKzEs
NCBAQAo+ICsjIExvY2FsbHkgY2FsY3VsYXRlZAo+ICtzaGEyNTYgIDAxOWZiYzdlYzI1ODYwMDcw
YTFkOTBlMTI2ODZmYzE2MGNmYjMzZTIyYWEwNjNjODBmNTJiMzYzZjEzNjFlOWQgIG5lb24tMi1z
c2UtYTE1YjQ4OWUxMjIyYjIwODcwMDc1NDZiNDkxMmUyMTI5M2VhODZmZi50YXIuZ3oKPiArIyBM
aWNlbnNlIGZpbGVzLCBsb2NhbGx5IGNhbGN1bGF0ZWQKPiArc2hhMjU2ICA3MDIyZjUxYjQzOWE1
OTE1ZTkzM2VjYzI3MGM4M2UyNGNhMGNiMmNjZWViMDhiMDEzMmRjZDRkYmIwM2VkMmRjICBMSUNF
TlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbmVvbi0yLXNzZS9uZW9uLTItc3NlLm1rIGIvcGFj
a2FnZS9uZW9uLTItc3NlL25lb24tMi1zc2UubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGlu
ZGV4IDAwMDAwMDAwMDAuLjBlOWQwNjZhYmQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2Fn
ZS9uZW9uLTItc3NlL25lb24tMi1zc2UubWsKPiBAQCAtMCwwICsxLDE0IEBACj4gKyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBuZW9uLTItc3NlCj4gKyMKPiArIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKPiArCj4gK05FT05fMl9TU0VfVkVSU0lPTiA9IGExNWI0ODllMTIyMmIyMDg3
MDA3NTQ2YjQ5MTJlMjEyOTNlYTg2ZmYKPiArTkVPTl8yX1NTRV9TSVRFID0gJChjYWxsIGdpdGh1
YixpbnRlbCxBUk1fTkVPTl8yX3g4Nl9TU0UsJChORU9OXzJfU1NFX1ZFUlNJT04pKQo+ICtORU9O
XzJfU1NFX0xJQ0VOU0UgPSBCU0QtMi1DbGF1c2UKPiArTkVPTl8yX1NTRV9MSUNFTlNFX0ZJTEVT
ID0gTElDRU5TRQo+ICtORU9OXzJfU1NFX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+ICtORU9OXzJf
U1NFX0lOU1RBTExfVEFSR0VUID0gTk8KPiArCj4gKyQoZXZhbCAkKGNtYWtlLXBhY2thZ2UpKQo+
IC0tCj4gMi4zNC4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAp0aGFua3MKR2lsbGVzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
