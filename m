Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9AAC54E5D
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 10:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8818240B0F;
	Tue, 19 Mar 2024 10:28:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X7cayc0N_77p; Tue, 19 Mar 2024 10:28:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 792FF40B60
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 792FF40B60;
	Tue, 19 Mar 2024 10:28:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA3B41BF2B6
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 10:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96D7A40B60
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 10:28:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DpriEIORUJEA for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 10:28:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com;
 envelope-from=javad.rahimipetroudi@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA1F240B0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA1F240B0F
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA1F240B0F
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 10:28:20 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-5a4859178f1so2091443eaf.0
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 03:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710844099; x=1711448899;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IMTis99azQbDCh+jJ76ePHzIp2mdCAIapHQyEhTIfoM=;
 b=KmljHXuvJ6IPOoxyhc+XMjWYJ7I7iQNu551pDJXPDpgrPlHTdNapRK/G2BZBp4VQkV
 J2zS4P0vDMXOmw1CZXUtDVI2iYZlCTOTNxryIhd6Oppp3em9VsqyGVQy5NgT7C2iOCE9
 2O2pFDvvASalYrwUoNba+bu8HPhHqZOMtpL2g3DCuIOgGgT4EwXJ11ilYUB17ZwtxCal
 1mMHgVCfs2Q7S4pieSI4SKXGrsBLVo7C1JtwtpqmdTconecIC8n6noORTFIO/QNgKCa/
 KnMwvn/Qn8jUoSv5TjjS2gWQbCXamjzdng4Qi5/PouoYDhQhuw9N01qLzsryiJtMYA1r
 F5Kg==
X-Gm-Message-State: AOJu0YyVGY6Z7BuudVFpz7rb0/BYIVzexGj/DCtslKhcjl4Ya3EjyKPl
 2wQPW/9XXLodRNdK52zXW9My7lRRD/3mLGu7m7iAMRiW3AFh7W52vTWc9vnmJkh+XIvehM+TEXa
 zDKWYMK9wp5N59CGG7xw1u1VebIBzjrUhm/972h/zHdm5ekB3C+wwFA==
X-Google-Smtp-Source: AGHT+IHqJP0arXr+S/HbNODkxuS0s4HVieok5ScoZDqjhBV6ZUf8L4NQjwLzdc/96d3riOIYEbTTJNOvFSKe6G2Nrqk=
X-Received: by 2002:a4a:9d4d:0:b0:5a4:6594:9c53 with SMTP id
 f13-20020a4a9d4d000000b005a465949c53mr10061185ook.4.1710844099400; Tue, 19
 Mar 2024 03:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240319070554.1323606-1-javad.rahimipetroudi@mind.be>
 <20240319070554.1323606-3-javad.rahimipetroudi@mind.be>
 <0f200aec-5ba4-4338-a8bd-f5b8a8429a32@mind.be>
In-Reply-To: <0f200aec-5ba4-4338-a8bd-f5b8a8429a32@mind.be>
Date: Tue, 19 Mar 2024 11:28:08 +0100
Message-ID: <CAP_ewpNv3=yRKwOfpBVHAy5mY2uDf-dxEErXrzVm=Ff7xNwCyg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1710844099; x=1711448899; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IMTis99azQbDCh+jJ76ePHzIp2mdCAIapHQyEhTIfoM=;
 b=RAgRlnmFRgAgfa1+iOTcKG19g5vz7k0Cy9IPi1q0V3sppaPUBjN5XvwGGTBjp3qkMb
 s7ZUghZT2KntAfEE9Cex6HTz7FbIabsE2Gkt97e7f54A9ZVRmNQ7t2xkyDVcFMTGOGB8
 mHGJXJQ1sLOu7Oif0+3hGUSyCaO0uGu4TgoTOYav8z6liSUY/MnOTVqg/Gx4dNzTK0Ju
 WyDIxa45554TtLwW7O4ZMo4KksPVF+yCC+oJarbcJ9Ynkzwyqy+9zn5l/4OSZIN9bfUU
 8FNuoJSFxzN569U4WkovzzLMmcJBmu8CVJA6Ive/pZN1d10MVEIh1T2qEx8M94d2aeig
 xlWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=RAgRlnmF
Subject: Re: [Buildroot] [PATCH v3 3/3] configs/avenger96: bump ATF version
 to v2.8
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
From: Javad Rahimipetroudi via buildroot <buildroot@buildroot.org>
Reply-To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
Cc: Marleen Vos <marleen.vos@mind.be>,
 Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gVHVlLCBNYXIgMTksIDIwMjQgYXQgOTo0N+KAr0FNIEFybm91dCBWYW5k
ZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4gd3JvdGU6Cj4KPgo+Cj4gT24gMTkvMDMvMjAyNCAw
ODowNSwgSmF2YWQgUmFoaW1pcGV0cm91ZGkgd3JvdGU6Cj4gPiBUaGlzIHBhdGNoIHVwZ3JhZGVz
IHRoZSBBVEYgdmVyc2lvbiB0byB2Mi44LiBQbGVhc2Ugbm90ZSB0aGF0Cj4gPiBkdWUgdG8gRFRT
IGNoYWdlcyBmcm9tIGNvbW1pdCA1MWUyMjMwNThmZTcwYjMxMTU0MjE3OGYxODY1NTE0NzQ1ZmE3
ODc0Cj4gPiAoImZlYXQoc3RtMzJtcDE1LWZkdHMpOiBhZGQgQXZlbmdlcjk2IGJvYXJkIHdpdGgg
U1RNMzJNUDE1N0EgREhDT1IgU29NIikKPiA+IFRoZSBBVEYgYWRkaXRpb25hbCBidWlsZCB2YXJp
YWJsZSBhbHNvIG1vZGlmaWVkIHRvIHVzZSB0aGUgbmV3IERUUyBmaWxlLgo+Cj4gICBJIG5vdGlj
ZWQgdGhhdCB0aGUgb2xkIERUUyBmaWxlIGZkdHMvc3RtMzJtcDE1N2EtYXZlbmdlcjk2LmR0cyBz
dGlsbCBleGlzdHMsCj4gYnV0IEkgc3VwcG9zZSBpdCBkb2Vzbid0IGFjdHVhbGx5IHdvcmsgYW55
IG1vcmUgdGhlbj8KPgpZZXMsIHdlIGFyZSB1c2luZyAic3RtMzJtcDE1N2EtZGhjb3ItYXZlbmdl
cjk2LmR0cyIuIElmCiJzdG0zMm1wMTU3YS1hdmVuZ2VyOTYuZHRzIgpiZSB1c2VkLCB0aGUgYm9h
cmQgd2lsbCBub3QgYm9hcmQgd2l0aCB0aGUgZm9sbG93aW5nIGVycm9yOgoKTk9USUNFOiAgQ1BV
OiBTVE0zMk1QMTU3QUFDIFJldi5CCk5PVElDRTogIE1vZGVsOiBBcnJvdyBFbGVjdHJvbmljcyBT
VE0zMk1QMTU3QSBBdmVuZ2VyOTYgYm9hcmQKRVJST1I6ICAgbnZtZW0gbm9kZSBib2FyZF9pZCBu
b3QgZm91bmQKRVJST1I6ICAgUHJvZHVjdF9iZWxvd18ydjU9MToKRVJST1I6ICAgIEhTTFZFTiB1
cGRhdGUgaXMgZGVzdHJ1Y3RpdmUsCkVSUk9SOiAgICBubyB1cGRhdGUgYXMgVkREID4gMi43VgpQ
QU5JQyBhdCBQQyA6IDB4MmZmZWU5NWQKCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYXZhZCBSYWhpbWlw
ZXRyb3VkaSA8amF2YWQucmFoaW1pcGV0cm91ZGlAbWluZC5iZT4KPiA+IC0tLQo+ID4gICBjb25m
aWdzL2F2ZW5nZXI5Nl9kZWZjb25maWcgfCA0ICsrLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvY29uZmln
cy9hdmVuZ2VyOTZfZGVmY29uZmlnIGIvY29uZmlncy9hdmVuZ2VyOTZfZGVmY29uZmlnCj4gPiBp
bmRleCA5OGE3MWEwZjI1Li42N2I2ZDE2NzQ5IDEwMDY0NAo+ID4gLS0tIGEvY29uZmlncy9hdmVu
Z2VyOTZfZGVmY29uZmlnCj4gPiArKysgYi9jb25maWdzL2F2ZW5nZXI5Nl9kZWZjb25maWcKPiA+
IEBAIC0yOSwxMyArMjksMTMgQEAgQlIyX1RBUkdFVF9ST09URlNfRVhUMl9TSVpFPSIxMjBNIgo+
ID4gICAjIEJvb3Rsb2FkZXJzCj4gPiAgIEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkU9
eQo+ID4gICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OPXkK
PiA+IC1CUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OX1ZBTFVF
PSJ2Mi42Igo+ID4gK0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJ
T05fVkFMVUU9InYyLjgiCj4KPiAgIFRoZSBpbnRlbnRpb24gd2FzIHRvIGJlIGFibGUgdG8gdXNl
Cj4gQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9MQVRFU1RfTFRTXzJfOF9WRVJTSU9O
IGhlcmUsIHNvIHRoYXQgaXQgZ2V0cwo+IHVwZGF0ZWQgYXV0b21hdGljYWxseSB3aGVuIHRoZSBB
VEYgTFRTIHZlcnNpb24gaXMgdXBkYXRlZC4KPgo+ICAgRm9yIHN1cmUsIHYyLjggaXMgbm90IGEg
Z29vZCBjaG9pY2UsIGJlY2F1c2UgdGhlcmUncyBhbHJlYWR5IGEgdjIuOC4xNiEKVGhhbmtzLCBJ
IHdpbGwgdGVzdCBhbmQgdXNlIGx0cy0yLjguMTYgdmVyc2lvbi4KPgo+ID4gICBCUjJfVEFSR0VU
X0FSTV9UUlVTVEVEX0ZJUk1XQVJFX1BMQVRGT1JNPSJzdG0zMm1wMSIKPiA+ICAgQlIyX1RBUkdF
VF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9GSVA9eQo+ID4gICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVE
X0ZJUk1XQVJFX0JMMzE9eQo+ID4gICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX1VC
T09UX0FTX0JMMzM9eQo+ID4gICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX1VCT09U
X0JMMzNfSU1BR0U9InUtYm9vdC1ub2R0Yi5iaW4iCj4gPiAtQlIyX1RBUkdFVF9BUk1fVFJVU1RF
RF9GSVJNV0FSRV9BRERJVElPTkFMX1ZBUklBQkxFUz0iU1RNMzJNUF9TRE1NQz0xIEFBUkNIMzJf
U1A9c3BfbWluIERUQl9GSUxFX05BTUU9c3RtMzJtcDE1N2EtYXZlbmdlcjk2LmR0YiBFPTAgQkwz
M19DRkc9JChCSU5BUklFU19ESVIpL3UtYm9vdC5kdGIiCj4KPiAgIFBsZWFzZSBjb21tZW50IGlu
IHRoZSBjb21taXQgbWVzc2FnZSBvbiB3aHkgRT0wIGlzIHJlbW92ZWQuIEl0IHdhcyBhZGRlZCBi
eQo+IFBldGVyIGluIGRlYjhkNzFjOTI4NWViNjBiYzNkMjhlOGFiY2Y3MjA4Zjc4OTgwYTcgIHdp
dGggdGhpcyBjb21tZW50Ogo+Cj4gICAgICBJbnN0ZWFkIHVzZSB2Mi41IHRvIG1hdGNoIHRoZSBv
dGhlciBzdG0zMm1wMSBib2FyZHMgYW5kIHVzZSB0aGUgc2FtZSBFPTAKPiAgICAgIC1XZXJyb3Ig
d29ya2Fyb3VuZC4KPgo+IFRoZSAidGhlIHNhbWUiIHJlZmVycyB0byBjb21taXQgMWMwYzY3ZmMx
YWUxNDZiMzQ0NzUyMzFmYjcwMmU3ZjJlNmJmOWY4ZiB3aGljaAo+IGhhcyB0aGlzIGNvbW1lbnQ6
Cj4KPiAgICAgIFdpdGggdGhlIG1vdmUgdG8gZGVmYXVsdCB0byBHQ0MgMTIgaW4gY29tbWl0IGUw
MDkxZTQyZWVmOSAocGFja2FnZS9nY2M6Cj4gICAgICBzd2l0Y2ggdG8gZ2NjIDEyLnggYXMgdGhl
IGRlZmF1bHQpLCBURi1BIG5vdyBmYWlscyB0byBidWlsZCBhcyBhIHdhcm5pbmcgaXMKPiAgICAg
IGdlbmVyYXRlZCBhbmQgaXQgYnVpbGRzIHdpdGggLVdlcnJvcjoKPgo+ICAgICAgICBDQyAgICAg
IHBsYXQvc3Qvc3RtMzJtcDEvYmwyX3BsYXRfc2V0dXAuYwo+ICAgICAgZHJpdmVycy9zdC9pby9p
b19zdG0zMmltYWdlLmM6IEluIGZ1bmN0aW9uIOKAmHN0bTMyaW1hZ2VfcGFydGl0aW9uX3JlYWTi
gJk6Cj4gICAgICBkcml2ZXJzL3N0L2lvL2lvX3N0bTMyaW1hZ2UuYzoyNDk6MTM6IGVycm9yOiDi
gJhyZXN1bHTigJkgbWF5IGJlIHVzZWQKPiB1bmluaXRpYWxpemVkIFstV2Vycm9yPW1heWJlLXVu
aW5pdGlhbGl6ZWRdCj4gICAgICAgIDI0OSB8ICAgICAgICAgaW50IHJlc3VsdDsKPiAgICAgICAg
ICAgIHwgICAgICAgICAgICAgXn5+fn5+Cj4gICAgICBjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0
cmVhdGVkIGFzIGVycm9ycwo+Cj4gICAgICBUaGlzIGlzIGZpeGVkIGluIFRGLUEgdjIuNiB3aXRo
IGNvbW1pdCBjMWQ3MzJkMGRiMjQgKGZpeChpb19zdG0zMmltYWdlKToKPiAgICAgIHVuaW5pdGlh
bGl6ZWQgdmFyaWFibGUgd2FybmluZyksIGJ1dCBJIGRvIG5vdCBoYXZlIHRoZSBib2FyZCB0byB2
ZXJpZnkgaWYKPiAgICAgIHYyLjYgd29ya3MsIHNvIGluc3RlYWQgZGlzYWJsZSAtV2Vycm9yIGJ5
IHBhc3NzaW5nIEU9MC4KPgo+ICAgU28gaW5kZWVkLCB0aGUgRT0wIGlzIG5vIGxvbmdlciBuZWNl
c3Nhcnkgd2hlbiB3ZSBtb3ZlIHRvIHYyLjYgb3IgbGF0ZXIsIGJ1dAo+IHRoaXMgc2hvdWxkIGJl
IGV4cGxhaW5lZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCj4KU3VyZSwgSSB3aWxsIGFkZCBpdCBp
biB0aGUgY29tbWl0Cj4gICBSZWdhcmRzLAo+ICAgQXJub3V0Cj4KPiA+ICtCUjJfVEFSR0VUX0FS
TV9UUlVTVEVEX0ZJUk1XQVJFX0FERElUSU9OQUxfVkFSSUFCTEVTPSJTVE0zMk1QX1NETU1DPTEg
QUFSQ0gzMl9TUD1zcF9taW4gRFRCX0ZJTEVfTkFNRT1zdG0zMm1wMTU3YS1kaGNvci1hdmVuZ2Vy
OTYuZHRiIEJMMzNfQ0ZHPSQoQklOQVJJRVNfRElSKS91LWJvb3QuZHRiIgo+ID4gICBCUjJfVEFS
R0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0lNQUdFUz0iZmlwLmJpbiAqLnN0bTMyIgo+ID4gICBC
UjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX05FRURTX0RUQz15Cj4gPiAgIEJSMl9UQVJH
RVRfVUJPT1Q9eQoKUmVnYXJkcywKSmF2YWQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
