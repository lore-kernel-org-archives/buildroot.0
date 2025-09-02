Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F5ACA1005
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 23:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58B8561203;
	Tue,  2 Sep 2025 23:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hf5NWWRRH9yD; Tue,  2 Sep 2025 23:03:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9111861574
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9111861574;
	Tue,  2 Sep 2025 23:03:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A9DDE10E
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 23:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FA63844EE
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 23:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oNN-qORa7ER0 for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 23:03:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B32E984353
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B32E984353
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B32E984353
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 23:03:26 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-71d603cebd9so62116977b3.1
 for <buildroot@buildroot.org>; Tue, 02 Sep 2025 16:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756854205; x=1757459005;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t/ZFRfPiovJsDCAVY8sI/o5ycCjJCWKdwMsFw0MnuHQ=;
 b=O7HvNA+lk+7d0O9svs2xnPMtISvWltX4Ke7M0Jha07c7qQqnsjXYZmgcEBlR6CxLVx
 nEZGp53ZfbrPPgHFDZNxBbLOmOwoYNYOK26CDPepOeipoCqJVwAHYzqOEx1DOt3o2wzO
 tptB1eYSqreexKqq8mxmLLx7PXwWB/pHLUN/QsAabS0LZvo1AfcqpnUzsCDbMLieRAKv
 qNFGJ1W9NW2rKxHCH3rT/GYSPFnEUvm4SIM7PbBxdO6W9d7rWezD8ZstDb5adpCXvZJW
 4GC6lmLFOrnohmOWTuNfIzD8Gk337qyBinPVgT1v+AcK8IC7PNNQvNFRzRaKKXdFlvGO
 /GtA==
X-Gm-Message-State: AOJu0Yxf4FoNGOQdqnYqPX76ZinDgm/AuGKnjw50KIcgqyC0THCjAjNz
 KlOAN8EQYuzl/gy72obh9UO1EIc5kxxDyx+ZSpFoNsx1eiI9JSQ01Aoz+9xDO+v09kVQnFgWdgJ
 m3aZBDBqa3JeuJgnB3L0ORyDysibdoPNf5Kba
X-Gm-Gg: ASbGncuYZJ/X51YE5v9m16MwXDDqS1/LJ94kBn+PMDaD+UDGmroKc/tsMOpu2T9CLrb
 Ht1F331UkSUEkmL208PAjD08h/MgBG5o9NW2ywAcoo8JXhli2mJpv2omHvSD0BefCcX35csLBBi
 vwDWG2Q4sG3Kric6eHJx31ZATzFPE9qo6nrJ29po4HHv538Jujf2n11htuGUc9sud9jxqaw0L27
 gR/q1eFGu/xmswn5w==
X-Google-Smtp-Source: AGHT+IHZ4pHBGMCs17Cu4IIlm6m840b7m+Nrn0IjesOMJzSKz4qrK1lsGpHm0udPUcQXRBDS80VeRM0yXuq0FchDROA=
X-Received: by 2002:a05:690c:312:b0:723:8ccd:6898 with SMTP id
 00721157ae682-7238ccd7709mr112585047b3.10.1756854205440; Tue, 02 Sep 2025
 16:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250831123953.391803-1-clg@kaod.org>
 <20250831123953.391803-4-clg@kaod.org>
In-Reply-To: <20250831123953.391803-4-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 3 Sep 2025 08:33:14 +0930
X-Gm-Features: Ac12FXzglxREsGG9_KNUR1VReMd7PW5avYOpbxkR-HhGrxxnjLxZMmXTJ9AlE10
Message-ID: <CACPK8Xc8VDPhYstx_snAOWLM721rS5nW48_g_iNg1EU6BMg=5Q@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1756854205; x=1757459005; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t/ZFRfPiovJsDCAVY8sI/o5ycCjJCWKdwMsFw0MnuHQ=;
 b=c3L0qPhOIrMwwhSisDaTuaBm87rJ9tSAafnPPLzErezwrRD2Xe6MxPmkF0APwYzq6K
 Zi4PCP/5LXx9zuwsZmyvTM2gLoZBg2jMcfGpSYqj0I3h8wJGzUn72TYwYlMmpgT6dbkW
 DS5lA0u6tKXd4ZP7ByY4Y587eRUsJClbS0Ves=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jms.id.au
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=c3L0qPhO
Subject: Re: [Buildroot] [PATCH 3/4] configs/aspeed_ast2600evb_defconfig:
 bump U-Boot to commit 66672e5af36f
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAzMSBBdWcgMjAyNSBhdCAyMjoxMSwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9k
Lm9yZz4gd3JvdGU6Cj4KPiBVc2UgYSBuZXdlciBjb21taXQgSUQgKDIwMjMtMDctMjQpLiBXaGls
ZSBub3QgdGhlIGxhdGVzdCwgdGhpcyBjb21taXQKPiBtYXJrcyBhIHNpZ25pZmljYW50IG1pbGVz
dG9uZSBpbiB0aGUgb25nb2luZyBkZXZlbG9wbWVudCBhbmQgc3VwcG9ydAo+IG9mIEFTVDI2MDAg
U29DIGJvYXJkcy4KCldoeSBub3QgdGhlIGxhdGVzdD8KClJldmlld2VkLWJ5OiBKb2VsIFN0YW5s
ZXkgPGpvZWxAam1zLmlkLmF1PgoKPgo+IFNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVy
IDxjbGdAa2FvZC5vcmc+Cj4gLS0tCj4gIGNvbmZpZ3MvYXNwZWVkX2FzdDI2MDBldmJfZGVmY29u
ZmlnIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9jb25maWdzL2FzcGVlZF9hc3QyNjAwZXZiX2RlZmNvbmZpZyBi
L2NvbmZpZ3MvYXNwZWVkX2FzdDI2MDBldmJfZGVmY29uZmlnCj4gaW5kZXggNGU0OWM0YWNiZWFi
Li4yMDU3MDkxNzc2ZjMgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy9hc3BlZWRfYXN0MjYwMGV2Yl9k
ZWZjb25maWcKPiArKysgYi9jb25maWdzL2FzcGVlZF9hc3QyNjAwZXZiX2RlZmNvbmZpZwo+IEBA
IC0xOCw3ICsxOCw3IEBAIEJSMl9UQVJHRVRfVUJPT1Q9eQo+ICBCUjJfVEFSR0VUX1VCT09UX0JV
SUxEX1NZU1RFTV9LQ09ORklHPXkKPiAgQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fR0lUPXkKPiAg
QlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fUkVQT19VUkw9Imh0dHBzOi8vZ2l0aHViLmNvbS9vcGVu
Ym1jL3UtYm9vdC5naXQiCj4gLUJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1JFUE9fVkVSU0lPTj0i
ZjJiODJmYTRiYTE3ZWQ4MDkxZmU3NmMyODQyMjAwMDY2NDVhMjkzYiIKPiArQlIyX1RBUkdFVF9V
Qk9PVF9DVVNUT01fUkVQT19WRVJTSU9OPSI2NjY3MmU1YWYzNmZlMjk0ZGY1NmY4ZTc5NDIwNjll
MzkwOWYzNzkwIgo+ICBCUjJfVEFSR0VUX1VCT09UX0JPQVJEX0RFRkNPTkZJRz0iZXZiLWFzdDI2
MDAiCj4gIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfRFRDPXkKPiAgQlIyX1RBUkdFVF9VQk9PVF9D
VVNUT01fTUFLRU9QVFM9IkRFVklDRV9UUkVFPWFzdDI2MDBhMS1ldmIiCj4gLS0KPiAyLjUxLjAK
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
