Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2104FCEDDA3
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 15:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B035B40724;
	Wed,  9 Oct 2024 15:11:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LK9eVllquEwm; Wed,  9 Oct 2024 15:11:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5066740729
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5066740729;
	Wed,  9 Oct 2024 15:11:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C5D91BF396
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 15:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B22381279
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 15:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPfJtk_fBGpy for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 15:11:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DEB3C81271
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEB3C81271
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEB3C81271
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 15:11:19 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c896b9b4e0so10051135a12.3
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 08:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728486678; x=1729091478;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mcEFP4DMzoL0rg07lmhBDwsnGB5zg6ya0hAiwhi4AD0=;
 b=Dek1JbNwpMTniLSQBqnYr87Qqo5b+c3ospv3zwZwD7u7cPSuogPA0L30KMvKr6oUry
 DD3uWtwjPlwIniLoHe5af7Qnowq2LhF5cq/ceiNpnhNxIFByJZ7H99eh7GALXDr/omWf
 D/beg6UdewOrhcB/aeX5JOlNIXNYNP0hBlgqtMyShgvaJl0W1CFYUBs48sua4vTHHPEC
 6A7mmILbxbqfejz1Eliv/KPcfdtpLs9lVqCzMP2ICYRLkUMqKTIZw8XYumEfNiu/KV50
 f+RqONo9hUyPoUbTzh+55UkMQIaLRaRi0r5sZjajkJ3XdpFV+o8vDVO95GElMlfKoToc
 x3iQ==
X-Gm-Message-State: AOJu0YwvDzB5EA96IqoBjn8tIhyhBrjZhzO82dF2BH8SDSh77EFhucdY
 nFIXjO/nkxGeZ9FRi2/D10v6YtVLZafUPiHMnAnKE0D2RifniaE6gLBSD0gc16pGIyWPSo8rOY5
 5Tx85ZIDu/2x5HB6ddryzqmH3uXTeIO4L6gY2yw==
X-Google-Smtp-Source: AGHT+IFCzEWTOgja450cI8LIapUDjhBgy4IoT/ryP/6PiQtLqHPYJs4X+tCntIMhU3v2cbrH0zs1/eiHLTPJSRlSD7Y=
X-Received: by 2002:a05:6402:3490:b0:5c9:2a98:f4e2 with SMTP id
 4fb4d7f45d1cf-5c92a98f58fmr1000528a12.7.1728486677763; Wed, 09 Oct 2024
 08:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <20241009062631.895124-1-dario.binacchi@amarulasolutions.com>
 <20241009150040.mxnktvztmjzwasyw@bryanbrattlof.com>
In-Reply-To: <20241009150040.mxnktvztmjzwasyw@bryanbrattlof.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 9 Oct 2024 17:11:06 +0200
Message-ID: <CABGWkvqAVxoYRPm3=LJsM6QhGF_BOFP=FXiKYtuF4R-RgEyavg@mail.gmail.com>
To: Bryan Brattlof <bb@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728486678; x=1729091478;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mcEFP4DMzoL0rg07lmhBDwsnGB5zg6ya0hAiwhi4AD0=;
 b=rbJ5qv0Y+l5JjjVK+DRdHJpjezgyNds4hfpAbxQfbJSpqUg4EwQvIF3Wnd3T+9ORf2
 kQAxp8NIBAY3ZKEzcxkYo3EZ4CQZk3gzWtdeU/MwzOYKU+CcxnG2tRkNhdn4y26BYZkM
 eyTc3kIOdnF2o41Hvy4YEyZF8JogjpIITeeoI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=rbJ5qv0Y
Subject: Re: [Buildroot] [PATCH 1/1] configs/ti_am62x_sk: bump Linux to
 6.10.13 and U-Boot to 2024.10
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQnJ5YW4sCgpPbiBXZWQsIE9jdCA5LCAyMDI0IGF0IDU6MDDigK9QTSBCcnlhbiBCcmF0dGxv
ZiA8YmJAdGkuY29tPiB3cm90ZToKPgo+IEhpIERhcmlvIQo+Cj4gT24gT2N0b2JlciAgOSwgMjAy
NCB0aHVzIHNheWV0aCBEYXJpbyBCaW5hY2NoaToKPiA+IFRoZSBwYXRjaCBidW1wcyB0aGUgTGlu
dXgga2VybmVsIHRvIHZlcnNpb24gNi4xMC4xMyBhbmQgVS1Cb290IHRvCj4gPiB2ZXJzaW9uIDIw
MjQuMTAuIEFybSB0cnVzdGVkIGZpcm13YXJlIGlzIGFscmVhZHkgdXAgdG8gZGF0ZS4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNv
bHV0aW9ucy5jb20+Cj4gPiAtLS0KPiA+ICBib2FyZC90aS9hbTYyeC1zay9wYXRjaGVzL2xpbnV4
L2xpbnV4Lmhhc2ggfCAyICstCj4gPiAgYm9hcmQvdGkvYW02Mngtc2svcGF0Y2hlcy91Ym9vdC91
Ym9vdC5oYXNoIHwgMiArLQo+ID4gIGNvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnICAgICAg
ICAgICAgICB8IDYgKysrLS0tCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2JvYXJkL3RpL2FtNjJ4LXNrL3Bh
dGNoZXMvbGludXgvbGludXguaGFzaCBiL2JvYXJkL3RpL2FtNjJ4LXNrL3BhdGNoZXMvbGludXgv
bGludXguaGFzaAo+ID4gaW5kZXggNTNlYjE0Mzg5NDViLi43MDZkZGI4ZGJiZDQgMTAwNjQ0Cj4g
PiAtLS0gYS9ib2FyZC90aS9hbTYyeC1zay9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2gKPiA+ICsr
KyBiL2JvYXJkL3RpL2FtNjJ4LXNrL3BhdGNoZXMvbGludXgvbGludXguaGFzaAo+ID4gQEAgLTEs
MiArMSwyIEBACj4gPiAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiA+IC1zaGEyNTYgIDc3NDY5ODQy
MmVlNTRjNWYxZTcwNDQ1NmYzN2M2NWMwNmI1MWI0ZTlhOGIwODY2ZjM0NTgwZDg2ZmVmOGUyMjYg
IGxpbnV4LTYuMTAudGFyLnh6Cj4gPiArc2hhMjU2ICA1ZmZjZWIyMzUwZGIxNTQ3ZTY5MjMxYTYz
ZGYyZDNiZWVkMDE1YTMxM2Q3ZDdhZGY4YjVjYjcxZGVkYWViMTZhICBsaW51eC02LjEwLjEzLnRh
ci54ego+ID4gZGlmZiAtLWdpdCBhL2JvYXJkL3RpL2FtNjJ4LXNrL3BhdGNoZXMvdWJvb3QvdWJv
b3QuaGFzaCBiL2JvYXJkL3RpL2FtNjJ4LXNrL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaAo+ID4g
aW5kZXggZmU5YjRmNTNkYzYzLi45MDRmYTU2YzAyYTMgMTAwNjQ0Cj4gPiAtLS0gYS9ib2FyZC90
aS9hbTYyeC1zay9wYXRjaGVzL3Vib290L3Vib290Lmhhc2gKPiA+ICsrKyBiL2JvYXJkL3RpL2Ft
NjJ4LXNrL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaAo+ID4gQEAgLTEsMiArMSwyIEBACj4gPiAg
IyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiA+IC1zaGEyNTYgIGY1OTFkYTlhYjkwZWYzZDZiM2QxNzM3
NjZkMGRkZmY5MGM0ZWQ3MzMwNjgwODk3NDg2MTE3ZGYzOTBkODNjOGYgIHUtYm9vdC0yMDI0LjA3
LnRhci5iejIKPiA+ICtzaGEyNTYgIGIyOGRhZjRhYzE3ZTQzMTU2MzYzMDc4YmY1MTAyOTc1ODQx
MzdmNmRmNTBmY2VkOWIxMmRmMzRmNjFhOTJmYjAgIHUtYm9vdC0yMDI0LjEwLnRhci5iejIKPiA+
IGRpZmYgLS1naXQgYS9jb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZyBiL2NvbmZpZ3MvdGlf
YW02Mnhfc2tfZGVmY29uZmlnCj4gPiBpbmRleCBlMTFiODAzYjczZTQuLjZkMDcxYjRjYzE0OCAx
MDA2NDQKPiA+IC0tLSBhL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnCj4gPiArKysgYi9j
b25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZwo+ID4gQEAgLTgsNyArOCw3IEBAIEJSMl9ST09U
RlNfUE9TVF9CVUlMRF9TQ1JJUFRfQVJHUz0iLWMgdHR5UzIsMTE1MjAwbjggLWQgazMtYW02MjUt
c2suZHRiIC1sIGFtNjJ4Cj4gPiAgQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVF9BUkdTPSIt
YyBib2FyZC90aS9hbTYyeC1zay9nZW5pbWFnZS5jZmciCj4gPiAgQlIyX0xJTlVYX0tFUk5FTD15
Cj4gPiAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15Cj4gPiAtQlIyX0xJTlVYX0tF
Uk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xMCIKPiA+ICtCUjJfTElOVVhfS0VSTkVMX0NV
U1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjEwLjEzIgo+Cj4gSSd2ZSBub3RpY2VkIHlvdSd2ZSBiZWVu
IHBpY2tpbmcgc3RhYmxlIHRhZ3MgYW5kIHdhcyBjdXJpb3VzIGlmIHlvdQo+IHByZWZlciB0byBz
dGF5IG9uIHN0YWJsZSB0YWdzPwoKQXMgZmFyIGFzIEkga25vdywgaXQgaXMgZ29vZCBwcmFjdGlj
ZS4KCj4gSSBoYXZlIHBsYW5zIHRvIG1vdmUgZXZlcnl0aGluZyB0byB2Ni4xMQo+IGJ1dCBJIGNv
dWxkIGNob29zZSB0aGUgc3RhYmxlIHZlcnNpb24gKHY2LjExLjIpIGlmIHRoYXQgaGVscHMgeW91
LgoKPgo+ID4gIEJSMl9MSU5VWF9LRVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUc9eQo+ID4g
IEJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQo+ID4gIEJSMl9MSU5VWF9LRVJORUxfSU5U
UkVFX0RUU19OQU1FPSJ0aS9rMy1hbTYyNS1zayIKPiA+IEBAIC0yNywxMiArMjcsMTIgQEAgQlIy
X1RBUkdFVF9PUFRFRV9PUz15Cj4gPiAgQlIyX1RBUkdFVF9PUFRFRV9PU19QTEFURk9STT0iazMt
YW02MngiCj4gPiAgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVI9eQo+ID4gIEJSMl9UQVJHRVRf
VElfSzNfUjVfTE9BREVSX0NVU1RPTV9WRVJTSU9OPXkKPiA+IC1CUjJfVEFSR0VUX1RJX0szX1I1
X0xPQURFUl9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyNC4wNyIKPiA+ICtCUjJfVEFSR0VUX1RJ
X0szX1I1X0xPQURFUl9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyNC4xMCIKPiA+ICBCUjJfVEFS
R0VUX1RJX0szX1I1X0xPQURFUl9CT0FSRF9ERUZDT05GSUc9ImFtNjJ4X2V2bV9yNSIKPiA+ICBC
UjJfVEFSR0VUX1VCT09UPXkKPiA+ICBCUjJfVEFSR0VUX1VCT09UX0JVSUxEX1NZU1RFTV9LQ09O
RklHPXkKPiA+ICBCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OPXkKPiA+IC1CUjJfVEFS
R0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDI0LjA3Igo+ID4gK0JSMl9UQVJHRVRf
VUJPT1RfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjQuMTAiCj4KPiBPbmUgb2YgdGhlIG1vcmUg
aW50ZXJlc3RpbmcgdGhpbmdzIHdlJ3ZlIGJlZW4gd29ya2luZyBvbiBsYXRlbHkgaXMgRUZJCj4g
Q2Fwc3VsZSBzdXBwb3J0IHdoaWNoIGRlcGVuZHMgb24gR251VExTLiBXZSdsbCBuZWVkIHRvIGNo
ZWNrCj4gQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19HTlVUTFMgd2hlbiBtb3ZpbmcgdG8gdGhpcyB2
ZXJzaW9uLiA6KQoKRG8gSSBoYXZlIHRvIGVuYWJsZSB0aGlzIG9wdGlvbj8gV2hlbiBJIHRlc3Rl
ZCwgSSBkaWRuJ3Qgbm90aWNlIGFueXRoaW5nIHVudXN1YWwKT3IgaXMgdGhlcmUgc29tZXRoaW5n
IEknbSBtaXNzaW5nPwoKVGhhbmtzIGFuZCByZWdhcmRzLApEYXJpbwoKPgo+IH5CcnlhbgoKCgot
LSAKCkRhcmlvIEJpbmFjY2hpCgpTZW5pb3IgRW1iZWRkZWQgTGludXggRGV2ZWxvcGVyCgpkYXJp
by5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwoKCkFtYXJ1bGEgU29sdXRpb25zIFNSTAoKVmlhIExlIENhbmV2YXJlIDMwLCAz
MTEwMCBUcmV2aXNvLCBWZW5ldG8sIElUCgpULiArMzkgMDQyIDI0MyA1MzEwCmluZm9AYW1hcnVs
YXNvbHV0aW9ucy5jb20KCnd3dy5hbWFydWxhc29sdXRpb25zLmNvbQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
