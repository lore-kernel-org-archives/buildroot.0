Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D9BC624A5
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 07:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0727280B4C;
	Mon, 31 Aug 2026 07:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8k5hyl04scrx; Mon, 31 Aug 2026 07:47:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788162451;
	bh=KtgkW7snBF6p+OWHh0ZaohnvGGWX9sca4TD4AEN0U1g=;
	h=References:In-Reply-To:Date:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=PfLJUbwIca4cc3Sk9AywKUPQByek9ksWZHW0U/8MV6TS3GNSHfmETrbTudfdD/PSh
	 M8lP/dqBqdYULUz0P2YL2wGS0yxEdCylh+QGgaed3gqxHW3R1+RjBYa5XXLikMfv4X
	 zmwKJNA68R8Bu1bIzbWi04abfglmVtrDffhlwkp082mCKZnwOzSptiynepNjS4nq01
	 3DRd18F3MKarTxLYJvYWBryCvzjTHseAW8TZ7YKe9HqnJGH019FGjWYw/5H14LLf7r
	 5Mu420uJvM2yMftpv7oFlubZTlujaIogYHr3Cdblyp41yD9MgLqcz1Ohnd/wGhkW32
	 Db5ZAQuLdS5Ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B9AD80B53;
	Mon, 31 Aug 2026 07:47:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 130032FC
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 07:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED05C40519
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 07:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aaBbhnFfJjk1 for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 07:47:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0E0D40411
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 07:47:28 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c255c58156bso546823166b.3
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 00:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788162446; cv=none;
 d=google.com; s=arc-20260327;
 b=ChI8GWk44Q7ase/FomHdeVZHG+puC5yuAOo7HOYdqljUcU/+8HuoUxzwmF6+PRq8NK
 3Lw6QyBumcZX4Z9lIQmspaISTT9baj7iJjrG5kyNqZKBdk7P+FNe3AD/zlvrmmVZXt9M
 9RNwPAB7ydKR8I5z2YPTlROFiC98M/aLynOX944eqr2UIJaBXah/tDELUtwdVEClb9n+
 N051NV+walKmmSg5eFwINAv/o8/CnvnIwzrtD8eYls42c8ELGD6IO3mr2+ESElljfss6
 8SXNuDeo3NXlbPMeb5dRY7BhWtv6sTesj9TcCEOLOs0FNuOWJDDj5i20hfuGPO/i5KH8
 t3yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=YAgPvYmesDdKJduyVQ7Yxuc89pgS5l5kRM5Bb99nK44=;
 fh=3pWBXGdSiVldOzJ6ypfJcTUIWlbrikH1EIZUHFIjzuo=;
 b=MjaVMKzw+YzrlMTr3CR/NJTP5ePW5/4F3JIs/6xD8E2eiDPkU2cLR47ZIX/j/g85R7
 zEzVeRw3fcIwBUuus/IlMfNrwuhfui63E9OEpTLUXiHx5DMugIz2zd7Py+6UAM6gaoqI
 e+aIkyb/90uT71kD9D0G0/76n3rb/U4gQb1vPjP0R6LJftifSQPdqxMyfxxbXWn4QaLa
 FOo4ahT5wNwVcRTkzX1xgOnAoWrIQIwTQQodQgEBsRW1VaAmeAYBprlw4hBK8nM9B5H4
 u1JxtsGFzz54afQZag7LrN0IM3Qw6nfuq4lWiz2SHD+0oYtcfgv1/nz/CI7T2BeBKLE9
 CbrQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788162446; x=1788767246;
 h=content-transfer-encoding:content-type:to:subject:message-id:date
 :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=YAgPvYmesDdKJduyVQ7Yxuc89pgS5l5kRM5Bb99nK44=;
 b=C8AKaEGc03Ghheq+WYBDQfAZP8RboWHNgFIQe7lUVo+9l1muZZydF5yLL/aZeU0Eug
 2uatDqV99GIMRdRx8FOvr3nw7gW6r4GM9j0d0TM2giCvB4dlW684USKanv/D9hrrQjdK
 lWZD0OhRHrIrahfRjWJb2Dy0BL75W0tavewkqWAktEUaagr8OMscnpPJoQVZT+6enKg8
 hO3CETVL6qoixXZicbwMeQycycNiG4rdbRD7rX+jFDY5AyIdBazO0xI5vlygmY728UGS
 Jf3/tLnsWYY03beWLR5Gcywz6bnYd8t1KfGjTiUcwG8l/QuF9wQi06HA1PvUpmYrrgET
 Rn4g==
X-Gm-Message-State: AFuF++kPG7P7uGSUDh7g6wqhGV1tXuzblzFh4Fs2U6zwe71nEfYTrjaP
 fGbqKXMMSzyQfgdPStJUX1u3vPMFuJldw9q+lzufdhIRvPSzrPsZazXl1acWPv19Okx3x80JnSx
 He72VaPFGWqeITmPi1T51l+NOpYglSHe0lhpZ
X-Gm-Gg: AR+sD10mMIaySxl2iKseviIl2LFU/nmqvtTJtLWF6A8rHt59f5I01yB55dgYnNx77VS
 Un/MUUu3KCFf/e6JoMVF0o64uh/T5VuBzdvFUIl+V/PT9Gtklqh2lG665mZZpSvkVSRj8fzLWJk
 2K/wpeQxcZ1LohzdwkVAyxgH4rKBlU0HrqwVCrKUbU5Tk9H7qtoMCrh6ii6BFXmBg4TA0kYrfZN
 HdaQx/a1nffi5Lka4VwFIcEGnVEmSngJ23W5CazEENs7jlwIJleOc6fgnERXvEX5+u8IcUkZ8/q
 vtqwOBtQ7kbm1BwIX4xQKjogvYeQawTK6vAgllf2YTjFqA==
X-Received: by 2002:a17:907:6d25:b0:c20:2d38:e518 with SMTP id
 a640c23a62f3a-c2556c61d72mr1529260366b.2.1788162446209; Mon, 31 Aug 2026
 00:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260829205149.958488-1-yegorslists@googlemail.com>
In-Reply-To: <20260829205149.958488-1-yegorslists@googlemail.com>
Date: Mon, 31 Aug 2026 09:48:08 +0200
X-Gm-Features: AcwNN1W-XyKbNJcK1BAHcJ4eUABBTJN_F63Px30c3ri1_YurDr8-93zGmE6bOw4
Message-ID: <CAGm1_kvd6J=JD000t-tMP54ENDomPY-XBxmWCzDqnJVZR-i=0Q@mail.gmail.com>
To: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH] package/attr: don't rely on kernel headers
 for struct xattr_args
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBBdWcgMjksIDIwMjYgYXQgMTA6NTHigK9QTSA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFp
bC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2ds
ZW1haWwuY29tPgo+Cj4gc3RydWN0IHhhdHRyX2FyZ3Mgd2FzIGFkZGVkIHRvIDxsaW51eC94YXR0
ci5oPiBpbiBMaW51eCA2LjEzLCBidXQgdGhlCj4gZ2V0eGF0dHJhdCgpIGFuZCBzZXR4YXR0cmF0
KCkgc3lzY2FsbCBudW1iZXJzIGNhbiBiZSBkZWZpbmVkCj4gaW5kZXBlbmRlbnRseSBvZiB0aGUg
a2VybmVsIGhlYWRlcnM6IG11c2wgbGliYywgZm9yIGV4YW1wbGUsIGRlZmluZXMKPiB0aGVtIGlu
IDxiaXRzL3N5c2NhbGwuaD4gZm9yIGFsbCBrZXJuZWwgaGVhZGVyIHZlcnNpb25zLiAgQnVpbGRp
bmcKPiBhZ2FpbnN0IGtlcm5lbCBoZWFkZXJzIG9sZGVyIHRoYW4gNi4xMyB3aXRoIHN1Y2ggYSBs
aWJjIGZhaWxzOgo+Cj4gICBsaWJtaXNjL3hhdHRyYXQuYzozNToxNjogZXJyb3I6IHZhcmlhYmxl
ICd1YXJncycgaGFzIGluaXRpYWxpemVyIGJ1dAo+ICAgaW5jb21wbGV0ZSB0eXBlCj4gICAgICAz
NSB8ICAgICAgICAgc3RydWN0IHhhdHRyX2FyZ3MgdWFyZ3MgPSB7Cj4KPiBTdG9wIGluY2x1ZGlu
ZyA8bGludXgveGF0dHIuaD4gYW5kIHVzZSBvdXIgb3duIGRlZmluaXRpb24gb2YgdGhpcyBmaXhl
ZAo+IHBhcnQgb2YgdGhlIGtlcm5lbCBBQkkgaW5zdGVhZCwgc28gdGhhdCB0aGUgYnVpbGQgbm8g
bG9uZ2VyIGRlcGVuZHMgb24KPiB0aGUga2VybmVsIGhlYWRlcnMgdmVyc2lvbi4gIFRoZSBzdHJ1
Y3QgbGF5b3V0IGlzIGlkZW50aWNhbCB0byB0aGUKPiBrZXJuZWwgZGVmaW5pdGlvbiAoc2l6ZSAx
NiwgbWVtYmVycyBhdCBvZmZzZXRzIDAsIDggYW5kIDEyKSBvbiAzMi1iaXQKPiBhbmQgNjQtYml0
IGFyY2hpdGVjdHVyZXMuCj4KCkZvcmdvdCB0byBhZGQgdGhlIHVwc3RyZWFtIFVSTDoKCmh0dHBz
Oi8vbGlzdHMubm9uZ251Lm9yZy9hcmNoaXZlL2h0bWwvYWNsLWRldmVsLzIwMjYtMDgvbXNnMDAw
MDAuaHRtbAoKUmVnYXJkcywKWWVnb3IKCj4gRml4ZXM6Cj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVp
bGRyb290Lm9yZy9yZXN1bHRzLzEwOTI2Y2NhZjNkMzIxMmQ4ODE2ZjUxNTZhZTI0MDViNDY5MTk1
YWEKPgo+IFNpZ25lZC1vZmYtYnk6IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVt
YWlsLmNvbT4KPiAtLS0KPiAgLi4ubHktb24ta2VybmVsLWhlYWRlcnMtZm9yLXN0cnVjdC14YXR0
LnBhdGNoIHwgODMgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgODMgaW5z
ZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9hdHRyLzAwMDItbGlibWlz
Yy1kb24tdC1yZWx5LW9uLWtlcm5lbC1oZWFkZXJzLWZvci1zdHJ1Y3QteGF0dC5wYXRjaAo+Cj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvYXR0ci8wMDAyLWxpYm1pc2MtZG9uLXQtcmVseS1vbi1rZXJu
ZWwtaGVhZGVycy1mb3Itc3RydWN0LXhhdHQucGF0Y2ggYi9wYWNrYWdlL2F0dHIvMDAwMi1saWJt
aXNjLWRvbi10LXJlbHktb24ta2VybmVsLWhlYWRlcnMtZm9yLXN0cnVjdC14YXR0LnBhdGNoCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5hOWMwNGY4NzIzCj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvYXR0ci8wMDAyLWxpYm1pc2MtZG9uLXQtcmVseS1v
bi1rZXJuZWwtaGVhZGVycy1mb3Itc3RydWN0LXhhdHQucGF0Y2gKPiBAQCAtMCwwICsxLDgzIEBA
Cj4gK0Zyb20gOTc1NTAyMGI4MTUwNjY3MzI2NzdkNjEwN2Q0MGFmMTJhNThkMWEwZCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdv
b2dsZW1haWwuY29tPgo+ICtEYXRlOiBGcmksIDI4IEF1ZyAyMDI2IDIzOjQzOjQ4ICswMjAwCj4g
K1N1YmplY3Q6IFtQQVRDSF0gbGlibWlzYzogZG9uJ3QgcmVseSBvbiBrZXJuZWwgaGVhZGVycyBm
b3Igc3RydWN0IHhhdHRyX2FyZ3MKPiArCj4gK3N0cnVjdCB4YXR0cl9hcmdzIHdhcyBhZGRlZCB0
byA8bGludXgveGF0dHIuaD4gaW4gTGludXggNi4xMywgYnV0IHRoZQo+ICtnZXR4YXR0cmF0KCkg
YW5kIHNldHhhdHRyYXQoKSBzeXNjYWxsIG51bWJlcnMgY2FuIGJlIGRlZmluZWQKPiAraW5kZXBl
bmRlbnRseSBvZiB0aGUga2VybmVsIGhlYWRlcnM6IG11c2wgbGliYywgZm9yIGV4YW1wbGUsIGRl
ZmluZXMKPiArdGhlbSBpbiA8Yml0cy9zeXNjYWxsLmg+IGZvciBhbGwga2VybmVsIGhlYWRlciB2
ZXJzaW9ucy4gIEJ1aWxkaW5nCj4gK2FnYWluc3Qga2VybmVsIGhlYWRlcnMgb2xkZXIgdGhhbiA2
LjEzIHdpdGggc3VjaCBhIGxpYmMgZmFpbHM6Cj4gKwo+ICsgIGxpYm1pc2MveGF0dHJhdC5jOjM1
OjE2OiBlcnJvcjogdmFyaWFibGUgJ3VhcmdzJyBoYXMgaW5pdGlhbGl6ZXIgYnV0Cj4gKyAgaW5j
b21wbGV0ZSB0eXBlCj4gKyAgICAgMzUgfCAgICAgICAgIHN0cnVjdCB4YXR0cl9hcmdzIHVhcmdz
ID0gewo+ICsKPiArU3RvcCBpbmNsdWRpbmcgPGxpbnV4L3hhdHRyLmg+IGFuZCB1c2Ugb3VyIG93
biBkZWZpbml0aW9uIG9mIHRoaXMgZml4ZWQKPiArcGFydCBvZiB0aGUga2VybmVsIEFCSSBpbnN0
ZWFkLCBzbyB0aGF0IHRoZSBidWlsZCBubyBsb25nZXIgZGVwZW5kcyBvbgo+ICt0aGUga2VybmVs
IGhlYWRlcnMgdmVyc2lvbi4gIFRoZSBzdHJ1Y3QgbGF5b3V0IGlzIGlkZW50aWNhbCB0byB0aGUK
PiAra2VybmVsIGRlZmluaXRpb24gKHNpemUgMTYsIG1lbWJlcnMgYXQgb2Zmc2V0cyAwLCA4IGFu
ZCAxMikgb24gMzItYml0Cj4gK2FuZCA2NC1iaXQgYXJjaGl0ZWN0dXJlcy4KPiArCj4gK0Fzc2lz
dGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLW9wdXMtNQo+ICtTaWduZWQtb2ZmLWJ5OiBZZWdvciBZZWZy
ZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4gKy0tLQo+ICsgbGlibWlzYy94YXR0
cmF0LmMgfCAyMyArKysrKysrKysrKysrKysrKystLS0tLQo+ICsgMSBmaWxlIGNoYW5nZWQsIDE4
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEvbGlibWlz
Yy94YXR0cmF0LmMgYi9saWJtaXNjL3hhdHRyYXQuYwo+ICtpbmRleCA1ZjYyMTJjLi5jMDdjMDRk
IDEwMDY0NAo+ICstLS0gYS9saWJtaXNjL3hhdHRyYXQuYwo+ICsrKysgYi9saWJtaXNjL3hhdHRy
YXQuYwo+ICtAQCAtMTgsNyArMTgsNyBAQAo+ICsgKi8KPiArCj4gKyAjaW5jbHVkZSAiY29uZmln
LmgiCj4gKy0jaW5jbHVkZSA8bGludXgveGF0dHIuaD4KPiArKyNpbmNsdWRlIDxzdGRpbnQuaD4K
PiArICNpbmNsdWRlIDxzeXMvc3lzY2FsbC5oPgo+ICsgI2luY2x1ZGUgPHVuaXN0ZC5oPgo+ICsg
I2luY2x1ZGUgPGVycm5vLmg+Cj4gK0BAIC0yNywxMyArMjcsMjYgQEAKPiArCj4gKyAjcHJhZ21h
IEdDQyBkaWFnbm9zdGljIGlnbm9yZWQgIi1XdW51c2VkLXBhcmFtZXRlciIKPiArCj4gKysvKgo+
ICsrICogc3RydWN0IHhhdHRyX2FyZ3Mgd2FzIGFkZGVkIHRvIDxsaW51eC94YXR0ci5oPiBpbiBM
aW51eCA2LjEzLCBidXQgdGhlCj4gKysgKiBzeXNjYWxsIG51bWJlcnMgY2FuIGJlIGRlZmluZWQg
aW5kZXBlbmRlbnRseSBvZiB0aGUga2VybmVsIGhlYWRlcnMgKG11c2wKPiArKyAqIGxpYmMgZGVm
aW5lcyB0aGVtIGluIDxiaXRzL3N5c2NhbGwuaD4sIGZvciBleGFtcGxlKSwgc28gd2UgY2Fubm90
IHJlbHkgb24KPiArKyAqIHRoZSBrZXJuZWwgaGVhZGVycyB0byBkZWZpbmUgdGhlIHN0cnVjdC4g
IFVzZSBvdXIgb3duIGRlZmluaXRpb24gb2YgdGhpcwo+ICsrICogZml4ZWQgcGFydCBvZiB0aGUg
a2VybmVsIEFCSSBpbnN0ZWFkLgo+ICsrICovCj4gKytzdHJ1Y3QgYXR0cl94YXR0cl9hcmdzIHsK
PiArKyAgICAgIHVpbnQ2NF90IHZhbHVlIF9fYXR0cmlidXRlX18oKGFsaWduZWQoOCkpKTsKPiAr
KyAgICAgIHVpbnQzMl90IHNpemU7Cj4gKysgICAgICB1aW50MzJfdCBmbGFnczsKPiArK307Cj4g
KysKPiArIHNzaXplX3QKPiArIGdldHhhdHRyYXQoaW50IGRpcmZkLCBjb25zdCBjaGFyICpwYXRo
LCBpbnQgYXRfZmxhZ3MsIGNvbnN0IGNoYXIgKm5hbWUsCj4gKyAgICAgICAgICB2b2lkICp2YWx1
ZSwgc2l6ZV90IHNpemUpCj4gKyB7Cj4gKyAjaWZkZWYgX19OUl9nZXR4YXR0cmF0Cj4gKy0gICAg
ICBzdHJ1Y3QgeGF0dHJfYXJncyB1YXJncyA9IHsKPiArLSAgICAgICAgICAgICAgLnZhbHVlID0g
KHVuc2lnbmVkIGxvbmcpdmFsdWUsCj4gKysgICAgICBzdHJ1Y3QgYXR0cl94YXR0cl9hcmdzIHVh
cmdzID0gewo+ICsrICAgICAgICAgICAgICAudmFsdWUgPSAodWludHB0cl90KXZhbHVlLAo+ICsg
ICAgICAgICAgICAgICAuc2l6ZSA9IHNpemUsCj4gKyAgICAgICB9Owo+ICsKPiArQEAgLTUwLDgg
KzYzLDggQEAgc2V0eGF0dHJhdChpbnQgZGlyZmQsIGNvbnN0IGNoYXIgKnBhdGgsIGludCBhdF9m
bGFncywgY29uc3QgY2hhciAqbmFtZSwKPiArICAgICAgICAgIGNvbnN0IHZvaWQgKnZhbHVlLCBz
aXplX3Qgc2l6ZSwgaW50IGZsYWdzKQo+ICsgewo+ICsgI2lmZGVmIF9fTlJfc2V0eGF0dHJhdAo+
ICstICAgICAgc3RydWN0IHhhdHRyX2FyZ3MgdWFyZ3MgPSB7Cj4gKy0gICAgICAgICAgICAgIC52
YWx1ZSA9ICh1bnNpZ25lZCBsb25nKXZhbHVlLAo+ICsrICAgICAgc3RydWN0IGF0dHJfeGF0dHJf
YXJncyB1YXJncyA9IHsKPiArKyAgICAgICAgICAgICAgLnZhbHVlID0gKHVpbnRwdHJfdCl2YWx1
ZSwKPiArICAgICAgICAgICAgICAgLnNpemUgPSBzaXplLAo+ICsgICAgICAgICAgICAgICAuZmxh
Z3MgPSBmbGFncywKPiArICAgICAgIH07Cj4gKy0tCj4gKzIuMzQuMQo+ICsKPiAtLQo+IDIuMzQu
MQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
