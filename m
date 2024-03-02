Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1657C54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 21:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5306D828C5;
	Sat,  2 Mar 2024 21:24:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T4mzyk5mfRJk; Sat,  2 Mar 2024 21:24:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C64782993
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C64782993;
	Sat,  2 Mar 2024 21:24:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 38CFC1BF2BA
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 21:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 253A8404F8
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 21:24:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YsoXUmWVnydc for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 21:24:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AED1240131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AED1240131
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AED1240131
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 21:24:22 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-512ed314881so2872690e87.2
 for <buildroot@buildroot.org>; Sat, 02 Mar 2024 13:24:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709414660; x=1710019460;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vshe0bxJd6zNflMQsk6jsiiuIMHdJ5z8kOwV4UyR0pA=;
 b=FAaGGi8i8+Y7/GejOjlUxSadqrE1Qy2Cc5JvIsCngqk0/MP9JlpFddOpb5S+sdAN2l
 ZXAnQymNzMzptlMXcaaWSV1nOGaJhkUUY2dPS1KORUtJZOYXT/xnZxVvZPReniSUQnM7
 PNa5la48VVoTCjEt1/eNivDRga6VHqibeYxmNvmiQd1+dAMCejPkciik/bJuMq2h5dfN
 6osVnqc341GeO5qGs2NkRU/ZqC8TC4Q7g1PCgZkclMmYic9+E1Hg0F61tEaUOMQsLjZi
 OyzvhaCCD5psj88t8XFXV9ZXS4tWCF/znQ1hUJK7HJNsbrqn41NFDT+4EYKUG4+u9F1e
 4t8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXlO93ePIRBeKGP/W0Hv6lo1G0WCL/vmUNE+wr2kIz6NQyprCCcTKWpQHtReBzbg3YmXVEtogDWkNtH2HA57lOwqKCf7GMmQ==
X-Gm-Message-State: AOJu0YwMEnkqUzelcWMefHqu4f95r6USxCdLtMdsOVk/HRvMuyEzxBzk
 ac2fbNNLWeahlEPk1KDJwmDAYnjs0ifLLzDJhaN37CvxsK8OXGH5tzbMtaFhygZvk5KjsJMMuvO
 BQe8HcfWjPFuB9bw5SbNwOgWAFAs=
X-Google-Smtp-Source: AGHT+IGVCFxREbuvoln2fAR44Heid9JNJsxyi7XMKx0nNQbiNBOxGebf9CJXd9ydHTXiD9mzT+x6JYeHTwom2iebS8M=
X-Received: by 2002:a19:5f19:0:b0:513:2999:5ef3 with SMTP id
 t25-20020a195f19000000b0051329995ef3mr3643456lfb.7.1709414659985; Sat, 02 Mar
 2024 13:24:19 -0800 (PST)
MIME-Version: 1.0
References: <20240302100259.251307-1-fontaine.fabrice@gmail.com>
 <ZeNFzUSTpCvstKLW@landeda>
 <CAPi7W80doZ_BQeALCe4nh+orvGcAGMgzr3OtzJ+-kB_ZgOPU1g@mail.gmail.com>
 <ZeNvUxJde1-CBurL@landeda>
 <CAPi7W83MYxj1qgLjDzNYSiN5R3ESKz7-o9-O=UrDLMP+ebTZ6A@mail.gmail.com>
 <ZeOGR-mLVryLRXI0@landeda>
In-Reply-To: <ZeOGR-mLVryLRXI0@landeda>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 2 Mar 2024 22:24:08 +0100
Message-ID: <CAPi7W837HVE9AXV-rqE135fpFc6VX-UsRW+jT1ussCyAJTcgOg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709414660; x=1710019460; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vshe0bxJd6zNflMQsk6jsiiuIMHdJ5z8kOwV4UyR0pA=;
 b=Qw0BU58BonGx05Scf71FvwyXXvurcpzFEZtq2cX0mCdf/m7oDGSwn4MCNqDDtDK4Qr
 MvCXbYNiAjnSInCbzj9uCpIfJKKhoDQt8TnMaOAvY+ccJ/1E092L5U2PTIzrgx4w6Jw/
 SEDgbqw91fDsgz5/g/SSU4gDfxLE6gzSESOjTud+86I2lbzeLojBATFhhFHZFXZ80XN7
 hSa0SwmhdLDBgxP3mZDN8+iO0q/o2ViSWB0tIJab5VCIvZE27QUh4DzVlxtgt6mYZ/B/
 H6wC1APT3VRV+00l2KYxMXy2I9PsX3t2BtYQRF/4C1sc5p9XAv7lRwDsxm3ohpLQFVms
 wisw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Qw0BU58B
Subject: Re: [Buildroot] [PATCH 1/1] package/powertop: fix gettext build
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
Cc: Steven Noonan <steven@uplinklabs.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgc2FtLiAyIG1hcnMgMjAyNCDDoCAyMTowNCwgWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4x
OTk4QGZyZWUuZnI+IGEgw6ljcml0IDoKPgo+IEZhYnJpY2UsIEFsbCwKPgo+IE9uIDIwMjQtMDMt
MDIgMjA6MTIgKzAxMDAsIEZhYnJpY2UgRm9udGFpbmUgc3Bha2UgdGh1c2x5Ogo+ID4gTGUgc2Ft
LiAyIG1hcnMgMjAyNCDDoCAxOToyNiwgWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZy
ZWUuZnI+IGEgw6ljcml0IDoKPiA+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vZmVucnVzNzUvcG93
ZXJ0b3AvY29tbWl0L2Q1YzZhZWI3MGQ3MTE3MjJlYjNmNGRmYTg4YjcyMGMxYjIwZWVjNGEKPiA+
ID4gPiBUaGUgcmF0aW9uYWxlIHdhczoKPiA+ID4gPiAiVGhpcyBwYXRjaCBpcyBrbm93biB0byBj
YXVzZSBpc3N1ZXMgb24gcGxhdGZvcm1zIHRoYXQgYXJlIHVwZGF0ZWQgdG8KPiA+ID4gPiBnZXR0
ZXh0IDAuMjAuMiBvciBoaWdoZXIgYW5kIHdvdWxkbnQgYmUgYWJsZSB0byBtb3ZlIGZvcndhcmQg
d2l0aAo+ID4gPiA+IGJ1aWxkaW5nIFBvd2VyVG9wIHN1Y2Vzc2Z1bGx5LiBIZW5jZSByZXZlcnQg
dGhpcyBwYXRjaC4iCj4gPiA+Cj4gPiA+IEJ1dCB0aGF0IG1lYW5zIHRoYXQgd2Ugd2lsbCBoYXZl
IHRvIGNhcnIgeXRoYXQgcGF0Y2ggZm9yZXZlciwgYW5kIHJlYmFzZQo+ID4gPiBpdCBldmVyeSB0
aW1lIHdlIHVwZGF0ZSBpZiBjb25maWd1cmUuYWMgb3IgcG8vTWFrZWZpbGUuaW4uaW4gY2hhbmdl
Li4uCj4gPgo+ID4gSW5kZWVkLCBJIGNhbiBvcGVuIGFuIGlzc3VlIHRvIHVwc3RyZWFtIGJ1dCB0
aGV5IGFyZSBub3QgdmVyeQo+ID4gcmVzcG9uc2l2ZSBhcyBjYW4gYmUgc2VlbiBpbiB0aGUgbGFj
ayBvZiBwcm9ncmVzcyBvbiBteSBQUiBmb3IgdGhlCj4gPiBmaXJzdCBwYXRjaCAuLi4KPgo+IFst
LVNOSVAtLV0KPiA+ID4gRGlkIHlvdSB0cnkgdG8gc2V0IFBPV0VSVE9QX0FVVE9QT0lOVCA9IFlF
UyA/Cj4gPiBZZXMgYW5kIGl0IGRvZXNuJ3Qgd29yay4KPgo+IFdlaXJkLi4uIGF1dG9wb2ludCBp
cyB0aGVyZSBleHBsaWNpdGx5IGZvciB0aGlzIGtpbmQgb2YgaXNzdWVzIChhZmFpaykuCj4gU28g
SSB0cmllZCBoZXJlLCBhbmQgaXQgZGlkIGZpeCB0aGUgYnVpbGQgZm9yIHRoZSBhdXRvYnVpbGRl
ciBmYWlsdXJlCj4geW91IHJlcG9ydGVkLCBhdCBsZWFzdDoKPgo+ICAgICBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9wb3dlcnRvcC9wb3dlcnRvcC5tayBiL3BhY2thZ2UvcG93ZXJ0b3AvcG93ZXJ0b3Au
bWsKPiAgICAgaW5kZXggMDQ4MWNhZWUwNy4uNTA2ZGJhMDM4ZCAxMDA2NDQKPiAgICAgLS0tIGEv
cGFja2FnZS9wb3dlcnRvcC9wb3dlcnRvcC5tawo+ICAgICArKysgYi9wYWNrYWdlL3Bvd2VydG9w
L3Bvd2VydG9wLm1rCj4gICAgIEBAIC0xNyw2ICsxNyw3IEBAIFBPV0VSVE9QX0RFUEVOREVOQ0lF
UyA9IFwKPiAgICAgICAgICQoaWYgJChCUjJfUEFDS0FHRV9QQ0lVVElMUykscGNpdXRpbHMpIFwK
PiAgICAgICAgICQoVEFSR0VUX05MU19ERVBFTkRFTkNJRVMpCj4KPiAgICAgK1BPV0VSVE9QX0FV
VE9QT0lOVCA9IFlFUwo+ICAgICAgUE9XRVJUT1BfQ09ORl9FTlYgPSBMSUJTPSQoVEFSR0VUX05M
U19MSUJTKQo+ICAgICAgIyAwMDAxLWFkZC1kaXNhYmxlLXN0YWNrLXByb3RlY3Rvci1vcHRpb24u
cGF0Y2gKPiAgICAgIFBPV0VSVE9QX0FVVE9SRUNPTkYgPSBZRVMKPgo+ICAgICAkIG1ha2UgZGlz
dGNsZWFuCj4gICAgICQgd2dldCAtTyAuY29uZmlnICdodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9v
dC5vcmcvcmVzdWx0cy9iYjgwYTc4NDJkMTg2NTFlNTA2OWYzYTkxZjA2YTljMjMyMThkMjYwL2Rl
ZmNvbmZpZycKPiAgICAgJCBtYWtlIG9sZGRlZmNvbmZpZwo+ICAgICAkIG1ha2UgcG93ZXJ0b3At
YnVpbGQKPgo+IChJIHRyaWVkIGJvdGggd2l0aCBhbmQgd2l0aG91dCBQUEQsIGJvdGggc3VjY2Vl
ZGVkIHdpdGggdGhlIHBhdGNoCj4gYWJvdmUuKQo+Cj4gV2hhdCB3YXMgYnJva2VuIG9uIHlvdXIg
c2lkZT8KCkFmdGVyIGFkZGluZyBQT1dFUlRPUF9BVVRPUE9JTlQ9WUVTLCBJIHJhbiBtYWtlIHBv
d2VydG9wLWRpcmNsZWFuOwptYWtlIHBvd2VydG9wIGFuZCB0aGUgYnVpbGQgZmFpbHVyZSB3YXMg
c3RpbGwgdGhlcmUuCkFmdGVyIGEgbWFrZSBjbGVhbiwgdGhlIGJ1aWxkIGZhaWx1cmUgd2FzIHJl
bW92ZWQuCkknbGwgc2VuZCBhIG5ldyBpdGVyYXRpb24uCgo+Cj4gUmVnYXJkcywKPiBZYW5uIEUu
IE1PUklOLgo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9S
SU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25z
cGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8g
Q0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBg
LS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBu
byAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwg
TUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScK
CkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
