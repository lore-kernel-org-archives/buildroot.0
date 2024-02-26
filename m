Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FDEC5478C
	for <buildroot@archiver.kernel.org>; Mon, 26 Feb 2024 06:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED0778142B;
	Mon, 26 Feb 2024 06:52:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 38qFsSQZlNnY; Mon, 26 Feb 2024 06:52:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E689681453
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E689681453;
	Mon, 26 Feb 2024 06:52:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2918E1BF267
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 06:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2305E81453
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 06:52:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6tdQ5q7vj8lx for <buildroot@lists.busybox.net>;
 Mon, 26 Feb 2024 06:52:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D11D78142B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D11D78142B
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D11D78142B
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 06:52:24 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-512f5484a37so1571588e87.3
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 22:52:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708930342; x=1709535142;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s6GHnzfYU2K7ej+G/tl7HoejbeOjU1PPPZtPPTS7d8c=;
 b=hZb2IkGwharDPxibNyN8r353h6/6DHSsz+lRJZ+vFImJPey5+Vr4SW+wmx8jGXTlQI
 Nc/5+1cHrDlaZrW/qZiOuieSTwAgYsSne9YI0z8ibd9Ejcar3UfHCvN9B1YA951l0Jrc
 Pyrf80/+Axb7Q2iWCUISWpE+XEhzexhTF6H812HzhgNorNxscBOPepekQMSqszj34oln
 eIus7S/AMnprrdsXKpSJMdFfC1Ae7V8zC6bFtxA2R69ULlwFF/hlYRPS30k+nP8lxVaV
 WmcrtNkAeTCH7g2TeTSJFZA8KTR9uEKD8Cuk9egwmX6hMcatlcp0AjBXpZBcJ3vpu6fT
 l8jA==
X-Gm-Message-State: AOJu0YwSc+MvszyfNpbBMHDz9YSLjkDHPJmwXAm2+ERA4aTgDyaP3G02
 HO1x0tUvx11KMPr3PCIIosqHXL8fCjRu4JTR74x3aLpCx4C/Cy3giM2CSSZouTIxxPB9h0PvSi2
 31X+L5MIoaVPVlIgKRyWZSBizKTLGEeDo2xg=
X-Google-Smtp-Source: AGHT+IFINvGlqdB73aMD2f9mSJaVUcqVG3LsYyMoNq7m+95+WfYUWfUnDsVBA7LQWimkTazRuBI1XtKOHGZoag/PvX8=
X-Received: by 2002:ac2:5fef:0:b0:512:99c2:dfa with SMTP id
 s15-20020ac25fef000000b0051299c20dfamr4008302lfg.42.1708930342172; Sun, 25
 Feb 2024 22:52:22 -0800 (PST)
MIME-Version: 1.0
References: <20240225171149.1447606-1-fontaine.fabrice@gmail.com>
 <d643e11f-81d7-4bd4-9891-beb2e648d2c2@benettiengineering.com>
In-Reply-To: <d643e11f-81d7-4bd4-9891-beb2e648d2c2@benettiengineering.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 26 Feb 2024 07:52:11 +0100
Message-ID: <CAPi7W81x1vZrKe-kzZn77NAySHLjMbNN51hNrz6pL2j=x40Wag@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708930342; x=1709535142; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s6GHnzfYU2K7ej+G/tl7HoejbeOjU1PPPZtPPTS7d8c=;
 b=kIVrmdwI4UYIs4Rt7FbGLXg0ia2Xfl0JrhuSYvQUwYm6CuR+Bh/Fg11MY+ZcS4iGu+
 0WEVmo99PVU4yR7vuLn4wEfYQ3dytq1vg0jPzmHaB1I2fNLdkqGTntL3cK89ViWZRVge
 3k4ADJZlHKXlKn98LLk5BV9EihsihyhIaTTNw1iWnBxgreE64DnVdZnh2AXYit2aUY7I
 LlJ7dO8tso/gHqYAxbv8m9Mq6euk28gLbzTmAQ8Is0RjsvOEZanMN7CaYy270qvpcSyY
 ad+apKsm+DESX3gJ+37PQ2b/+hFLG7wUugrcQ9iOVDLLTLWNU9SsGHIf8FhYI9Cvqwez
 kP2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kIVrmdwI
Subject: Re: [Buildroot] [PATCH 1/1] package/libtracefs: disable utest
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
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR2l1bGlvLAoKTGUgZGltLiAyNSBmw6l2ci4gMjAyNCDDoCAyMDoyMywgR2l1bGlvIEJl
bmV0dGkKPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IGEgw6ljcml0IDoK
Pgo+IEhpIEZhYnJpY2UsCj4KPiB0aGFua3MgYSBsb3QgZm9yIHRoZSBwYXRjaCwKPgo+IE9uIDI1
LzAyLzI0IDE4OjExLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+ID4gRGlzYWJsZSB1dGVzdCB0
byBhdm9pZCB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgcmFpc2VkIHNpbmNlIHRoZQo+ID4g
YWRkaXRpb24gb2YgdGhlIHBhY2thZ2UgaW4gY29tbWl0Cj4gPiBiMWRiZDNmNjc5ZTY2NjAzMjU0
NzJlM2ZkY2E3MjEyN2Q3NGU2OTI5IGlmIGN1bml0IGlzIGZvdW5kOgo+ID4KPiA+IC4uL3V0ZXN0
L3RyYWNlZnMtdXRlc3QuYzogSW4gZnVuY3Rpb24gJ3Rlc3RfdXByb2Jlc19pbnN0YW5jZSc6Cj4g
PiAuLi91dGVzdC90cmFjZWZzLXV0ZXN0LmM6MjQ5MjoxOTogZXJyb3I6ICdQQVRIX01BWCcgdW5k
ZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pCj4gPiAgIDI0OTIgfCAgICAgICAg
IGNoYXIgc2VsZltQQVRIX01BWF0gPSB7IDAgfTsKPiA+ICAgICAgICB8ICAgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+Cj4gPgo+ID4gRml4ZXM6IGIxZGJkM2Y2NzllNjY2MDMyNTQ3MmUzZmRjYTcy
MTI3ZDc0ZTY5MjkKPiA+ICAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0
cy8xYTAxODgzMjMxZGJjOGE3Njg4ZGUyNmRiOWEwODc1MTE2NWZlOGZlCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4g
PiAtLS0KPiA+ICAgLi4uLzAwMDItbWVzb24tYWRkLXV0ZXN0LW9wdGlvbi5wYXRjaCAgICAgICAg
IHwgNDAgKysrKysrKysrKysrKysrKysrKwo+ID4gICBwYWNrYWdlL2xpYnRyYWNlZnMvbGlidHJh
Y2Vmcy5tayAgICAgICAgICAgICAgfCAgMyArLQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDQyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvbGlidHJhY2Vmcy8wMDAyLW1lc29uLWFkZC11dGVzdC1vcHRpb24ucGF0Y2gKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9saWJ0cmFjZWZzLzAwMDItbWVzb24tYWRkLXV0ZXN0LW9wdGlv
bi5wYXRjaCBiL3BhY2thZ2UvbGlidHJhY2Vmcy8wMDAyLW1lc29uLWFkZC11dGVzdC1vcHRpb24u
cGF0Y2gKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwLi45MGY3
M2E3ZWEwCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9wYWNrYWdlL2xpYnRyYWNlZnMvMDAw
Mi1tZXNvbi1hZGQtdXRlc3Qtb3B0aW9uLnBhdGNoCj4gPiBAQCAtMCwwICsxLDQwIEBACj4gPiAr
RnJvbSA3YTA5ZTJkNDE0OTU5MDc1ZTIxNzdjNTBlZjFkNGJmNjA2YjljY2RjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQo+ID4gK0Zyb206IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJp
Y2VAZ21haWwuY29tPgo+ID4gK0RhdGU6IFRodSwgMTUgRmViIDIwMjQgMjE6MjA6MjkgKzAxMDAK
PiA+ICtTdWJqZWN0OiBbUEFUQ0hdIG1lc29uOiBhZGQgdXRlc3Qgb3B0aW9uCj4gPiArCj4gPiAr
QWRkIHV0ZXN0IG9wdGlvbiB0byBhbGxvdyB0aGUgdXNlciB0byBkaXNhYmxlIHV0ZXN0Cj4gPiAr
Cj4gPiArU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBn
bWFpbC5jb20+Cj4gPiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9yb3N0ZWR0L2xpYnRy
YWNlZnMvcHVsbC8yCj4KPiBGb3IgdGhpcyBwcm9qZWN0IHlvdSBoYXZlIHRvIGdpdCBzZW5kLWVt
YWlsIHRoZSBwYXRjaCB0bzoKPiBsaW51eC10cmFjZS1kZXZlbEB2Z2VyLmtlcm5lbC5vcmcKPgo+
IGFzIGRvY3VtZW50ZWQgaW46Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpYnMv
bGlidHJhY2UvbGlidHJhY2Vmcy5naXQvdHJlZS9SRUFETUUjbjQ1Cj4KPiBDYW4geW91IGRvIHRo
YXQ/IE90aGVyd2lzZSBJIGNhbiBzZW5kIHRoZSBwYXRjaC4KCkRvbmU6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXRyYWNlLWRldmVsLzIwMjQwMjI1MjA0NzU5LjMyNjMtMS1mb250YWlu
ZS5mYWJyaWNlQGdtYWlsLmNvbS9ULyN1Cgo+Cj4gVGhhbmsgeW91IQo+Cj4gQmVzdCByZWdhcmRz
Cj4gLS0KPiBHaXVsaW8gQmVuZXR0aQo+IENFTyZDVE9AQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMK
Pgo+ID4gKy0tLQo+ID4gKyBtZXNvbi5idWlsZCAgICAgICB8IDIgKy0KPiA+ICsgbWVzb25fb3B0
aW9ucy50eHQgfCAyICsrCj4gPiArIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gPiArCj4gPiArZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24u
YnVpbGQKPiA+ICtpbmRleCAzMTU2ZjFjLi5kNGNmZDUzIDEwMDY0NAo+ID4gKy0tLSBhL21lc29u
LmJ1aWxkCj4gPiArKysrIGIvbWVzb24uYnVpbGQKPiA+ICtAQCAtMzUsNyArMzUsNyBAQCBpbmNk
aXIgPSBpbmNsdWRlX2RpcmVjdG9yaWVzKFsnaW5jbHVkZSddKQo+ID4gKwo+ID4gKyBzdWJkaXIo
J3NyYycpCj4gPiArIHN1YmRpcignaW5jbHVkZScpCj4gPiArLWlmIGN1bml0X2RlcC5mb3VuZCgp
Cj4gPiArK2lmIGdldF9vcHRpb24oJ3V0ZXN0JykgYW5kIGN1bml0X2RlcC5mb3VuZCgpCj4gPiAr
ICAgICBzdWJkaXIoJ3V0ZXN0JykKPiA+ICsgZW5kaWYKPiA+ICsgaWYgZ2V0X29wdGlvbignc2Ft
cGxlcycpCj4gPiArZGlmZiAtLWdpdCBhL21lc29uX29wdGlvbnMudHh0IGIvbWVzb25fb3B0aW9u
cy50eHQKPiA+ICtpbmRleCA4NDUwOTkyLi5hNDhlZmVhIDEwMDY0NAo+ID4gKy0tLSBhL21lc29u
X29wdGlvbnMudHh0Cj4gPiArKysrIGIvbWVzb25fb3B0aW9ucy50eHQKPiA+ICtAQCAtMTgsMyAr
MTgsNSBAQCBvcHRpb24oJ2RvYycsIHR5cGUgOiAnYm9vbGVhbicsIHZhbHVlOiB0cnVlLAo+ID4g
KyAgICAgICAgZGVzY3JpcHRpb24gOiAncHJvZHVjZSBkb2N1bWVudGF0aW9uJykKPiA+ICsgb3B0
aW9uKCdzYW1wbGVzJywgdHlwZSA6ICdib29sZWFuJywgdmFsdWU6IHRydWUsCj4gPiArICAgICAg
ICBkZXNjcmlwdGlvbiA6ICdidWlsZCBzYW1wbGVzJykKPiA+ICsrb3B0aW9uKCd1dGVzdCcsIHR5
cGUgOiAnYm9vbGVhbicsIHZhbHVlOiB0cnVlLAo+ID4gKysgICAgICAgZGVzY3JpcHRpb24gOiAn
YnVpbGQgdXRlc3QnKQo+ID4gKy0tCj4gPiArMi40My4wCj4gPiArCj4gPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9saWJ0cmFjZWZzL2xpYnRyYWNlZnMubWsgYi9wYWNrYWdlL2xpYnRyYWNlZnMvbGli
dHJhY2Vmcy5tawo+ID4gaW5kZXggZWQ0NWZjYmM1MC4uMjFjYjhlODRlMyAxMDA2NDQKPiA+IC0t
LSBhL3BhY2thZ2UvbGlidHJhY2Vmcy9saWJ0cmFjZWZzLm1rCj4gPiArKysgYi9wYWNrYWdlL2xp
YnRyYWNlZnMvbGlidHJhY2Vmcy5tawo+ID4gQEAgLTE0LDYgKzE0LDcgQEAgTElCVFJBQ0VGU19E
RVBFTkRFTkNJRVMgPSBob3N0LWJpc29uIGhvc3QtZmxleCBob3N0LXBrZ2NvbmYgbGlidHJhY2Vl
dmVudAo+ID4KPiA+ICAgTElCVFJBQ0VGU19DT05GX09QVFMgPSBcCj4gPiAgICAgICAtRGRvYz1m
YWxzZSBcCj4gPiAtICAgICAtRHNhbXBsZXM9ZmFsc2UKPiA+ICsgICAgIC1Ec2FtcGxlcz1mYWxz
ZSBcCj4gPiArICAgICAtRHV0ZXN0PWZhbHNlCj4gPgo+ID4gICAkKGV2YWwgJChtZXNvbi1wYWNr
YWdlKSkKPgoKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
