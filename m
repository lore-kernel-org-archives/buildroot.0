Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109D9CD37AC
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 18:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB03A60735;
	Wed, 13 May 2026 18:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 13n_-AbRNr6b; Wed, 13 May 2026 18:36:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE19960738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778697398;
	bh=dQe0CPuFi60IOGKT5PgoaWGHezJXehK3bpBH7Xyhu4Y=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=am2AloYoUzG+nt/opU9On+OZs7s7N6w/xByXmcQAkoSgnJmO1qMuBeAd+I7FowTMv
	 9bEP3wmbOVDc7ZPAoPqs8WL2ag49Ahn3ObjERtiz4GrFinGfkDQlQ9ZHhuzJVZ72MU
	 SFCeHIjmdpyh0bd2ICV/TKRQ7LtPNwRt/xPTrGRkpkbFung+uh0RFcow0Opz9HkY2L
	 D0a/+Fm1YTL1Gxdw0QNVrn26mbsDxB3aK9lOlKxfyafGQZGag5HYwPVJ2slztTWaQA
	 9NdwL2iQIdMGZISXkCIlCpAVVBxvdTcws87B+1T+S8N4h56pDzRVneA8kkqpJrb5RF
	 YYzybww8BierA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE19960738;
	Wed, 13 May 2026 18:36:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BF4636F
 for <buildroot@buildroot.org>; Wed, 13 May 2026 18:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C24240102
 for <buildroot@buildroot.org>; Wed, 13 May 2026 18:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fE0h58zG2xN6 for <buildroot@buildroot.org>;
 Wed, 13 May 2026 18:36:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA06340152
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA06340152
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA06340152
 for <buildroot@buildroot.org>; Wed, 13 May 2026 18:36:33 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-43fe608cb92so4528313f8f.2
 for <buildroot@buildroot.org>; Wed, 13 May 2026 11:36:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778697392; cv=none;
 d=google.com; s=arc-20240605;
 b=hq8xiS4mICEa/9MbQdbwYVoHs7uq0XYne4ucSHVXLGxyLhvPl0vwCNNk3HiFHSPRxv
 FnNFmAMtoYSlYdSSIIySY34W3OTETCKz7t7mfBKTRgjc80osGjFJPfpN5cLoAV8uM/wy
 3tgZQeZ1vRRBah5EfAknA0RraH2yMik/Io2XJcHi/SF224EBaaJHp0J7l394Bvf0hQEG
 9BltXzMUf9NI3tBa1qiJ0iVoXdPmcPhc+JZs6dAnb1VQW5seCdRcUF1K6WZ97sVLfrlr
 2OCnjxmLijN5FtesfsWE52lRro+QvtCiBUGmU6bbPBOVIA7BLhP8imblBJeh2IArWyDg
 vABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=BfV061fExuFftX009UNoF4iAsSex79CTOlZi1MnZOlA=;
 fh=vqI4HZAeDLA61/B+Lw/9MOP6+wMkwdbrtiLhDiBqY2w=;
 b=aq3KLZbg3qfbYfIYkoXMCgYkcVYtYRIxhW/UYfcMhYLFx4VnhSXKzlPF0ZwRxAyoeU
 qHG0TeJ63F5i36BWJqNP3jKArVn0tInLPC7wsWIue5qYmyvUukbFbaDvNMi0d4Ct/bcr
 OmOKI7vGzNvgKBTwV8Gax2OJ1UJhHquIZ26MQTd3c2rbjsq1f/Q6GaBaAQF+hNQfc1Fn
 a/ZiyJatFk7A5NoXIUw9IobP7ZMSkhwBfwlH2wLI7ZU2SgbepOspEOhNvH5CqnRmdSZ2
 RyM7tNop+DkNVWb9D7L8X3rGxb/BWWqUUCB+vesbzbQ+CIcd5W2vprNyd08P7Hj1mqn3
 +lXw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778697392; x=1779302192;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BfV061fExuFftX009UNoF4iAsSex79CTOlZi1MnZOlA=;
 b=bhO9y5b9u7d/CrFGDYjoHSJbzLOpqF8EGS2jVm8wSLWiAk2rG88al2ZdPSW6/zlsel
 8yxvWRu18BaFGFSR7jKkXy5K555EbEydjQEIX89bkGVDbsJ6cNbCE68IxuNwTC4cSQ3x
 FNqxXdukYii3e2FYU9xNf6LPL9yMQ2JJIV7PQ0gtq+PhivmqCgIxhV6Zy8TT703fU2c+
 hrX7muHuHnmQc4PWmqZ1WL6oLaqNvk6oxPob7KfeJg8MnMXWxW/jhdjRpSrg0cN5mZxO
 tuHM4bgJnb0/DigTvROib0uKUJu7iHoSSCOWAL/b/M5OfrnNSZ8MKl6/YdqOMLigOZsj
 1ZAA==
X-Gm-Message-State: AOJu0YzTLD1INvB4AVbMWlVXbpXwQB/w0bhxdlxOqAxKhjMxbNXrt5Z4
 pcfW2Zxn3ACsdv7zsFpppy+3IOKacq7TfH8AVwGYdgBDIVl5WJJMtv3VbNK36GeyaJjodIUvNnx
 e7OAUVn8ByUjudmtTkisgwOV8PMZiUuKE0mSQuBurnQ==
X-Gm-Gg: Acq92OHgGelgxDXD6+E8Od4cDKucwj7CtQx4KfOaIFYrLG0qFGYHJGwN+/uEP1o3c8J
 cnS3IoNfssEDi9PQMWYAth8GPozfxpNSpk1OUDXWLwU6K6pZR5RTRnEZxszGLbi8m0o34dwg4kA
 JcHNVYqMIk68Gt2awEMYOFbH9vprcCXnu4CXSghVDi5UYkCFBbjjL9aiLQtTIIo0S3aFcJOsLop
 Um342qFtJaVBKYjrR9s/hQ9KGq7TPrWWAxNFb/3N++Dkc1tyb3PLXrcJw/v28gyqoP450JcXaMg
 zIbI
X-Received: by 2002:a05:6000:4284:b0:455:7c9f:a49e with SMTP id
 ffacd0b85a97d-45c59cd1599mr7412409f8f.25.1778697391627; Wed, 13 May 2026
 11:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260512-virglrenderer-v5-0-1806e588eb59@gmail.com>
 <20260512-virglrenderer-v5-1-1806e588eb59@gmail.com>
 <90f566b2-c146-4f37-b5b2-838bccce48ef@smile.fr>
In-Reply-To: <90f566b2-c146-4f37-b5b2-838bccce48ef@smile.fr>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 13 May 2026 11:35:52 -0700
X-Gm-Features: AVHnY4JePHyuDywNPBRcqoDzkH5EgUqTSWYfp9BorUkVzDrOvh3xyLyvIAA-DMg
Message-ID: <CAMWSM7jt8FLNmkHmee8iVGkKzj5k4XjzsufvjV9EnAgzyjLRsA@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778697392; x=1779302192; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BfV061fExuFftX009UNoF4iAsSex79CTOlZi1MnZOlA=;
 b=mIjFXt3ehaqPcPFn0IV9x/x9xTwyJOXo/bZAyuzq0Pw9ffLQxgQz4p2fBA34JCrSaZ
 7rg8B6kJ0Qh3JSv2rDLNOq75oxrObvofIji7CdhTIFHK50XWUA3BY7Kq/PFa1ylKuKDo
 mfRU83xx/KlL/7VtvoFjV0aaWqJhAfO5BjYNvxpnc/SNN/AewVaGjOqB9X+igCOVDcDk
 jyL2SgJjooYUJzeQTkxvlH8wNGZkCY9GSnXYlZhAWol5SDPY1SA6GPZgZ0DqVUcFseDj
 2kxNVHK1t0LyUCxnvjvdGbOugFrio2dH6RuZvl0qnnf4hhEjQz38qeFlQJPzugk29Ytx
 ioQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=mIjFXt3e
Subject: Re: [Buildroot] [PATCH RESEND v5 1/5] package/libepoxy: remove
 gl/egl dependency
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

SGVsbG8gUm9tYWluLAoKT24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgODozNeKAr0FNIFJvbWFpbiBO
YW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKPgo+IEhlbGxvIEpvc2VwaCwgQWxs
LAo+Cj4gTGUgMTIvMDUvMjAyNiDDoCAyMTozNiwgSm9zZXBoIEtvZ3V0IGEgw6ljcml0IDoKPiA+
IExpYmVwb3h5IGlzIGEgbGlicmFyeSBmb3IgaGFuZGxpbmcgT3BlbkdMIGZ1bmN0aW9uIHBvaW50
ZXIgbWFuYWdlbWVudC4KPiA+Cj4gPiBJdCBoYXMgYmFja2VuZHMgZm9yIGVnbC9nbHgsIHdoaWNo
IG1heSBhdCBvbmUgcG9pbnQgaGF2ZSBiZWVuIG1hbmRhdG9yeQo+ID4gdG8gZW5hYmxlLCBidXQg
dGhlIGxpYnJhcnkgbm93IGJ1aWxkcyB3aXRoIG5vbmUgb2YgdGhlIGFib3ZlIGVuYWJsZWQKPiA+
IGZlYXR1cmVzLCBhcyBzZWVuIGJlbG93Lgo+ID4KPiA+ICAgbGliZXBveHkgMS41LjEwCj4gPgo+
ID4gICAgIFVzZXIgZGVmaW5lZCBvcHRpb25zCj4gPiAgICAgICBDcm9zcyBmaWxlcyAgICAgICAg
ICAgIDogL2hvbWUvam9zZXBoL2JyLXRlc3QtcGtnL2FybS1hYXJjaDY0L2J1aWxkL2xpYmVwb3h5
LTEuNS4xMC8vYnVpbGRyb290LWJ1aWxkL2Nyb3NzLWNvbXBpbGF0aW9uLmNvbmYKPiA+ICAgICAg
IGJfcGllICAgICAgICAgICAgICAgICAgOiBmYWxzZQo+ID4gICAgICAgYl9zdGF0aWNwaWMgICAg
ICAgICAgICA6IHRydWUKPiA+ICAgICAgIGJ1aWxkdHlwZSAgICAgICAgICAgICAgOiByZWxlYXNl
Cj4gPiAgICAgICBidWlsZC5jbWFrZV9wcmVmaXhfcGF0aDogL2hvbWUvam9zZXBoL2JyLXRlc3Qt
cGtnL2FybS1hYXJjaDY0L2hvc3QvbGliL2NtYWtlCj4gPiAgICAgICBkZWZhdWx0X2xpYnJhcnkg
ICAgICAgIDogc2hhcmVkCj4gPiAgICAgICBkb2NzICAgICAgICAgICAgICAgICAgIDogZmFsc2UK
PiA+ICAgICAgIGVnbCAgICAgICAgICAgICAgICAgICAgOiBubwo+ID4gICAgICAgZ2x4ICAgICAg
ICAgICAgICAgICAgICA6IG5vCj4gPiAgICAgICBsaWJkaXIgICAgICAgICAgICAgICAgIDogbGli
Cj4gPiAgICAgICBidWlsZC5wa2dfY29uZmlnX3BhdGggIDogL2hvbWUvam9zZXBoL2JyLXRlc3Qt
cGtnL2FybS1hYXJjaDY0L2hvc3QvbGliL3BrZ2NvbmZpZwo+ID4gICAgICAgcHJlZml4ICAgICAg
ICAgICAgICAgICA6IC91c3IKPiA+ICAgICAgIHN0cmlwICAgICAgICAgICAgICAgICAgOiBmYWxz
ZQo+ID4gICAgICAgdGVzdHMgICAgICAgICAgICAgICAgICA6IGZhbHNlCj4gPiAgICAgICB4MTEg
ICAgICAgICAgICAgICAgICAgIDogZmFsc2UKPiA+Cj4gPiBSZW1vdmluZyB0aGVzZSBkZXBlbmRl
bmNpZXMgYWxsb3dzIGZvciBzb21lIGFwcGxpY2F0aW9ucyB0aGF0IHJlcXVpcmUgaXQKPiA+IGFz
IGEgYnVpbGQgZGVwZW5kZW5jeSwgYnV0IG90aGVyd2lzZSBjYW4gcnVuIGhlYWRsZXNzIG9yIHdp
dGhvdXQgR0wsIHRvCj4gPiBidWlsZCBhbmQgZnVuY3Rpb24uCj4KPiBJJ20gbm90IHN1cmUgYWJv
dXQgdGhpcyBjaGFuZ2UuIEhhdmluZyBlZ2wgb3IgZ2x4IGJhY2tlbmQgc3RpbGwgc2VlbXMgaGln
aGx5Cj4gcmVjb21tZW5kZWQuIE9rIGl0IGJ1aWxkcyBidXQgd2h5IHVzaW5nIGxpYmVwb3h5IGlu
IHRoaXMgY2FzZSAoaGVhZGxlc3MpPwoKSXQgc2VlbXMgYSBjbGVhbiB3YXkgZm9yIGFwcGxpY2F0
aW9ucyB0byBzdXBwb3J0IHZhcmlvdXMgR0wKY29uZmlndXJhdGlvbnMgKEdML0dMWCwgR0wvRUdM
LCBHTEVTL0VHTCkgYXQgcnVudGltZS4gSSBzdXBwb3NlICJub25lCm9mIHRoZSBhYm92ZSIgaXMg
b25lIHZhbGlkIGNvbmZpZ3VyYXRpb24uCgpGb3IgdmlyZ2xyZW5kZXJlciwgdGhhdCdzIHN0aWxs
IGEgdXNlZnVsIGNvbmZpZ3VyYXRpb24uIElmIHdlIGF0dGVtcHQKdG8gYnVpbGQgYSBtaW5pbWFs
IHRhcmdldCB0aGF0IGNhbiBydW4gYSBWTU0gbGlrZSBxZW11IG9yIGxpYmtydW4gd2l0aApoYXJk
d2FyZSBhY2NlbGVyYXRlZCBncmFwaGljcy9jb21wdXRlLCB0aGlzIGN1dHMgb3V0IG1vc3Qgb3Ig
YWxsIG9mCnRoZSBob3N0J3MgZ3JhcGhpY3Mgc3RhY2ssIGRlcGVuZGluZyBvbiBvdXIgbmVlZCB0
byBkaXNwbGF5IGZyYW1lcwpsb2NhbGx5IG9uIHRoZSBob3N0LiBJIGNvdWxkIGVudmlzaW9uIGEg
dmlydHVhbGl6ZWQgZ3Vlc3QgdXNpbmcgZS5nLgptb29ubGlnaHQgWzBdIHRvIHN0cmVhbSBncmFw
aGljYWwgb3V0cHV0IHRvIGFub3RoZXIgbWFjaGluZS4KCkxvb2tpbmcgYXQgb3RoZXIgdXNlcnMg
b2YgbGliZXBveHksIFdlc3RvbiBjYW4gdXNlIHBpeG1hbiwgR0wsIG9yClZ1bGthbiBmb3IgcmVu
ZGVyaW5nLCBhbmQgY2FuIHVzZSBEUk0sIHgxMSwgd2F5bGFuZCwgb3Igdm5jIGFzIGRpc3BsYXkK
YmFja2VuZHMsIG9yIGV2ZW4gcnVuIGhlYWRsZXNzLiBObyBHTC9FR0wgaXMgYWdhaW4gYSB2YWxp
ZApjb25maWd1cmF0aW9uIGhlcmUsIGl0IGp1c3QgZ3JhY2VmdWxseSBkaXNhYmxlcyBHTCBhdCBy
dW50aW1lLgoKSSBkb24ndCBrbm93IGFib3V0IGxpYmNhbWVyYS1hcHBzLCBsaWJndGszLCBsaWJn
dGszLCB3ZWJraXRndGssIG9yCndwZXdlYmtpdC4gQ3VycmVudGx5LCB0aGV5IHdpbGwgYWxsIHJl
dGFpbiB0aGVpciBkZXBlbmRlbmN5IG9uCkhBU19MSUJHTCB8fCBIQVNfTElCRUdMLiBJIHN1cHBv
c2UgaWYgdGhlc2UgZGVwZW5kZW5jaWVzIHdlcmUgcmVtb3ZlZCwKaXQgbWlnaHQgYmUgcG9zc2li
bGUgdG8gYnVpbGQgc29tZSBhcHBsaWNhdGlvbnMgaW4gcG9pbnRsZXNzCmNvbmZpZ3VyYXRpb25z
IHRoYXQgbGFjayBkZXNpcmVkIGZ1bmN0aW9uYWxpdHkuCgpbMF0gaHR0cHM6Ly9tb29ubGlnaHQt
c3RyZWFtLm9yZy8KCkJlc3QsCkpvc2VwaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
