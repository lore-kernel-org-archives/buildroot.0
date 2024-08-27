Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99357C5320E
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 06:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 346AF80DB2;
	Tue, 27 Aug 2024 06:28:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UhKqo45jjmOd; Tue, 27 Aug 2024 06:28:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18EAE80ED2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18EAE80ED2;
	Tue, 27 Aug 2024 06:28:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF11A1BF2BB
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 06:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E88EE403CD
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 06:28:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id POqc6JND23yF for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 06:28:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 89E55403B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89E55403B6
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89E55403B6
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 06:28:55 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-6c0ac97232bso42431467b3.1
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 23:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724740134; x=1725344934;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qU/cnoJXoPm44eOVDca1W3tXQtUznJnwifTbe+Br20E=;
 b=TPq7CVWjs9ivEgrOvvpNFVrGsVzqtzxQhH5HrB61dp029Cl95YmP1Qx2RY3X2xR8Vs
 NaiQaPxwpalpAwT0JWzFYSlKAQUR96RC9as/V0Gp8Uusn+6Nz82mpa9c0UtffdUG2kNm
 6C69gm/1xRgvGutLxva9gv5nYW5mgzSi2O2ddcSbCKsbgd/3c12X4wMAyc1UGTeLGllz
 2spt31dK4LlNv/8PveYlc+JPrZzVnipTgSeGzgqT1JpGwOCwqJAeb9nLWIwPcSSYtU1h
 qdStRWQhtE2lgwWZVIbUxME7I75LBsXvSsa/rJXSxb4W1Uy8SlToQ3Dm7+J16IyLMf30
 hTSQ==
X-Gm-Message-State: AOJu0YwUlHyadk3hk//Pg0BTefRjICBZrJhQ06rakSsvGkuxFV6vMHTf
 gtcrZhexotqYAGNbOfa7JvyE2+6O2o7hrY2aqv6xcENLOJjgszqtfEED1iePCVa9ajmhA3jrg+0
 jgyx06phcXzZBHhId1hVXV1MBiXIgqh6fwKgVdhXLG9A6fMVr/hRR0A==
X-Google-Smtp-Source: AGHT+IEB+2DttWTlH5Tc71M++n0/YbQsYTjLqdTZT75mLzFZOT1qK5lGxjkobU1G4FxTO5iNY1cD4agaT1aYhSadwMo=
X-Received: by 2002:a05:690c:4c0c:b0:6b3:3520:a45 with SMTP id
 00721157ae682-6c6259571abmr141654447b3.20.1724740134244; Mon, 26 Aug 2024
 23:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240824141616.3139902-1-dario.binacchi@amarulasolutions.com>
 <20240826184512.12aca28f@windsurf>
In-Reply-To: <20240826184512.12aca28f@windsurf>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 27 Aug 2024 08:28:43 +0200
Message-ID: <CABGWkvrm1TV6+RXPwEynvt=17BhaHcofjBg-8bvRL-JpS96bcA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724740134; x=1725344934;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qU/cnoJXoPm44eOVDca1W3tXQtUznJnwifTbe+Br20E=;
 b=rcZWOC9PBOptUU4LN87W/tElFdpTWIwGy3LMhN11yNnXwXCB5a06jKUl8zSZYT5teA
 T8HbIGLfy4HFgy1P2IVHMrnzUXgw5lDw8Zpw/fl2HAG4fTV+BK6FpyHF0ju5JPiqVMel
 9DUxGt/lA8tk0cBZflv3dAKH+VN85DHaNIPi4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=rcZWOC9P
Subject: Re: [Buildroot] [PATCH 1/1] package/babeld: bump to version 1.10
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gTW9uLCBBdWcgMjYsIDIwMjQgYXQgNjo0NeKAr1BNIFRob21hcyBQ
ZXRhenpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gU2F0
LCAyNCBBdWcgMjAyNCAxNjoxNjoxNiArMDIwMAo+IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5h
Y2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiA+IC0gUmVtb3ZlZCB0aGUgZGlz
YW1iaWd1YXRpb24gY29kZTogc291cmNlLXNwZWNpZmljIHJvdXRpbmcgaXMgbm8gbG9uZ2VyCj4g
PiAgIHN1cHBvcnRlZCBmb3IgSVB2NCwgYW5kIGZvciBJUHY2IG9ubHkgb24gTGludXggMy4xMSBv
ciBsYXRlci4KPiA+IC0gRml4ZWQgYW4gaXNzdWUgaGFuZGxpbmcgb2YgcmV0cmFjdGlvbnMgd2l0
aCBubyBuZXh0IGhvcCwgd2hpY2ggY2F1c2VkCj4gPiAgIGludGVyb3BlcmFiaWxpdHkgcHJvYmxl
bXMgd2l0aCBCSVJELiAgVGhhbmtzIHRvIEZhYmlhbiBCbMOkc2UuCj4gPiAtIElmIHNraXAta2Vy
bmVsLXNldHVwIGlzIHNldCwgd2Ugbm8gbG9uZ2VyIGRpc2FibGUgdGhlIHJwX2ZpbHRlciwgd2hp
Y2gKPiA+ICAgbWFrZXMgYmFiZWxkIHdvcmsgaW4gY29udGFpbmVycy4gIFRoYW5rcyB0byBNYXJ0
aW4gV2VpbmVsdC4KPiA+Cj4gPiBGaXhlczoKPiA+IC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJv
b3Qub3JnL3Jlc3VsdHMvMjQ0NzA2MGM4NmFjZjFiZDhkNmVlMGJjZjhmOWI2YWRjZGZjNTBjOQo+
Cj4gSG1tLCBzb3JyeSBidXQgd2h5IGEgdmVyc2lvbiBidW1wIGlzIG5lZWRlZCB0byBmaXggYW4g
aXNzdWUgYWJvdXQgYQo+IHRhcmJhbGwgbm90IGJlaW5nIGZvdW5kPwo+Cj4gVGhpcyBpcyBnZW5l
cmFsbHkgYSBzaWduIHRoYXQgdXBzdHJlYW0gaXMgbW92aW5nIHRhcmJhbGxzIGFyb3VuZCBhZnRl
cgo+IHRoZXkgYXJlIHJlbGVhc2VkLCB3aGljaCBtZWFucyB0aGF0IGF0IHNvbWUgcG9pbnQgdGhl
IGlzc3VlIHdpbGwgb2NjdXIKPiBhZ2FpbiB3aXRoIGJhYmVsZCAxLjEwLgo+Cj4gQ291bGQgeW91
IGNoZWNrIHdoYXQgaGFwcGVuZWQgd2l0aCB0aGUgYmFiZWxkIDEuOS4yIHRhcmJhbGwsIHBlcmhh
cHMgYnkKPiBjb250YWN0aW5nIHVwc3RyZWFtPwoKVGhpcyBpcyB0aGUgcmVzcG9uc2UgZnJvbSBK
dWxpdXN6IENocm9ib2N6ZWssIG9uZSBvZiB0aGUgbWFpbnRhaW5lcnMgb2YKdGhlIHByb2plY3Q6
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoxLjkuMiB3YXMg
cmVsZWFzZWQgaW4gQXByaWwgMjAyMCwgaXQncyBvdmVyIGZvdXIgeWVhcnMgb2xkLiAgU29tZSBm
ZWF0dXJlcwp3ZXJlIHJlbW92ZWQgaW4gMS4xMywgYnV0IHRoZXJlJ3MgcmVhbGx5IG5vIHJlYXNv
biB0byBydW4gYW55dGhpbmcgb2xkZXIKdGhhbiAxLjEyLjIuCgo+IFdoYXQgaGFwcGVuZWQgdG8g
aXQ/CgpJdCdzIGJlZW4gbW92ZWQgaW50byB0aGUgYXJjaGl2ZSBkaXJlY3Rvcnk6CgogIGh0dHBz
Oi8vd3d3LmlyaWYuZnIvfmpjaC9zb2Z0d2FyZS9maWxlcy9vbGQvCgo+IElmIGl0IHdvbid0IGJl
IHJlLWFkZGVkLCBjYW4gSSByZWZlciB0byBodHRwczovL2dpdGh1Yi5jb20vamVjaC9iYWJlbGQK
PiBhcyB0aGUgb2ZmaWNpYWwgc291cmNlIGZyb20gd2hpY2ggYnVpbGRyb290IGNhbiBkb3dubG9h
ZCB0aGUgY3VycmVudAo+IGFuZCBmdXR1cmUgdmVyc2lvbnM/CgpZZXMsIHRoYXQncyBhIGdvb2Qg
aWRlYTsgZXZlbiB0aG91Z2ggSSBoYXZlIG1pc2dpdmluZ3MgYWJvdXQgZ2l0aHViLCBJJ20Kbm90
IHBsYW5uaW5nIHRvIG1vdmUgYXdheSBhbnl0aW1lIHNvb24uICBQbGVhc2UgdXNlIHRhZ2dlZCB2
ZXJzaW9ucyByYXRoZXIKdGhhbiB0aGUgbWFzdGVyIGhlYWQuCgpUaGFua3MsCgotLSBKdWxpdXN6
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpTbyBhdCB0aGlz
IHBvaW50LCBJIGNhbiBjaGFuZ2UgdGhlIG9mZmljaWFsIHJlcG9zaXRvcnkgZnJvbSB3aGljaCB0
byBkb3dubG9hZAp2ZXJzaW9uIDEuOS4yIGFuZCB0aGVuIHByb2NlZWQgd2l0aCBhIHZlcnNpb24g
YnVtcC4KRm9yIG5vdywgSSdsbCBzZW5kIHRoZSBmaXguCkRvIHlvdSBhZ3JlZT8KClRoYW5rcyBh
bmQgcmVnYXJkcywKRGFyaW8KCj4KPiAoSSBtZWFuIG9mIGNvdXJzZSB3ZSB3aWxsIHdhbnQgdG8g
dXBkYXRlIGJhYmVsZCB0byB2ZXJzaW9uIDEuMTAsIGJ1dAo+IHRoaXMgc2hvdWxkIGJlIGRvbmUg
c2VwYXJhdGVseSB0aGFuIGZpeGluZyB0aGUgZG93bmxvYWQgaXNzdWUpCj4KPiBUaGFua3MhCj4K
PiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3Rs
aW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+
IGh0dHBzOi8vYm9vdGxpbi5jb20KCgoKLS0gCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9yIEVtYmVk
ZGVkIExpbnV4IERldmVsb3BlcgoKZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0aW9ucyBT
UkwKClZpYSBMZSBDYW5ldmFyZSAzMCwgMzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoKVC4gKzM5
IDA0MiAyNDMgNTMxMAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNvbHV0
aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
