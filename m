Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B68AC46467
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 12:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0238340985;
	Tue, 10 Jan 2023 12:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0238340985
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wg2KbwwbLzpn; Tue, 10 Jan 2023 12:28:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF1754093F;
	Tue, 10 Jan 2023 12:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF1754093F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E9DD21BF307
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 12:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD0C4605D5
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 12:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD0C4605D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zDmdBzzO08A2 for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 12:28:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 883706059F
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 883706059F
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 12:28:38 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id vm8so28151492ejc.2
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 04:28:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uISIZhAL37zMrL78jT312G6MDPHpgJ2Ja+MUiZaHpAA=;
 b=bHGdgmwQQG6YzFkEJP8ZKmVfgZnW+OQqY1a5erRXKeK8cG5l6wAOkynZP/ORzcTXhZ
 sVOSMRx4VdZ9JyB1vuAMSFhj1ZxYzQXAUocrBWYX+K8dn5iltabKGJZtB0F4vnHyyRFH
 ub58z5wyLyQRBk7gdFT1Lu52004vmFFabaJlG9GqENk3Kby/10tzxhYO2FgDou3DJ42c
 0Fb1v42n7vt7hvOH2zHajd6tFH9MPeb08/n2EfELca7WiiQU4peAe/cBVw9xOljPHHSx
 jYcN1gsJbghFBRJbvBj+ceUErlYAvsWTN7OdMqW+9NkhJphBozzLPNZJ/7A04rEWIF5/
 f0lA==
X-Gm-Message-State: AFqh2koP3LYjQ/tK1Bs6FYPhTRdBn7PHVi+Zp/1pCIZ315CaauNyr0Ro
 1aF29goGMJrGO5uK/41be6GyuZsgSwAaumfi5YY=
X-Google-Smtp-Source: AMrXdXu+DGRYdRxAdAEx0V6Esd4Qyg95U1c388yyl4BzohRW7uzPsB/a1mZFl2JgtsIpGLfVggO0PiuGS5XP5bX9WLA=
X-Received: by 2002:a17:907:c786:b0:7fc:4242:f9ea with SMTP id
 tz6-20020a170907c78600b007fc4242f9eamr3943882ejc.99.1673353716721; Tue, 10
 Jan 2023 04:28:36 -0800 (PST)
MIME-Version: 1.0
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
 <20221128175851.1913859-2-james.hilliard1@gmail.com>
In-Reply-To: <20221128175851.1913859-2-james.hilliard1@gmail.com>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 10 Jan 2023 13:28:24 +0100
Message-ID: <CAKcgs2xGiCkwvOAt__Yutw_goTzSG1VT4Vt_BQzuPFadTC6m1g@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uISIZhAL37zMrL78jT312G6MDPHpgJ2Ja+MUiZaHpAA=;
 b=p0ndTDUqMb9kZ9ufmqcrgWthRZ9AVwvceK2ytuOgPwWA8bMYLqsu/6p2PAs+L5b66m
 m7AwlTwO5GOXBpNLizwRS7EyHU67x5WQJc4ZD9VjhZ9OxIm1ASGXsRYniqazdNJqLbMk
 xJSW6Z/x+PT1M8YB0K+mJHX0xu13Zjg1+xfqSJkFCLOrwDNm8DLDW/cAUqzwGGDWEg+F
 7+1HlXXNRxRcj9YBpQyHRhPwvigN5uL3YLBxEnpRrg5Ew0yUutcVMPO/DnPZuRMZPA3Q
 rPIs9bBxINHNAJBqDM+Esn38v9Naot8eZIsifjrFN0yZMyHw1FU1itw5GRwMnhq6cGCy
 0a0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=p0ndTDUq
Subject: Re: [Buildroot] [PATCH v2 2/8] package/cpuinfo: new package
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

SGkgSmFtZXMsIGhpIFN0ZWZhbiwKCnRoYW5rcyBhIGxvdCBmb3IgdGhlIHdob2xlIHRlbnNvcmZs
b3cgbGl0ZSBjb250cmlidXRpb24KSnVzdCBhIGZldyBjb21tZW50cyBoZXJlIGFuZCB0aGVyZS4K
dGhhbmtzCkdpbGxlcy4KCkxlIGx1bi4gMjggbm92LiAyMDIyIMOgIDE5OjAwLCBKYW1lcyBIaWxs
aWFyZAo8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4gYSDDqWNyaXQgOgo+Cj4gRnJvbTogU3Rl
ZmFuIEhhZ2VyIDxzdGVmYW4uaGFnZXJAZ2luemluZ2VyLmNvbT4KPgo+IFRoaXMgcGFja2FnZSBp
cyByZXF1aXJlZCBieSB0ZW5zb3JmbG93LWxpdGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4g
SGFnZXIgPHN0ZWZhbi5oYWdlckBnaW56aW5nZXIuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbWVz
IEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+IC0tLQo+ICBwYWNrYWdlL0Nv
bmZpZy5pbiAgICAgICAgICAgIHwgIDEgKwpEb24ndCB5b3Ugd2FudCB0byBiZSBtYWludGFpbmVy
cyBmb3IgdGhpcyBwYWNrYWdlPyBJZiBzbywgeW91IHNob3VsZAp1cGRhdGUgdGhlIERFVkVMT1BF
UlMgZmlsZS4KCj4gIHBhY2thZ2UvY3B1aW5mby9Db25maWcuaW4gICAgfCAgOSArKysrKysrKysK
PiAgcGFja2FnZS9jcHVpbmZvL2NwdWluZm8uaGFzaCB8ICA0ICsrKysKPiAgcGFja2FnZS9jcHVp
bmZvL2NwdWluZm8ubWsgICB8IDE3ICsrKysrKysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdl
ZCwgMzEgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9jcHVpbmZv
L0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9jcHVpbmZvL2NwdWluZm8u
aGFzaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9jcHVpbmZvL2NwdWluZm8ubWsKPgo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCj4gaW5k
ZXggYWVmODBmOWFiMC4uZTA5ZmEwYjNiZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL0NvbmZpZy5p
bgo+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj4gQEAgLTQ2NSw2ICs0NjUsNyBAQCBlbmRtZW51
Cj4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvY2MtdG9vbC9Db25maWcuaW4iCj4gICAgICAgICBz
b3VyY2UgInBhY2thZ2UvY2Rya2l0L0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2Fn
ZS9jcHVidXJuLWFybS9Db25maWcuaW4iCj4gKyAgICAgICBzb3VyY2UgInBhY2thZ2UvY3B1aW5m
by9Db25maWcuaW4iCklmIGl0IGlzIGEgbGlicmFyeSwgSSB3b3VsZCBwdXQgdGhpcyBwYWNrYWdl
IHVuZGVyIExpYnJhcmllcyAtPgpIYXJkd2FyZSBoYW5kbGluZwoKPiAgICAgICAgIHNvdXJjZSAi
cGFja2FnZS9jcnVjaWJsZS9Db25maWcuaW4iCj4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvY3J5
cHRzZXR1cC9Db25maWcuaW4iCj4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvY3dpaWQvQ29uZmln
LmluIgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2NwdWluZm8vQ29uZmlnLmluIGIvcGFja2FnZS9j
cHVpbmZvL0NvbmZpZy5pbgo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAw
MC4uMTM3ZjY1N2Q2OQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2NwdWluZm8vQ29u
ZmlnLmluCj4gQEAgLTAsMCArMSw5IEBACj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9DUFVJTkZPCj4g
KyAgICAgICBib29sICJjcHVpbmZvIgo+ICsgICAgICAgZGVwZW5kcyBvbiBCUjJfSU5TVEFMTF9M
SUJTVERDUFAKPiArICAgICAgIGhlbHAKPiArICAgICAgICAgQ1BVIElORk9ybWF0aW9uIGxpYnJh
cnksIGNwdWluZm8gaXMgYSBsaWJyYXJ5IHRvIGRldGVjdAo+ICsgICAgICAgICBlc3NlbnRpYWwg
Zm9yIHBlcmZvcm1hbmNlIG9wdGltaXphdGlvbiBpbmZvcm1hdGlvbiBhYm91dAo+ICsgICAgICAg
ICBob3N0IENQVS4KPiArCj4gKyAgICAgICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9weXRvcmNoL2Nw
dWluZm8KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9jcHVpbmZvL2NwdWluZm8uaGFzaCBiL3BhY2th
Z2UvY3B1aW5mby9jcHVpbmZvLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAw
MDAwMDAwMDAuLmMzZjcwZmE5MGYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9jcHVp
bmZvL2NwdWluZm8uaGFzaAo+IEBAIC0wLDAgKzEsNCBAQAo+ICsjIExvY2FsbHkgY2FsY3VsYXRl
ZAo+ICtzaGEyNTYgIDA5MzY4NDg5MDQ5NDMzODFiMmMwMTMyMTEwMTYxNDc3NmU0M2Q1ODM4NDBl
ZTBmM2NlZWVhMWUzZmI3NDA1ZjcgIGNwdWluZm8tZGUyZmE3OGViYjQzMWRiOTg0ODllNzg2MDNl
NGY3N2MxZjZjNWM1Ny50YXIuZ3oKPiArIyBMaWNlbnNlIGZpbGVzLCBsb2NhbGx5IGNhbGN1bGF0
ZWQKPiArc2hhMjU2ICA4ZTdlNjA2MzZjM2FhMGNiMDM1NzFhMWE4NDFjZTU2OTdmOTU1MWZmOTJi
M2M0MjZjMjU2MTYxM2QxNWFkZTcwICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvY3B1
aW5mby9jcHVpbmZvLm1rIGIvcGFja2FnZS9jcHVpbmZvL2NwdWluZm8ubWsKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmFiNmEwMjY5ZWMKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvcGFja2FnZS9jcHVpbmZvL2NwdWluZm8ubWsKPiBAQCAtMCwwICsxLDE3IEBACj4g
KyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBjcHVpbmZvCj4gKyMKPiArIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gK0NQVUlORk9fVkVSU0lPTiA9IGRlMmZhNzhlYmI0MzFk
Yjk4NDg5ZTc4NjAzZTRmNzdjMWY2YzVjNTcKPiArQ1BVSU5GT19TSVRFID0gJChjYWxsIGdpdGh1
YixweXRvcmNoLGNwdWluZm8sJChDUFVJTkZPX1ZFUlNJT04pKQo+ICtDUFVJTkZPX0xJQ0VOU0Ug
PSBCU0QtMi1DbGF1c2UKPiArQ1BVSU5GT19MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+ICtDUFVJ
TkZPX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+ICtDUFVJTkZPX0NPTkZfT1BUUyA9IFwKPiArICAg
ICAgIC1EQ1BVSU5GT19CVUlMRF9VTklUX1RFU1RTPU9GRiBcCj4gKyAgICAgICAtRENQVUlORk9f
QlVJTERfTU9DS19URVNUUz1PRkYgXAo+ICsgICAgICAgLURDUFVJTkZPX0JVSUxEX0JFTkNITUFS
S1M9T0ZGCj4gKwo+ICskKGV2YWwgJChjbWFrZS1wYWNrYWdlKSkKPiAtLQo+IDIuMzQuMQo+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJv
b3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
