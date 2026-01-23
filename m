Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7E4D77891
	for <buildroot@archiver.kernel.org>; Fri, 23 Jan 2026 17:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45A8240422;
	Fri, 23 Jan 2026 17:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRCLAw0HcBw0; Fri, 23 Jan 2026 17:29:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42B2740517
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769189369;
	bh=gfOlx8ZDwa/MbfauOQroKqen2wmUOQRbHySmjjnzj3g=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o2n6ctmcxwUx5QKOI9BPrgsBgM3ZWtEPt/U/L1nQ8VxvUeRacF3UhdxtypjrlGzK/
	 0jt4y1jFfEvooIRJOL17atKk7Y5+AqMa0ha/xyU8Mzrofda6VJ+lf7bCei+31lnt1u
	 /0pxHtGmqCadd1Y/oKB9tjSNi1D4NIs95OTK1204xQRbpFAbj5fy87VgzoorMNLoDM
	 ps5Ta1awsw7DS7B2Lv/uxkZPPiOGbzRJYeqqqeJx89gZoQuswvBEUoVOjvxt5AjEUZ
	 neq2qO1ZsWkDYpcCTQg4nDCNCxdyla065oNheU99mSHndU1sRf2hCLGqzo7Q56ROUt
	 09M+/k5Rj7DRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42B2740517;
	Fri, 23 Jan 2026 17:29:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17A2723F
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 17:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F245D608AE
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 17:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u2zxztR0nxVC for <buildroot@buildroot.org>;
 Fri, 23 Jan 2026 17:29:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e34; helo=mail-vs1-xe34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CEE0F6083B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEE0F6083B
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEE0F6083B
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 17:29:25 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id
 ada2fe7eead31-5ebb6392f58so717177137.0
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 09:29:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769189364; cv=none;
 d=google.com; s=arc-20240605;
 b=hX2Ar2ruSoJhE/aLRlOxpsYhrdE4f79eergLaFejc3lB3Pswsqxci4UIvqodnw0nr/
 rtbO0CXjRl1dyiCarNH2cEDhS4gjzZhVL7M8MQ15jU6Da+NpEB9ylrSGnET0AgJZ8ICW
 zHB83PLOvnpSCsQerJqZRGzmVB5R6wW7S718PpK9PT3v1KD9aA2jGIJdV8ljlDrK1tMZ
 VsVQRSaYJWnX4Jswn353+408W9OHIy7HOSXwpuZOqdsUquxyI+2fyybe3XSAWgOuYZ5O
 8zbjduingB8x35htauLkVWoEFUKVyO45T41tIeqLCMfuqCamva79iKV2niU0/yqWT1JL
 NQXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=6vONN2aVNegOwwkmikd+7Ifqterp6ieOWoOdOiqcno4=;
 fh=lgRPIRPzXxxRS599zlHIbpt0lol323QK4/G5IjH/bI0=;
 b=VArvi/6RqeKAf5/Ovqk9yoAVCf2YK+R9RXZTAGzFlT+xciznZ/rmO/jKnbWYFwjCIq
 TFktOqHpGknP2G9DG6km47inAhx/0Qkq1JyHoHCEnZTjJSN79crfVaQ8w9mQcwEiH0ie
 kWdUZ+tnRSvORszS18tujsGKDHoaT8cZf3k/dN7uKBht/o0XShOMIh4oLRWTq84NT8Nb
 ymR+18nT8/q9trIs2BGLKdep27V7nJAM90tOErntsgDphIA8Nt7kJuIjqL/OxPtljlNy
 o5gmLUIAi0yFQPx+2nEJfA9CO7khqaKqq4zvr3ZV8SW09vIYYFHnT229o9ziGtaoEB/G
 6iyQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769189364; x=1769794164;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6vONN2aVNegOwwkmikd+7Ifqterp6ieOWoOdOiqcno4=;
 b=HrT+N906JBAirSE9i4WZdFfCTbyr+bkqXOO1YrXcrfo378JKNDCK92gEkrQDpBCEts
 HuVv4DeFprAKUKkJsJrvGofENMGzvRQEk/zlvsSNm3T2YlVr+zw2RDaLCGA2hYZK+/Qg
 xxDnEFJq4msJfa+vhX4dLTDdDnu+f1vAoYlWWmi0HEoVDDZZNo5ishPUx2NleZypzU6u
 2gkYfPAZI8Jw3UaOF+Mhp6iYyPGbCyDKx4RCkNtzd2KG7DCbEJJkeOYMTl+ql4rXOvzp
 lGW31yE/su1nSB5BMMah3pqhZYEmHrM5YxhQfkCIemfGjv6HQtgO6cEMWEML/U8ZMvR1
 lBqA==
X-Gm-Message-State: AOJu0Yw0ZSRopnxjmRKqVr/MPgHsUoWB+0ADJ52RV4ZCvGC6oVCVXdbN
 /GelYYxH46OYpKUTX8QO8rhlSaYD9KP8FnLYK39fRwqTeQq5NpwvINB5IkOYnvfHdz2DUTLVAwY
 uzJj0CkWHWEYnBiNhL8UwtNUo0DZXIPtzVbhN
X-Gm-Gg: AZuq6aIcuOtoepS34JGI92B1sAy0oELaD5bN4A7q0sQqITPzIYuJVx7+DCvHWMoNjt0
 i7e1jVXTZQKVxy45T94aoQyR9oIy7SeEpERid+MJtBrgqlrCb3jvwPOTHuVB4k+ycONRVP3b9Cu
 uVyGALzxVIyVgBc0zJHD6ICwRXsxltoLB5lSP3w7IjW+M7vJvr790pQyOVKbnDBaUwaSlNKyyoX
 75Qelzhe0qi2GOoEjvcJDz1kMJNRlNGL4uxMhhuwWIgmDTSZO6iQ7nOdu4Q2YlSmOdtxIEIBBby
 ucjsvCS6UVOSRHkIQ8a4+C1RJJup78oz4BogPk3FPaQ3CChkvKBY7zc+xQ==
X-Received: by 2002:a05:6102:d8a:b0:5dc:51c5:e3c7 with SMTP id
 ada2fe7eead31-5f54bc6e014mr1022747137.26.1769189364176; Fri, 23 Jan 2026
 09:29:24 -0800 (PST)
MIME-Version: 1.0
References: <20260121011429.1442015-1-james.hilliard1@gmail.com>
 <70549457-9F2A-412B-9756-3E45D724B853@benettiengineering.com>
 <CADvTj4r0Q9AOjL3zaSj3LMRKpHcuMMUC1-uKi93YaPGThOUgMw@mail.gmail.com>
 <3e0e22ca-c0f3-4e34-989d-df032f6b7b7e@benettiengineering.com>
In-Reply-To: <3e0e22ca-c0f3-4e34-989d-df032f6b7b7e@benettiengineering.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Jan 2026 10:29:12 -0700
X-Gm-Features: AZwV_QiYZgvHNOpyMvUPpk0ltJEgeFx-3SLez2Pb6GvhG1C6Dnn9Wjpx5jgoiEg
Message-ID: <CADvTj4o6J808cKawjdhaVPkaJDL_Yk29exLsEs_zxwEKMjgh8Q@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769189364; x=1769794164; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6vONN2aVNegOwwkmikd+7Ifqterp6ieOWoOdOiqcno4=;
 b=NUPm4+OLP0+tdqwyuEngXbCVJISvr/KAMflatQyDEbCgmPYjwoM+5b/EZJSnaB9Ff7
 rLMzz0EEw+zTSPFVkmMJZwf1P9e/M4iSdzqVO8F/Oj/JaquLuF8bg9kMxABAMpkXPdTS
 pixcKQ1eHiw4H7kpyFKfexj4XbhDEKPR55P3do+TgLR4vEV3j3J/ObsP1mZxDLCVqgwu
 Mti4fE3Wy8QFXhhDvhwBTs2pheKUItkfu5OBPJGCHUynPH18gQF0aaZeBPMb5UqJXmvu
 pnWo1ORXCx5KPZ95bwPM9qsYQEmaogJfqGKX6nr/tEVIXdxAkA93QQPAtL3AmmicJfK/
 8P+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NUPm4+OL
Subject: Re: [Buildroot] [PATCH 1/1] package/swupdate: bump to version
 2025.12
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

T24gRnJpLCBKYW4gMjMsIDIwMjYgYXQgMTA6MTTigK9BTSBHaXVsaW8gQmVuZXR0aQo8Z2l1bGlv
LmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cj4KPiBPbiAxLzIxLzI2IDE3
OjI0LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiA+IE9uIFdlZCwgSmFuIDIxLCAyMDI2IGF0IDEy
OjQy4oCvQU0gR2l1bGlvIEJlbmV0dGkKPiA+IDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5l
ZXJpbmcuY29tCj4gPiA8bWFpbHRvOmdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5j
b20+PiB3cm90ZToKPiA+Cj4gPiAgICAgSGkgSmFtZXMsCj4gPgo+ID4gICAgIEkgd2FzIHdvcmtp
bmcgb24gaXQgdG9vLgo+ID4gICAgIEFzIGlzIHRoZSBwYXRjaCBkb2VzbuKAmXQgd29yayBvbiBt
eSBzaWRlLgo+ID4gICAgIEl0IHNlZW1zIGxpa2UgYXQgbGVhc3Qgb25lIGNyeXB0byBpcyBuZWVk
ZWQgd2l0aCB0aGlzIHZlcnNpb24sIHNvIEkKPiA+ICAgICB3YXMgZGVmYXVsdGluZyB0byBPcGVu
U1NMIGFuZCBhZGRpbmcgYSBjaG9pY2UgYmV0d2VlbiBpdCwgV29sZnNzbCBldGMuCj4gPgo+ID4K
PiA+IFllYWgsIEkgdGhpbmsgb25lIGNyeXB0byBwcm92aWRlciBtaWdodCBiZSByZXF1aXJlZCB0
byBiZSBzZWxlY3RlZAo+ID4gb3Igc29tZXRoaW5nIGluIHRoZSBzd3VwZGF0ZSBtZW51Y29uZmln
LCBidXQgdGhhdCdzIG1heWJlIG1vcmUKPiA+IG9mIGFuIGlzc3VlIHRvIGZpeCB1cHN0cmVhbT8g
TXkgYnVpbGRzIGhhdmUgc2lnbmF0dXJlIHZlcmlmaWNhdGlvbgo+ID4gZW5hYmxlZCBzbyBJIHRo
aW5rIEkgYWx3YXlzIGVuYWJsZSB0aGF0Lgo+Cj4gSXQgc2VlbXMgc28geWVzLCBidXQgaGVyZSB3
ZSBuZWVkIGEgcGFja2FnZSB0aGF0IGJ1aWxkcyBvdXQgb2YgdGhlIGJveCwKCkhtbSwgSSBndWVz
cyB3ZSBuZWVkIHRvIGZpeCB0aGlzIHVwc3RyZWFtIHRoZW4/Cgo+Cj4gPgo+ID4gVGhlcmUgd2Fz
IGF0IGxlYXN0IG9uZSBydW50aW1lIHNlZ2ZhdWx0IEkgcmFuIGludG8gYmVmb3JlIEkgZml4ZWQg
bXkKPiA+IHN3dXBkYXRlIGNvbmZpZyBidXQgSSB0aGluayB0aGF0J3MgYSBzbGlnaHRseSBkaWZm
ZXJlbnQgaXNzdWUoU0lHQUxHKToKPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJv
amVjdC9zd3VwZGF0ZS8KPiA+IHBhdGNoLzIwMjYwMTIwMjIwMjE5LjcxNDMwNC0xLWphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20vIDxodHRwczovLwo+ID4gcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJv
amVjdC9zd3VwZGF0ZS9wYXRjaC8yMDI2MDEyMDIyMDIxOS43MTQzMDQtMS0KPiA+IGphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20vPgo+Cj4gU28gaXQgbWFrZXMgc2Vuc2UgdG8gbWUgdG8gYWRkIGl0
IGFzIGxvY2FsIHBhdGNoCgpNYXliZSwgYnV0IHRoaXMgc2VnZmF1bHQgb25seSBoYXBwZW5zIHdp
dGggYW4gaW52YWxpZCBjb25maWcgQUZBSVUKd2hpY2ggaXMgd2h5IEkgZGlkbid0IHJlYWxseSBi
b3RoZXIgYWRkaW5nIGl0LCBhbHNvIHdhbnRlZCB0byB3YWl0IGZvcgppdCB0byBiZSBtZXJnZWQg
dXBzdHJlYW0gaWYgd2UgZG8gd2FudCBpdC4KCj4KPgo+ID4KPiA+Cj4gPiAgICAgQXJlIHlvdSBz
dXJlIGl0IGJ1aWxkcyBhcyBpcz8KPiA+ICAgICBPdGhlcndpc2UgY2FuIHlvdSBwbGVhc2UgZml4
IHRoZSBwYXRjaD8KPiA+Cj4gPgo+ID4gSSdtIHVzaW5nIHRoaXMgZm9yIG15IHN3dXBkYXRlIGNv
bmZpZyB3aGljaCBzZWVtcyB0byBidWlsZC9ydW4gZmluZToKPiA+IENPTkZJR19TWVNURU1EPXkK
PiA+IENPTkZJR19IV19DT01QQVRJQklMSVRZPXkKPiA+IENPTkZJR19TT0NLRVRfQ1RSTF9QQVRI
PSIvdG1wL3NvY2tpbnN0Y3RybCIKPiA+IENPTkZJR19TT0NLRVRfUFJPR1JFU1NfUEFUSD0iL3Rt
cC9zd3VwZGF0ZXByb2ciCj4gPiBDT05GSUdfTFVBUEtHPSJsdWEiCj4gPiBDT05GSUdfVUJPT1Q9
eQo+ID4gQ09ORklHX0JPT1RMT0FERVJfREVGQVVMVF9OT05FPXkKPiA+IENPTkZJR19ET1dOTE9B
RD15Cj4gPiBDT05GSUdfRE9XTkxPQURfU1NMPXkKPiA+IENPTkZJR19XRUJTRVJWRVI9eQo+ID4g
Q09ORklHX01PTkdPT1NFU1NMPXkKPiA+IENPTkZJR19TSUdORURfSU1BR0VTPXkKPiA+IENPTkZJ
R19TSUdBTEdfUkFXUlNBPXkKPiA+IENPTkZJR19FTkNSWVBURURfSU1BR0VTPXkKPiA+IENPTkZJ
R19MVUFFWFRFUk5BTD15Cj4gPiBDT05GSUdfQVJDSElWRT15Cj4gPiBDT05GSUdfQk9PVExPQURF
UkhBTkRMRVI9eQo+ID4gQ09ORklHX0NGST15Cj4gPiBDT05GSUdfQ0ZJSEFNTUlORzE9eQo+ID4g
Q09ORklHX0NPUFk9eQo+ID4gQ09ORklHX0RJU0tQQVJUPXkKPiA+IENPTkZJR19ESVNLUEFSVF9G
T1JNQVQ9eQo+ID4gQ09ORklHX0RJU0tGT1JNQVRfSEFORExFUj15Cj4gPiBDT05GSUdfRkFUX0ZJ
TEVTWVNURU09eQo+ID4gQ09ORklHX0xVQVNDUklQVEhBTkRMRVI9eQo+ID4gQ09ORklHX0VNTUNf
SEFORExFUj15Cj4gPiBDT05GSUdfUkFXPXkKPiA+IENPTkZJR19SRElGRkhBTkRMRVI9eQo+ID4g
Q09ORklHX1JFQURCQUNLSEFORExFUj15Cj4gPiBDT05GSUdfU0hFTExTQ1JJUFRIQU5ETEVSPXkK
PiA+IENPTkZJR19TV1VGT1JXQVJERVJfSEFORExFUj15Cj4gPiBDT05GSUdfU1NCTFNXSVRDSD15
Cj4gPiBDT05GSUdfVUJJVk9MPXkKPiA+IENPTkZJR19VQklCTEFDS0xJU1Q9IjAgMSAyIDMgNCA1
Igo+ID4gQ09ORklHX1VCSVdISVRFTElTVD0iNiIKPiA+IENPTkZJR19VTklRVUVVVUlEPXkKPgo+
IFNvIHRoaXMgc2hvdWxkIGJlIHRoZSBsb2NhbCBzd3VwZGF0ZS5jb25maWcsIHByb2JhYmx5IHdp
dGggbGVzcyBvcHRpb24KPiBlbmFibGVkLiBJIHdvdWxkIGRpZmYgdGhpcyBhbmQgdGhlIGFjdHVh
bCBzd3VwZGF0ZS5jb25maWcgcmVzdWx0aW5nIGludG8KPiBhIHdvcmtpbmcgc3d1cGRhdGUuY29u
ZmlnIHdpdGggYXMgbGVzcyBhcyBwb3NzaWJsZSBvcHRpb25zIGVuYWJsZWQuCj4KPiBDYW4geW91
IHJld29yayBpdCBhbmQgc2VuZCBWMj8KCklzIHRoZSBpc3N1ZSB3aGVyZSBhIGNyeXB0byBwcm92
aWRlciBpcyByZXF1aXJlZCBhbiB1cHN0cmVhbSBidWcKbWF5YmU/IEkgZ3Vlc3MgdGhhdCBtaWdo
dCBuZWVkIHRvIGJlIGZpeGVkIGluIG9yZGVyIHRvIGdldCBhIHdvcmtpbmcKbWluaW1hbCBjb25m
aWcgc2luY2UgdGhlIGNyeXB0byBsaWJyYXJpZXMgYXJlIGNvbmRpdGlvbmFsIGRlcGVuZGVuY2ll
cwpzbyB3ZSBjYW4ndCByZWFsbHkgaW5jbHVkZSB0aGVtIGluIGEgbWluaW1hbCBjb25maWcuCgo+
Cj4gVGhhbmsgeW91IQo+IEJlc3QgcmVnYXJkcwo+IEdpdWxpbwo+Cj4gPgo+ID4KPiA+ICAgICBU
aGFuayB5b3UKPiA+ICAgICBHaXVsaW8KPiA+Cj4gPiAgICAgID4gSWwgZ2lvcm5vIDIxIGdlbiAy
MDI2LCBhbGxlIG9yZSAwMjoxNCwgSmFtZXMgSGlsbGlhcmQKPiA+ICAgICA8amFtZXMuaGlsbGlh
cmQxQGdtYWlsLmNvbSA8bWFpbHRvOmphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+PiBoYQo+ID4g
ICAgIHNjcml0dG86Cj4gPiAgICAgID4KPiA+ICAgICAgPiDvu79TaWduZWQtb2ZmLWJ5OiBKYW1l
cyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbQo+ID4gICAgIDxtYWlsdG86amFt
ZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4+Cj4gPiAgICAgID4gLS0tCj4gPiAgICAgID4gcGFja2Fn
ZS9zd3VwZGF0ZS9zd3VwZGF0ZS5oYXNoIHwgMiArLQo+ID4gICAgICA+IHBhY2thZ2Uvc3d1cGRh
dGUvc3d1cGRhdGUubWsgPGh0dHA6Ly9zd3VwZGF0ZS5taz4gICB8IDIgKy0KPiA+ICAgICAgPiAy
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+ICAgICAg
Pgo+ID4gICAgICA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3N3dXBkYXRlL3N3dXBkYXRlLmhhc2gg
Yi9wYWNrYWdlL3N3dXBkYXRlLwo+ID4gICAgIHN3dXBkYXRlLmhhc2gKPiA+ICAgICAgPiBpbmRl
eCBiYzkxMWQxODIwLi5iM2Y0MzY0OGY4IDEwMDY0NAo+ID4gICAgICA+IC0tLSBhL3BhY2thZ2Uv
c3d1cGRhdGUvc3d1cGRhdGUuaGFzaAo+ID4gICAgICA+ICsrKyBiL3BhY2thZ2Uvc3d1cGRhdGUv
c3d1cGRhdGUuaGFzaAo+ID4gICAgICA+IEBAIC0xLDUgKzEsNSBAQAo+ID4gICAgICA+ICMgTG9j
YWxseSBjYWxjdWxhdGVkCj4gPiAgICAgID4gLXNoYTI1Ngo+ID4gICAgIDY3OGI0N2ZkMjQxOTcy
N2M0ZDBhYmY1YzlmM2JjMGRjNGI2N2U5NTk1MTEzMmJkMWM4ZjU2MDNlODg5NDc3NzkKPiA+ICAg
ICBzd3VwZGF0ZS0yMDI1LjA1LnRhci5nego+ID4gICAgICA+ICtzaGEyNTYKPiA+ICAgICA4NTE3
ZjM3MzBlZWI2NmUyMGU2NTFiODgxZGQ0YjljMTBjYTlhZTA1ZTM4ODNkYjU5YjVkZjE4YWIxZWFh
NTMzCj4gPiAgICAgc3d1cGRhdGUtMjAyNS4xMi50YXIuZ3oKPiA+ICAgICAgPiBzaGEyNTYKPiA+
ICAgICA0Y2YwNGVkMzRmZjBlYmJmNWM3MTM0NWI1NmU2YWY1MDkzZmMxNzIwNjM2NGNjYTBlYmJh
ZTkyZWYzOTQwNjgzCj4gPiAgICAgTElDRU5TRVMvQlNELTEtQ2xhdXNlLnR4dAo+ID4gICAgICA+
IHNoYTI1Ngo+ID4gICAgIGUyN2EzZTg3NzA2YjNhYTVmZjJlNTBlYWFmZTJlNmVkNTM5N2ZiZjJk
NzY3OWVhZjQ0NGE2ZDAwMDUxOGEzYTYKPiA+ICAgICBMSUNFTlNFUy9CU0QtMy1DbGF1c2UudHh0
Cj4gPiAgICAgID4gc2hhMjU2Cj4gPiAgICAgMDU1ODEwMTk4NDU1MGZhODRkMWQxM2MyYWYxMWQx
MTZjMjAwNzlkMmJlNTg3MTFlOGQ5OWNhZGNlNzAwOTE5Mgo+ID4gICAgIExJQ0VOU0VTL0NDMC0x
LjAudHh0Cj4gPiAgICAgID4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3d1cGRhdGUvc3d1cGRhdGUu
bWsgPGh0dHA6Ly9zd3VwZGF0ZS5taz4gYi8KPiA+ICAgICBwYWNrYWdlL3N3dXBkYXRlL3N3dXBk
YXRlLm1rIDxodHRwOi8vc3d1cGRhdGUubWs+Cj4gPiAgICAgID4gaW5kZXggMDUzMjlkMTNiOC4u
ODY0Yzg3NmU0MCAxMDA2NDQKPiA+ICAgICAgPiAtLS0gYS9wYWNrYWdlL3N3dXBkYXRlL3N3dXBk
YXRlLm1rIDxodHRwOi8vc3d1cGRhdGUubWs+Cj4gPiAgICAgID4gKysrIGIvcGFja2FnZS9zd3Vw
ZGF0ZS9zd3VwZGF0ZS5tayA8aHR0cDovL3N3dXBkYXRlLm1rPgo+ID4gICAgICA+IEBAIC00LDcg
KzQsNyBAQAo+ID4gICAgICA+ICMKPiA+ICAgICAgPgo+ID4gICAgICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCj4gPiAgICAgID4KPiA+ICAgICAgPiAtU1dVUERBVEVfVkVSU0lPTiA9IDIwMjUuMDUK
PiA+ICAgICAgPiArU1dVUERBVEVfVkVSU0lPTiA9IDIwMjUuMTIKPiA+ICAgICAgPiBTV1VQREFU
RV9TSVRFID0gJChjYWxsIGdpdGh1YixzYmFiaWMsc3d1cGRhdGUsJChTV1VQREFURV9WRVJTSU9O
KSkKPiA+ICAgICAgPiBTV1VQREFURV9MSUNFTlNFID0gR1BMLTIuMCwgR1BMLTIuMCssIExHUEwt
Mi4xKywgTUlULCBJU0MsIEJTRC0xLQo+ID4gICAgIENsYXVzZSwgQlNELTMtQ2xhdXNlLCBDQzAt
MS4wLCBDQy1CWS1TQS00LjAsIE9GTC0xLjEKPiA+ICAgICAgPiBTV1VQREFURV9MSUNFTlNFX0ZJ
TEVTID0gTElDRU5TRVMvQlNELTEtQ2xhdXNlLnR4dCBcCj4gPiAgICAgID4gLS0KPiA+ICAgICAg
PiAyLjQzLjAKPiA+ICAgICAgPgo+ID4KPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
