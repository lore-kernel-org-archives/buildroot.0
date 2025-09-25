Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F105BCAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD18E61601;
	Thu, 25 Sep 2025 20:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QGhrOI89dYlK; Thu, 25 Sep 2025 20:17:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7FBB6157A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7FBB6157A;
	Thu, 25 Sep 2025 20:17:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 35A9C12D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B9A88439B
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 20_6ubjKMVBT for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:17:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EAE4C84384
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAE4C84384
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAE4C84384
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:05 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45ed646b656so9886195e9.3
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831424; x=1759436224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3xVBVrqt8AGw4E4GPQjEyrq8PofHWEPcyLrbaGWfKqI=;
 b=seTpVGdiTMgpl31BccKywtuzYQsYyX364WiwGyfUotWU+75h6BtJdtIbwOdzXerOXc
 RnuFe6iL4CnLrG+pjcM1RqYGeQw1xBMaM1TEtsu7epns2DHj7nLl/tkwyodVxPnF8sHY
 QutxpUEU3xKI6EC4yvMGmZF2vwq5aiUU3751EJGF/k8tIHqmK7GvrcK7zrpgsM6vNXMQ
 9+JNUN4ZGaK6HYSOjlncX+p3v6/rDqiwqjIzZfYm6gOljA5Z7aA46JLSzkR8w/pGQgFO
 IXFuV7SEAsNM0CxjSEfKyJOcaaIsgmkPvUzq51B3OdIlnuxF/S00/JdV2JkzXw0+iXZN
 akxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjBUxtCz38bujz+EQbLimYokgqKlcjuSg2/7YAmAd8FsiHARTz5kumVxoxX0mPbENA/BbTQG5J1Xs=@buildroot.org
X-Gm-Message-State: AOJu0YwIyHVSzgem8b8yAWFtSf03TYJVCSeh5SWSMrBczKagTbA2wh2L
 LMEvKjqLazfx05KZvZgagv9LSkldfEkHg32EF5IbFposOJPAEnqt03439B8M40L7mbbyA99OtiE
 q06+qiPU=
X-Gm-Gg: ASbGnct5bEbRW2nb+cAaqvSyVR/t5TivZdc7ZKkISGBIaeFxn93zjIp5jlvRGG+pLL+
 I6Pf16j99XyMZYuVsxIEjUUaQuZGkVOc9AFfoWG9QqXBbbmdtdoTBBoKeRLKou8P4UhGpeDd8ph
 pweofP64yFuu/j0I4Vgbh3zmgWd6pcgfuBNXXVPjO/N62Lf//DWvivgd773Sdu1uCqQI1wr8FUz
 oL5vB5Aa5wX0krOwVqBoc66z/Ca+YAZI0hoi5PRAX7grYjub4jbwDHcIY3CIqO3bAqy+wYESOXP
 mk4iKmYUFJmvHb8Ei7GWQto3x/yH0EwdaSMx0eZOjQJE754LPHFJkk0DZunmwT3FskCJSnhJfiR
 pVHB2kb8+uchlMkY=
X-Google-Smtp-Source: AGHT+IG17MOumHOjZwOJKDfj3q14cmEDz/zttj/Ht2T4/ENo5M2UZRY7NUH3BmSLhvCpZ4tooNRCmQ==
X-Received: by 2002:a05:600c:3e0e:b0:46e:3b81:c3f9 with SMTP id
 5b1f17b1804b1-46e3b81c4e2mr4089635e9.17.1758831423864; 
 Thu, 25 Sep 2025 13:17:03 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2a996d7dsm94999965e9.4.2025.09.25.13.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:17:03 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:17:02 +0200
Message-ID: <20250925201703.44469-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920155803.829424-1-romain.naour@smile.fr>
References: <20250920155803.829424-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831424; x=1759436224; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3xVBVrqt8AGw4E4GPQjEyrq8PofHWEPcyLrbaGWfKqI=;
 b=I2PDxkt6ZA5TmlXuv8wWHjrgx8Sh9z6PpowIq82fEAQTdQqV3w/nEKgzfumsgyE8iY
 yOVALO5Q/ngQq+PMDOTrdrOS00wsg7vujXOmozrFc6TZlSpPZeNAoxbj4wCLZCxpSlSS
 YBubNGCzgg+FRpm09yocSrmXtjtz9BWYBoGD2f0fxESutH//AZZf+TSIWC9hN34EsTNj
 +Uz5BCAUjZmUGLVz0NcI+HGVoG1I48+o83stFbcVexL7HOgjikBqfuNt9ySiNKxvgfPq
 fMDhsaKOVOwlMgloMKorq3qb8Ng0bx/AHPf2dxWeK06Aa8XxhwGzthxLch69FLsIvP49
 Vxyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=I2PDxkt6
Subject: Re: [Buildroot] [PATCHv2] support/testing: TestZfsUclibc: use
 internal backend for uClibc-ng toolchain
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gQXMgcmVwb3J0ZWQgb24gdGhlIG1haWxpbmcgbGlzdCBbMV0gd2hpbGUg
aW52ZXN0aWdhdGluZyB0aGUKPiBUZXN0WmZzVWNsaWJjIEdpdGxhYi1DSSBmYWlsdXJlLCB0aGUg
cHl0aG9uIDMuMTMgaW50ZXJwcmV0ZXIgaXRzZWYKPiBzZWdmYXVsdCBhdCBydW50aW1lOgo+IAo+
ICAgRmF0YWwgUHl0aG9uIGVycm9yOiBfUHlUaHJlYWRTdGF0ZV9BdHRhY2g6IG5vbi1OVUxMIG9s
ZCB0aHJlYWQgc3RhdGUKPiAgIFB5dGhvbiBydW50aW1lIHN0YXRlOiBwcmVpbml0aWFsaXplZAo+
ICAgVGhyZWFkIDB4U2VnbWVudGF0aW9uIGZhdWx0Cj4gCj4gVGhpcyBpc3N1ZSBpcyByZWxhdGVk
IHRvIHRoZSBweXRob24gMy4xMyB2ZXJzaW9uIGJ1bXAgWzJdIHdlcmUgc2V2ZXJhbAo+IGludGVy
bmFsIGNoYW5nZXMgd2VyZSBhZGRlZCBbM10gdG8gc3VwcG9ydCBQRVAgNzAzIFs0XS4KPiBQRVAg
NzkzIGlzIGFib3V0IENQeXRob27igJlzIGdsb2JhbCBpbnRlcnByZXRlciBsb2NrICjigJxHSUzi
gJ0pIHJlbW92YWwKPiBmb3IgbXVsdGktdGhyZWFkcyBzdXBwb3J0IHRoYXQgcmVxdWlyZXMgYSB3
b3JraW5nIEMxMSAidGhyZWFkX2xvY2FsIgo+IGZvciB0aHJlYWQtbG9jYWwgc3RvcmFnZSBbNV0u
Cj4gCj4gVGhlIG5ldyB1Y2xpYmMtbmcgMS4wLjU1IHJlbGVhc2UgY29udGFpbnMgYSBmaXggZm9y
IHRoaXMgaXNzdWUgWzZdLgo+IAo+IFNpbmNlIHRoZSBwcmVidWlsdCBCb290bGluZyBhYXJjaDY0
IHVjbGliYyBzdGFibGUgMjAyNS4wOC0xIGlzIGJhc2VkCj4gb24gcHJldmlvdXMgdUNsaWJjLW5n
IHJlbGVhc2UgKDEuMC41NCkgd2UgaGF2ZSB0byB1c2UgdGhlIGludGVybmFsCj4gdG9vbGNoYWlu
IGJhY2tlbmQgdG8gYnVpbGQgYSBuZXcgdUNsaWJjLW5nIHRvb2xjaGFpbiB1c2luZyB1Y2xpYmMt
bmcKPiAxLjAuNTUuCj4gCj4gRml4ZXM6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vam9icy8xMTI3MTEyNDg1OSAoVGVzdFpmc1VjbGliYykKPiAKPiBbMV0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzdhNGQyNDVkLTE1NTYtNDNjOS04OTk3
LTZiMWY3OTFhZmJmZUBnbWFpbC5jb20vIChUZXN0WmZzVWNsaWJjKQo+IFsyXSBkNjNlMjA3ZWI4
NjkwNjNmODJjODY3NjU4Njc2YzI5MDNiZWIwOGNiCj4gWzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9w
eXRob24vY3B5dGhvbi9jb21taXQvNmU5N2E5NjQ3YWUwMjhmYWNiMzkyZDEyZmMyNDk3MzUwMzY5
M2JkNgo+IFs0XSBodHRwczovL3BlcHMucHl0aG9uLm9yZy9wZXAtMDcwMy8KPiBbNV0gaHR0cHM6
Ly9nY2MuZ251Lm9yZy9vbmxpbmVkb2NzL2djYy0xNS4xLjAvZ2NjL1RocmVhZC1Mb2NhbC5odG1s
Cj4gWzZdIGh0dHBzOi8vZ2l0aHViLmNvbS93YngtZ2l0aHViL3VjbGliYy1uZy9jb21taXQvOTRj
MTI5N2Q1MjI2M2UyMGNkOTcxNTYwMWFmYTM3ZjQ5ZDAwOGQ5Mwo+IAo+IENjOiBKb3PDqSBMdWlz
IFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4KPiBDYzogV2FsZGVt
YXIgQnJvZGtvcmIgPHdieEBvcGVuYWRrLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFv
dXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KCkFwcGxpZWQgdG8gMjAyNS4wMi54LCAyMDI1LjA1
LnggJiAyMDI1LjA4LnguIFRoYW5rcwoKPiAtLS0KPiB2MjogRm9sbG93aW5nIHRoZSB1Q2xpYmMt
bmcgMS4wLjU1IHJlbGVhc2UsIHVwZGF0ZSBUZXN0WmZzVWNsaWJjIGNoYW5nZXMKPiAgICAgdG8g
dXNlIGludGVybmFsIHRvb2xjaGFpbiBiYWNrZW5kLgo+ICAgICBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9idWlsZHJvb3QvYU0yZkRMMUlIZ3hYN2FyekB3YWxkZW1hci1icm9ka29yYi5kZS9ULyN1
Cj4gLS0tCj4gIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5IHwgMTMg
KysrKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
dGVzdF96ZnMucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weQo+
IGluZGV4IDFiOTA3YWM0ZGUuLmMyMThjYzM2YTggMTAwNjQ0Cj4gLS0tIGEvc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkKPiArKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X3pmcy5weQo+IEBAIC03NCw5ICs3NCwxOCBAQCBjbGFzcyBUZXN0WmZz
R2xpYmMoVGVzdFpmc0Jhc2UpOgo+ICAKPiAgCj4gIGNsYXNzIFRlc3RaZnNVY2xpYmMoVGVzdFpm
c0Jhc2UpOgo+IC0gICAgY29uZmlnID0gVGVzdFpmc0Jhc2UuY29uZmlnICsgXAo+ICsgICAgIyBU
aGUgQm9vdGxpbmcgYWFyY2g2NCB1Y2xpYmMgc3RhYmxlIDIwMjUuMDgtMSBuZWVkcyB0byBiZQo+
ICsgICAgIyByZWJ1aWxkIHdpdGggdUNsaWJjLW5nIDEuMC41NS4KPiArICAgICMgU2VlOiBodHRw
czovL2dpdGh1Yi5jb20vd2J4LWdpdGh1Yi91Y2xpYmMtbmcvY29tbWl0Lzk0YzEyOTdkNTIyNjNl
MjBjZDk3MTU2MDFhZmEzN2Y0OWQwMDhkOTMKPiArICAgIGNvbmZpZyA9IFRlc3RaZnNCYXNlLmNv
bmZpZy5yZXBsYWNlKCdCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXlcbicsICcnKQo+ICsgICAgY29u
ZmlnID0gY29uZmlnLnJlcGxhY2UoJ0JSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTj15XG4n
LCAnJykgKyBcCj4gICAgICAgICAgIiIiCj4gLSAgICAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5B
TF9CT09UTElOX0FBUkNINjRfVUNMSUJDX1NUQUJMRT15Cj4gKyAgICAgICAgQlIyX1RPT0xDSEFJ
Tl9CVUlMRFJPT1RfVUNMSUJDPXkKPiArICAgICAgICBCUjJfS0VSTkVMX0hFQURFUlNfNV80PXkK
PiArICAgICAgICBCUjJfVE9PTENIQUlOX0JVSUxEUk9PVF9MT0NBTEU9eQo+ICsgICAgICAgIEJS
Ml9QVEhSRUFEX0RFQlVHPXkKPiArICAgICAgICBCUjJfVE9PTENIQUlOX0JVSUxEUk9PVF9DWFg9
eQo+ICsgICAgICAgIEJSMl9HQ0NfRU5BQkxFX09QRU5NUD15Cj4gICAgICAgICAgIiIiCj4gIAo+
ICAgICAgZGVmIHRlc3RfcnVuKHNlbGYpOgo+IC0tIAo+IDIuNTEuMAo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
