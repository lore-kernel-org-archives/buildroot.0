Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6820CCD4F21
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 18:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E459E60680;
	Wed, 13 May 2026 18:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id di7o4GZyTp_u; Wed, 13 May 2026 18:06:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BCFA60670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778695616;
	bh=876SVLz35/i7NqvV2eCwD2JYZs8EdP8aOturi5vmGWU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VtvrmygFslbY/zCL+X4xcgDfsM8YzkeaNB+6/h0ihCBkPKpJS9soErZ6nUxxaJq3K
	 4gqFPKO0izzx5epXgFB1JesiHWVhxdiG6XBMU+LNN4o8HzbxCk1kJ6aRNflUxEVgtG
	 QLzJkGPZ5STb3CzgVTkBmOXKp+59FK6thXTVnJJACq8/9vq8cMdJkxLAVTkr2CTKeE
	 ioevrF0JPs4ZThke6AWp0/j6/eIOTV2G3n5Xtmx6YlTl9hzVAhQUB5hMpjCqO4+OyC
	 DbhFMByvFSfWAiDIXtHm2BoEaAM2zVIdpKBP1wZWXb0+lAdlhubrwqi7wNUrm5FlQC
	 euKp46+Ye4tNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BCFA60670;
	Wed, 13 May 2026 18:06:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5858336F
 for <buildroot@buildroot.org>; Wed, 13 May 2026 18:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4876260670
 for <buildroot@buildroot.org>; Wed, 13 May 2026 18:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wl33_LvFfrr9 for <buildroot@buildroot.org>;
 Wed, 13 May 2026 18:06:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2D7AE6066F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D7AE6066F
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D7AE6066F
 for <buildroot@buildroot.org>; Wed, 13 May 2026 18:06:52 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488af96f6b2so84933405e9.0
 for <buildroot@buildroot.org>; Wed, 13 May 2026 11:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778695611; x=1779300411;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/522BzPWcLUGMzPLNdQ4CIDg77Xcq2UQlmrJF1XClI8=;
 b=BjE7PHg3RVILGjheN8gombKsX3mLTZDKLr9/5aLIxmdXIHSUBQM/YNXTz4EJSGWKZK
 ZNL4Zilgand5qAEw/smiPNiHORb7UyqpnWE2jtabzBODy+0D7ILMtq1hHqdsuQzibDx2
 3AwBclEt8pJqk6B2IJ1vermuaIclOW74OuzRHvGOg6Ajam8X2tijJD6VMFMybcfSYlpk
 Thw4Pqr3S9VqTI1+QTXX3PPbxt38tcvJuVFGS6k8rzRtFRblFEEhwEkGERSuLuxjE1V6
 OF7rbTtYEDCvdvAruW3jJsZbiAaFM/9PycbRdbYT3nq3qvIQ4FAXkhDgtdJDdMonWcOo
 FBQw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9965qouct2ehU94flFD7kStyNEDnh3MBwGt6OnGpOm9RWh0WNysx/66+ThFDVko0bMo+RCKklZXfQ=@buildroot.org
X-Gm-Message-State: AOJu0Yy3AHUM8D4vl8n17MOqOg6C1YuUd/YhWvWUshAha4RfsCtz3pmx
 Btv4MFRHTqDpgRItHMk3Ye1vMDN8MDM3MFWYixEYGLvBlZ6OLwmRW3fdm5Vc1nvkvAo=
X-Gm-Gg: Acq92OFIbfIpIM5BQr5p4Ii5RNz6m2pqUDJpnBQBhoD1IFLT9me98Ruz2gtUgxs8uKW
 Vz52jibno0fDsreXIct7pcjTvyAsLTZ+KzSn62Ix3H8BGy/hyJHSLttshk/lnZ1Yy/fMVfy3oAn
 l5WngBG/xHzI3GibtMV9fQTKtXMJ8K0/lJR+PQWaSRpgcCl6SDks2mEOyC7ez+2R3jj17s5Ps3F
 gtkmuEDFSZVZ6furuY7TB4R/HqSYJOBQZqRrXEy7HE1UpbrD00NfJdaCRoLrxiG3TBYFPEQ9K8+
 Zg75OBA7vTyx9FcbAmPytAaYW+ZuWrnGMXvg5haktQAcB9S4afCD+dTgaYyIUesKSbGFaTB7aaz
 P9fVg1XGN2qQdmpOYREBlsSrE2I+6RDoKvqfui3NMEE26pgLJ/UGkJPlYZr5eod0RitlIlLAJLz
 9FkWk1WSH10Gn2KDMTjyc/riExbDx91Uag0ckUDPOT9Dug9gZeFG/j/gSotmHUNQYugpkVaiX0U
 seeXUQZsPEFXAnbBnge3AsBIM3JcrxdYGh7jfs8ySbyWc8lbbYWol6tDcko63uCwg==
X-Received: by 2002:a05:600c:34c9:b0:486:d76c:fa57 with SMTP id
 5b1f17b1804b1-48fc9a30d32mr67787225e9.17.1778695610975; 
 Wed, 13 May 2026 11:06:50 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec3acf7sm692366f8f.12.2026.05.13.11.06.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 11:06:50 -0700 (PDT)
Message-ID: <05ba173a-7eff-49e5-b2d0-af15f83878f4@smile.fr>
Date: Wed, 13 May 2026 20:06:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>
References: <20260512-virglrenderer-v5-0-1806e588eb59@gmail.com>
 <20260512-virglrenderer-v5-5-1806e588eb59@gmail.com>
 <5bd5971c-17c5-4ebb-85d3-3944efb39a7c@smile.fr>
Content-Language: fr, en-US
In-Reply-To: <5bd5971c-17c5-4ebb-85d3-3944efb39a7c@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778695611; x=1779300411; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/522BzPWcLUGMzPLNdQ4CIDg77Xcq2UQlmrJF1XClI8=;
 b=cDAV7mqOyH7mOR4To5KLjwBXXkZrEF7fI6s3ZON0zIhM2M2ILBB5fxPmwV1LqqlMp0
 eX8RMNIGdZQThgEMbbGI33Ryt871Y5N3m+xjAMeevW/cFfTWF51dfDzX2tp67wC9mfjV
 dYqKrmQxDzOz7zIb8mU89gtxcG/3Cp0eQyFTw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=cDAV7mqO
Subject: Re: [Buildroot] [PATCH RESEND v5 5/5] package/qemu: add
 virglrenderer support
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMTMvMDUvMjAyNiDDoCAxOToxNywgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4gSGVsbG8g
Sm9zZXBoLCBBbGwsCj4gCj4gTGUgMTIvMDUvMjAyNiDDoCAyMTozNiwgSm9zZXBoIEtvZ3V0IGEg
w6ljcml0wqA6Cj4+IEFkZCBvcHRpb25hbCB2aXJnbHJlbmRlcmVyIHN1cHBvcnQsIGFsb25nIHdp
dGggZW5hYmxpbmcgT3BlbkdMIHdoZW4KPj4gbmVjZXNzYXJ5Lgo+Pgo+PiBodHRwczovL3FlbXUu
cmVhZHRoZWRvY3MuaW8vZW4vdjEwLjAuMy9zeXN0ZW0vZGV2aWNlcy92aXJ0aW8tZ3B1Lmh0bWwj
dmlydGlvLWdwdS12aXJnbHJlbmRlcmVyCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEpvc2VwaCBLb2d1
dCA8am9zZXBoLmtvZ3V0QGdtYWlsLmNvbT4KPj4gLS0tCj4+ICBwYWNrYWdlL3FlbXUvQ29uZmln
LmluIHwgMTcgKysrKysrKysrKysrKysrKysKPj4gIHBhY2thZ2UvcWVtdS9xZW11Lm1rICAgfCAg
NyArKysrKysrCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKPj4KPj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvcWVtdS9Db25maWcuaW4gYi9wYWNrYWdlL3FlbXUvQ29uZmlnLmlu
Cj4+IGluZGV4IGU0ZThlYjNiNjMuLjU5OWJjYjExYmIgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2Uv
cWVtdS9Db25maWcuaW4KPj4gKysrIGIvcGFja2FnZS9xZW11L0NvbmZpZy5pbgo+PiBAQCAtMTMw
LDYgKzEzMCwyMyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfUUVNVV9PUEVOR0wKPj4gIGNvbW1lbnQg
Ik9wZW5HTCBzdXBwb3J0IG5lZWRzIGFuIE9wZW5HTCBhbmQvb3IgT3BlbkdMIEVHTCBiYWNrZW5k
Igo+PiAgCWRlcGVuZHMgb24gIShCUjJfUEFDS0FHRV9IQVNfTElCRUdMIHx8IEJSMl9QQUNLQUdF
X0hBU19MSUJHTCkKPj4gIAo+PiArY29uZmlnIEJSMl9QQUNLQUdFX1FFTVVfVklSR0xSRU5ERVJF
Ugo+PiArCWJvb2wgIkVuYWJsZSB2aXJnbHJlbmRlcmVyIgo+PiArCWRlcGVuZHMgb24gQlIyX1BB
Q0tBR0VfSEFTX0xJQkVHTCB8fCBCUjJfUEFDS0FHRV9IQVNfTElCR0wKPj4gKwlzZWxlY3QgQlIy
X1BBQ0tBR0VfUUVNVV9PUEVOR0wKPj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfVklSR0xSRU5ERVJF
UgoKSSBndWVzcyBRZW11IHZpcmdscmVuZGVyZXIgc2hvdWxkIHNlbGVjdCBCUjJfUEFDS0FHRV9W
SVJHTFJFTkRFUkVSX1ZJUkdMIGluIHRoaXMKY2FzZS4gQlIyX1BBQ0tBR0VfVklSR0xSRU5ERVJF
Ul9WSVJHTCBpcyBpbmRlZWQgc2VsZWN0ZWQgYnkgZGVmYXVsdCBidXQgY2FuIGJlCm1hbnVhbGx5
IGRpc2FibGVkIGZyb20gbWVudWNvbmZpZy4KCj4gCj4gQWxsIHRoaXMgZWZmb3J0IHRvIGJ1aWxk
IHZpcmdscmVuZGVyZXIgd2l0aG91dCBlZ2wgb3IgZ2wgdG8gdXNlIGl0IChzZWxlY3QgaXQpCj4g
dW5kZXIgYW4gb3B0aW9uIHRoYXQgZGVwZW5kcyBvbiBlZ2wgb3IgZ2w/Cj4gCj4gSSdsbCBoYXZl
IGEgc2Vjb25kIGxvb2suCgpPayBJIGdldCBpdCwgYnVpbGRpbmcgbGliZXBveHkgd2l0aG91dCBl
Z2wgb3IgZ2wgZGVwZW5kZW5jeSBtYWtlcyBzZW5zIHdoaWxlCmJ1aWxkaW5nIHdpdGggb25seSB2
ZW51cyAodnVsa2FuKS4gbGliZXBveHkgaXMgYSBtYW5kYXRvcnkgZGVwZW5kZW5jeSBvZgp2aXJn
bHJlbmRlcmVyIGV2ZW4gaWYgb25seSB2ZW51cyAodnVsa2FuKSBpcyBlbmFibGVkIGluIHRoZSBk
ZWZjb25maWcuCgpUaGUgQlIyX1BBQ0tBR0VfVklSR0xSRU5ERVJFUl9WRU5VUyBvcHRpb24gaXMg
bm90IHVzZWQgYnkgUWVtdSBidXQgY291bGQgYmUgdXNlZAppbiBieSBhbm90aGVyIHBhY2thZ2Ug
b3IgZGVmY29uZmlnLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4gQmVzdCByZWdhcmRzLAo+
IFJvbWFpbgo+IAo+PiArCWhlbHAKPj4gKwkgIFNheSAneScgdG8gZW5hYmxlIHZpcmdscmVuZGVy
ZXIsIGVuYWJsaW5nIEdMIGFuZCBWdWxrYW4KPj4gKwkgIHBhc3N0aHJvdWdoIGZyb20gdGhlIGhv
c3QgdG8gdGhlIGd1ZXN0IHRocm91Z2ggdmlydGlvLWdwdS4KPj4gKwkgIFRoaXMgZW5hYmxlcyB0
aGUgZ3Vlc3QgdG8gaGF2ZSBhY2NlbGVyYXRlZCBHTCBhbmQvb3IgVnVsa2FuLgo+PiArCj4+ICsJ
ICBSdW4gcWVtdSB3aXRoIGAtZGV2aWNlIHZpcnRpby1ncHUtZ2xgCj4+ICsKPj4gKwkgIGh0dHBz
Oi8vcWVtdS5yZWFkdGhlZG9jcy5pby9lbi92MTAuMC4zL3N5c3RlbS9kZXZpY2VzL3ZpcnRpby1n
cHUuaHRtbCN2aXJ0aW8tZ3B1LXZpcmdscmVuZGVyZXIKPj4gKwo+PiArY29tbWVudCAidmlyZ2xy
ZW5kZXJlciBuZWVkcyBPcGVuR0wgYWNjZWxlcmF0ZWQgZGlzcGxheSBmcm9udGVuZCBzdXBwb3J0
Igo+PiArCWRlcGVuZHMgb24gIShCUjJfUEFDS0FHRV9IQVNfTElCRUdMIHx8IEJSMl9QQUNLQUdF
X0hBU19MSUJHTCkKPj4gKwo+PiAgY29uZmlnIEJSMl9QQUNLQUdFX1FFTVVfRkRUCj4+ICAJYm9v
bCAiRW5hYmxlIEZEVCIKPj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfRFRDCj4+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3FlbXUvcWVtdS5tayBiL3BhY2thZ2UvcWVtdS9xZW11Lm1rCj4+IGluZGV4IDli
NzgwNzk3ZmEuLmUyNTAxMjhkZmEgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvcWVtdS9xZW11Lm1r
Cj4+ICsrKyBiL3BhY2thZ2UvcWVtdS9xZW11Lm1rCj4+IEBAIC0yODEsNiArMjgxLDEzIEBAIGVs
c2UKPj4gIFFFTVVfT1BUUyArPSAtLWRpc2FibGUtb3BlbmdsCj4+ICBlbmRpZgo+PiAgCj4+ICtp
ZmVxICgkKEJSMl9QQUNLQUdFX1FFTVVfVklSR0xSRU5ERVJFUikseSkKPj4gK1FFTVVfT1BUUyAr
PSAtLWVuYWJsZS12aXJnbHJlbmRlcmVyCj4+ICtRRU1VX0RFUEVOREVOQ0lFUyArPSB2aXJnbHJl
bmRlcmVyCj4+ICtlbHNlCj4+ICtRRU1VX09QVFMgKz0gLS1kaXNhYmxlLXZpcmdscmVuZGVyZXIK
Pj4gK2VuZGlmCj4+ICsKPj4gIGlmZXEgKCQoQlIyX1NUQVRJQ19MSUJTKSx5KQo+PiAgUUVNVV9P
UFRTICs9IC0tc3RhdGljCj4+ICBlbmRpZgo+Pgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
