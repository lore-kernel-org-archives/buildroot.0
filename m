Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E5AC4167B
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 23:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 065D160736;
	Fri,  8 Dec 2023 23:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 065D160736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HdmkDefCFzqm; Fri,  8 Dec 2023 23:20:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4438F60F3E;
	Fri,  8 Dec 2023 23:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4438F60F3E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDE561BF5D7
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 23:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3E6E4151B
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 23:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3E6E4151B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MFhSayqIemVm for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 23:20:26 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6D08414E5
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 23:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6D08414E5
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50c0f6b1015so3002909e87.3
 for <buildroot@buildroot.org>; Fri, 08 Dec 2023 15:20:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702077624; x=1702682424;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BxWM6lixyA1O5tt74O/Sq2bzYcsibY+wXCWwccSrElU=;
 b=AJy3u08rmI2Qk7Eni/yusQhS5YnlQwRjhDY8Js7qgBiEplKwuRNUKEGpPrEkUlyx6a
 HW7xU5yr7kKIb3Jahj9cd6d2IgOHhHgygMDWz1Hxg90Y2/Rjuhf2iRufiO9F466g+154
 txQTCP3kzTUyZsB2Xh9KrUfDkDjAZT9d4Yz4kcaJpGOHc1UB1czXuE+3I9iC0ADiqUPZ
 GWmt6ZmCwc8PCbkDQdVOC6nikyu3+sKDm9KiOR0GWVzZYPDcExUNXR/RrpUwFobrXyi0
 zRzYcEkEwnl385JWYPYJqPgtlWrN+bcflY9sQA5sKSePTMyDpxewy/fcScgHBv2SCfXm
 yapA==
X-Gm-Message-State: AOJu0YzLugPNZejymlGU1unnZt7j9jh8oteWJW88OHjHM6pVwkmikpEp
 PncgIHMA0/pvB8+gsLxhThDN+K9hBlwLllmYgnk=
X-Google-Smtp-Source: AGHT+IH9/mmwALSNWXLxN4qOp1t+c7Lbco6uKKgmJcMuRzszCTjjdLHZubwfexuIhhJzuB/1BvMMoQMhrvocEY8tAAM=
X-Received: by 2002:a19:7005:0:b0:50b:f130:52f6 with SMTP id
 h5-20020a197005000000b0050bf13052f6mr263156lfc.70.1702077623417; Fri, 08 Dec
 2023 15:20:23 -0800 (PST)
MIME-Version: 1.0
References: <20231207220930.1356097-1-fontaine.fabrice@gmail.com>
 <ZXOehwwVDyiGPpRf@landeda>
 <CAPi7W838vzhK48R5GduRL660bWQnS1WGTPsDmnx+gsj3HfVX3w@mail.gmail.com>
 <ZXOi7tN9L6o6nEmp@landeda>
In-Reply-To: <ZXOi7tN9L6o6nEmp@landeda>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 9 Dec 2023 00:20:11 +0100
Message-ID: <CAPi7W81SxGKzj7feR4i6TtwJZNjBYsADqMw-2ZriWb2oLc+bTQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702077624; x=1702682424; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BxWM6lixyA1O5tt74O/Sq2bzYcsibY+wXCWwccSrElU=;
 b=Pa1p7V3y1/IYKw23PUvNUE8ECHxAygiCuZIIH/SD0ohM3xYNPYCbPZGNr/utqcM5IB
 pE8D7c0NwstfdqnvQ7bi3siUTDvzTtwNAe2KhP0u5QeZuaqoIBpl8WgQxgisbuKkpkAq
 0xNTiBkqNkS10jXWoTBBPg00c4Pz+q4FkiPUSeklRUej0bNVfQEQpjzolXZUaZONs8cx
 muUDzvAT6sVmadc1oamLivqsHbe2Z7k6GXpWkoJG6TDNfsonzadcR/O5XcU3yy8fY/L6
 BkQRg81SHzo9RyPiHC+T0dGz6mlmtKa4F/97qr2DwBT3I8E7quRsPAhqB1XaGECRmuqb
 JP9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Pa1p7V3y
Subject: Re: [Buildroot] [PATCH 1/1] package/memtest86: pass TARGET_CC
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
Cc: Steve Kenton <skenton@ou.edu>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgc2FtLiA5IGTDqWMuIDIwMjMgw6AgMDA6MTIsIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4u
MTk5OEBmcmVlLmZyPiBhIMOpY3JpdCA6Cj4KPiBGYnJpY2UsIEFsbCwKPgo+IE9uIDIwMjMtMTIt
MDkgMDA6MDQgKzAxMDAsIEZhYnJpY2UgRm9udGFpbmUgc3Bha2UgdGh1c2x5Ogo+ID4gTGUgdmVu
LiA4IGTDqWMuIDIwMjMgw6AgMjM6NTQsIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBm
cmVlLmZyPiBhIMOpY3JpdCA6Cj4gPiA+IE9uIDIwMjMtMTItMDcgMjM6MDkgKzAxMDAsIEZhYnJp
Y2UgRm9udGFpbmUgc3Bha2UgdGh1c2x5Ogo+ID4gPiA+IFBhc3MgQ0M9JChUQVJHRVRfQ0MpIHRv
IG1ha2UgdG8gYXZvaWQgdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHJhaXNlZAo+ID4gPiA+
IHNpbmNlIGJ1bXAgdG8gdmVyc2lvbiA2LjIwIGluIGNvbW1pdAo+ID4gPiA+IGE3NDMwODc1OTNh
NWZkNWIzM2UyNjUwNTkxY2FkYTA5OTI5YzI3YTY6Cj4gWy0tU05JUC0tXQo+ID4gPiA+ICBkZWZp
bmUgTUVNVEVTVDg2X0JVSUxEX0NNRFMKPiA+ID4gPiAtICAgICAkKFRBUkdFVF9DT05GSUdVUkVf
T1BUUykgJChNQUtFKSAtQyAkKEBEKS8kKE1FTVRFU1Q4Nl9CVUlMRF9ESVIpCj4gPiA+ID4gKyAg
ICAgJChUQVJHRVRfQ09ORklHVVJFX09QVFMpICQoTUFLRSkgQ0M9JChUQVJHRVRfQ0MpIFwKPiA+
ID4gQ0M9JChUQVJHRVRfQ0MpIGlzIGFscmVhZHkgcHJlc2VudCBpbiBUQVJHRVRfQ09ORklHVVJF
X09QVFMsIHNvIHdoeSBpcwo+ID4gPiBpdCBub3QgYWNjb3VudGVkIGZvcj8KPiA+IEJlY2F1c2Ug
IkNDPSQoVEFSR0VUX0NDKSBtYWtlIiBpcyBub3QgdGhlIHNhbWUgYXMgIm1ha2UKPiA+IENDPSQo
VEFSR0VUX0NDKSIKPgo+IFllYWgsIEkga25vdyB0aGF0IHByZXR0eSB3ZWxsIChldmVuIGlmIEkg
bmV2ZXIgcmVtZW1iZXIgdGhlIHJ1bGVzIG9mCj4gcHJlY2VkZW5jZSBmb3IgdGhlIGVudmlyb25t
ZW50LCBhcmd1bWVudCwgYW5kIE1ha2VmaWxlIHZhcmlhYmxlcykuLi4KPgo+ID4gYXMgYnVpbGR7
MzIsNjR9L01ha2VmaWxlIGlzIHNldHRpbmcgQ0MgdG8gZ2NjLgo+Cj4gQnV0IHRoYXQgd2FzIG5v
dCB0aGUgY2FzZSBwcmV2aW91c2x5LCBJIGd1ZXNzLCBhcyB5b3Ugc2FpZCBpdCBhcHBlYXJlZAo+
IHdpdGggdGhlIGJ1bXAgdG8gNi4yMC4gU28gbWF5YmUgd2Ugc2hvdWxkIG5vdyBtb3ZlIHRoZSB3
aG9sZSBvZgo+ICQoVEFSR0VUX0NPTkZJR1VSRV9PUFRTKSB0byBiZSBhcmd1bWVudHMgcmF0aGVy
IHRoYW4gZW52aXJvbm1lbnQKPiB2YXJpYWJsZXMsIGluc3RlYWQgb2YganVzdCBtb3ZpbmcgQ0Mg
dGhlcmUuCgpJIGFscmVhZHkgdHJpZWQgdGhhdCBidXQgaXQgcmFpc2VzIGEgYnVpbGQgZmFpbHVy
ZSBiZWNhdXNlIHRoZQpmb2xsb3dpbmcgQ0ZMQUdTIHdpbGwgYmUgb3ZlcnJpZGRlbjoKCkNGTEFH
UyA9IC1zdGQ9YzExIC1XYWxsIC1XZXh0cmEgLVdzaGFkb3cgLW0zMiAtbWFyY2g9aTU4NiAtZnBp
YyAtZm5vLWJ1aWx0aW4gXAogICAgICAgICAtZmZyZWVzdGFuZGluZyAtZm9taXQtZnJhbWUtcG9p
bnRlciAtZm5vLXN0YWNrLXByb3RlY3RvcgoKPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4K
Pgo+ID4gPgo+ID4gPiBSZWdhcmRzLAo+ID4gPiBZYW5uIEUuIE1PUklOLgo+ID4gPgo+ID4gPiA+
ICsgICAgICAgICAgICAgLUMgJChARCkvJChNRU1URVNUODZfQlVJTERfRElSKQo+ID4gPiA+ICBl
bmRlZgo+ID4gPiA+Cj4gPiA+ID4gIGRlZmluZSBNRU1URVNUODZfSU5TVEFMTF9JTUFHRVNfQ01E
Uwo+ID4gPiA+IC0tCj4gPiA+ID4gMi40Mi4wCj4gPiA+ID4KPiA+ID4gPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiA+IGJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKPiA+ID4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gPiA+IGh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+ID4gPgo+ID4g
PiAtLQo+ID4gPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+ID4gPiB8ICBZYW5uIEUuIE1PUklO
ICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3Bp
cmFjeTogfAo+ID4gPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwg
LyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAo+ID4gPiB8ICszMyA1NjEgMDk5
IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVy
ZSBpcyBubyAgfAo+ID4gPiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8
IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAo+ID4gPiAnLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLS0tJwo+ID4KPiA+IEJlc3QgUmVnYXJkcywKPiA+Cj4gPiBGYWJyaWNlCj4KPiAt
LQo+IC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRp
bWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8
ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAg
fCAgX19fICAgICAgICAgICAgICAgfAo+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0u
LS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRw
Oi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2
ICAgY29uc3BpcmFjeS4gIHwKPiAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0t
LS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpCZXN0IFJlZ2FyZHMs
CgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
