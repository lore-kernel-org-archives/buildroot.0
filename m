Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CF0C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 08:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A2E4600CC;
	Wed, 28 Feb 2024 08:28:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qbO7LWe6FKMM; Wed, 28 Feb 2024 08:28:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B680606DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B680606DE;
	Wed, 28 Feb 2024 08:28:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C58931BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 08:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1D444158F
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 08:28:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ajk2RmJpS6VL for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 08:28:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 95C6041588
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95C6041588
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95C6041588
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 08:28:12 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-dccb1421bdeso5225504276.1
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 00:28:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709108891; x=1709713691;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V40mEibwz/Md/PwKBN4XyDH+w0wkHeakIGqNVYjG2Vg=;
 b=Yth7mDngbXeUiu/VY4axeEjtqQbGyUUcwEdKAskWubSo3ZkiL1Ng7Tf+5SVSO5kZcJ
 M30JO8NauUYK8K/Grt3D2w4itAt6j8laGMpN0faYEPEwmCWMbDPxfUjA237dXhSOnY/X
 36Dv6hCsT/4ZIBNhKMa4sKwiUwQvIELSTtSYDHaMD2xEBB6Mi1eOqYlo+NYs9b5daUC8
 rTeCsOaFzcCSCq2ySF1s3F+Pa9ndI1x1/akhSvw7+xUJ3CJvrQzVU/0pU8H8GU+W7gV9
 sjVgOzTR2oXj8+JfKpP50ed/KFIy1LqLtB7p3TvYZZqYPt8imRNYvIJAglGnTtox1uAf
 i+Gw==
X-Gm-Message-State: AOJu0YxuMoNqGyOmnt3C6i+yuKaPxlew0ulMlP5Jy1bZ38fL7DnXHm85
 Aw6Ilq0MjkJaK1gkIGRZLvzb4Y9gLVwUXLciDdlbI+m9DvBuedTd+6zNbvhvsqWVYbhBHkgqmDV
 xXm5UM/p8wLbC5AGXX2ssCDzjPMrMRceAG2jOzg==
X-Google-Smtp-Source: AGHT+IGHGkMiHEKfYFyHUdzq0AmOt9AG2slvec6fQayaMvk7iHoKxLCafCR7Awo7QPgPGtlhLjedoDLm8cd6FepGP0w=
X-Received: by 2002:a25:dc86:0:b0:dcc:ebb4:fdc0 with SMTP id
 y128-20020a25dc86000000b00dccebb4fdc0mr1734490ybe.65.1709108891287; Wed, 28
 Feb 2024 00:28:11 -0800 (PST)
MIME-Version: 1.0
References: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
 <20240224205654.1546744-17-dario.binacchi@amarulasolutions.com>
 <383a2418-fa99-44f6-935c-8423cf9c22b3@smile.fr>
 <CABGWkvr8UBGB=z9QWwdZxjHQ53E0gjXRp9oK0PUTmwo3Vas28g@mail.gmail.com>
 <28040f8a-c68e-4966-9e81-804f723f2100@smile.fr>
In-Reply-To: <28040f8a-c68e-4966-9e81-804f723f2100@smile.fr>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 28 Feb 2024 09:28:00 +0100
Message-ID: <CABGWkvrvhd0GYmoM=9PxvcO724EQn7zdYEdSDrcRg2yy2KG-ZQ@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709108891; x=1709713691;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V40mEibwz/Md/PwKBN4XyDH+w0wkHeakIGqNVYjG2Vg=;
 b=UhXUEKDS0VbkrSElHIPM8HbWoyLvHfFowdXr4vOaqPnTbFmwATdUJln/7V+EHgxIpo
 iYM6jhnS5er56N7Li188QqqlgDKnxbV8uQoKq4vXmbwEtUiCMNvzgeIasEmatjWehoIa
 6F1bJcKa3ohPLM4iWMAF2rDIH+eBydzexCciQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=UhXUEKDS
Subject: Re: [Buildroot] [PATCH v6 16/16] configs/ti_am62x_sk_defconfig:
 bump Linux version to 6.6.17
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gVHVlLCBGZWIgMjcsIDIwMjQgYXQgMTE6MjPigK9QTSBSb21haW4gTmFv
dXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gd3JvdGU6Cj4KPiBIaSBEYXJpbywKPgo+IExlIDI3
LzAyLzIwMjQgw6AgMTc6NDAsIERhcmlvIEJpbmFjY2hpIGEgw6ljcml0IDoKPiA+IEhpIFJvbWFp
biwKPiA+Cj4gPiBPbiBTdW4sIEZlYiAyNSwgMjAyNCBhdCA1OjQz4oCvUE0gUm9tYWluIE5hb3Vy
IDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+ID4+Cj4gPj4gSGVsbG8gRGFyaW8sCj4g
Pj4KPiA+PiBMZSAyNC8wMi8yMDI0IMOgIDIxOjU2LCBEYXJpbyBCaW5hY2NoaSBhIMOpY3JpdCA6
Cj4gPj4+IFRlc3RlZCBvbiBTSy1BTTYyQi1QMS4KPiA+Pgo+ID4+IFlvdSBjb3VsZCBjb21wbGV0
ZSB5b3VyIHNlcmllcyBieSB1cGRhdGluZyB0aGUgdGlfYW02NHhfc2tfZGVmY29uZmlnIHRvbyBh
bmQKPiA+PiByZW1vdmUgdGktazMtaW1hZ2UtZ2VuLgo+ID4KPiA+IEkgcHJlZmVycmVkIHRvIHN1
Ym1pdCB2ZXJzaW9uIDcgd2l0aG91dCB0aGUgcGF0Y2hlcyBmb3IgdXBkYXRpbmcgdGhlCj4gPiB0
aV9hbTY0eF9za19kZWZjb25maWcgYW5kIHRoZSByZW1vdmFsIG9mIHRoZSB0aS1rMy1pbWFnZS1n
ZW4gcGFja2FnZS4KPiA+IFRoaXMgaXMgYmVjYXVzZSBJIGRvIG5vdCBoYXZlIHRoZSBhbTY0eF9z
ayBib2FyZCB0byB0ZXN0IHRoZSBjaGFuZ2VzCj4gPiBvbi4gSG93ZXZlciwgSSBhbSBhdmFpbGFi
bGUgdG8gc3VibWl0IGEgc2VwYXJhdGUgc2VyaWVzIGZvciBhcHBseWluZwo+ID4gdGhlIGNoYW5n
ZXMgdG8gdGlfYW02NHhfc2tfZGVmY29uZmlnIGlmIHRoZXJlIGlzIHNvbWVvbmUgd2hvIGNhbiB0
ZXN0Cj4gPiB0aGUgY29uZmlndXJhdGlvbiBmb3IgbWUuCj4gPiBQbGVhc2UgbGV0IG1lIGtub3cu
Cj4KPiBNYXliZSB5b3UgY2FuIGFzayB0byBBbmRyZWFzIERhbm5lbmJlcmcgZm9yIHRoZSBhbTY0
eF9zaz8KPgo+ID4gTWF5YmUgaWYgeW91IGNhbiBhbHNvIHRlc3Qgb24gQU02NHgganVzdCB0byBi
ZSBzdXJlIHRoZSBkZWZjb25maWcgaXMgd29ya2luZy4KPgoKT2ssIEknbGwgZ2V0IHRvIHdvcmsg
YW5kIHRyeSB0byBtb2RpZnkgdGhlIGNvbmZpZ3VyYXRpb24gYmFzZWQgb24gbXkKZXhwZXJpZW5j
ZSB3aXRoCmFtNjJ4LiBUaGUgaWRlYSBpcyB0byBzdWJtaXQgdGhlIGNoYW5nZXMgb3ZlciB0aGUg
d2Vla2VuZC4KClRoYW5rcyBhbmQgcmVnYXJkcywKRGFyaW8KCj4gSSdtIHBsYW5uaW5nIG9uIHRl
c3RpbmcgdGhlIGVudGlyZSBzZXJpZXMgaGVyZSBwcmV0dHkgc29vbiBhbmQgd2lsbAo+IHByb3Zp
ZGUgZmVlZGJhY2sgKEkgaGF2ZSBhY2Nlc3MgdG8gYW55IGFuZCBhbGwgYm9hcmRzOikKPgo+IGh0
dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9waXBlcm1haWwvYnVpbGRyb290LzIwMjQtRmVicnVhcnkv
Njg1ODM2Lmh0bWwKPgo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPgo+Cj4gPgo+ID4gVGhhbmtz
IGFuZCByZWdhcmRzLAo+ID4gRGFyaW8KPiA+Cj4gPj4KPiA+PiBFeGNlcHQgZm9yIG1pbm9yIGlt
cHJvdmVtZW50LCB0aGlzIHNlcmllcyBpcyBvayBmb3IgbWUuCj4gPj4KPiA+PiBCZXN0IHJlZ2Fy
ZHMsCj4gPj4gUm9tYWluCj4gPj4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmlu
YWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ID4+Pgo+ID4+PiAt
LS0KPiA+Pj4KPiA+Pj4gQ2hhbmdlcyBpbiB2NToKPiA+Pj4gLSBCdW1wIHRvIDYuNi4xNyBmcm9t
IDYuNi4xCj4gPj4+IC0gVXBkYXRlIGNvbW1pdCBtZXNzYWdlCj4gPj4+Cj4gPj4+IENoYW5nZXMg
aW4gdjQ6Cj4gPj4+IC0gQWRkIEJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01f
Nl82IHRvIHRpX2FtNjJ4X3NrX2RlZmNvbmZpZy4KPiA+Pj4KPiA+Pj4gbm8gY2hhbmdlcyBzaW5j
ZSB2MQo+ID4+Pgo+ID4+PiAgY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcgfCA0ICsrLS0K
PiA+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
Pj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9jb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZyBiL2Nv
bmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnCj4gPj4+IGluZGV4IDQ4NGY5ZmViOGM2MS4uOGM5
NjJiNGE5NDk0IDEwMDY0NAo+ID4+PiAtLS0gYS9jb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZp
Zwo+ID4+PiArKysgYi9jb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZwo+ID4+PiBAQCAtMSwx
MSArMSwxMSBAQAo+ID4+PiAgQlIyX2FhcmNoNjQ9eQo+ID4+PiAtQlIyX1BBQ0tBR0VfSE9TVF9M
SU5VWF9IRUFERVJTX0NVU1RPTV82XzQ9eQo+ID4+PiArQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9I
RUFERVJTX0NVU1RPTV82XzY9eQo+ID4+PiAgQlIyX1JPT1RGU19QT1NUX0JVSUxEX1NDUklQVD0i
Ym9hcmQvdGkvYW02Mngtc2svcG9zdC1idWlsZC5zaCIKPiA+Pj4gIEJSMl9ST09URlNfUE9TVF9J
TUFHRV9TQ1JJUFQ9ImJvYXJkL3RpL2FtNjJ4LXNrL3Bvc3QtaW1hZ2Uuc2giCj4gPj4+ICBCUjJf
Uk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1jIHR0eVMyLDExNTIwMG44IC1yIC9kZXYvbW1jYmxr
MXAyIC14IGVhcmx5Y29uPW5zMTY1NTBhLG1taW8zMiwweDAyODAwMDAwIgo+ID4+PiAgQlIyX0xJ
TlVYX0tFUk5FTD15Cj4gPj4+ICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKPiA+
Pj4gLUJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuNC4xNiIKPiA+Pj4g
K0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuNi4xNyIKPiA+Pj4gIEJS
Ml9MSU5VWF9LRVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUc9eQo+ID4+PiAgQlIyX0xJTlVY
X0tFUk5FTF9EVFNfU1VQUE9SVD15Cj4gPj4+ICBCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNf
TkFNRT0idGkvazMtYW02MjUtc2siCj4gPj4KPiA+Cj4gPgo+CgoKLS0gCgpEYXJpbyBCaW5hY2No
aQoKU2VuaW9yIEVtYmVkZGVkIExpbnV4IERldmVsb3BlcgoKZGFyaW8uYmluYWNjaGlAYW1hcnVs
YXNvbHV0aW9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCgpBbWFy
dWxhIFNvbHV0aW9ucyBTUkwKClZpYSBMZSBDYW5ldmFyZSAzMCwgMzExMDAgVHJldmlzbywgVmVu
ZXRvLCBJVAoKVC4gKzM5IDA0MiAyNDMgNTMxMAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3
d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
